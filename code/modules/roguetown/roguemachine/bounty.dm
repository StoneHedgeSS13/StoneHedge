/obj/structure/roguemachine/bounty
	name = "Excidium"
	desc = "A machine that sets and collects bounties. Its bloodied maw could easily fit a human head."
	icon = 'icons/roguetown/topadd/statue1.dmi'
	icon_state = "baldguy"
	density = FALSE
	blade_dulling = DULLING_BASH
	anchored = TRUE

/datum/bounty
	var/target
	var/amount
	var/reason
	var/employer

	/// Whats displayed when consulting the bounties
	var/banner
	///Is this a bandit bounty?
	var/bandit

/obj/structure/roguemachine/bounty/attack_hand(mob/user)

	if(!ishuman(user)) return

	// We need to check the user's bank account later
	var/mob/living/carbon/human/H = user

	// Main Menu
	var/list/choices = list("Consult bounties", "Set bounty")
	if(user.job in list("Hedgemaster", "Hedge Knight"))
		choices += "Remove bounty"
	var/selection = input(user, "The Excidium listens", src) as null|anything in choices

	switch(selection)

		if("Consult bounties")
			consult_bounties(H)

		if("Set bounty")
			set_bounty(H)

		if("Remove bounty")
			remove_bounty(H)

/obj/structure/roguemachine/bounty/attackby(obj/item/P, mob/user, params)

	if(!(ishuman(user))) return

	// Only heads are allowed
	if(P.type != /obj/item/bodypart/head) return

	var/machine_location = get_turf(src)
	var/obj/item/bodypart/head/stored_head = P
	var/correct_head = FALSE

	var/reward_amount = 0
	for(var/datum/bounty/b in GLOB.head_bounties)
		if(b.target == stored_head.real_name)
			correct_head = TRUE
			say("A bounty has been sated.")
			reward_amount += b.amount
			GLOB.head_bounties -= b

	if(correct_head)
		qdel(P)
	else // No valid bounty for this head?
		say("This skull carries no reward.")
		playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
		return

	say(pick(list("Performing intra-cranial inspection...", "Analyzing skull structure...", "Commencing cephalic dissection...")))

	sleep(1 SECONDS)

	var/list/headcrush = list('sound/combat/fracture/headcrush (2).ogg', 'sound/combat/fracture/headcrush (3).ogg', 'sound/combat/fracture/headcrush (4).ogg')
	playsound(src, pick_n_take(headcrush), 100, FALSE, -1)
	sleep(1 SECONDS)
	playsound(src, pick(headcrush), 100, FALSE, -1)

	sleep(2 SECONDS)

	if(correct_head)
		budget2change(reward_amount, user)

	// Head has been "analyzed". Return it.
	sleep(2 SECONDS)
	playsound(src, 'sound/combat/vite.ogg', 100, FALSE, -1)
	stored_head = new /obj/item/bodypart/head(machine_location)
	stored_head.name = "mutilated head"
	stored_head.desc = "This head has been violated beyond recognition, the work of a horrific machine."

///Shows all active bounties to the user.
/obj/structure/roguemachine/bounty/proc/consult_bounties(mob/living/carbon/human/user)
	var/bounty_found = FALSE
	var/consult_menu
	consult_menu += "<center>BOUNTIES<BR>"
	consult_menu += "--------------<BR>"
	for(var/datum/bounty/saved_bounty in GLOB.head_bounties)
		consult_menu += saved_bounty.banner
		bounty_found = TRUE

	if(bounty_found)
		var/datum/browser/popup = new(user, "BOUNTIES", "", 500, 300)
		popup.set_content(consult_menu)
		popup.open()
	else
		say("No bounties are currently active.")

///Sets a bounty on a target player through user input.
///@param user: The player setting the bounty.
/obj/structure/roguemachine/bounty/proc/set_bounty(mob/living/carbon/human/user)
	var/list/eligible_players = list()

	if(user.mind.known_people.len)
		for(var/guys_name in user.mind.known_people)
			eligible_players += guys_name
	else
		to_chat(user, span_warning("I don't know anyone."))
		return
	var/target = input(user, "Whose name shall be etched on the wanted list?", src) as null|anything in eligible_players
	if(isnull(target))
		say("No target selected.")
		return

	var/amount = input(user, "How many mammons shall be stained red for their demise?", src) as null|num
	if(isnull(amount))
		say("Invalid amount.")
		return
	if(amount < 20)
		say("Insufficient amount. Bounty must be at least 20 mammons.")
		return

	// Has user a bank account?
	if(!(user in SStreasury.bank_accounts))
		say("You have no bank account.")
		return

	// Has user enough money?
	if(SStreasury.bank_accounts[user] < amount)
		say("Insufficient balance funds.")
		return

	var/reason = input(user, "For what sins do you summon the hounds of hell?", src) as null|text
	if(isnull(reason) || reason == "")
		say("No reason given.")
		return

	var/confirm = input(user, "Do you dare unleash this darkness upon the world? Your name will be known.", src) as null|anything in list("Yes", "No")
	if(isnull(confirm) || confirm == "No") return

	// Deduct money from user
	SStreasury.bank_accounts[user] -= round(amount)

	//Deduct royal tax from amount
	var/royal_tax = round(amount * 0.1)
	SStreasury.treasury_value += royal_tax
	SStreasury.log_entries += "+[royal_tax] to treasury (bounty tax)"

	amount -= royal_tax

	// Finally create bounty
	add_bounty(target, amount, FALSE, reason, user.real_name)

	//Announce it locally and on scomm
	playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
	var/bounty_announcement = "The Excidium hungers for the head of [target]."
	say(bounty_announcement)
	scom_announce(bounty_announcement)

	message_admins("[ADMIN_LOOKUPFLW(user)] has set a bounty on [ADMIN_LOOKUPFLW(target)] with the reason of: '[reason]'")

/obj/structure/roguemachine/bounty/proc/remove_bounty(mob/living/carbon/human/user)
	var/list/eligible_players = list()

	if(user.mind.known_people.len)
		for(var/datum/bounty/b in GLOB.head_bounties)
			eligible_players += b.target
	else
		to_chat(user, span_warning("I don't know anyone."))
		return
	var/mob/living/carbon/target = input(user, "Whose name shall be removed from the wanted list?", src) as null|anything in eligible_players
	if(isnull(target))
		say("No target selected.")
		return

	var/confirm = input(user, "Do you dare release this one?", src) as null|anything in list("Yes", "No")
	if(isnull(confirm) || confirm == "No") return
	for(var/datum/bounty/b in GLOB.head_bounties)
		if(b.target == target.real_name)
			GLOB.head_bounties -= b

	//Announce it locally and on scomm
	playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
	var/bounty_announcement = "[target] is no longer wanted."
	say(bounty_announcement)
	scom_announce(bounty_announcement)

	message_admins("[ADMIN_LOOKUPFLW(user)] has removed a bounty on [ADMIN_LOOKUPFLW(target)]'")

/proc/add_bounty(target_realname, amount, bandit_status, reason, employer_name)
	var/datum/bounty/new_bounty = new /datum/bounty
	new_bounty.amount = amount
	new_bounty.target = target_realname
	new_bounty.bandit = bandit_status
	new_bounty.reason = reason
	new_bounty.employer = employer_name
	compose_bounty(new_bounty)
	GLOB.head_bounties += new_bounty

///Composes a random bounty banner based on the given bounty info.
///@param new_bounty:  The bounty datum.
/proc/compose_bounty(datum/bounty/new_bounty)
	switch(rand(1, 3))
		if(1)
			new_bounty.banner += "A dire bounty hangs upon the head of [new_bounty.target], for '[new_bounty.reason]'.<BR>"
			new_bounty.banner += "The patron, [new_bounty.employer], offers [new_bounty.amount] mammons for the task.<BR>"
		if(2)
			new_bounty.banner += "The head of [new_bounty.target] is wanted for '[new_bounty.reason]''.<BR>"
			new_bounty.banner += "The employer, [new_bounty.employer], offers [new_bounty.amount] mammons for the deed.<BR>"
		if(3)
			new_bounty.banner += "[new_bounty.employer] hath offered to pay [new_bounty.amount] mammons for the head of [new_bounty.target].<BR>"
			new_bounty.banner += "By reason of the following: '[new_bounty.reason]'.<BR>"
	new_bounty.banner += "--------------<BR>"



/obj/structure/chair/arrestchair
	name = "SLAVEMASTER"
	desc = "A chairesque machine that collects bounties through enslavement rather than death, for a much greater reward."
	icon = 'icons/obj/chairs.dmi'
	icon_state = "brass_chair"
	blade_dulling = DULLING_BASH
	item_chair = null
	anchored = TRUE

/obj/structure/chair/arrestchair/buckle_mob(mob/living/carbon/human/M, force, check_loc)
	. = ..()
	if(!(ishuman(M)))
		return

	playsound(src.loc, 'sound/items/beartrap.ogg', 100, TRUE, -1)
	M.Paralyze(3 SECONDS)

	var/correct_head = FALSE

	var/reward_amount = 0
	for(var/datum/bounty/b in GLOB.head_bounties)
		if(b.target == M.real_name)
			correct_head = TRUE
			reward_amount += b.amount
			GLOB.head_bounties -= b

	say(pick(list("Performing intra-cranial inspection...", "Analyzing skull structure...", "Commencing cephalic dissection...")))

	sleep(1 SECONDS)

	var/list/headcrush = list('sound/combat/fracture/headcrush (2).ogg', 'sound/combat/fracture/headcrush (3).ogg', 'sound/combat/fracture/headcrush (4).ogg')
	playsound(src, pick_n_take(headcrush), 100, FALSE, -1)
	M.emote("scream")
	M.apply_damage(50, BRUTE, BODY_ZONE_HEAD, FALSE)
	sleep(1 SECONDS)
	playsound(src, pick(headcrush), 100, FALSE, -1)
	M.emote("agony")
	M.apply_damage(50, BRUTE, BODY_ZONE_HEAD, FALSE)

	sleep(2 SECONDS)

	if(correct_head)
		say("A bounty has been sated.")
		budget2change((reward_amount*2)) //double reward for alive
		var/newcollar = new /obj/item/clothing/neck/roguetown/gorget/prisoner/servant(get_turf(M))
		playsound(src.loc, 'sound/items/beartrap.ogg', 100, TRUE, -1)
		M.doUnEquip(M.wear_neck, TRUE, invdrop = TRUE)
		M.equip_item(newcollar)
	else
		say("This skull carries no reward, you fool.")
		playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
	M.Stun(2 SECONDS)


	// Head has been "analyzed". Return it.
	sleep(2 SECONDS)
	playsound(src, 'sound/combat/vite.ogg', 100, FALSE, -1)
	unbuckle_all_mobs()
	M.Paralyze(50, TRUE)


/obj/structure/chair/arrestchair/proc/budget2change(budget, mob/user, specify)
	var/turf/T
	if(!user || (!ismob(user)))
		T = get_turf(src)
	else
		T = get_turf(user)
	if(!budget || budget <= 0)
		return
	budget = floor(budget)
	var/type_to_put
	var/zenars_to_put
	if(specify)
		switch(specify)
			if("GOLD")
				zenars_to_put = budget/10
				type_to_put = /obj/item/roguecoin/gold
			if("SILVER")
				zenars_to_put = budget/5
				type_to_put = /obj/item/roguecoin/silver
			if("BRONZE")
				zenars_to_put = budget
				type_to_put = /obj/item/roguecoin/copper
	else
		var/highest_found = FALSE
		var/zenars = floor(budget/10)
		if(zenars)
			budget -= zenars * 10
			highest_found = TRUE
			type_to_put = /obj/item/roguecoin/gold
			zenars_to_put = zenars
		zenars = floor(budget/5)
		if(zenars)
			budget -= zenars * 5
			if(!highest_found)
				highest_found = TRUE
				type_to_put = /obj/item/roguecoin/silver
				zenars_to_put = zenars
			else
				new /obj/item/roguecoin/silver(T, zenars)
		if(budget >= 1)
			if(!highest_found)
				type_to_put = /obj/item/roguecoin/copper
				zenars_to_put = budget
			else
				new /obj/item/roguecoin/copper(T, budget)
	if(!type_to_put || zenars_to_put < 1)
		return
	new type_to_put(T, floor(zenars_to_put))
	playsound(T, 'sound/misc/coindispense.ogg', 100, FALSE, -1)

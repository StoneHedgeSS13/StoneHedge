
//TOWN GUARDS
//quotes from skyrim cause funny
/mob/living/carbon/human/species/human/smart_npc/townguard
	friendlyfactions = list("Station", "neutral")
	dodgetime = 12
	calmmessages = list(
		"What do you need?",
		"Trouble?",
		"What is it?",
		"No lollygaggin'.",
		"Everything's in order.",
		"Staying safe I hope.",
		"Everything all right?",
		"Could sure use a warm bed right about now...",
		"I fear the night. Because the werewolves and vampires don't.",
		"Just a few more hours and I can crawl under some furs...",
		)
	aggromessages = list(
		"Then let me speed your passage to Yamais' hands!",
		"Then pay with your blood!",
		"That can be arranged!",
		"So be it!",
		"You have sealed your fate!",
		"You cannot escape the righteous!",
		"Fool!",
		"You will pay, with your blood!",
		)
	punish_attacking = TRUE
	var/patrol = TRUE
	var/lastpatroltime
	var/last_report
	var/last_hostile_message = 0
	var/static/list/failed_arrests = list()

/mob/living/carbon/human/species/human/smart_npc/townguard/should_target(mob/living/L)
	if(!L)
		return FALSE

	if(L == src)
		return FALSE

	//leaders arent shat on.
	if(L.job in list("Great Druid", "Hedge Warden", "Druid", "Hedge Knight", "Ovate", "Academy Archmage", "Guildmaster", "Guild Appraiser", "Grandmaster", "Archpriest", "Archpriestess", "Wytcher", "Wytcher Captain"))
		return FALSE

	if(HAS_TRAIT(src, TRAIT_PACIFISM))
		return FALSE

	if(!is_in_zweb(src,L))
		return FALSE

	if(L.alpha <= 100) //if mostly invisible dont see it, surely this wont go wrong.
		return FALSE

	if(L.InFullCritical())
		return FALSE

	if(L.name in friends)
		return FALSE

	if(L.stat != CONSCIOUS)
		return FALSE

	if(ishuman(L))
		var/mob/living/carbon/human/H = L

		if((H.wear_mask && (H.wear_mask.flags_inv & HIDEFACE)) || (H.head && (H.head.flags_inv & HIDEFACE)))
			return FALSE

		if(H == lasthitter)
			return TRUE

		// Only check grove outlaw status if we can see their face
		if(H.has_status_effect(/datum/status_effect/grove_outlaw))
			if(!failed_arrests[H.real_name])
				failed_arrests[H.real_name] = 0
				if(!H.handcuffed && world.time > last_hostile_message + 30 SECONDS)
					say("Grove marked criminal! Do not move, you're under arrest! If you move you will be subdued with lethal force.")
					last_hostile_message = world.time

			if(failed_arrests[H.real_name] >= 2)
				if(world.time > last_hostile_message + 30 SECONDS)
					say("You've resisted arrest for the last time!")
					last_hostile_message = world.time
				return TRUE

			if(!H.handcuffed && Adjacent(H))
				if(world.time > last_hostile_message + 10 SECONDS)
					failed_arrests[H.real_name]++
					if(failed_arrests[H.real_name] == 2)
						say("This is your final warning! Submit to justice!")
					last_hostile_message = world.time

				if(do_after_mob(src, H, 3 SECONDS, FALSE))
					if(world.time > (last_report + 5 MINUTES))
						last_report = world.time
						scom_announce("I caught the criminal scum [H.real_name] at [get_area_name(get_area(src))].")
					var/obj/item/rope/ropey = new /obj/item/rope
					ropey.item_flags = DROPDEL
					if(ropey.apply_cuffs(H, src))
						var/obj/item/rope/legropey = new /obj/item/rope
						legropey.item_flags = DROPDEL
						legropey.apply_cuffs(H, src, TRUE)  // TRUE for legcuffs
						if(world.time > (last_report + 5 MINUTES))
							last_report = world.time
							scom_announce("I caught the grove-marked criminal [H.real_name] at [get_area_name(get_area(src))].")
							var/message = "<span class='green'>ARREST ALERT: A town guard has apprehended [H.real_name] at [get_area_name(get_area(src))]! (<a href='?src=[REF(get_turf(src))];alert_response=1;caller=[H.real_name]'>Create Waygate</a>)</span>"
							for(var/mob/M in GLOB.player_list)
								if(M.mind && (M.mind.assigned_role in list("Great Druid", "Druid", "Hedge Warden", "Hedge Knight")))
									to_chat(M, message)
									SEND_SOUND(M, sound('sound/misc/treefall.ogg'))
						failed_arrests[H.real_name] = 0
						return FALSE
					else
						qdel(ropey)
			else if(!Adjacent(H))
				walk2derpless(get_turf(H))
			return FALSE

		// Handle lying targets
		if(H.lying && !H.get_active_held_item())
			if(H.mind && H == lasthitter && Adjacent(H) && !H.handcuffed && get_num_arms(TRUE) > 1)
				say("I got you now, criminal scum.")
				if(do_after_mob(src, H, 3 SECONDS, FALSE))
					if(world.time > (last_report + 5 MINUTES))
						last_report = world.time
						scom_announce("I caught the criminal scum [H.real_name] at [get_area_name(get_area(src))].")

					// Create and use grab object
					var/obj/item/rope/ropey = new /obj/item/rope
					ropey.item_flags = DROPDEL

					if(ropey.apply_cuffs(H, src))
						var/obj/item/rope/legropey = new /obj/item/rope
						legropey.item_flags = DROPDEL
						legropey.apply_cuffs(H, src, TRUE)  // TRUE for legcuffs
					else
						qdel(ropey)
			return FALSE

		// Handle last hitter and faction checks
		if(H == lasthitter && H.alpha > 100)
			return TRUE
		if(H.Adjacent(src) && mode != AI_HUNT && H.mind && H.alpha > 100)
			if(prob(10))
				face_atom(H)
				if(calmmessages.len)
					say(pick(calmmessages))
		if(friendlyfactions)
			var/list/madafaction = H.faction
			if(find_match_in_list(madafaction, friendlyfactions) && lasthitter != target)
				return FALSE
			else
				return TRUE
		if(friendlyjobs)
			var/list/madajob = H.job
			if((madajob in friendlyjobs) && lasthitter != target)
				return FALSE
			else
				return TRUE

	if(enemies[L])
		return TRUE

	return FALSE

/mob/living/carbon/human/species/human/smart_npc/townguard/MobBump(mob/M)
	if(ishuman(M))
		var/mob/living/carbon/human/L = M
		if(lasthitter == L)
			say("Wait, I know you..!")
			if(L.alpha <= 100)
				L.apply_status_effect(/datum/status_effect/debuff/stealthcd)
			retaliate(L)
		else
			face_atom(L)
			visible_message(span_emote(pick("[src] turns to [L].", "[src] faces [L].")))
			if(calmmessages.len && prob(10))
				say(pick(calmmessages))
	. = ..()

/mob/living/carbon/human/species/human/smart_npc/townguard/proc/__feint_react(mob/living/carbon/human/user, mob/living/carbon/human/target)
	SIGNAL_HANDLER
	SHOULD_NOT_OVERRIDE(TRUE) // override feint_react instead
	INVOKE_ASYNC(src, PROC_REF(feint_react), user, target)

/mob/living/carbon/human/species/human/smart_npc/townguard/proc/feint_react(mob/living/carbon/human/user, mob/living/carbon/human/target)
	visible_message("[src], [user], [target]")
	say(pick("Yeah right.", "You are no match for me.", "Siddown."))
	visible_message(span_emote("[src] smacks [target] across the face!"))
	playsound(src,"punch_hard",100,TRUE)
	src.attack_hand(target)
	target.throw_at(get_step_away(user, src, 3), 3, 1, spin = FALSE)
	var/obj/item/activeitem = target.get_active_held_item()
	if(activeitem && !HAS_TRAIT(activeitem, TRAIT_NODROP))
		activeitem.throw_at(get_step_away(src, user, 3), 3, 2)
	target.Knockdown(30) //may end up getting you tied real fast.
	retaliate(target)

// Custom idle behavior
/mob/living/carbon/human/species/human/smart_npc/townguard/npc_idle()
	if(pulling)
		var/mob/living/carbon/human/H = pulling
		if(istype(H) && H.handcuffed)
			if(get_dist(src, H) > 1)
				walk2derpless(get_turf(H))
				return
			else if(!Adjacent(H))
				walk2derpless(get_turf(H))
				return
	if(wander)
		if(world.time < next_idle + rand(30,50))
			return
		next_idle = world.time + rand(30,50)
		if(mode != AI_OFF)
			if(prob(50))
				var/turf/target_loc = find_suitable_location()
				if(target_loc)
					walk2derpless(target_loc)
		. = ..()


// Find a suitable location to move to
/mob/living/carbon/human/species/human/smart_npc/townguard/proc/find_suitable_location()
	var/list/suitable_locations = list()

	// Collect all nearby stone road tiles
	// Adjust distance as needed, please keep it relatively low
	var/const/search_distance = 12 // allow them to move slightly out of their view range
	// It's genuinely faster to do three separate checks because BYOND does internal optimizations for it
	for(var/turf/open/floor/rogue/blocks/T in range(search_distance))
		suitable_locations += T
	for(var/turf/open/floor/rogue/cobble/T in range(search_distance))
		suitable_locations += T
	for(var/turf/open/floor/rogue/cobblerock/T in range(search_distance))
		suitable_locations += T

	// Randomly select one of the suitable locations
	return safepick(suitable_locations)

// working on fixing this, it's much better than the above system
// - ophelia

//this does not work for some reason unfortunately
/*
/mob/living/carbon/human/species/human/smart_npc/townguard/npc_idle()
	var/static/foliage_turfs // turf types we shouldn't move to as a fallback
	if(!foliage_turfs)
		foliage_turfs = typecacheof(list(/turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass))
	. = ..()
	if(mobility_flags & MOBILITY_MOVE || !isturf(loc) || !patrol)
		return
	//im not smart enough to make a good patrol system but here.
	if(prob(20) && world.time > lastpatroltime + 10 SECONDS) //give em some time to reach and whatever
		var/obj/effect/landmark/townpatrol/closest_point
		var/min_distance = INFINITY
		for(var/obj/effect/landmark/townpatrol/patrolpoint in GLOB.patrol_points)
			var/candidate_dist = get_dist(src, patrolpoint)
			if(candidate_dist < 1 || candidate_dist > 30) // too close or too far away
				continue
			if(candidate_dist < min_distance)
				min_distance = candidate_dist
				closest_point = patrolpoint
		if(closest_point)
			walk2derpless(pickedpoint)
			lastpatroltime = world.time
		else // this is expensive but should be a last resort for if they've been dragged off to the woods or something
			//make them randomly go to a distant tile thats not foilage, if there is no patrol landmark around
			var/turf/open/T = oview(rand(13,24),src)
			if(!isgroundlessturf(T) && !foliage_turfs)
			if(!istype(T, /turf/open/transparent/openspace) && !istype(T, /turf/open/floor/rogue/dirt) && !istype(T, /turf/open/floor/rogue/grass))
				walk2derpless(T)
*/

// Currently unused pending map changes.
GLOBAL_LIST_EMPTY_TYPED(patrol_points, /obj/effect/landmark/townpatrol)
/obj/effect/landmark/townpatrol
	name = "patrol-point"

/obj/effect/landmark/townpatrol/Initialize()
	. = ..()
	GLOB.patrol_points += src

/obj/effect/landmark/townpatrol/Destroy()
	GLOB.patrol_points -= src
	return ..()

/mob/living/carbon/human/species/human/smart_npc/townguard/brute

/mob/living/carbon/human/species/human/smart_npc/townguard/brute/after_creation()
	equipOutfit(new /datum/outfit/job/roguetown/human/species/human/smart_npc/townguard/brute)

/mob/living/carbon/human/species/human/smart_npc/townguard/retaliate(mob/living/L)
	var/newtarg = target
	if(L.job in list("Hedge Knight", "Hedgemaster", "Guildmaster", "Guild Appraiser", "Grandmaster", "Archpriest", "Archpriestess", "Wytcher", "Wytcher Captain"))
		return
	if(lasthitter != target)
		if(aggromessages.len)
			say(pick(aggromessages))
	lasthitter = target
	.=..()
	if(target)
		wander = TRUE
		if(src.stat != CONSCIOUS)
			return
		if(target == newtarg)
			linepoint(target)
			if(ishuman(target) && Adjacent(target))
				//i really REALLY want to punish players who try to strip those guys for loot, also they can do those badass moves on goblins too ig.
				if(prob(30) && !target.IsOffBalanced())
					say(pick("Aha!", "Parry this!", "Ha-haa!"))
					playsound(src, 'sound/combat/feint.ogg', 100, TRUE)
					visible_message(span_emote("[src] feints an attack at [target]!"))
					target.OffBalance(50) //since they cant defeat the parries might aswell give them a fat feint.
				else if(prob(20))
					say(pick("Sit the fuck down.", "Fuck away from me.", "Stay down."))
					visible_message(span_emote("[src] bashes [target] away!"))
					playsound(src,"punch_hard",100,TRUE)
					target.throw_at(target, pick(1,3), 1, src, FALSE, TRUE)
					target.Knockdown(25) //may end up getting you tied real fast.
				else if(prob(10) && target.get_active_held_item() != null)
					var/obj/item/activeitem = target.get_active_held_item()
					if(!HAS_TRAIT(activeitem, TRAIT_NODROP))
						say(pick("You are done.", "Ha! There goes your [activeitem.name]!", "You fucked up now!"))
						visible_message(span_emote("[src] disarms [target]!"))
						playsound(src,"bladedmedium",100,TRUE)
						target.OffBalance(15)
						activeitem.throw_at(get_step_away(target, src, 3), 3, 2, target, TRUE)
				if(punish_attacking && target.mind)
					var/bounty_exists = FALSE
					for(var/datum/bounty/b in GLOB.head_bounties)
						if(b.target == target.real_name)
							bounty_exists = TRUE
					if(!bounty_exists)
						add_bounty(L.real_name, 200, FALSE, "Attacking a town guardsman.", "Hedgeknights")
						var/bounty_announcement = "[target.real_name] is accused of attacking a town guardsman at [get_area_name(get_area(src))], wanted with a bounty of 200 mammons."
						say("Stop right there, criminal scum!")
						scom_announce(bounty_announcement)
						to_chat(L, span_notice("I got a bounty on my head now!"))
					else if(world.time > (last_report + 5 MINUTES))
						last_report = world.time
						scom_announce("the criminal [target.real_name] is reported attacking a townsguard at [get_area_name(get_area(src))].")

/mob/living/carbon/human/species/human/smart_npc/townguard/after_creation()
	..()
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_FEINT_IMMUNITY, TRAIT_GENERIC)
	//should fucking prevent people from feeding them poisonous shit.
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NASTY_EATER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_ROT_EATER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_WILD_EATER, TRAIT_GENERIC)
	RegisterSignal(src, COMSIG_FEINT_REACT, PROC_REF(__feint_react))
	equipOutfit(new /datum/outfit/job/roguetown/human/species/human/smart_npc/townguard)
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes/night_vision/full_darksight) //elf eyes
	if(organ_eyes)
		organ_eyes.eye_color = pick("27becc", "35cc27", "000000")
	update_hair()
	update_body()

/mob/living/carbon/human/species/human/smart_npc/townguard/handle_combat()
	if(mode == AI_HUNT)
		if(prob(10) && target)
			emote("rage")
	. = ..()

/datum/outfit/job/roguetown/human/species/human/smart_npc/townguard/pre_equip(mob/living/carbon/human/H)
	if(prob(50))
		wrists = /obj/item/clothing/wrists/roguetown/bracers
	cloak = /obj/item/clothing/cloak/templar/dendor
	gloves = /obj/item/clothing/gloves/roguetown/forestergauntlets
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/foresterarmor
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/tights
	head = /obj/item/clothing/head/roguetown/helmet/foresterhelmet
	H.STASPD = 12
	H.STAPER = 10
	H.STACON = 14
	H.STAEND = 15
	H.STAINT = 12
	H.STASTR = rand(13,16)
	if(prob(50))
		r_hand = /obj/item/rogueweapon/sword
	else
		r_hand = /obj/item/rogueweapon/mace
	l_hand = /obj/item/rogueweapon/shield/tower
	shoes = /obj/item/clothing/shoes/roguetown/boots/forestershoes
	if(prob(30))
		neck = /obj/item/clothing/neck/roguetown/chaincoif
		H.eye_color = pick("27becc", "35cc27", "000000")
	H.hair_color = pick ("4f4f4f", "61310f", "faf6b9")
	H.facial_hair_color = H.hair_color
	if(H.gender == MALE)
		H.name = pick( world.file2list("strings/rt/names/elf/elfwm.txt") )
		H.real_name = H.name
	else
		H.name = pick( world.file2list("strings/rt/names/elf/elfwf.txt") )
		H.real_name = H.name

/datum/outfit/job/roguetown/human/species/human/smart_npc/townguard/brute/pre_equip(mob/living/carbon/human/H)
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	cloak = /obj/item/clothing/cloak/templar/dendor
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs
	head = /obj/item/clothing/head/roguetown/helmet/dendorhelm
	if(prob(60))
		mask = /obj/item/clothing/mask/rogue/facemask
	gloves = /obj/item/clothing/gloves/roguetown/chain
	H.STASPD = 12
	H.STAPER = 10
	H.STACON = 16
	H.STAEND = 16
	H.STAINT = 14
	H.STASTR = rand(14,16)
	if(prob(50))
		r_hand = /obj/item/rogueweapon/halberd/bardiche
	else
		r_hand = /obj/item/rogueweapon/greatsword
	shoes = /obj/item/clothing/shoes/roguetown/boots/armoriron
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(H.gender == MALE)
		H.name = pick( world.file2list("strings/rt/names/elf/elfwm.txt") )
		H.real_name = H.name
	else
		H.name = pick( world.file2list("strings/rt/names/elf/elfwf.txt") )
		H.real_name = H.name

/mob/living/carbon/human/species/human/smart_npc/townguard/sentry
	patrol = FALSE
	wander = FALSE
	var/turf/spawned_loc

/mob/living/carbon/human/species/human/smart_npc/townguard/sentry/Initialize()
	. = ..()
	spawned_loc = get_turf(src)
	addtimer(CALLBACK(src, PROC_REF(return_to_post)), 5 MINUTES, TIMER_STOPPABLE)

/mob/living/carbon/human/species/human/smart_npc/townguard/sentry/proc/return_to_post()
	if(src.loc != spawned_loc)
		walk2derpless(spawned_loc)
		wander = FALSE
	addtimer(CALLBACK(src, PROC_REF(return_to_post)), 5 MINUTES, TIMER_STOPPABLE)

/mob/living/carbon/human/species/human/smart_npc/townguard/sentry/after_creation()
	equipOutfit(new /datum/outfit/job/roguetown/human/species/human/smart_npc/townguard/sentry)

/datum/outfit/job/roguetown/human/species/human/smart_npc/townguard/sentry/pre_equip(mob/living/carbon/human/H)
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	cloak = /obj/item/clothing/cloak/templar/dendor
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs
	head = /obj/item/clothing/head/roguetown/helmet/dendorhelm
	if(prob(60))
		mask = /obj/item/clothing/mask/rogue/facemask
	gloves = /obj/item/clothing/gloves/roguetown/chain
	H.STASPD = 12
	H.STAPER = 10
	H.STACON = 16
	H.STAEND = 16
	H.STAINT = 14
	H.STASTR = rand(14,16)
	r_hand = /obj/item/rogueweapon/halberd
	shoes = /obj/item/clothing/shoes/roguetown/boots/armoriron
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(H.gender == MALE)
		H.name = pick( world.file2list("strings/rt/names/elf/elfwm.txt") )
		H.real_name = H.name
	else
		H.name = pick( world.file2list("strings/rt/names/elf/elfwf.txt") )
		H.real_name = H.name

/mob/living/carbon/human/species/human/smart_npc/back_to_idle()
	last_aggro_loss = world.time
	if(pulling)
		var/mob/living/carbon/human/H = pulling
		if(!istype(H) || !H.handcuffed)
			stop_pulling()
	myPath = list()
	mode = AI_IDLE
	target = null
	a_intent = INTENT_HELP
	frustration = 0
	walk_to(src,0)

/mob/living/carbon/human/species/human/smart_npc/townguard/back_to_idle()
	last_aggro_loss = world.time
	if(pulling)
		var/mob/living/carbon/human/H = pulling
		if(!istype(H) || !H.handcuffed)
			stop_pulling()
	myPath = list()
	mode = AI_IDLE
	target = null
	a_intent = INTENT_HELP
	frustration = 0
	walk_to(src,0)

/mob/living/carbon/human/species/human/smart_npc/townguard/Moved()
	. = ..()
	if(pulling)
		var/mob/living/carbon/human/H = pulling
		if(istype(H) && H.handcuffed)
			if(get_dist(src, H) > 1)
				walk2derpless(get_turf(H))

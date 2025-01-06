//By Vide Noir https://github.com/EaglePhntm.
//templated on hearthstone sea raiders.

/mob/living/carbon/human/species/human/smart_npc
	race = /datum/species/elf/wood
	mode = AI_IDLE
	faction = list("Station")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	possible_rmb_intents = list()
	erpable = TRUE
	wander = TRUE
	d_intent = INTENT_DODGE //parry dont work with npcs.
	aggressive = 1
	show_genitals = TRUE
	var/list/friendlyfactions = list("Station", "neutral", "rogueanimal", "saiga", "chickens", "goats", "cows", "turtles", "rats", "crabs", "horse")
	//using friendlyjobs will make this mob hostile to everyone not of those jobs, unless they are in friendlyfactions.
	var/list/friendlyjobs
	//quotes from skyrim cause we love skyrim.
	var/list/calmmessages = list()
	var/list/aggromessages = list()
	var/mob/living/lasthitter = null
	var/punish_attacking = FALSE

/mob/living/carbon/human/species/human/smart_npc/Initialize()
	gender = pick(MALE,FEMALE)
	hairstyle = pick("Bobcut", "Braid (High)", "Afro", "Pigtails", "Pixie Cut", "Bald")
	skin_tone = pick(GLOB.skin_tones)
	. = ..()
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC) //until someone adds self healing and stam regen
	spawn(10)
		after_creation()

/mob/living/carbon/human/species/human/smart_npc/after_creation()
	. = ..()
	ADD_TRAIT(src, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC) //necessary cause they dont path around those shit and die.
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	if(organ_eyes)
		organ_eyes.eye_color = pick("27becc", "35cc27", "000000")
	update_hair()
	update_body()

/mob/living/carbon/human/species/human/smart_npc/should_target(mob/living/L)
	if(!L)
		return FALSE

	if(L == src)
		return FALSE

	if(HAS_TRAIT(src, TRAIT_PACIFISM))
		return FALSE

	if(!is_in_zweb(src,L))
		return FALSE

	if(L.alpha <= 100) //if mostly invisible dont see it, surely this wont go wrong.
		return FALSE

	if(L.name in friends)
		return FALSE

	if(L.stat != CONSCIOUS)
		return FALSE

	if(L.lying && !L.get_active_held_item())
		if(ishuman(L) && L.mind)
			var/mob/living/carbon/human/badboi = L
			if(badboi == lasthitter && Adjacent(badboi) && !badboi.handcuffed && get_num_arms(TRUE) > 1)
				var/obj/item/grabbing/G = new()
				var/used_limb = badboi.find_used_grab_limb(src)
				G.name = "[badboi]'s [parse_zone(used_limb)]"
				var/obj/item/bodypart/BP = badboi.get_bodypart(check_zone(used_limb))
				G.grabbed = badboi
				G.grabbee = src
				G.limb_grabbed = BP
				G.sublimb_grabbed = used_limb
				G.icon_state = zone_selected
				START_PROCESSING(SSfastprocess, G)
				badboi.grabbedby += G
				put_in_hands(G)
				G.update_hands(src)
				start_pulling(badboi)
				visible_message("[src] starts to tie [badboi] up!")
				if(do_after_mob(src, badboi, 4 SECONDS, FALSE)) //some chance to escape
					// Apply both handcuffs and legcuffs
					var/obj/item/rope/handropey = new /obj/item/rope
					handropey.apply_cuffs(badboi, src)
					var/obj/item/rope/legropey = new /obj/item/rope
					legropey.apply_cuffs(badboi, src, TRUE)  // TRUE for legcuffs
				else
					dropItemToGround(G)
		return FALSE
	if(L.InFullCritical())
		return FALSE
	if(L == lasthitter && L.alpha > 100)
		return TRUE
	if(ishuman(L))
		var/mob/living/carbon/human/madafaka = L
		if(madafaka.Adjacent(src) && mode != AI_HUNT && madafaka.mind && madafaka.alpha > 100)
			if(prob(10))
				face_atom(madafaka)
				if(calmmessages.len)
					say(pick(calmmessages))
		if(friendlyfactions)
			var/list/madafaction = madafaka.faction
			if(find_match_in_list(madafaction, friendlyfactions) && lasthitter != target)
				return FALSE
			else
				return TRUE
		if(friendlyjobs)
			var/list/madajob = madafaka.job
			if((madajob in friendlyjobs) && lasthitter != target)
				return FALSE
			else
				return TRUE

	if(enemies[L])
		return TRUE

	return FALSE


/mob/living/carbon/human/species/human/smart_npc/retaliate(mob/living/L)
	var/newtarg = target
	if(lasthitter != target)
		if(aggromessages.len)
			say(pick(aggromessages))
	lasthitter = target
	.=..()
	if(target)
		if(src.stat != CONSCIOUS)
			return
		wander = TRUE
		if(target == newtarg)
			linepoint(target)
			if(ishuman(target) && Adjacent(target))
				//those are not your everyday goblins.
				if(prob(30) && !target.IsOffBalanced())
					say(pick("Aha!", "Parry this!", "Ha-haa!"))
					playsound(src, 'sound/combat/feint.ogg', 100, TRUE)
					visible_message(span_emote("[src] feints an attack at [target]!"))
					target.OffBalance(50) //since they cant defeat the parries might aswell give them a fat feint.
				else if(prob(5)) //knockdown is annoying so less likely.
					say(pick("Sit the fuck down.", "Fuck away from me.", "Stay down."))
					visible_message(span_emote("[src] bashes [target] away!"))
					playsound(src,"punch_hard",100,TRUE)
					target.throw_at(target, pick(1,3), 1, src, FALSE, TRUE)
					target.Knockdown(20) //may end up getting you tied real fast.
				else if(prob(5) && target.get_active_held_item() != null)
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
						add_bounty(L.real_name, 150, FALSE, "Attacking [name].", "[name]'s [pick("widow","parents","daughter","son","friends","partner")] (NPC)")
						var/bounty_announcement = "[target.real_name] is accused of attacking [name] at [get_area_name(get_area(src))], wanted with a bounty of 150 mammons."
						scom_announce(bounty_announcement)
						to_chat(L, span_notice("I got a bounty on my head now!"))

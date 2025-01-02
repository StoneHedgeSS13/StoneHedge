// Necrite
/obj/effect/proc_holder/spell/targeted/burialrite
	name = "Burial Rites"
	range = 5
	overlay_state = "consecrateburial"
	releasedrain = 30
	charge_max = 30 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "Judge and Ferrymen, grant thee passage forth and spare the trials of the forgotten."
	invocation_type = "whisper" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = 5 //very weak spell, you can just make a grave marker with a literal stick

/obj/effect/proc_holder/spell/targeted/burialrite/cast(list/targets, mob/user = usr)
	. = ..()
	var/success = FALSE
	for(var/obj/structure/closet/crate/coffin/coffin in view(1))
		success = pacify_coffin(coffin, user)
		if(success)
			user.visible_message("[user] consecrates [coffin]!", "My funeral rites have been performed on [coffin]!")
			return
	for(var/obj/structure/closet/dirthole/hole in view(1))
		success = pacify_coffin(hole, user)
		if(success)
			user.visible_message("[user] consecrates [hole]!", "My funeral rites have been performed on [hole]!")
			return
	to_chat(user, span_red("I failed to perform the rites."))

/obj/effect/proc_holder/spell/targeted/seance
	name = "Seance"
	range = 5
	overlay_state = "consecrateburial"
	releasedrain = 30
	charge_max = 30 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "With ashes do I annoint the eyes and ears of those around me and allow them to commune with the dead."
	invocation_type = "shout" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = 50

/obj/effect/proc_holder/spell/targeted/seance/cast(list/targets, mob/user = usr)
	. = ..()
	var/requirement = FALSE
	var/sacrifice
	for(var/obj/item/I in user.held_items)
		if(istype(I, /obj/item/ash))
			requirement = TRUE
			sacrifice = I
			qdel(sacrifice)
	if(requirement == TRUE)
		for(var/mob/living/carbon/human/person in view(2))
			if(person == user)
				user.visible_message("[user] scatters the [sacrifice]", "I scatter the [sacrifice]!")
			else
				add_buff_timer(person)
	else
		to_chat(user, span_warning("I need to be holding ashes in my hand to cast this."))

/obj/effect/proc_holder/spell/targeted/seance/proc/add_buff_timer(mob/living/user)
	ADD_TRAIT(user, TRAIT_SEESPIRITS, MAGIC_TRAIT)
	ADD_TRAIT(user, TRAIT_SIXTHSENSE, MAGIC_TRAIT)
	user.grant_language(/datum/language_holder/abyssal)
	user.update_sight()
	addtimer(CALLBACK(src, PROC_REF(remove_buff), user), wait = 5 MINUTES)
	to_chat(user, span_notice("My eyes and ears become aware of the spectral."))

/obj/effect/proc_holder/spell/targeted/seance/proc/remove_buff(mob/living/user)
	REMOVE_TRAIT(user, TRAIT_SEESPIRITS, MAGIC_TRAIT)
	REMOVE_TRAIT(user, TRAIT_SIXTHSENSE, MAGIC_TRAIT)
	user.remove_language(/datum/language_holder/abyssal)
	user.update_sight()
	to_chat(user, span_warning("My eyes and ears grow blind to the spectral."))

/obj/effect/proc_holder/spell/targeted/churn
	name = "Churn Undead"
	range = 2
	overlay_state = "necra"
	releasedrain = 15
	charge_max = 15 SECONDS
	max_targets = 0
	cast_without_targets = TRUE
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "The Undermaiden rebukes!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = 10

/obj/effect/proc_holder/spell/targeted/churn/cast(list/targets,mob/living/user = usr)
	var/prob2explode = 100
	if(user && user.mind)
		prob2explode = 0
		for(var/i in 1 to user.mind.get_skill_level(/datum/skill/magic/holy))
			prob2explode += 30
	for(var/mob/living/L in targets)
		var/isvampire = FALSE
		var/iszombie = FALSE
		if(L.stat == DEAD)
			continue
		if(L.mind)
			var/datum/antagonist/vampirelord/lesser/V = L.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
			if(V)
				if(!V.disguised)
					isvampire = TRUE
			if(L.mind.has_antag_datum(/datum/antagonist/zombie))
				iszombie = TRUE
			if(L.mind.special_role == "Vampire Lord")
				user.visible_message(span_warning("[L] overpowers being churned!"), span_userdanger("[L] is too strong, I am churned!"))
				user.Stun(50)
				user.throw_at(get_ranged_target_turf(user, get_dir(user,L), 7), 7, 1, L, spin = FALSE)
				return
		if((L.mob_biotypes & MOB_UNDEAD) || isvampire || iszombie)
//			L.visible_message(span_warning("[L] is unmade by PSYDON!"), span_danger("I'm unmade by PSYDON!"))
			var/vamp_prob = prob2explode
			if(isvampire)
				vamp_prob -= 59
			if(prob(vamp_prob))
				explosion(get_turf(L), light_impact_range = 1, flame_range = 1, smoke = FALSE)
				L.Stun(50)
//				L.throw_at(get_ranged_target_turf(L, get_dir(user,L), 7), 7, 1, L, spin = FALSE)
			else
				L.visible_message(span_warning("[L] resists being churned!"), span_userdanger("I resist being churned!"))
	..()
	return TRUE

/obj/effect/proc_holder/spell/targeted/soulspeak
	name = "Summon Spirit"
	range = 5
	overlay_state = "speakwithdead"
	releasedrain = 30
	charge_max = 30 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "Oriri mortuus spiritus."
	invocation_type = "whisper" //can be none, whisper, emote and shout
	miracle = FALSE
	devotion_cost = 0
	var/summoned_spirit

/obj/effect/proc_holder/spell/targeted/soulspeak/cast(list/targets,mob/user = usr)
	if(summoned_spirit)
		var/mob/living/carbon/spirit/SS = summoned_spirit
		to_chat(user, "You dismiss the spirit to the underworld.")
		to_chat(SS, "[user.real_name] has returned you to the underworld. If you are wrongfully denied your reward by your summoner, please open a ticket.")
		for(var/obj/effect/landmark/underworld/A in GLOB.landmarks_list)
			for(var/obj/item/I in SS.held_items)
				if(!istype(I, /obj/item/roguecoin/silver) && !istype(I, /obj/item/flashlight/lantern/shrunken) && !istype(I, /obj/item/underworld/coin))
					. |= SS.dropItemToGround(I)
				if(istype(I, /obj/item/roguecoin/silver))
					to_chat(SS, "As you return across the veil to the underworld, the silver coin in your hand is transformed.")
					qdel(I)
					var/obj/item/underworld/coin/C = new
					SS.put_in_hand(C)
			SS.loc = A.loc
			SS.invisibility = initial(SS.invisibility)
		user.remove_language(/datum/language_holder/abyssal)
		summoned_spirit = null
		return
	var/mob/living/carbon/spirit/capturedsoul = null
	var/list/souloptions = list()
	var/list/itemstorestore = list()
	for(var/mob/living/carbon/spirit/S in GLOB.mob_list)
		souloptions += S.livingname
	var/pickedsoul = input(user, "Which soul should I commune with?", "Available Souls") as null|anything in souloptions
	if(!pickedsoul)
		return
	for(var/mob/living/carbon/spirit/P in GLOB.carbon_list)
		if(P.livingname == pickedsoul)
			to_chat(P, "You feel yourself being summoned to a Gravesinger.")
			sleep(2 SECONDS)
			P.loc = user.loc
			user.say("I call upon the soul of [P.livingname] to become corporeal and walk this world for a time. In return for your obediance, I offer the choice of reincarnation by paying your toll in silver, or the choice of reanimation, by returning your body to life.", language = /datum/language/common, forced = "invocation")
			capturedsoul = P
			summoned_spirit = capturedsoul
			P.invisibility = 0
/*
			for(var/obj/item/I in P.held_items) // this is big ass, will revisit later
				. |= P.dropItemToGround(I)
				if(istype(I, /obj/item/underworld/coin))
					itemstorestore |= "token"
				if(istype(I, /obj/item/flashlight/lantern/shrunken))
					itemstorestore |= "lamp"
				qdel(I)
*/
			break
		to_chat(P, "[itemstorestore]")
	if(summoned_spirit)
		spawn(60 MINUTES)
			if(!summoned_spirit)
				return
			to_chat(user, "The soul returns to the underworld as your spell expires.")
			to_chat(capturedsoul, "You feel yourself being pulled to the underworld as your summoner's spell expires. The carriage awaits, if your summoner")
			for(var/obj/effect/landmark/underworld/A in GLOB.landmarks_list)
				capturedsoul.loc = A.loc
				capturedsoul.invisibility = initial(capturedsoul.invisibility)
				for(var/obj/item/I in capturedsoul.held_items)
					if(!istype(I, /obj/item/roguecoin/silver) && !istype(I, /obj/item/flashlight/lantern/shrunken) && !istype(I, /obj/item/underworld/coin))
						. |= capturedsoul.dropItemToGround(I)
					if(istype(I, /obj/item/roguecoin/silver))
						to_chat(capturedsoul, "As you return across the veil to the underworld, the silver coin in your hand is transformed.")
						qdel(I)
						var/obj/item/underworld/coin/C = new
						capturedsoul.put_in_hand(C)
			summoned_spirit = null
		to_chat(user, "<font color='blue'>I feel a cold chill run down my spine; the spirit has arrived.</font>")
		capturedsoul.Immobilize(10 SECONDS)

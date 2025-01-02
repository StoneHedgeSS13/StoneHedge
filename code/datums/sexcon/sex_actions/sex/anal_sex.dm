/datum/sex_action/anal_sex
	name = "Sodomize them"
	stamina_cost = 1.0
	check_incapacitated = FALSE

/datum/sex_action/anal_sex/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_ANUS))
		if(issimple(target) && target.sexcon)
		else
			return FALSE
	return TRUE

/datum/sex_action/anal_sex/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = userhuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_ANUS))
		if(issimple(target) && target.sexcon)
		else
			return FALSE
	if(!user.sexcon.can_use_penis())
		return
	return TRUE

/datum/sex_action/anal_sex/on_start(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))	//Humen on Seelie
		//Scream and rib break
		user.visible_message(span_warning("[user] forces their cock into [target]'s tiny butt!"))
		var/obj/item/bodypart/BPG = target.get_bodypart(BODY_ZONE_PRECISE_GROIN)
		var/obj/item/bodypart/BPC = target.get_bodypart(BODY_ZONE_CHEST)
		if(user.sexcon.force > SEX_FORCE_LOW)
			if(prob(20))
				BPC.add_wound(/datum/wound/fracture/chest)
				BPG.add_wound(/datum/wound/fracture/groin)
		target.apply_damage(5, BRUTE, BPC)
		target.apply_damage(5, BRUTE, BPG)
	else if(!(HAS_TRAIT(target, TRAIT_TINY)) && HAS_TRAIT(user, TRAIT_TINY))	//Seelie on Humen
		user.visible_message(span_warning("[user] inserts their tiny cock into [target]'s butt!"))
	else
		user.visible_message(span_warning("[user] slides his cock into [target]'s butt!"))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/datum/sex_action/anal_sex/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s ass."))

	if(HAS_TRAIT(user, TRAIT_DEATHBYSNOOSNOO))
		user.sexcon.try_pelvis_crush(target)

	if(user.rogue_sneaking || user.alpha <= 100)
		segsovolume *= 0.5
	playsound(target, 'sound/misc/mat/segso.ogg', segsovolume, TRUE, -2, ignore_walls = FALSE)
	do_thrust_animate(user, target)

	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))
		//Scream and body damage
		target.apply_damage(10, BRUTE, target.get_bodypart(BODY_ZONE_CHEST))
		target.apply_damage(3, BRUTE, target.get_bodypart(BODY_ZONE_PRECISE_GROIN))

	if(user.sexcon.check_active_ejaculation())
		user.visible_message(span_lovebold("[user] cums into [target]'s ass!"))
		user.sexcon.cum_into(anal = TRUE)
//		user.try_impregnate(target)
		user.virginity = FALSE
		target.virginity = FALSE

	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(user, 1.2, 0, TRUE)
		user.sexcon.perform_sex_action(target, 1.2, 3, FALSE)
	else
		user.sexcon.perform_sex_action(user, 2.4, 0, TRUE)
		user.sexcon.perform_sex_action(target, 2.4, 7, FALSE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/anal_sex/on_finish(mob/living/user, mob/living/target)
	..()
	if(!(HAS_TRAIT(target, TRAIT_TINY)) && HAS_TRAIT(user, TRAIT_TINY)) //Male seelie trying to fuck normal size humen
		user.visible_message(span_warning("[user] stops trying to insert hit tiny cock into [target]'s ass."))
	else
		user.visible_message(span_warning("[user] pulls his cock out of [target]'s ass."))

/datum/sex_action/anal_sex/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

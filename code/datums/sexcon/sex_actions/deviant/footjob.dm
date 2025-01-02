/datum/sex_action/footjob
	name = "Jerk them off with feet"
	check_same_tile = FALSE
	check_incapacitated = FALSE

/datum/sex_action/footjob/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		if(issimple(target) && target.gender == MALE && target.sexcon)
		else
			return FALSE

	if(!(HAS_TRAIT(user, TRAIT_TINY)) && HAS_TRAIT(target, TRAIT_TINY))	//Normal size trying to footjob male Seelie, pp too smol
		return FALSE
	return TRUE

/datum/sex_action/footjob/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
/// Booted footjob time
//	if(!get_location_accessible(user, BODY_ZONE_PRECISE_L_FOOT))
//		return FALSE
//	if(!get_location_accessible(user, BODY_ZONE_PRECISE_R_FOOT))
//		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		if(issimple(target) && target.gender == MALE && target.sexcon)
		else
			return FALSE
	return TRUE

/datum/sex_action/footjob/on_start(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(user, TRAIT_TINY) && !HAS_TRAIT(target, TRAIT_TINY))
		user.visible_message(span_warning("[user] plants their tiny feet against [target]'s cock..."))
	else
		user.visible_message(span_warning("[user] puts their feet on [target]'s cock..."))

/datum/sex_action/footjob/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		if(HAS_TRAIT(user, TRAIT_TINY) && !HAS_TRAIT(target, TRAIT_TINY))
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] rubs their feet along [target]'s cock..."))
		else
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] jerks [target]'s cock with their feet..."))
	if(user.rogue_sneaking || user.alpha <= 100)
		segsovolume *= 0.5
	playsound(user, 'sound/misc/mat/fingering.ogg', segsovolume, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(target, 2, 4, TRUE)

	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/footjob/on_finish(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(user, TRAIT_TINY) && !HAS_TRAIT(target, TRAIT_TINY))
		user.visible_message(span_warning("[user] stops rubbing their feet along [target]'s cock."))
	else
		user.visible_message(span_warning("[user] stops jerking [target] off with their feet."))

/datum/sex_action/footjob/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE

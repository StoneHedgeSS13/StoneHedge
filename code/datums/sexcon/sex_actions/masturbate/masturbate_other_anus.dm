/datum/sex_action/masturbate_other_anus
	name = "Finger their butt"
	check_same_tile = FALSE

/datum/sex_action/masturbate_other_anus/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/masturbate_other_anus/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	return TRUE

/datum/sex_action/masturbate_other_anus/on_start(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY))) //Fairy on non-fairy will be fucking, otherwise normal
		//Stroking becomes finger fucking instead
		user.visible_message(span_warning("[user] starts fucking [target]'s butt with their finger..."))
	else
		user.visible_message(span_warning("[user] starts fingering [target]'s butt..."))

/datum/sex_action/masturbate_other_anus/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY))) //Fairy on non-fairy will be fucking, otherwise normal
			//Stroking becomes finger fucking instead
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s butt with their finger..."))
		else
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fingers [target]'s butt..."))
	if(user.rogue_sneaking || user.alpha <= 100)
		segsovolume *= 0.5
	playsound(user, 'sound/misc/mat/fingering.ogg', segsovolume, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(target, 2, 6, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_other_anus/on_finish(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY))) //Fairy on non-fairy will be fucking, otherwise normal
		user.visible_message(span_warning("[user] stops fucking [target]'s butt with their finger."))
	else
		user.visible_message(span_warning("[user] stops fingering [target]'s butt."))

/datum/sex_action/masturbate_other_anus/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE

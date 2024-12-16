/datum/sex_action/force_nipple_sex
	name = "Force them to fuck nipple"
	require_grab = TRUE
	stamina_cost = 1.0

/datum/sex_action/force_nipple_sex/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!user.has_quirk(/datum/quirk/weirdo) && !target.has_quirk(/datum/quirk/weirdo))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_BREASTS))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		if(issimple(target) && target.gender == MALE && target.sexcon)
		else
			return FALSE
		return FALSE
	return TRUE

/datum/sex_action/force_nipple_sex/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_shirt)
			var/obj/item/clothing/suit/roguetown/shirtsies = userhuman.wear_shirt
			if(shirtsies.flags_inv & HIDEBOOB)
				if(shirtsies.genitalaccess == FALSE)
					return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		if(issimple(target) && target.gender == MALE && target.sexcon)
		else
			return FALSE
	if(!target.sexcon.can_use_penis())
		return
	return TRUE

/datum/sex_action/force_nipple_sex/on_start(mob/living/user, mob/living/target)
	target.visible_message(span_warning("[user] grabs [target] and shoves their cock into their own nipple!"))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/datum/sex_action/force_nipple_sex/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks their nipple against [target]'s cock forcibly."))
	target.make_sucking_noise()

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	if(user.sexcon.check_active_ejaculation())
		user.visible_message(span_love("[target] cums into [user]'s nipple!"))
		user.sexcon.cum_into(nipple = TRUE)

	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 1.2, 3, FALSE)
	else
		user.sexcon.perform_sex_action(target, 2.4, 7, FALSE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/force_nipple_sex/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] pulls [target]'s cock out of their nipple."))

/datum/sex_action/force_nipple_sex/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

/datum/sex_action/suck_nipples
	name = "Suck their nipples"
	check_same_tile = FALSE

/datum/sex_action/suck_nipples/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_BREASTS))
		if(issimple(target) && target.gender == FEMALE && target.sexcon)
		else
			return FALSE
	return TRUE

/datum/sex_action/suck_nipples/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_shirt)
			var/obj/item/clothing/suit/roguetown/shirtsies = targethuman.wear_shirt
			if(shirtsies.flags_inv & HIDEBOOB)
				if(shirtsies.genitalaccess == FALSE)
					return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_BREASTS))
		if(issimple(target) && target.gender == FEMALE && target.sexcon)
		else
			return FALSE
	return TRUE

/datum/sex_action/suck_nipples/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts sucking [target]'s nipples..."))

/datum/sex_action/suck_nipples/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] sucks [target]'s nipples..."))
	user.make_sucking_noise()

	user.sexcon.perform_sex_action(target, 1, 3, TRUE)
	target.sexcon.handle_passive_ejaculation()

	var/obj/item/organ/filling_organ/breasts/tiddies = target.getorganslot(ORGAN_SLOT_BREASTS)
	var/milk_to_add = min(max(tiddies.organ_size, 1), tiddies.reagents.total_volume)
	if(milk_to_add > 0 && prob(25))
		tiddies.reagents.trans_to(user, milk_to_add, TRUE, TRUE, FALSE, target, FALSE, INGEST)
		to_chat(target, span_notice("I can feel milk leak from my buds."))

/datum/sex_action/suck_nipples/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops sucking [target]'s nipples ..."))

/datum/sex_action/suck_nipples/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE

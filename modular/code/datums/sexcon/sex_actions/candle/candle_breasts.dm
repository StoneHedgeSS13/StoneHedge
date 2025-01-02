/datum/sex_action/candle_breasts
	name = "Use candle wax on their breasts"

/datum/sex_action/candle_breasts/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!get_candle_in_either_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/candle_breasts/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_shirt)
			var/obj/item/clothing/suit/roguetown/shirtsies = targethuman.wear_shirt
			if(shirtsies.flags_inv & HIDEBOOB)
				if(shirtsies.genitalaccess == FALSE)
					return FALSE
	if(!target.getorganslot(ORGAN_SLOT_BREASTS))
		return FALSE
	if(!get_candle_in_either_hand(user))
		return FALSE
	var/obj/item/candle/C = get_candle_in_either_hand(user)
	if(!C.lit)
		to_chat(usr, span_warning("Light it first!"))
		return FALSE

	return TRUE

/datum/sex_action/candle_breasts/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] begins to drop wax [target]'s breasts..."))

/datum/sex_action/candle_breasts/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] drops wax on [target]'s breasts..."))

	user.sexcon.perform_sex_action(target, 0.5, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

	if(prob(33))
		to_chat(target, span_warning("It's hot!"))
		playsound(src, 'sound/items/firesnuff.ogg', 20)

/datum/sex_action/candle_breasts/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops dropping wax on [target]'s breasts..."))

/datum/sex_action/candle_breasts/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE

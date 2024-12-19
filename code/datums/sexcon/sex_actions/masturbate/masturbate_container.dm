/* we got a way of milking filling organs on our own -vide
/datum/sex_action/masturbate_container
	name = "Masturbate into container"

/datum/sex_action/masturbate_container/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user != target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_container/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/holding = user.get_active_held_item()
	if(istype(holding, /obj/item/reagent_containers/glass) != TRUE)
		return FALSE
	if(user != target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = userhuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(!user.sexcon.can_use_penis())
		return
	return TRUE

/datum/sex_action/masturbate_container/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts masturbating into [user.get_active_held_item()]..."))

/datum/sex_action/masturbate_container/on_perform(mob/living/user, mob/living/target)
	var/chosen_verb = pick(list("pleasures themself over [user.get_active_held_item()]", "sensually massages themself over [user.get_active_held_item()]", "masturbates over [user.get_active_held_item()]"))
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] [chosen_verb]..."))
	if(user.rogue_sneaking || user.alpha <= 100)
		segsovolume *= 0.5
	playsound(user, 'sound/misc/mat/fingering.ogg', segsovolume, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 0, TRUE)

	user.sexcon.handle_container_ejaculation()

/datum/sex_action/masturbate_container/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops masturbating into the container."))

/datum/sex_action/masturbate_container/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
// WIP, UNFINISHED, I JUST WANT PEOPLE TO SEE. if you want to help feel free to review and add code or whatever. i am a slopcoder so i need it <3
*/

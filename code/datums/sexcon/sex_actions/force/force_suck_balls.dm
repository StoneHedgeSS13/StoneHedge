/datum/sex_action/force_suck_balls
	name = "Force them to suck balls"
	require_grab = TRUE
	stamina_cost = 1.0

/datum/sex_action/force_suck_balls/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_TESTICLES))
		return FALSE
	return TRUE

/datum/sex_action/force_suck_balls/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = userhuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_TESTICLES))
		return FALSE
	return TRUE

/datum/sex_action/force_suck_balls/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] forces [target]'s head down to swallow and suck on their balls!"))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/datum/sex_action/force_suck_balls/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] forces [target] to suck their balls."))
	target.make_sucking_noise()

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	if(user.sexcon.check_active_ejaculation())
		user.visible_message(span_love("cums on [target]'s head!"))
		user.sexcon.cum_onto()

	user.sexcon.perform_sex_action(target, 0, 7, FALSE)
	if(!user.sexcon.considered_limp())
		user.sexcon.perform_deepthroat_oxyloss(target, 0.6)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/force_suck_balls/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] pulls their balls out of [target]'s mouth."))

/datum/sex_action/force_suck_balls/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

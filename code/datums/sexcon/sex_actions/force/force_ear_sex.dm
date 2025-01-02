/datum/sex_action/force_ear_sex
	name = "Force them to fuck ear"
	require_grab = TRUE
	stamina_cost = 1.0

/datum/sex_action/force_ear_sex/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_EARS))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		if(issimple(target) && target.gender == MALE && target.sexcon)
		else
			return FALSE
	return TRUE

/datum/sex_action/force_ear_sex/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_EARS))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		if(issimple(target) && target.gender == MALE && target.sexcon)
		else
			return FALSE
	if(!target.sexcon.can_use_penis())
		return
	return TRUE

/datum/sex_action/force_ear_sex/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] forces [target]'s head down to fuck their ear!"))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/datum/sex_action/force_ear_sex/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s ear forcibly."))
	target.make_sucking_noise()

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	if(user.sexcon.check_active_ejaculation())
		user.visible_message(span_love("cums into [target]'s ear!"))
		user.sexcon.cum_into(oral = TRUE)

	var/datum/sex_controller/sc = user.sexcon

	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 1.2, 3, FALSE)
	else
		user.sexcon.perform_sex_action(target, 2.4, 7, FALSE)
		user.sexcon.perform_deepthroat_oxyloss(target, 1.3)
		if(sc.force > SEX_FORCE_HIGH)
			user.adjustEarDamage(0.2)
		if(sc.force > SEX_FORCE_HIGH)
			if(prob(15))
				to_chat(user, span_warning("I feel something squish against my tip..."))
			target.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.2)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/force_ear_sex/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] pulls their cock out of [target]'s ear."))

/datum/sex_action/force_ear_sex/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

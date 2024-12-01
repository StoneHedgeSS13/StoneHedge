/datum/sex_action/anal_ride_sex
	name = "Ride them anally"
	stamina_cost = 1.0
	aggro_grab_instead_same_tile = FALSE
	check_incapacitated = FALSE

/datum/sex_action/anal_ride_sex/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_ANUS))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		if(issimple(target) && target.gender == MALE && target.sexcon)
		else
			return FALSE
	return TRUE

/datum/sex_action/anal_ride_sex/can_perform(mob/living/user, mob/living/target)
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
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		if(issimple(target) && target.gender == MALE && target.sexcon)
		else
			return FALSE
	if(!user.getorganslot(ORGAN_SLOT_ANUS))
		return FALSE
	return TRUE

/datum/sex_action/anal_ride_sex/on_start(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))
		user.visible_message(span_warning("[user] gets on top of [target] and begins riding the tiny cock with their butt!"))
	else
		user.visible_message(span_warning("[user] gets on top of [target] and begins riding them with their butt!"))
		playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/datum/sex_action/anal_ride_sex/on_perform(mob/living/user, mob/living/target)
	if(HAS_TRAIT(user, TRAIT_DEATHBYSNOOSNOO))
		user.sexcon.try_pelvis_crush(target)

	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] anally rides [target]."))
	playsound(target, 'sound/misc/mat/segso.ogg', 50, TRUE, -2, ignore_walls = FALSE)
	do_thrust_animate(user, target)

	if(target.sexcon.considered_limp())
		user.sexcon.perform_sex_action(user, 2.4, 0, TRUE)
		user.sexcon.perform_sex_action(target, 1.2, 3, TRUE)
	else
		user.sexcon.perform_sex_action(user, 4.8, 0, TRUE)
		user.sexcon.perform_sex_action(target, 2.4, 7, TRUE)
	user.sexcon.handle_passive_ejaculation()

	if(target.sexcon.check_active_ejaculation())
		target.visible_message(span_lovebold("[target] cums into [user]'s ass!"))
		target.sexcon.cum_into(anal = TRUE)
//		target.try_impregnate(user)
		target.virginity = FALSE
		user.virginity = FALSE

/datum/sex_action/anal_ride_sex/on_finish(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] gets off [target]."))

/datum/sex_action/anal_ride_sex/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

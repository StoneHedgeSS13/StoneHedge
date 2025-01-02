/datum/sex_action/tailpegging_vaginal
	name = "Peg cunt with tail"
	check_incapacitated = FALSE

/datum/sex_action/tailpegging_vaginal/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	var/obj/item/organ/tail/tail = user.getorganslot(ORGAN_SLOT_TAIL)
	if(!tail?.can_penetrate)
		return FALSE
	return TRUE

/datum/sex_action/tailpegging_vaginal/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	var/obj/item/organ/tail/tail = user.getorganslot(ORGAN_SLOT_TAIL)
	if(!tail?.can_penetrate)
		return FALSE
	return TRUE

/datum/sex_action/tailpegging_vaginal/on_start(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))	//Humen on Seelie
		//Scream and rib break
		user.visible_message(span_warning("[user] forces their tail into [target]'s tiny cunt!"))
		var/obj/item/bodypart/BPG = target.get_bodypart(BODY_ZONE_PRECISE_GROIN)
		var/obj/item/bodypart/BPC = target.get_bodypart(BODY_ZONE_CHEST)
		if(user.sexcon.force > SEX_FORCE_LOW)
			if(prob(20))
				BPC.add_wound(/datum/wound/fracture/chest)
				BPG.add_wound(/datum/wound/fracture/groin)
		target.apply_damage(5, BRUTE, BPC)
		target.apply_damage(5, BRUTE, BPG)
	else if(!(HAS_TRAIT(target, TRAIT_TINY)) && HAS_TRAIT(user, TRAIT_TINY))	//Seelie on Humen
		user.visible_message(span_warning("[user] inserts their tiny tail into [target]'s cunt!"))
	else
		user.visible_message(span_warning("[user] slides their tail into [target]'s cunt!"))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/datum/sex_action/tailpegging_vaginal/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s cunt with their tail."))

	if(user.rogue_sneaking || user.alpha <= 100)
		segsovolume *= 0.5
	playsound(target, 'sound/misc/mat/segso.ogg', segsovolume, TRUE, -2, ignore_walls = FALSE)
	do_thrust_animate(user, target)

	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))
		//Scream and body damage
		if(user.sexcon.force > SEX_FORCE_LOW)
			target.apply_damage(3, BRUTE, target.get_bodypart(BODY_ZONE_CHEST))
			target.apply_damage(3, BRUTE, target.get_bodypart(BODY_ZONE_PRECISE_GROIN))

	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 1.2, 4, FALSE)
	else
		user.sexcon.perform_sex_action(target, 2.4, 9, FALSE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/tailpegging_vaginal/on_finish(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] pulls their tail out of [target]'s cunt."))

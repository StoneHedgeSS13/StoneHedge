/mob/living/carbon/human/proc/handle_comfy()
	if(last_move_time < world.time - 10 MINUTES)
		apply_status_effect(/datum/status_effect/buff/comfy)
	else
		remove_status_effect(/datum/status_effect/buff/comfy)

/mob/living/carbon/human/proc/comfy_heal()
	var/sleepy_mod = 0.5
	if(!bleed_rate)
		blood_volume = min(blood_volume + (4 * sleepy_mod), BLOOD_VOLUME_NORMAL)
	for(var/obj/item/bodypart/affecting as anything in bodyparts)
		//for context, it takes 5 small cuts (0.2 x 5) or 3 normal cuts (0.4 x 3) for a bodypart to not be able to heal itself
		if(affecting.get_bleed_rate() >= 1)
			continue
		if(affecting.heal_damage(sleepy_mod, sleepy_mod, required_status = BODYPART_ORGANIC))
			src.update_damage_overlays()
		for(var/datum/wound/wound as anything in affecting.wounds)
			if(!wound.sleep_healing)
				continue
			wound.heal_wound(wound.sleep_healing * sleepy_mod)
	adjustToxLoss(-sleepy_mod)

/datum/status_effect/buff/comfy
	id = "comfy"
	alert_type = /atom/movable/screen/alert/status_effect/buff/comfy
	duration = -1

/atom/movable/screen/alert/status_effect/buff/comfy
	name = "I feel at peace"
	desc = "You are so comfortable that you don't really feel like eating or drinking. Strange."
	icon_state = "stressvgood"


/datum/status_effect/buff/comfy/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_NOHUNGER, TRAIT_GENERIC)
	owner.add_stress(/datum/stress_event/comfy)


/datum/status_effect/buff/comfy/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_NOHUNGER, TRAIT_GENERIC)
	owner.remove_stress(/datum/stress_event/comfy)


/datum/status_effect/buff/comfy/tick()
	var/mob/living/carbon/human/bob = owner
	bob.hydration = HYDRATION_LEVEL_FULL
	bob.nutrition = NUTRITION_LEVEL_WELL_FED
	bob.comfy_heal()

/datum/stress_event/comfy
	timer = INFINITY
	desc = "<span class='nicegreen'>I'm so comfortable and peaceful!</span>\n"
	stress_change = -10

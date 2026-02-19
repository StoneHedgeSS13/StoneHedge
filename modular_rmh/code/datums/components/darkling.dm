/datum/component/darkling
	var/current_light_stress = 0
	var/max_light_stress = 100
	var/msg_light_warn = 0
	var/msg_dark_warn = 0

/datum/component/darkling/Initialize(...)
    . = ..()
    if(!iscarbon(parent))
        return COMPONENT_INCOMPATIBLE
    ADD_TRAIT(parent, TRAIT_DARKLING, TRAIT_GENERIC)
    RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(update_light_stress))
    START_PROCESSING(SSobj, src)

/datum/component/darkling/process()
	update_light_stress(parent)

/datum/component/darkling/proc/update_light_stress(var/mob/living/carbon/darkling)
	if(darkling.eyesclosed || darkling.is_blind())
		current_light_stress = max(current_light_stress - 2, 0)
		if(darkling.IsSleeping())
			current_light_stress = max(current_light_stress - 6, 0)
		return
	var/incoming = get_light_stress_value(darkling)
	if(incoming < 0)
		incoming *= 3
	current_light_stress = clamp(current_light_stress + incoming, 0, max_light_stress)
	apply_stress_effects(darkling)

/datum/component/darkling/proc/apply_stress_effects(var/mob/living/carbon/darkling)
	var/turf/T = get_turf(parent)
	var/light = T ? T.get_lumcount() : 0

	// Darkness buff
	if(current_light_stress == 0 && light <= 0.1)
		darkling.remove_status_effect(/datum/status_effect/debuff/darkling_glare)
		if(!msg_dark_warn)
			to_chat(darkling, span_info("Darkness is good on my eyes."))
			msg_dark_warn = 1
			msg_light_warn = 0
		darkling.apply_status_effect(/datum/status_effect/darkling_darkly)
	else
		msg_dark_warn = 0

	// Light debuff
	if(current_light_stress >= 10 && current_light_stress < 30)
		darkling.remove_status_effect(/datum/status_effect/darkling_darkly)
		darkling.remove_status_effect(/datum/status_effect/debuff/darkling_glare)
		if(!msg_light_warn)
			to_chat(darkling, span_warning("The light stings my eyes."))
			msg_light_warn = 1
			msg_dark_warn = 0
	if(current_light_stress >= 30)
		darkling.remove_status_effect(/datum/status_effect/darkling_darkly)
		darkling.add_stress(/datum/stress_event/darkling_toobright)
		darkling.apply_status_effect(/datum/status_effect/debuff/darkling_glare)

/datum/component/darkling/proc/get_light_stress_value(var/mob/living/carbon/darkling)
	var/turf/T = get_turf(parent)
	if(!T)
		return 0
	var/light_amount = T.get_lumcount()
	var/resistance = 0.5 * ((darkling.STAEND + 5) / 10)
	resistance += get_face_covered(darkling) * 1.25
	resistance += darkling.get_eye_protection()
	var/multiplier = 1.5
	if(GLOB.tod == "day" && T.can_see_sky() && light_amount > 0.4)
		multiplier += 1
	return (light_amount * multiplier) - resistance

/datum/component/darkling/proc/get_face_covered(var/mob/living/carbon/darkling)
	if((darkling.wear_mask && (darkling.wear_mask.flags_inv & HIDEFACE)) || (darkling.head && (darkling.head.flags_inv & (HIDEFACE | HIDEHAIR))))
		return 1
	return 0

/datum/component/darkling/Destroy()
	REMOVE_TRAIT(parent, TRAIT_DARKLING, TRAIT_GENERIC)
	UnregisterSignal(parent, COMSIG_LIVING_HEALTH_UPDATE)
	STOP_PROCESSING(SSobj, src)
	. = ..()

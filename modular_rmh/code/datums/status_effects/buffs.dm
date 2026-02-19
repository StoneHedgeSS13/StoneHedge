/datum/status_effect/darkling_darkly
	id = "Darkling"
	alert_type =  /atom/movable/screen/alert/status_effect/darkling_darkly
	effectedstats = list(STATKEY_PER = 1)
	duration = 2 MINUTES
	status_type = STATUS_EFFECT_REFRESH

/atom/movable/screen/alert/status_effect/darkling_darkly
	name = "Darkling"
	desc = "You are at home in the dark. Unbothered."
	icon_state = "stressg"

//GIANT SHAPE

/datum/status_effect/buff/giant_shape
	id = "giant_shape"
	alert_type = /atom/movable/screen/alert/status_effect/buff/trollshape
	effectedstats = list(STATKEY_STR = 4, STATKEY_END = 2, STATKEY_SPD = -2, STATKEY_INT = -4)
	duration = 3 MINUTES

/atom/movable/screen/alert/status_effect/buff/giant_shape
	name = "Giant Shape"
	desc = span_nicegreen("I AM STRONG! MY ENEMIES WILL DIE!")
	icon_state = "trollshape"
/datum/status_effect/buff/giant_shape/on_apply()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/human/C = owner
		C.resize = 1.2
		C.update_transform()
		C.RemoveElement(/datum/element/footstep, C.footstep_type, 1, -6)
		C.AddElement(/datum/element/footstep, FOOTSTEP_MOB_HEAVY, 1, -2)

/datum/status_effect/buff/giant_shape/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/human/C = owner
		to_chat(C, span_warning("My body shrinking back."))
		C.resize = (1/1.2)
		C.update_transform()
		C.RemoveElement(/datum/element/footstep, FOOTSTEP_MOB_HEAVY, 1, -2)
		C.AddElement(/datum/element/footstep, C.footstep_type, 1, -6)

//WILDRAGE

/datum/status_effect/buff/wildrage
	id = "wildrage"
	alert_type = /atom/movable/screen/alert/status_effect/buff/barbrage
	effectedstats = list(STATKEY_STR = 1, STATKEY_END = 1, STATKEY_PER = -1, STATKEY_INT = -1)
	duration = 30 SECONDS

//DRUNKMASTER

/datum/status_effect/buff/drunk_master
	id = "drunk master"
	alert_type = /atom/movable/screen/alert/status_effect/buff/drunk
	effectedstats = list(STATKEY_STR = 5, STATKEY_PER = 5, STATKEY_CON = 5, STATKEY_END = 5, STATKEY_SPD = 5, STATKEY_LCK = 5)
	duration = 12 MINUTES

/atom/movable/screen/alert/status_effect/buff/drunk_master
	name = "Drunk Master"
	desc = span_nicegreen("I feel drunkly strong!")
	icon_state = "drunk"

/datum/status_effect/buff/drunk_master/on_apply()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stress_event/drunk)

/datum/status_effect/buff/drunk_master/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stress_event/drunk)

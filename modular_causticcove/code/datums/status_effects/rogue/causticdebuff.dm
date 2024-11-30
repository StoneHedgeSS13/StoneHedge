////////////////
//EFFECT BUFFS//
////////////////


/datum/status_effect/buff/induced_insanity //What is... happening!?
	id = "inducedinsanity"
	alert_type = /atom/movable/screen/alert/status_effect/buff/induced_insanity
	effectedstats = list("strength" = -2, "perception" = -2, "constitution" = -1, "endurance" = -1, "speed" = -6, "fortune" = -6) 
	duration = 1 MINUTES 

/atom/movable/screen/alert/status_effect/buff/induced_insanity
	name = "##^%$*%!!?"
	desc = "WWHAAAT IS HAAAPENNIINGG!? AAHAHHAHAAA!!!"
	icon_state = "status"

/datum/status_effect/buff/induced_insanity/process()
	. = ..()
	var/mob/living/carbon/human/C = owner
	var/atom/movable/screen/fullscreen/maniac/hallucinations
	//Check if it's null to prevent runtiming.
	if(C == null)
		return
	hallucinations = owner.overlay_fullscreen("maniac", /atom/movable/screen/fullscreen/maniac)
	if(istype(C, /mob/living/carbon/human))
		handle_maniac_visions(C, hallucinations)
		handle_maniac_hallucinations(C)
		handle_maniac_floors(C)
		handle_maniac_walls(C)

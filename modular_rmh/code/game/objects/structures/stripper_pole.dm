/obj/structure/stripper_pole //dirty port from Splurt
	name = "stripper pole"
	desc = "Big polished metal pole, fastened to a well-decorated wooden podium."
	icon = 'modular_rmh/icons/obj/structures/strip-pole.dmi'
	icon_state = "strip-pole"
	density = TRUE
	anchored = TRUE
	max_integrity = 75
	layer = BELOW_MOB_LAYER
	density = 0 //easy to step up on
	/// The mob currently using the pole to dance
	var/mob/living/dancer = null
	/// Is the pole in use currently?
	var/pole_in_use


//trigger dance if character uses LBM
/obj/structure/stripper_pole/attack_hand(mob/living/user, proximity_flag)
	. = ..()
	if(.)
		return
	if(!proximity_flag)
		return
	if(pole_in_use)
		balloon_alert(user, "already in use!")
		return
	pole_in_use = TRUE
	dancer = user
	user.setDir(SOUTH)
	user.Stun(10 SECONDS)
	user.forceMove(loc)
	user.visible_message(pick(span_purple("[user] dances on [src]!"), span_purple("[user] flexes their hip-moving skills on [src]!")))
	dance_animate(user)
	pole_in_use = FALSE
	user.pixel_y = 0
	dancer = null
	user.pixel_z = 0

/// The proc used to make the user 'dance' on the pole. Basically just consists of pixel shifting them around a bunch and sleeping. Could probably be improved a lot.
/obj/structure/stripper_pole/proc/dance_animate(mob/living/user)
	if(user.loc != src.loc)
		return
	user.pixel_z = 9
	if(!QDELETED(src))
		animate(user, pixel_x = -6, pixel_y = 0, time = 1 SECONDS)
		sleep(2 SECONDS)
		user.dir = 4
	if(!QDELETED(src))
		animate(user, pixel_x = -6, pixel_y = 24, time = 1 SECONDS)
		sleep(1.2 SECONDS)
		src.layer = 4.01 //move the pole infront for now. better to move the pole, because the character moved behind people sitting above otherwise
	if(!QDELETED(src))
		animate(user, pixel_x = 6, pixel_y = 12, time = 0.5 SECONDS)
		user.dir = 8
		sleep(0.6 SECONDS)
	if(!QDELETED(src))
		animate(user, pixel_x = -6, pixel_y = 4, time = 0.5 SECONDS)
		user.dir = 4
		src.layer = 4 // move it back.
		sleep(0.6 SECONDS)
	if(!QDELETED(src))
		user.dir = 1
		animate(user, pixel_x = 0, pixel_y = 0, time = 0.3 SECONDS)
		sleep(0.6 SECONDS)
	if(!QDELETED(src))
		user.do_jitter_animation(100)
		sleep(0.6 SECONDS)
		user.dir = 2
	user.pixel_z = 0


/obj/structure/stripper_pole/Destroy()
	if(dancer)
		dancer.SetStun(0)
		dancer.pixel_y = 0
		dancer.pixel_x = 0
		dancer.pixel_z = 0
		dancer.layer = layer
		dancer.forceMove(get_turf(src))
		dancer = null
	. = ..()

/obj/structure/stripper_pole/wood
	icon_state = "strip-pole-wood"
	desc = "Big polished metal pole, fastened to a simple wooden podium."

/datum/blueprint_recipe/carpentry/stripper_pole
	name = "stripper pole"
	desc = "Big polished metal pole, fastened to a simple wooden podium."
	result_type = /obj/structure/stripper_pole/wood
	required_materials = list(
		/obj/item/grown/log/tree/small = 2,
		/obj/item/ingot/iron = 1,
	)
	supports_directions = FALSE
	craftdiff = 2

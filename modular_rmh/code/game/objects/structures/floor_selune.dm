/obj/effect/decal/floor_selune
	icon = 'modular_rmh/icons/effect/floor_selune.dmi'
	icon_state = "1"
	mouse_opacity = 0
	SET_BASE_PIXEL(-16, -16)

/obj/effect/decal/floor_selune/Initialize()
	. = ..()
	icon_state = pick("1", "2", "3", "4")

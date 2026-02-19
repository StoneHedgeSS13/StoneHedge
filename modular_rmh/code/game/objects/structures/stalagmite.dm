/obj/structure/stalagmite
	name = "stalagmite"
	desc = "Sharp stones born with time."
	icon = 'modular_rmh/icons/obj/structures/64x64.dmi'
	icon_state = "stalagmite1"
	max_integrity = 50
	layer = ABOVE_MOB_LAYER
	blade_dulling = DULLING_PICK
	destroy_sound = 'sound/foley/smash_rock.ogg'
	attacked_sound = 'sound/foley/hit_rock.ogg'
	static_debris = list(/obj/item/natural/stone = 3)
	pixel_x = -16

/obj/structure/stalagmite/Initialize()
	. = ..()
	icon_state = "stalagmite[rand(1, 5)]"

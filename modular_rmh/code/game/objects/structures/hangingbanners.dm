
/obj/structure/fluff/littlebanners
	name = "hanging little banners"
	desc = ""
	icon = 'modular_rmh/icons/obj/decor.dmi'
	icon_state = "hangingbanners_wr"
	density = FALSE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	blade_dulling = DULLING_BASH
	resistance_flags = FLAMMABLE
	max_integrity = 20
	integrity_failure = 0.33
	dir = SOUTH
	destroy_sound = 'sound/combat/hits/onwood/destroyfurniture.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')


/obj/structure/fluff/littlebanners/greenblue
	icon_state = "hangingbanners_gb"

/obj/structure/fluff/littlebanners/greenred
	icon_state = "hangingbanners_gr"

/obj/structure/fluff/littlebanners/bluewhite
	icon_state = "hangingbanners_bw"

/obj/structure/fluff/littlebanners/greenwhite
	icon_state = "hangingbanners_gw"

/obj/structure/fluff/littlebanners/bluered
	icon_state = "hangingbanners_br"

/obj/structure/fluff/littlebanners/MouseDrop(over_object, src_location, over_location)
	. = ..()
	if(over_object == usr && Adjacent(usr) && (in_range(src, usr) || usr.contents.Find(src)))
		if(!ishuman(usr))
			return
		visible_message(span_notice("[usr] tears down [src]."))
		if(do_after(usr, 30, target = src))
			playsound(src,'sound/foley/dropsound/cloth_drop.ogg', 100, FALSE)
			new /obj/item/natural/cloth (get_turf(src))
			new /obj/item/natural/cloth (get_turf(src))
			new /obj/item/natural/cloth (get_turf(src))
			new /obj/item/natural/cloth (get_turf(src))
			qdel(src)

///Crafting

/datum/blueprint_recipe/structure/littlebanners
	name = "fair banners red-white"
	result_type = /obj/structure/fluff/littlebanners
	required_materials = list(/obj/item/natural/cloth = 4, /obj/item/natural/fibers)
	verbage = "constructs"
	skillcraft = null
	requires_learning = FALSE
	construct_tool = null

/datum/blueprint_recipe/structure/littlebanners/greenblue
	name = "fair banners green-blue"
	result_type = /obj/structure/fluff/littlebanners/greenblue

/datum/blueprint_recipe/structure/littlebanners/greenred
	name = "fair banners green-red"
	result_type = /obj/structure/fluff/littlebanners/greenred

/datum/blueprint_recipe/structure/littlebanners/bluewhite
	name = "fair banners blue-white"
	result_type = /obj/structure/fluff/littlebanners/bluewhite

/datum/blueprint_recipe/structure/littlebanners/greenwhite
	name = "fair banners green-white"
	result_type = /obj/structure/fluff/littlebanners/greenwhite

/datum/blueprint_recipe/structure/littlebanners/bluered
	name = "fair banners blue-red"
	result_type = /obj/structure/fluff/littlebanners/bluered

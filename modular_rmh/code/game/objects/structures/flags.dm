
/obj/structure/fluff/festive_flags
	name = "festive flags"
	desc = "Fancy festive flags to put you in the holiday mood."
	icon = 'modular_rmh/icons/obj/structures/flags.dmi'
	icon_state = "f_1"
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
	var/random_color = FALSE

/obj/structure/fluff/festive_flags/Initialize()
	. = ..()
	if(random_color)
		var/num = rand(1, 8)
		icon_state = "f_[num]"

/obj/structure/fluff/festive_flags/red
	icon_state = "f_red"

/obj/structure/fluff/festive_flags/blue
	icon_state = "f_blue"

/obj/structure/fluff/festive_flags/yellow
	icon_state = "f_yellow"

/obj/structure/fluff/festive_flags/green
	icon_state = "f_green"

/obj/structure/fluff/festive_flags/random
	random_color = TRUE

/obj/structure/fluff/festive_flags/MouseDrop(over_object, src_location, over_location)
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

/datum/blueprint_recipe/structure/festive_flags
	name = "festive flags - random color"
	result_type = /obj/structure/fluff/festive_flags/random
	required_materials = list(/obj/item/natural/cloth = 4, /obj/item/natural/fibers)
	verbage = "constructs"
	skillcraft = null
	requires_learning = FALSE
	construct_tool = null

/datum/blueprint_recipe/structure/festive_flags/green
	name = "festive flags - green"
	result_type = /obj/structure/fluff/festive_flags/green

/datum/blueprint_recipe/structure/festive_flags/red
	name = "festive flags - red"
	result_type = /obj/structure/fluff/festive_flags/red

/datum/blueprint_recipe/structure/festive_flags/blue
	name = "festive flags - blue"
	result_type = /obj/structure/fluff/festive_flags/blue

/datum/blueprint_recipe/structure/festive_flags/yellow
	name = "festive flags - yellow"
	result_type = /obj/structure/fluff/festive_flags/yellow


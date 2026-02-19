
/obj/structure/fluff/festive_garlands
	name = "festive garlands"
	desc = "Glittering festive garlands lighting up your spirits."
	icon = 'modular_rmh/icons/obj/structures/girliandy.dmi'
	icon_state = "g_1"
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

/obj/structure/fluff/festive_garlands/Initialize()
	. = ..()
	if(random_color)
		var/num = rand(1, 8)
		icon_state = "g_[num]"

/obj/structure/fluff/festive_garlands/red
	icon_state = "g_red"

/obj/structure/fluff/festive_garlands/blue
	icon_state = "g_blue"

/obj/structure/fluff/festive_garlands/yellow
	icon_state = "g_yellow"

/obj/structure/fluff/festive_garlands/green
	icon_state = "g_green"

/obj/structure/fluff/festive_garlands/random
	random_color = TRUE

/obj/structure/fluff/festive_garlands/MouseDrop(over_object, src_location, over_location)
	. = ..()
	if(over_object == usr && Adjacent(usr) && (in_range(src, usr) || usr.contents.Find(src)))
		if(!ishuman(usr))
			return
		visible_message(span_notice("[usr] tears down [src]."))
		if(do_after(usr, 30, target = src))
			playsound(src,'sound/foley/dropsound/cloth_drop.ogg', 100, FALSE)
			new /obj/item/natural/glass/shard (get_turf(src))
			new /obj/item/natural/glass/shard (get_turf(src))
			new /obj/item/natural/cloth (get_turf(src))
			new /obj/item/natural/cloth (get_turf(src))
			qdel(src)

///Crafting

/datum/blueprint_recipe/structure/festive_garlands
	name = "festive garlands - random color"
	result_type = /obj/structure/fluff/festive_garlands/random
	required_materials = list(/obj/item/natural/cloth = 4, /obj/item/natural/fibers)
	verbage = "constructs"
	skillcraft = null
	requires_learning = FALSE
	construct_tool = null

/datum/blueprint_recipe/structure/festive_garlands/green
	name = "festive garlands - green"
	result_type = /obj/structure/fluff/festive_garlands/green

/datum/blueprint_recipe/structure/festive_garlands/red
	name = "festive garlands - red"
	result_type = /obj/structure/fluff/festive_garlands/red

/datum/blueprint_recipe/structure/festive_garlands/blue
	name = "festive garlands - blue"
	result_type = /obj/structure/fluff/festive_garlands/blue

/datum/blueprint_recipe/structure/festive_garlands/yellow
	name = "festive garlands - yellow"
	result_type = /obj/structure/fluff/festive_garlands/yellow


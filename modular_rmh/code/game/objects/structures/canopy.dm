/obj/structure/fluff/canopy
	name = "Canopy"
	desc = "A simple market canopy/booth roofing."
	icon = 'modular_rmh/icons/obj/decor.dmi'
	icon_state = "canopy"
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

/obj/structure/fluff/canopy/green
	icon_state = "canopyg"

/obj/structure/fluff/canopy/booth
	icon_state = "canopyr-booth"

/obj/structure/fluff/canopy/booth/booth02
	icon_state = "canopyr-booth-2"

/obj/structure/fluff/canopy/booth/booth_green
	icon_state = "canopyg-booth"

/obj/structure/fluff/canopy/booth/booth_green02
	icon_state = "canopyg-booth-2"

/obj/structure/fluff/canopy/side
	icon_state = "canopyb-side"

/obj/structure/fluff/canopy/side/end
	icon_state = "canopyb-side-end"

/obj/structure/fluff/canopy/booth/CanPass(atom/movable/mover, turf/target)
	SHOULD_CALL_PARENT(TRUE)
	. = ..()
	if(get_dir(mover.loc, loc) == dir)
		return 0
	return .

/obj/structure/fluff/canopy/booth/CanAStarPass(ID, to_dir, caller)
	if(to_dir == dir)
		return FALSE
	return ..()

/obj/structure/fluff/canopy/booth/Exit(atom/movable/O, turf/target)
	SHOULD_CALL_PARENT(TRUE)
	. = ..()
	if(get_dir(O.loc, target) == dir)
		return 0
	return .

/obj/structure/fluff/canopy/MouseDrop(over_object, item_src, over_location)
	. = ..()
	var/mob/actor = over_object
	if(!actor) return
	if(!ishuman(actor)) return
	if(!Adjacent(actor)) return
	if(!(in_range(item_src, actor) || actor.contents.Find(item_src)))
		return
	visible_message(span_notice("[actor] tears down [item_src]."))
	if(do_after(actor, 30, target = item_src))
		playsound(item_src, 'sound/foley/dropsound/cloth_drop.ogg', 100, FALSE)
		new /obj/item/grown/log/tree/small(get_turf(item_src))
		new /obj/item/natural/cloth(get_turf(item_src))
		qdel(item_src)

/datum/blueprint_recipe/carpentry/canopy
	abstract_type = /datum/blueprint_recipe/carpentry
	name = "market canopy"
	desc = "A simple market canopy/booth roofing."
	result_type = /obj/structure/fluff/canopy/booth
	required_materials = list(
		/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/cloth = 2
	)
	supports_directions = TRUE
	craftdiff = 0
	build_time = 2 SECONDS
	verbage = "construct"
	verbage_tp = "constructs"

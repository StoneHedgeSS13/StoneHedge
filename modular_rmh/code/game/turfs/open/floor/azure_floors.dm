/turf/open/floor/AzureSand
	name = "sand"
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	desc = "Warm sand that, sadly, have been mixed with dirt."
	icon_state = "grimshart"
	layer = MID_TURF_LAYER
	heelstep = HEELSTEP_SAND
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	//tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0
	neighborlay = "grimshartedge"
	smoothing_flags = SMOOTH_EDGE
	smoothing_groups = SMOOTH_GROUP_OPEN_FLOOR
	smoothing_list = SMOOTH_GROUP_FLOOR_DIRT_ROAD + SMOOTH_GROUP_FLOOR_GRASS

/turf/open/floor/AzureSand/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/obj/effect/decal/mossy
	name = "mossy brick floor"
	desc = "dirt and moss have crept between the gaps of this stone-brick flooring."
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "mossyedge"
	mouse_opacity = 0

/obj/effect/decal/cobble/mossy
	name = "mossy brick floor"
	desc = "Dirt and moss have crept between the gaps of this stone-brick flooring. Rather fitting for an outdoor garden; not so much for a home."
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "mossystone_edges"
	mouse_opacity = 0

/obj/effect/decal/edge
	name = "stone edge"
	desc = "A piece of stone used to border city roads."
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "border"
	mouse_opacity = 0

/obj/effect/decal/edge_corner
	name = "stone edge corner"
	desc = "A piece of stone used to border city roads."
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "border_corner"
	mouse_opacity = 0

/turf/open/floor/tile/harem
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "harem"

/turf/open/floor/tile/harem1
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "harem1"

/turf/open/floor/tile/harem2
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "harem2"

/turf/open/floor/carpet/inn
	icon = 'modular_rmh/icons/turf/inn.dmi'

/turf/open/floor/tile/harem
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "harem"

/turf/open/floor/tile/harem1
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "harem1"

/turf/open/floor/tile/harem2
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "harem2"

/turf/open/floor/rooftop/green/corner1
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "roofgc1-arw"

/turf/open/floor/rooftop/green/corner1/Initialize()
	. = ..()
	icon_state = "roofgc1"

/turf/open/floor/dark_ice
	name = "black ice"
	desc = "A deep black rock glazed over with unnaturally cold ice."
	icon = 'modular_rmh/icons/turf/roguefloor.dmi'
	icon_state = "blackice"
	heelstep = HEELSTEP_STONE
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/grassland.wav'

/turf/closed/indestructible/rock
	name = "granite"
	desc = ""
	icon = 'modular_rmh/icons/turf/mining.dmi'
	icon_state = "rock2"

//Mildly better than stone-wall due to it being harder to make, plus not loose-stone cobbled together. Also higher climbing diff akin to stone-brick wall.
/turf/closed/wall/mineral/brick
	name = "brick wall"
	desc = "Rows of overlapping bricks held together by mortar form a nigh-impenetrable wall of stone."
	icon = 'modular_rmh/icons/turf/brick_wall.dmi'
	icon_state = "brick"
	smoothing_flags = SMOOTH_BITMASK
	blade_dulling = DULLING_BASH
	max_integrity = 2000	//200 more than base stone wall
	sheet_type = /obj/item/natural/brick
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	above_floor = /turf/open/floor/tile/brick
	baseturfs = list(/turf/open/floor/tile/brick)
	neighborlay = "dirtedge"
	climbdiff = 4			//Same as stone-brick wall
	damage_deflection = 20

/turf/open/floor/tile/brick
	icon_state = "bricktile"

/turf/open/water/pond
	name = "pond"
	desc = "Still and idyllic water that flows through meadows."
	icon_state = "together"
	water_level = 3
	slowdown = 3
	swim_skill = TRUE
	wash_in = TRUE
	water_reagent = /datum/reagent/water

/turf/open/water/bath/pool
	desc = "Clear water, pleasant temperature. Soothing."
	icon_state = "bathtile_pool"

/turf/open/water/bath/pool/Initialize()
	.  = ..()
	icon_state = "bathtile_pool"

/turf/open/water/bath/pool/mid
	icon_state = "bathtile_pool_mid"

/turf/open/water/bath/pool/mid/Initialize()
	.  = ..()
	icon_state = "bathtile_pool_mid"

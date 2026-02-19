/turf/open/floor/sand/desertsand
	name = "sand"
	desc = "Hot gold sand."
	icon_state = "sand-1"
	icon = 'modular_rmh/icons/turf/desert.dmi'
	layer = MID_TURF_LAYER
	heelstep = HEELSTEP_SAND
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/grassland.ogg'
	slowdown = 3

/turf/open/floor/sand/desertsand/Initialize()
	. = ..()
	var/random_num = rand(1, 2)
	icon_state = "sand-[random_num]"

/turf/open/floor/sand/sandbrick
	name = "sand brick"
	desc = "Brickwork made of sandstone. However, it is already practically weathered away."
	icon_state = "sandbrick-1"
	icon = 'modular_rmh/icons/turf/desert.dmi'
	layer = MID_TURF_LAYER
	heelstep = HEELSTEP_SAND
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.ogg'
	slowdown = 1

/turf/open/floor/sand/sandbrick/Initialize()
	. = ..()
	var/random_num = rand(1, 2)
	icon_state = "sandbrick-[random_num]"


/turf/open/floor/sand/desertsand/sandpath
	name = "sand road"
	desc = "Tamped sand. Looks like a path."
	icon_state = "sandpath-1"
	layer = MID_TURF_LAYER
	heelstep = HEELSTEP_SAND
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/grassland.ogg'
	slowdown = 0
	path_weight = 10

/turf/open/floor/sand/desertsand/sandpath/Initialize()
	. = ..()
	var/random_num = rand(1, 2)
	icon_state = "sandpath-[random_num]"

/turf/open/floor/sand/desertsand/oasis
	name = "wet sand"
	desc = "Dump sand."
	icon_state = "oasissand-1"
	layer = MID_TURF_LAYER
	heelstep = HEELSTEP_SAND
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/grassland.ogg'
	slowdown = 2


//genstuff
/obj/effect/landmark/mapGenerator/rmh_mountains
	mapGeneratorType = /datum/mapGenerator/rmh_mountains
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/rmh_mountains
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/rmh_mountainssnow,/datum/mapGeneratorModule/rmh_mountainsroad, /datum/mapGeneratorModule/rmh_mountainsgrass)


/datum/mapGeneratorModule/rmh_mountainssnow
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/snow)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/grass/both = 15,
	/obj/structure/flora/grass/brown = 20,
	/obj/structure/flora/grass/green = 20,
	/obj/item/grown/log/tree/stick = 16,
	/obj/structure/flora/grass/pyroclasticflowers = 1,
	///obj/structure/flora/grass/maneater/real=3,
	/obj/structure/flora/grass/bush_meagre/tundra = 7,
	/obj/structure/flora/grass/bush/wall/tundra = 7,
	/obj/structure/flora/grass/bush/tundra = 73)
	spawnableTurfs = list(/turf/open/floor/snow/patchy=15,
	/turf/open/floor/snow/rough = 15)
	allowed_areas = list(/area/outdoors/mountains/rmh_mountains)

/datum/mapGeneratorModule/rmh_mountainsroad
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/item/natural/stone = 15,/obj/item/natural/rock = 3,/obj/item/grown/log/tree/stick = 6)
	allowed_areas = list(/area/outdoors/mountains/rmh_mountains)

/datum/mapGeneratorModule/rmh_mountainsgrass
	clusterCheckFlags =  CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/floor/grass, /turf/open/floor/grass/red, /turf/open/floor/grass/yel, /turf/open/floor/grass/cold)
	excluded_turfs = list()
	allowed_areas = list(/area/outdoors/mountains/rmh_mountains)
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 25,
							/obj/structure/flora/grass/herb/random = 2,
							/obj/structure/flora/grass/bush_meagre/tundra = 2,
							/obj/item/natural/stone = 6,
							/obj/item/natural/rock = 1,
							/obj/item/grown/log/tree/stick = 3)

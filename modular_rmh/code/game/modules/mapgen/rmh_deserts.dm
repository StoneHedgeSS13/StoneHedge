//genstuff
/obj/effect/landmark/mapGenerator/rmh_desert
	mapGeneratorType = /datum/mapGenerator/rmh_desert
	endTurfX = 155
	endTurfY = 155
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/rmh_desert
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/rmh_desert,/datum/mapGeneratorModule/rmh_desertroad, /datum/mapGeneratorModule/rmh_desertgrass)


/datum/mapGeneratorModule/rmh_desert
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/sand/desertsand)
	excluded_turfs = list(/turf/open/floor/sand/desertsand/sandpath)
	spawnableAtoms = list(/obj/structure/flora/grass/jungle/b = 5,
	/obj/structure/flora/grass = 5,
	/obj/structure/flora/ausbushes/reedbush = 5,
	/obj/structure/flora/ausbushes/stalkybush = 5,
	/obj/structure/flora/grass/pyroclasticflowers = 1,
	/obj/structure/flora/rock/pile = 5,
	/obj/structure/flora/rock = 2)
	allowed_areas = list(/area/outdoors/rmh_desert)

/datum/mapGeneratorModule/rmh_desertroad
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/sand/desertsand/sandpath)
	spawnableAtoms = list(/obj/item/natural/stone = 15,/obj/item/natural/rock = 3,/obj/item/grown/log/tree/stick = 6)
	allowed_areas = list(/area/outdoors/rmh_desert)

/datum/mapGeneratorModule/rmh_desertgrass
	clusterCheckFlags =  CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/floor/grass, /turf/open/floor/grass/red, /turf/open/floor/grass/yel, /turf/open/floor/grass/cold)
	excluded_turfs = list()
	allowed_areas = list(/area/outdoors/rmh_desert)
	spawnableAtoms = list(/obj/structure/flora/grass = 25,
							/obj/structure/flora/grass/herb/random = 2,
							/obj/structure/flora/grass/bush_meagre = 2,
							/obj/item/natural/stone = 6,
							/obj/item/natural/rock = 1,
							/obj/item/grown/log/tree/stick = 3)

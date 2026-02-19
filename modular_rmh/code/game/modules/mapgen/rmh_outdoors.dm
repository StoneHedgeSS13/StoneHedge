/obj/effect/landmark/mapGenerator/rmh_field
	mapGeneratorType = /datum/mapGenerator/rmh_field
	endTurfX = 155
	endTurfY = 155
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/rmh_field
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/rmh_field/grass,/datum/mapGeneratorModule/rmh_fieldgrass,/datum/mapGeneratorModule/rmh_field,/datum/mapGeneratorModule/rmh_field/road)


/datum/mapGeneratorModule/rmh_field
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/dirt)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/newtree/snow = 5,
							/obj/structure/flora/grass/bush/tundra = 13,
							/obj/structure/flora/grass/tundra = 40,
							///obj/structure/flora/grass/maneater = 16,
							/obj/item/natural/stone = 18,
							/obj/item/natural/rock = 2,
							/obj/item/grown/log/tree/stick = 3,
							/obj/structure/closet/dirthole/closed/loot = 3,
							/obj/structure/flora/grass/pyroclasticflowers = 3)
	spawnableTurfs = list(/turf/open/floor/dirt/road=5)
	allowed_areas = list(/area/outdoors/rmh_field)

/datum/mapGeneratorModule/rmh_field/road
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/dirt/road)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/item/natural/stone = 18,
							/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/outdoors/rmh_field)

/datum/mapGeneratorModule/rmh_field/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/dirt)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableTurfs = list(/turf/open/floor/grass/cold = 15)
	spawnableAtoms = list()
	allowed_areas = list(/area/outdoors/rmh_field)

/datum/mapGeneratorModule/rmh_fieldgrass
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/dirt,/turf/open/floor/grass,/turf/open/floor/grass/red,/turf/open/floor/grass/yel,/turf/open/floor/grass/cold)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/grass/tundra = 40,
						///obj/structure/flora/grass/maneater = 7,
							/obj/item/natural/stone = 18,
							/obj/structure/flora/grass/herb/random = 20,
							/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/outdoors/rmh_field)

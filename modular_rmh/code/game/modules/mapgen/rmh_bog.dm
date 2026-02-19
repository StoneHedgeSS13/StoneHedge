//genstuff
/obj/effect/landmark/mapGenerator/rmh_bog
	mapGeneratorType = /datum/mapGenerator/rmh_bog
	endTurfX = 215
	endTurfY = 215
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/rmh_bog
	modules = list(
	/datum/mapGeneratorModule/rmh_bog,
	/datum/mapGeneratorModule/rmh_bog/boggrassturf,
	/datum/mapGeneratorModule/rmh_bog/bogroad,
	/datum/mapGeneratorModule/rmh_bog/boggrass,
	/datum/mapGeneratorModule/rmh_bog/bogwater
	)


/datum/mapGeneratorModule/rmh_bog
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_TURFS
	allowed_turfs = list(/turf/open/floor/dirt)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	clusterMax = 1
	clusterMin = 1
	spawnableAtoms = list(/obj/structure/flora/newtree = 5,
							/obj/structure/flora/grass/bush = 10,
							/obj/structure/flora/grass/bush_meagre = 10,
							/obj/structure/flora/grass = 26,
							/obj/item/natural/stone = 23,
							/obj/item/natural/rock = 6,
							/obj/structure/flora/tree = 10,
							/obj/structure/essence_node = 0.1,
							/obj/item/natural/artifact = 2,
							/obj/structure/leyline = 2,
							/obj/structure/voidstoneobelisk = 2,
							/obj/structure/wild_plant/manabloom = 2,
							/obj/item/mana_battery/mana_crystal/small = 3,
							/obj/item/grown/log/tree/stick = 16,
							/obj/structure/closet/dirthole/closed/loot = 3,
							/obj/structure/flora/grass/swampweed = 10
							)
	spawnableTurfs = list(/turf/open/floor/dirt/road=2,
						/turf/open/water/swamp=1)
	allowed_areas = list(/area/outdoors/bog/rmh/north, /area/outdoors/bog/rmh/south)

/datum/mapGeneratorModule/rmh_bog/bogroad
	clusterCheckFlags = CLUSTER_CHECK_ALL_ATOMS
	allowed_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/item/natural/stone = 9,/obj/item/grown/log/tree/stick = 6)

/datum/mapGeneratorModule/rmh_bog/boggrassturf
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_TURFS
	allowed_turfs = list(/turf/open/floor/dirt)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableTurfs = list(/obj/structure/flora/grass = 23)
	allowed_areas = list(/area/outdoors/bog/rmh/north, /area/outdoors/bog/rmh/south)

/datum/mapGeneratorModule/rmh_bog/boggrass
	clusterCheckFlags = CLUSTER_CHECK_ALL_ATOMS
	allowed_turfs = list(/obj/structure/flora/grass)
	excluded_turfs = list()
	clusterMax = 2
	clusterMin = 0
	allowed_areas = list(/area/outdoors/bog/rmh/north, /area/outdoors/bog/rmh/south)
	spawnableAtoms = list(/obj/structure/kneestingers = 60)

/datum/mapGeneratorModule/rmh_bog/bogwater
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/water/swamp)
	excluded_turfs = list(/turf/open/water/swamp/deep)
	allowed_areas = list(/area/outdoors/bog/rmh/north,
						 /area/outdoors/bog/rmh/south)
	clusterMax = 1
	clusterMin = 0
	spawnableAtoms = list(/obj/structure/kneestingers = 5,
						/obj/structure/flora/grass/water = 30,
						/obj/structure/flora/grass/water/reeds = 40,
						/obj/structure/flora/tree/pine/dead = 5,
						/obj/structure/flora/tree = 5,
						/obj/structure/flora/tree/burnt = 5,
						/obj/structure/chair/bench/ancientlog = 5,
						/obj/item/restraints/legcuffs/beartrap/armed = 10,
						/obj/item/grown/log/tree/stick = 30)
	spawnableTurfs = list(/turf/open/water/swamp/deep = 5)

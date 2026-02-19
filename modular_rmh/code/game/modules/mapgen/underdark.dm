/obj/effect/landmark/mapGenerator/underdark
	mapGeneratorType = /datum/mapGenerator/underdark
	endTurfX = 255
	endTurfY = 450
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/underdark
	modules = list(/datum/mapGeneratorModule/ambushing, /datum/mapGeneratorModule/underdarkstone, /datum/mapGeneratorModule/underdarkmud)


/datum/mapGeneratorModule/underdarkstone
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/naturalstone)
	allowed_areas = list(/area/under/underdark)
	spawnableAtoms = list(/obj/structure/flora/shroom_tree/happy/random = 30,
							/obj/structure/flora/mushroomcluster = 20,
							/obj/structure/flora/tinymushrooms = 20,
							/obj/structure/roguerock = 25,
							/obj/item/natural/rock = 25,
							/obj/structure/vine = 5)

/datum/mapGeneratorModule/underdarkmud
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_areas = list(/area/under/underdark)
	allowed_turfs = list(/turf/open/floor/dirt)
	excluded_turfs = list(/turf/open/floor/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/mushroomcluster = 20,
							/obj/structure/flora/grass/thorn_bush = 10,
							/obj/structure/flora/shroom_tree = 20,
							/obj/structure/flora/shroom_tree/happy/random = 40,
							/obj/structure/flora/tinymushrooms = 20,
							/obj/structure/flora/grass = 30,
							/obj/structure/flora/grass/herb/random = 5)

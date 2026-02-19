//SWAMP MAP AREAS

/area/outdoors/bog/rmh
	name = "Green Swamps"
	first_time_text = "GREEN SWAMPS"
	icon_state = "bog"
	ambientsounds = DRONING_BOG_DAY
	ambientnight = DRONING_BOG_NIGHT
	background_track = 'sound/music/area/forest.ogg'
	background_track_dusk = 'sound/music/area/forest.ogg'
	background_track_night = 'sound/music/area/forest.ogg'
	ambush_times = list("night","dawn","dusk","day")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/troll/bog = 20,
				/mob/living/simple_animal/hostile/retaliate/spider = 40,
				/mob/living/carbon/human/species/orc/ambush = 40,
				/mob/living/simple_animal/hostile/retaliate/bogbug = 20,
				/mob/living/simple_animal/hostile/retaliate/gator = 20,
				/mob/living/carbon/human/species/goblin/npc/ambush = 30,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 30)
	converted_type = /area/indoors/shelter/bog/rmh
	//deathsight_message = "a swamp"

/area/indoors/shelter/bog/rmh
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "indoors"
	background_track = 'sound/music/area/bog.ogg'
	background_track_dusk = null
	background_track_night = null

/area/outdoors/bog/rmh/north
	name = "Northern Green Swamps"
	first_time_text = "NORTHERN GREEN SWAMPS"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "n_basin"

/area/outdoors/bog/rmh/south
	name = "Southern Green Swamps"
	first_time_text = "SOUTHERN GREEN SWAMPS"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "s_basin"

/area/indoors/shelter/bog/rmh/fort
	name = "The Dark Fort"
	first_time_text = "THE DARK FORT"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "village"
	background_track = 'sound/music/area/bog.ogg'
	background_track_dusk = null
	background_track_night = null
	//deathsight_message = "Dark Fort"

//FOREST AREAS

/area/outdoors/woods/rmh
	name = "The Dark Forest"
	icon_state = "woods"
	ambientsounds = DRONING_FOREST_DAY
	ambientnight = DRONING_FOREST_NIGHT
	//spookysounds = SPOOKY_CROWS
	//spookynight = SPOOKY_FOREST
	background_track = 'sound/music/area/forest.ogg'
	background_track_dusk = 'sound/music/area/septimus.ogg'
	background_track_night = 'sound/music/area/forestnight.ogg'
	soundenv = 15
	ambush_times = list("night","dawn","dusk","day")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/wolf = 40,
				/mob/living/simple_animal/hostile/retaliate/bobcat = 35,
				/mob/living/simple_animal/hostile/retaliate/smallrat = 20,
				/mob/living/simple_animal/hostile/retaliate/raccoon = 35,
				/mob/living/simple_animal/hostile/retaliate/direbear = 5,
				/mob/living/simple_animal/hostile/retaliate/fox = 35,
				/mob/living/carbon/human/species/skeleton/npc/peasant = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush = 30)
	first_time_text = "THE DARK FOREST"
	converted_type = /area/indoors/shelter/woods
	//deathsight_message = "somewhere in the forest"

/area/indoors/shelter/woods/rmh
	name = "Dark Forest"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "indoors"
	background_track = 'sound/music/area/forest.ogg'
	background_track_dusk = 'sound/music/area/septimus.ogg'
	background_track_night = 'sound/music/area/forestnight.ogg'

/area/under/cave/rmh/goblindungeon
	name = "Goblin Dungeon"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "camp"
	first_time_text = "GOBLIN DUNGEON"
	background_track = 'sound/music/area/dungeon.ogg'
	background_track_dusk = null
	background_track_night = null
	//converted_type = /area/outdoors
	ceiling_protected = TRUE
	//deathsight_message = "goblin dungeon"

/area/outdoors/woods/rmh/goblincampfire
	name = "Goblin Camp"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "camp"
	first_time_text = "GOBLIN CAMP"
	name = "goblin campfire"
	//deathsight_message = "goblin camp"

//CAVES AREAS
/area/under/cavewet/rmh/swamp_caves
	name = "Moist Tunnels"
	first_time_text = "MOIST TUNNELS"
	icon_state = "cavewet"
	ambientsounds = DRONING_CAVE_WET
	ambientnight = DRONING_CAVE_WET
	//spookysounds = AMBIENCE_CAVE
	//spookynight = AMBIENCE_CAVE
	background_track = 'sound/music/area/caves.ogg'
	background_track_dusk = null
	background_track_night = null
	ambush_times = list("night","dawn","dusk","day")
	/*ambush_mobs = list(
				/mob/living/carbon/human/species/skeleton/npc/easy = 10,
				/mob/living/simple_animal/hostile/retaliate/bigrat = 30,
				/mob/living/carbon/human/species/goblin/npc/sea = 20,
				/mob/living/carbon/human/species/human/northern/highwayman/ambush = 20,
				/mob/living/simple_animal/hostile/retaliate/troll = 15)*/
	converted_type = /area/outdoors/caves_rmh
	//deathsight_message = "moist tunnels"

/area/indoors/cave/rmh_cave/wet/mindflayer
	name = "Mindflayer Colony"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "living"
	first_time_text = "MINDFLAYER COLONY"
	//deathsight_message = "Mindflayer Colony"
	ceiling_protected = TRUE


/area/under/cave/spider/rmh
	name = "Spider Caves"
	icon_state = "spidercave"
	first_time_text = "SPIDER CAVES"
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/spider = 100)
	background_track = 'sound/music/area/spidercave.ogg'
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/outdoors/spidercave/rmh
	//deathsight_message = "Spider Caves"

/area/outdoors/spidercave/rmh
	name = "Spider Caves"
	icon_state = "Spider Caves"
	first_time_text = "SPIDER CAVES"
	icon_state = "spidercave"
	background_track = 'sound/music/area/spidercave.ogg'
	background_track_dusk = null
	background_track_night = null
	//deathsight_message = "Spider Caves"

/area/under/cavewet/rmh/wolf
	name = "Wolf Den"
	first_time_text = "WOLF DEN"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "wolf"

/area/under/cavewet/rmh/werewolf
	name = "Werewolf Den"
	first_time_text = "WEREWOLF DEN"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "wolf"

//TRANSITIONS

/area/outdoors/bog/rmh/travel/main
	name = "To Rivermist Hollow"
	first_time_text = "TO RIVERMIST HOLLOW"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "travel"

/area/outdoors/bog/rmh/travel/swamp_to_main
	name = "Green Swamp To Rivermist Hollow"
	first_time_text = "TO RIVERMIST HOLLOW"

/area/outdoors/bog/rmh/travel/forest_to_main
	name = "Dark Forest To Rivermist Hollow"
	first_time_text = "TO RIVERMIST HOLLOW"

/area/outdoors/bog/rmh/travel/underdark
	name = "Swamp Forest Descend To Underdark"
	first_time_text = "DESCEND TO UNDERDARK"

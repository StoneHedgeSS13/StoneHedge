//DESERT MAP AREAS//


//ПУСТЫНЯ - DESERT

/area/outdoors/rmh_desert
	name = "Desert"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "desert"
	soundenv = 19
	ambush_mobs = null
	first_time_text = "CURSED DESERT"
	ambientsounds = DRONING_MOUNTAIN
	ambientnight = DRONING_MOUNTAIN
	background_track_dawn = 'modular_rmh/sound/music/area/desert_dawn.ogg'
	background_track = 'modular_rmh/sound/music/area/desert_day.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/desert_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/desert_night.ogg'
	converted_type = /area/indoors/shelter/rmh_desert
	//deathsight_message = "somewhere far in sands"

/area/outdoors/rmh_desert/valley
	name = "Desert Valley"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "lowdesert"
	soundenv = 19
	ambush_mobs = null
	first_time_text = "DESERT VALLEY"
	ambientsounds = DRONING_MOUNTAIN
	ambientnight = DRONING_MOUNTAIN
	background_track_dawn = 'modular_rmh/sound/music/area/desert_dawn.ogg'
	background_track = 'modular_rmh/sound/music/area/desert_day.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/desert_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/desert_night.ogg'
	converted_type = /area/indoors/shelter/rmh_desert
	//deathsight_message = "somewhere far in lowsands"

// УБЕЖИЩЕ - SHELTER
/area/indoors/shelter/rmh_desert
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "shelter"
	background_track = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'
	background_track_night = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'

// МОРЕ - SEA
/area/outdoors/rmh_desert/sea
	name = "Saltsea"
	first_time_text = "FAR SALTSEA"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "sea"

// ПОРТ - PORT
/area/indoors/rmh_desert/phouse
	name = "indoors"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "house"
	background_track = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'
	background_track_night = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'
	converted_type = /area/outdoors/rmh_desert/port
	//deathsight_message = "the port point between sand and salty water"

/area/outdoors/rmh_desert/roofs
	name = "Seaport Roofs"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "roofs"
	ambientsounds = DRONING_MOUNTAIN
	ambientnight = DRONING_MOUNTAIN
	//spookysounds = SPOOKY_GEN
	//spookynight = SPOOKY_GEN
	background_track_dawn = 'modular_rmh/sound/music/area/desert_town.ogg'
	background_track = 'modular_rmh/sound/music/area/desert_town.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/desert_town.ogg'
	background_track_night = 'modular_rmh/sound/music/area/desert_town.ogg'
	soundenv = 17
	converted_type = /area/indoors/shelter/town/rmh/roofs

/area/indoors/shelter/rmh_desert/roofs
	name = "Rivermist Hollow Rooftops"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "roofs"
	background_track = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'
	background_track_night = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/indoorsdesert_alltime.ogg'

/area/outdoors/rmh_desert/port
	name = "Sea Port"
	first_time_text = "SEASIDE PORT"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "seaport"
	background_track_dawn = 'modular_rmh/sound/music/area/desert_town.ogg'
	background_track = 'modular_rmh/sound/music/area/desert_town.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/desert_town.ogg'
	background_track_night = 'modular_rmh/sound/music/area/desert_town.ogg'

// ДАНЖ И ПЕЩЕРЫ - DUNGEON AND CAVES
/area/under/rmh_desert/ziqurat
	name = "Ziqurat"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "ziqurat"
	first_time_text = "ZIQURAT"
	background_track = 'sound/music/area/dungeon2.ogg'
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/outdoors/rmh_desert/dungeon1
	ceiling_protected = TRUE

/area/outdoors/rmh_desert/dungeon1
	name = "Outdesertdungeon"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "spidercave"
	background_track = 'sound/music/area/dungeon.ogg'
	background_track_dusk = null
	background_track_night = null
	ceiling_protected = TRUE

/area/indoors/cave/rmh_desertcaves
	name = "Dusted Caves"
	first_time_text = "DUSTED CAVES"

// ОАЗИС - OASIS
/area/outdoors/rmh_desert/oasis
	name = "Oasis"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "oasis"
	ambientsounds = 'modular_rmh/sound/music/area/oasis_day.ogg'
	ambientnight = 'modular_rmh/sound/music/area/oasis_night.ogg'
	//spookysounds = null
	//spookynight = null
	background_track = null
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/indoors/shelter/rmh_desert

// ДВОРЦОВЫЙ ПОГРЕБ - PALACE CELLAR
/area/under/rmh_desert/tea/palacecellar
	name = "Palace Cellar"
	icon_state = "under"
	first_time_text = "PALACE CELLAR"
	background_track = 'sound/music/area/dungeon2.ogg'
	background_track_dusk = null
	background_track_night = null
	ceiling_protected = TRUE

// TEAPALACE - ЧАЙХАНА
/area/indoors/rmh_desert/tea
	name = "Tea Palace"
	first_time_text = "TEA PALACE"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "house"
	background_track = 'modular_rmh/sound/music/area/teapalace_day.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/teapalace_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/teapalace_night.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/teapalace_dawn.ogg'
	converted_type = /area/outdoors/rmh_desert/port
	//deathsight_message = "the port point between sand and salty water"

/area/outdoors/rmh_desert/tea
	name = "Tea Palace Garden"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "seaport"
	background_track = 'modular_rmh/sound/music/area/teapalace_day.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/teapalace_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/teapalace_night.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/teapalace_dawn.ogg'


// ДВОРЦОВЫЕ КАЗЕМАТЫ - PALACE CASEMATES
/area/under/rmh_desert/tea/palacecasemates
	name = "Palace Casemates"
	icon_state = "under"
	first_time_text = "PALACE CASEMATES"
	background_track = 'sound/music/area/dungeon2.ogg'
	background_track_dusk = null
	background_track_night = null
	ceiling_protected = TRUE

// ГАРЕМ - HAREM
/area/under/rmh_desert/tea/harem
	name = "Harem"
	icon_state = "under"
	first_time_text = "HAREM"
	droning_index = DRONING_BASEMENT
	droning_index_night = DRONING_BASEMENT
	ambient_index = AMBIENCE_DUNGEON
	ambient_index_night = AMBIENCE_DUNGEON
	background_track = 'sound/music/area/catacombs.ogg'
	background_track_dusk = null
	background_track_night = null
	ceiling_protected = TRUE

// ГАРЕМ НИЖНИЙ УРОВЕНЬ - LOWER HAREM
/area/under/rmh_desert/tea/hareml
	name = "Lower Harem"
	icon_state = "under"
	first_time_text = "LOWER HAREM"
	droning_index = DRONING_BASEMENT
	droning_index_night = DRONING_BASEMENT
	ambient_index = AMBIENCE_DUNGEON
	ambient_index_night = AMBIENCE_DUNGEON
	background_track = 'sound/music/area/catacombs.ogg'
	background_track_dusk = null
	background_track_night = null
	ceiling_protected = TRUE

// PYRAMID DUNGEON
/area/under/rmh_desert/pyramid
	name = "Pyramid"
	icon_state = "under"
	first_time_text = "PYRAMID"
	background_track = 'sound/music/area/dungeon2.ogg'
	background_track_dusk = null
	background_track_night = null
	ceiling_protected = TRUE

// SPIDER DESERT CAVE
/area/under/rmh_desert/spider
	name = "Desert Spider Caves"
	icon_state = "spider"
	first_time_text = "DESERT CAVES"
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/spider/mutated = 100)
	background_track = 'sound/music/area/spidercave.ogg'
	background_track_dusk = null
	background_track_night = null
	ceiling_protected = TRUE

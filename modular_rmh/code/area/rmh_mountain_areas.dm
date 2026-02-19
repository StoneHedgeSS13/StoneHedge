//MOUNTAIN MAP AREAS//

/area/outdoors/mountains/rmh_mountains/frozen
	name = "Dusk Spire Mountains"
	icon_state = "decap"
	ambush_mobs = null
	ambientsounds = DRONING_MOUNTAIN
	ambientnight = DRONING_MOUNTAIN
	background_track = 'sound/music/area/decap.ogg'
	background_track_dusk = null
	background_track_night = null
	first_time_text = "DUSK SPIRE MOUNTAINS"
	ambush_times = list("night","dawn","dusk")
	/*ambush_mobs = list(
				/mob/living/carbon/human/species/dwarfskeleton/ambush/knight = 11,
				/mob/living/carbon/human/species/dwarfskeleton/ambush = 11,
				/mob/living/simple_animal/hostile/retaliate/direbear = 13,
				/mob/living/simple_animal/hostile/retaliate/minotaur/wounded/chained = 5,
				/mob/living/simple_animal/hostile/retaliate/wolf/bobcat = 21,
				/mob/living/simple_animal/hostile/retaliate/wolf = 21,
				/mob/living/simple_animal/hostile/retaliate/wolf_undead = 18)*/
	converted_type = /area/indoors/shelter/mountains/rmh_mountains/frozen
	//deathsight_message = "a spire pass"

/area/indoors/shelter/mountains/rmh_mountains/frozen
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "indoors"
	background_track = 'sound/music/area/decap.ogg'
	ambush_times = null
	ambush_mobs = null
	background_track_dusk = null
	background_track_night = null

/area/indoors/cave/rmh_cave/cold
	name = "Cold Caves"
	first_time_text = "COLD CAVES"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "ice"
	ambush_times = null
	ambush_mobs = null
	//deathsight_message = "a cold cave"

//DUSK SPIRE MANOR

/area/indoors/town/rmh/manor
	name = "Dusk Spire Manor"
	first_time_text = "DUSK SPIRE MANOR"
	icon_state = "manor"
	background_track = 'sound/music/area/manor.ogg'
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/outdoors/exposed/rmh/manorgarri
	keep_area = TRUE

/area/outdoors/exposed/rmh/manorgarri
	name = "Dusk Spire Manor Court"
	first_time_text = "DUSK SPIRE MANOR COURTYARD"
	icon_state = "manorgarri"
	background_track = 'sound/music/area/manorgarri.ogg'
	background_track_dusk = null
	background_track_night = null
	keep_area = TRUE
	ambientsounds = DRONING_MOUNTAIN
	ambientnight = DRONING_MOUNTAIN

/area/indoors/town/rmh/manor/basement
	name = "Dusk Spire Manor Basement"
	first_time_text = "DUSK SPIRE MANOR BASEMENT"
	icon_state = "basement"

/area/indoors/town/rmh/manor/bath
	name = "Dusk Spire Manor Baths"
	first_time_text = "DUSK SPIRE MANOR BATHS"
	icon_state = "bath"
	background_track = 'modular_rmh/sound/music/area/baths.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/baths_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/baths_night.ogg'

/area/indoors/town/rmh/manor/vault
	name = "Dusk Spire Manor Vault"
	first_time_text = "DUSK SPIRE MANOR VAULT"
	icon_state = "vault"
	keep_area = TRUE

//KEEP OUTSKIRTS

/area/outdoors/mountains/rmh_mountains/frozen/lowlands
	name = "Cold Lowlands"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "outdoors"
	first_time_text = "COLD LOWLANDS"
	//deathsight_message = "cold lowlands"

/area/outdoors/mountains/rmh_mountains/frozen/forsaken_village
	name = "Forsaken Village"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "village"
	first_time_text = "FORSAKEN VILLAGE"
	//deathsight_message = "a forsaken village"

//KEEP

/area/indoors/cave/rmh_dwarf_keep
	name = "Kêdnath Acöb"
	first_time_text = "KÊDNATH ACÖB"
	icon_state = "dwarfin"
	background_track = 'sound/music/area/dwarf.ogg'
	ambientsounds = DRONING_CAVE_GENERIC
	ambientnight = DRONING_CAVE_GENERIC
	//spookysounds = AMBIENCE_CAVE
	//spookynight = AMBIENCE_CAVE
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/outdoors/exposed/rmh_dwarf_keep
	ceiling_protected = TRUE


/area/outdoors/exposed/rmh_dwarf_keep
	name = "Kêdnath Acöb"
	first_time_text = "KÊDNATH ACÖB"
	icon_state = "dwarfin"
	background_track = 'sound/music/area/dwarf.ogg'
	ambientsounds = DRONING_CAVE_GENERIC
	ambientnight = DRONING_CAVE_GENERIC
	//spookysounds = AMBIENCE_CAVE
	//spookynight = AMBIENCE_CAVE
	background_track_dusk = null
	background_track_night = null

/area/indoors/cave/rmh_dwarf_keep/entrance
	name = "Kêdnath Acöb Entrance Hall"
	first_time_text = "KÊDNATH ACÖB ENTRANCE HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "indoors"

/area/indoors/cave/rmh_dwarf_keep/living
	name = "Kêdnath Acöb Living Hall"
	first_time_text = "KÊDNATH ACÖB LIVING HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "living"

/area/indoors/cave/rmh_dwarf_keep/communal
	name = "Kêdnath Acöb Communal Hall"
	first_time_text = "KÊDNATH ACÖB COMMUNAL HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "village"

/area/indoors/cave/rmh_dwarf_keep/grand
	name = "Kêdnath Acöb Grand Hall"
	first_time_text = "KÊDNATH ACÖB GRAND HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "duke"

/area/indoors/cave/rmh_dwarf_keep/throne
	name = "Kêdnath Acöb Throne Hall"
	first_time_text = "KÊDNATH ACÖB THRONE HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "manor"

/area/indoors/cave/rmh_dwarf_keep/treasury
	name = "Kêdnath Acöb Treasury Hall"
	first_time_text = "KÊDNATH ACÖB TREASURY HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "vault"

/area/indoors/cave/rmh_dwarf_keep/smelters
	name = "Kêdnath Acöb Workshop: Smelters"
	first_time_text = "KÊDNATH ACÖB WORKSHOP: SMELTERS"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "fire_chamber"

/area/indoors/cave/rmh_dwarf_keep/forge
	name = "Kêdnath Acöb Workshop: Forge"
	first_time_text = "KÊDNATH ACÖB WORKSHOP: FORGE"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "forge"

//TRANSITIONS

/area/outdoors/rmh_field/tavel/mount_to_rivermist
	name = "Mountain To Rivermist Hollow"
	first_time_text = "TO RIVERMIST HOLLOW"
	ambientsounds = DRONING_MOUNTAIN
	ambientnight = DRONING_MOUNTAIN

/area/outdoors/rmh_field/tavel/mount_to_underdark
	name = "Mountain Descent To Underdark"
	first_time_text = "DESCENT TO UNDERDARK"

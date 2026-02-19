//MAIN MAP AREAS//


//FORESTS

/area/outdoors/rmh_field
	name = "Rivermist Hollow Outskirts"
	icon_state = "rtfield"
	soundenv = 19
	ambush_mobs = null
	first_time_text = "RIVERMIST HOLLOW OUTSKIRTS"
	background_track = 'modular_rmh/sound/music/area/field_day.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/field_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/field_night.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/field_dawn.ogg'
	ambient_index = null
	converted_type = /area/indoors/shelter/rmh_field
	//deathsight_message = "somewhere nar the town"

/area/indoors/shelter/rmh_field
	icon_state = "rtfield"
	background_track = 'modular_rmh/sound/music/area/field_day.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/field_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/field_night.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/field_dawn.ogg'
	ambient_index = null

/area/outdoors/rmh_field/north
	name = "North Forest"
	first_time_text = "NORTH FOREST"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "woods_n"

/area/outdoors/rmh_field/west
	name = "West Forest"
	first_time_text = "WEST FOREST"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "woods_w"

/area/outdoors/rmh_field/east
	name = "East Forest"
	first_time_text = "EAST FOREST"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "woods_e"

/area/outdoors/rmh_field/camp
	name = "Encampment On The Hill"
	first_time_text = "ENCAMPMENT ON THE HILL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "camp"

/area/outdoors/rmh_field/druid
	name = "Druid Grove"
	first_time_text = "DRUID GROVE"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "druid"

//CAVES

/area/indoors/cave/rmh_cave
	name = "Caves"
	first_time_text = "CAVES"
	icon_state = "cave"
	ambientsounds = DRONING_CAVE_GENERIC
	ambientnight = DRONING_CAVE_GENERIC
	soundenv = 8
	//deathsight_message = "a dark cave"
	converted_type = /area/outdoors/caves

/area/outdoors/caves_rmh
	name = "Caves"
	first_time_text = "CAVES"
	icon_state = "caves"
	background_track = 'sound/music/area/caves.ogg'
	background_track_dusk = null
	background_track_night = null


/area/indoors/cave/rmh_cave/mine
	name = "Abandoned Mines"
	first_time_text = "ABANDONED MINES"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "mine"
	//deathsight_message = "a dark mine"
	ceiling_protected = TRUE

/area/indoors/cave/rmh_cave/to_underdark
	name = "UNDERDARK DESCENT"
	first_time_text = "UNDERDARK DESCENT"
	icon_state = "underworld"

/area/outdoors/beach/rmh_beach
	name = "Misty Lake"
	icon_state = "beach"
	first_time_text = "MISTY LAKE"
	ambush_mobs = null

/area/indoors/cave/rmh_cave/wet
	name = "Southern Caves"
	icon_state = "cavewet"
	first_time_text = "SOUTHERN CAVES"
	ambientsounds = DRONING_CAVE_WET
	ambientnight = DRONING_CAVE_WET
	background_track = 'sound/music/area/caves.ogg'
	background_track_dusk = null
	background_track_night = null
	//deathsight_message = "wet caverns"

/area/indoors/cave/rmh_cave/wet/lake
	name = "Hidden Lake"
	icon_state = "lake"
	first_time_text = "HIDDEN LAKE"

//MOUNTAINS

/area/outdoors/mountains/rmh_mountains
	name = "Dusk Spire Mountains Pass"
	icon_state = "decap"
	ambush_mobs = null
	background_track = 'sound/music/area/decap.ogg'
	background_track_dusk = null
	background_track_night = null
	first_time_text = "DUSK SPIRE PASS"
	ambush_times = null
	converted_type = /area/indoors/shelter/mountains/rmh_mountains
	//deathsight_message = "a spire pass"

/area/indoors/shelter/mountains/rmh_mountains
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "indoors"
	background_track = 'sound/music/area/decap.ogg'
	background_track_dusk = null
	background_track_night = null

/area/outdoors/rmh_field/north_mountain
	name = "Northern Mountains Basin"
	first_time_text = "NORTHERN MOUNTAINS BASIN"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "n_basin"

//TRANSITIONS

/area/outdoors/rmh_field/tavel
	name = "Travel"
	first_time_text = "TRAVEL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "travel"

/area/outdoors/rmh_field/tavel/desert
	name = "To Coastal Desert"
	first_time_text = "TO COASTAL DESERT"

/area/outdoors/rmh_field/tavel/swamps
	name = "To Green Swamps"
	first_time_text = "TO GREEN SWAMPS"

/area/outdoors/rmh_field/tavel/forest
	name = "To Dark Forest"
	first_time_text = "TO DARK FOREST"

/area/outdoors/rmh_field/tavel/mountain
	name = "To Mountain Pass"
	first_time_text = "TO MOUNTAIN PASS"

/area/outdoors/rmh_field/tavel/vampires
	name = "To Dusk Spire"
	first_time_text = "TO DUSK SPIRE"

//ANTAGS
/area/indoors/cave/rmh_cave/minotaur
	name = "Abandoned Hall"
	first_time_text = "ABANDONED HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "minotaur"
	//deathsight_message = "a minotaur camp"
	ceiling_protected = TRUE


/area/indoors/cave/rmh_cave/greenskins
	name = "Greenskins Encampment"
	first_time_text = "GREENSKINS ENCAMPMENT"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "orc"
	//deathsight_message = "a greenskins camp"

//TOWN

/area/indoors/town/rmh
	name = "indoors"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "indoors"
	background_track = 'modular_rmh/sound/music/area/townindoor_day.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/townindoor_dawn.ogg'
	ambient_index = null
	converted_type = /area/outdoors/exposed/town/rmh
	//deathsight_message = "the town of Rivermist Hollow and all its bustling souls"

/area/outdoors/exposed/town/rmh
	name = "Rivermist Hollow"
	first_time_text = "RIVERMIST HOLLOW"
	icon_state = "town"
	background_track = 'modular_rmh/sound/music/area/town_day.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/town_dawn.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/town_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/town_night.ogg'

/area/outdoors/town/rmh
	name = "Rivermist Hollow outdoors"
	icon_state = "town"
	first_time_text = "RIVERMIST HOLLOW"
	background_track = 'modular_rmh/sound/music/area/town_day.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/town_dawn.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/town_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/town_night.ogg'
	ambient_index = null
	converted_type = /area/indoors/shelter/town/rmh

/area/outdoors/town/rmh/roofs
	name = "Rivermist Hollow Rooftops"
	icon_state = "roofs"
	ambientsounds = DRONING_MOUNTAIN
	ambientnight = DRONING_MOUNTAIN
	//spookysounds = SPOOKY_GEN
	//spookynight = SPOOKY_GEN
	background_track = 'modular_rmh/sound/music/area/town_day.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/town_dawn.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/town_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/town_night.ogg'
	soundenv = 17
	converted_type = /area/indoors/shelter/town/rmh/roofs

/area/indoors/shelter/town/rmh
	name = "Rivermist Hollow Shelter Indoors"
	icon_state = "town"
	background_track = 'modular_rmh/sound/music/area/townindoor_day.ogg'
	background_track_dawn = 'modular_rmh/sound/music/area/townindoor_dawn.ogg'

/area/indoors/shelter/town/rmh/roofs
	name = "Rivermist Hollow Shelter Rooftops"
	icon_state = "roofs"

/area/under/town/rmh/basement
	name = "basement"
	icon_state = "basement"
	ambientsounds = DRONING_BASEMENT
	ambientnight = DRONING_BASEMENT
	//spookysounds = SPOOKY_DUNGEON
	//spookynight = SPOOKY_DUNGEON
	background_track = 'sound/music/area/catacombs.ogg'
	background_track_dusk = null
	background_track_night = null
	soundenv = 5
	converted_type = /area/outdoors/exposed/rmh/under/basement
	ceiling_protected = TRUE

/area/outdoors/exposed/rmh/under/basement
	icon_state = "basement"
	background_track = 'sound/music/area/catacombs.ogg'
	background_track_dusk = null
	background_track_night = null

/area/under/town/rmh/treasury
	name = "treasury"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "treasury"
	ambientsounds = DRONING_BASEMENT
	ambientnight = DRONING_BASEMENT
	//spookysounds = SPOOKY_DUNGEON
	//spookynight = SPOOKY_DUNGEON
	background_track = 'sound/music/area/catacombs.ogg'
	background_track_dusk = null
	background_track_night = null
	soundenv = 5
	converted_type = /area/outdoors/exposed/rmh/under/basement
	ceiling_protected = TRUE

/area/under/town/rmh/bank
	name = "bank vault"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "bank"
	ambientsounds = DRONING_BASEMENT
	ambientnight = DRONING_BASEMENT
	//spookysounds = SPOOKY_DUNGEON
	//spookynight = SPOOKY_DUNGEON
	background_track = 'sound/music/area/catacombs.ogg'
	background_track_dusk = null
	background_track_night = null
	soundenv = 5
	converted_type = /area/outdoors/exposed/rmh/under/basement
	ceiling_protected = TRUE

/area/indoors/town/rmh/garrison
	name = "Town Guardhouse"
	first_time_text = "TOWN GUARDHOUSE"
	icon_state = "garrison"
	background_track = 'sound/music/area/manorgarri.ogg'
	background_track_dusk = null
	background_track_night = null
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/outdoors/exposed/town/rmh

/area/indoors/town/rmh/garrison/wall
	name = "Town Wall"
	first_time_text = "TOWN WALL"

/area/indoors/town/rmh/cell
	name = "Town Dungeon"
	first_time_text = "TOWN DUNGEON"
	icon_state = "cell"
	//spookysounds = SPOOKY_DUNGEON
	//spookynight = SPOOKY_DUNGEON
	background_track = 'sound/music/area/manorgarri.ogg'
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/outdoors/exposed/town/rmh
	cell_area = TRUE

/area/under/town/rmh/sewer
	name = "Rivermist Hollow Sewers"
	first_time_text = "RIVERMIST HOLLOW SEWERS"
	icon_state = "sewer"
	ambientsounds = DRONING_CAVE_WET
	ambientnight = DRONING_CAVE_WET
	//spookysounds = SPOOKY_RATS
	//spookynight = SPOOKY_RATS
	background_track = 'sound/music/area/sewers.ogg'
	background_track_dusk = null
	background_track_night = null
	//ambientrain = RAIN_SEWER
	soundenv = 21
	converted_type = /area/outdoors/exposed/under/rmh/sewer
	ceiling_protected = TRUE

/area/outdoors/exposed/under/rmh/sewer
	name = "Rivermist Hollow Sewers"
	first_time_text = "RIVERMIST HOLLOW SEWERS"
	icon_state = "sewer"
	background_track = 'sound/music/area/sewers.ogg'
	background_track_dusk = null
	background_track_night = null

/area/indoors/town/rmh/magician
	name = "Wizard's Tower"
	first_time_text = "WIZARD'S TOWER"
	icon_state = "magician"
	//spookysounds = SPOOKY_MYSTICAL
	//spookynight = SPOOKY_MYSTICAL
	background_track = 'sound/music/area/magiciantower.ogg'
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/outdoors/exposed/magiciantower

/area/outdoors/exposed/magiciantower
	name = "Wizard's Tower"
	first_time_text = "WIZARD'S TOWER"
	icon_state = "magiciantower"
	background_track = 'sound/music/area/magiciantower.ogg'
	background_track_dusk = null
	background_track_night = null

/area/indoors/town/rmh/magician/pass
	name = "Secret Pass"
	first_time_text = "SECRET PASS"
	//spookysounds = SPOOKY_MYSTICAL
	//spookynight = SPOOKY_MYSTICAL
	background_track = 'sound/music/area/magiciantower.ogg'
	background_track_dusk = null
	background_track_night = null
	ceiling_protected = TRUE

/area/indoors/town/rmh/barber
	name = "Town Barber"
	first_time_text = "TOWN BARBER"

/area/indoors/town/rmh/farm
	name = "Town Farm"
	first_time_text = "TOWN FARM"

/area/outdoors/exposed/town/rmh/farm
	name = "Town Farm"
	first_time_text = "TOWN FARM"
	icon_state = "outdoors"

/area/indoors/town/rmh/bank
	name = "Town Bank"
	first_time_text = "TOWN BANK"

/area/indoors/town/rmh/sawmill
	name = "Town Sawmill"
	first_time_text = "TOWN SAWMILL"

/area/indoors/town/rmh/library
	name = "Town Library"
	first_time_text = "TOWN LIBRARY"

/area/indoors/town/rmh/bath
	name = "Town Baths"
	first_time_text = "TOWN BATHS"
	icon_state = "bath"
	background_track = 'modular_rmh/sound/music/area/baths.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/baths_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/baths_night.ogg'
	converted_type = /area/outdoors/exposed/rmh/bath

/area/outdoors/exposed/rmh/bath
	name = "Town Baths"
	background_track = 'modular_rmh/sound/music/area/baths.ogg'
	background_track_dusk = 'modular_rmh/sound/music/area/baths_dusk.ogg'
	background_track_night = 'modular_rmh/sound/music/area/baths_night.ogg'

/area/indoors/town/rmh/crafters_guild
	name = "Crafters Guild"
	first_time_text = "CRAFTERS GUILD"

/area/indoors/town/rmh/crafters_guild/under
	name = "Crafters Guild"
	first_time_text = "CRAFTERS GUILD"
	icon_state = "dwarfin"
	background_track = 'sound/music/area/dwarf.ogg'
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/outdoors/exposed/rmh/crafters

/area/outdoors/exposed/rmh/crafters
	name = "Crafters Guild"
	first_time_text = "CRAFTERS GUILD"
	icon_state = "dwarf"
	background_track = 'sound/music/area/dwarf.ogg'
	background_track_dusk = null
	background_track_night = null

/area/indoors/town/rmh/merchant
	name = "Merchants Guild"
	first_time_text = "MERCHANTS GUILD"
	icon_state = "shop"
	background_track = 'sound/music/area/shop.ogg'
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/outdoors/exposed/rmh/merchant

/area/outdoors/exposed/rmh/merchant
	name = "Merchants Guild"
	first_time_text = "MERCHANTS GUILD"
	icon_state = "shop"
	background_track = 'sound/music/area/shop.ogg'

/area/indoors/town/rmh/tavern
	name = "Drunk Dwarf Tavern"
	first_time_text = "DRUNK DWARF TAVERN"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "tavern"
	ambientsounds = DRONING_INDOORS
	ambientnight = DRONING_INDOORS
	background_track = 'sound/silence.ogg'
	background_track_dusk = null
	background_track_night = null
	converted_type = /area/outdoors/exposed/rmh/tavern
	tavern_area = TRUE

/area/outdoors/exposed/rmh/tavern
	name = "Drunk Dwarf Tavern"
	first_time_text = "DRUNK DWARF TAVERN"
	background_track = 'sound/silence.ogg'
	background_track_dusk = null
	background_track_night = null
	tavern_area = TRUE

/area/indoors/town/rmh/town_hall
	name = "Town Hall"
	first_time_text = "TOWN HALL"

/area/indoors/town/rmh/chapel
	name = "The Town Chapel"
	first_time_text = "THE TOWN CHAPEL"
	icon_state = "church"
	background_track = 'sound/music/area/church.ogg'
	background_track_dusk = null
	background_track_night = null
	holy_area = TRUE
	background_track_dawn = 'sound/music/area/churchdawn.ogg'
	converted_type = /area/outdoors/exposed/church
	//deathsight_message = "a chapel"

/area/outdoors/exposed/rmh/chapel
	name = "The Town Chapel"
	first_time_text = "THE TOWN CHAPEL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "outdoors"
	background_track = 'sound/music/area/church.ogg'
	background_track_dusk = null
	background_track_night = null
	background_track_dawn = 'sound/music/area/churchdawn.ogg'
	//deathsight_message = "a chapel"

/area/indoors/town/rmh/chapel/basement
	icon_state = "The Ancient Crypt"
	first_time_text = "THE ANCIENT CRYPT"
	background_track = 'sound/music/area/catacombs.ogg'
	background_track_dusk = null
	background_track_night = null
	first_time_text = "THE ANCIENT CRYPT"

//HERMITS
/area/indoors/town/rmh/miner
	name = "Miner's Hut"
	first_time_text = "MINER'S HUT"

/area/indoors/town/rmh/witch
	name = "Witch's Hut"
	first_time_text = "WITCH'S HUT"

//BEDROCK AND BORDERS
/area/under/rmh_bedrock
	name = "Bedrock Border"
	first_time_text = "BEDROCK BORDER"
	icon_state = "unknown"
	//deathsight_message = "out of bounds"

/area/outdoors/rmh_air
	name = "In Air"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "air"
	//deathsight_message = "open air"
	ambientsounds = DRONING_MOUNTAIN
	ambientnight = DRONING_MOUNTAIN

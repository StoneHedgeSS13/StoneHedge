/datum/weather/fog
	name = "fog"
	desc = ""

	telegraph_duration = 10 SECONDS
	telegraph_message = span_warning("The fog is coming.")
	telegraph_sound = 'sound/blank.ogg'
	weather_message = ""
	weather_overlay = null
	weather_duration_lower = 2 MINUTES
	weather_duration_upper = 4 MINUTES
	weather_sound = 'sound/blank.ogg'
	weather_alpha = 100

	probability = 3

	end_duration = 5 SECONDS
	end_message = ""
	end_sound = 'sound/blank.ogg'

	area_type = /area/rogue/outdoors
	protected_areas = list(/area/rogue/indoors,/area/rogue/under)
	impacted_z_levels = list()

	particles = list(/atom/movable/screen/weather/fog)


/datum/weather/fog/process()
#ifndef TESTSERVER
	if(GLOB.forecast != "fog")
		wind_down()
		return
#endif

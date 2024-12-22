/datum/weather/snow_storm
	name = "snow storm"
	desc = ""
	probability = 90

	telegraph_message = span_warning("Drifting particles of snow begin to dust the surrounding area..")
	telegraph_duration = 300
	telegraph_overlay = "light_snow"

	weather_message = span_danger("<i>Harsh winds pick up as dense snow begins to fall from the sky! Seek shelter!</i>")
	weather_overlay = "snow_storm"
	weather_duration_lower = 600
	weather_duration_upper = 1500

	end_duration = 100
	end_message = span_boldannounce("The snowfall dies down, it should be safe to go outside again.")

	area_type = /area/awaymission/snowdin/outside
	target_trait = ZTRAIT_AWAY

	immunity_type = "snow"

	barometer_predictable = TRUE


/datum/weather/snow_storm/weather_act(mob/living/L)
	L.adjust_bodytemperature(-rand(5,15))


/datum/weather/snow
	name = "snow"
	desc = ""

	telegraph_duration = 10 SECONDS
	telegraph_message = span_warning("It begins to snow.")

	weather_message = ""
	weather_overlay = null
	weather_duration_lower = 5 MINUTES
	weather_duration_upper = 12 MINUTES
	weather_alpha = 100

	probability = 3

	end_duration = 5 SECONDS
	end_message = "The snow ceases."

	area_type = /area/rogue/outdoors
	protected_areas = list(/area/rogue/indoors,/area/rogue/under)
	impacted_z_levels = list()

	particles = list(/obj/emitters/weather/snow)

/datum/weather/snow/New(z_levels)
	impacted_z_levels = GLOB.sky_z.Copy()
	. = ..()

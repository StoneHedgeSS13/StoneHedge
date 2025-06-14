
//Rain - goes down
/particles/weather/rain
	icon_state             = "drop"
	color                  = "#ccffff"
	position               = generator("box", list(-500,-256,0), list(400,500,0))
	grow			       = list(-0.01,-0.01)
	gravity                = list(0, -10, 0.5)
	drift                  = generator("circle", 0, 1) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s
	transform 			   = null // Rain is directional - so don't make it "3D"
	//Weather effects, max values
	maxSpawning            = 250
	minSpawning            = 50
	wind                   = 2
	spin                   = 0 // explicitly set spin to 0 - there is a bug that seems to carry generators over from old particle effects

/datum/particle_weather/rain_gentle
	name = "Rain"
	desc = "Gentle rain, la la description."
	particleEffectType = /particles/weather/rain

	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/rain)
	indoor_weather_sounds = list(/datum/looping_sound/indoor_rain)
	weather_messages = list("The rain makes me shiver a little. I could use something to keep warm and dry.")

	minSeverity = 1
	maxSeverity = 15
	maxSeverityChange = 2
	severitySteps = 5
	immunity_type = TRAIT_RAINSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_RAIN

//Makes you a little chilly
/datum/particle_weather/rain_gentle/weather_act(mob/living/L)
	//shit that prevents our ass from freezing.
	var/turf/ceiling = get_step_multiz(src, UP)
	if(ceiling)
		if(!istype(ceiling, /turf/open/transparent/openspace))
			return
	var/obj/item/bedsheet/rogue/bedsheet = locate() in L.loc
	if(bedsheet)
		return
	for(var/obj/machinery/light/rogue/heater in range(3, L))
		return
	var/area/thearea = get_area(L)
	if(!thearea.outdoors)
		return
	L.adjust_bodytemperature(-rand(1,4))

/datum/particle_weather/rain_storm
	name = "Rain storm"
	desc = "Heavy rain, reminds you of those times you couldn't help but cry. pure and yet so hard to graspe.."
	particleEffectType = /particles/weather/rain

	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/storm)
	indoor_weather_sounds = list(/datum/looping_sound/indoor_rain)
	weather_messages = list("The rain makes me shiver a little.", "The storm is really picking up!")

	minSeverity = 4
	maxSeverity = 100
	maxSeverityChange = 50
	severitySteps = 50
	immunity_type = TRAIT_RAINSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_RAIN

//Makes you a bit chilly
/datum/particle_weather/rain_storm/weather_act(mob/living/L)
	//shit that prevents our ass from freezing.
	var/turf/ceiling = get_step_multiz(src, UP)
	if(ceiling)
		if(!istype(ceiling, /turf/open/transparent/openspace))
			return
	var/obj/item/bedsheet/rogue/bedsheet = locate() in L.loc
	if(bedsheet)
		return
	for(var/obj/machinery/light/rogue/heater in range(3, L))
		return
	var/area/thearea = get_area(L)
	if(!thearea.outdoors)
		return
	L.adjust_bodytemperature(-rand(4,8))

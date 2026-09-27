//Snow - goes down and swirls
/particles/weather/snow
	icon_state             = list("cross"=2, "snow_1"=5, "snow_2"=2, "snow_3"=2)
	color                  = "#ffffff"
	position               = generator("box", list(-500,-256,5), list(500,500,0))
	spin                   = generator("num",-10,10)
	gravity                = list(0, -2, 0.1)
	drift                  = generator("circle", 0, 3) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s
	transform 			   = null // Looks weird without it
	//Weather effects, max values
	maxSpawning           = 30
	minSpawning           = 5
	wind                  = 2
	count				  = 150

/particles/weather/snow/storm
	icon_state             = list("cross"=2, "snow_1"=5, "snow_2"=2, "snow_3"=2, "puff"= 1)
	color                  = "#ffffff"
	position               = generator("box", list(-500,-256,5), list(500,500,0))
	spin                   = generator("num",-10,10)
	gravity                = list(0, -4, 0.5)
	drift                  = generator("circle", 0, 3) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s
	transform 			   = null // Looks weird without it
	//Weather effects, max values
	maxSpawning           = 80
	minSpawning           = 10
	wind                  = 2
	count                  = 3000

/datum/particle_weather/snow_gentle
	name = "Snowfall"
	desc = "Gentle Snow, la la description."
	particleEffectType = /particles/weather/snow
	warning_message = span_greenannounce("The air chills across the realm, soft white specs appearing near warm breaths.")
	late_warning_message = span_greenannounce("Flakes swirl as snow starts to drift down from the sky.")
	wind_down_message = span_greenannounce("A few more flakes dance around in the air as the clouds start to part and move elsewhere.")
	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/snow)

	minSeverity = 5
	maxSeverity = 20
	maxSeverityChange = 5
	severitySteps = 5
	immunity_type = TRAIT_SNOWSTORM_IMMUNE
	probability = 15
	target_trait = PARTICLEWEATHER_SNOW
	forecast_tag = "snow"

//Makes you a little chilly
/datum/particle_weather/snow_gentle/weather_act(mob/living/L)
	if(HAS_TRAIT(L, TRAIT_WEATHER_PROTECTED))
		L.add_stress(/datum/stressevent/parasol_snow)
		return

	//Caustic Edit - Attempt to turn off that cold damage in cold weathers if you wear any kind of cloak-slot item. Simple check for now, can possibly make it more detailed with 'warm clothes' later?
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(!H.cloak)
			L.adjust_bodytemperature(-rand(5, 15))
	else
		L.adjust_bodytemperature(-rand(5, 15))
	//Caustic Edit End

/datum/particle_weather/snow_storm
	name = "Snow storm"
	desc = "Snow storm, la la description."
	particleEffectType = /particles/weather/snow/storm
	warning_message = span_greenannounce("Heavy clouds build in the sky as the air chills across the realm, soft white specs appearing near warm breaths.")
	late_warning_message = span_greenannounce("Heavy snow begins to fall thick and fast.")
	wind_down_message = span_greenannounce("The buffetting snowfall abates into lighter flakes, rays of light can be seen reflecting off the fresh snow.")
	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/snow)

	minSeverity = 40
	maxSeverity = 100
	maxSeverityChange = 50
	severitySteps = 50
	immunity_type = TRAIT_SNOWSTORM_IMMUNE
	probability = 10
	target_trait = PARTICLEWEATHER_SNOW
	forecast_tag = "snow"

//Makes you a lot little chilly
/datum/particle_weather/snow_storm/weather_act(mob/living/L)
	if(HAS_TRAIT(L, TRAIT_WEATHER_PROTECTED))
		L.add_stress(/datum/stressevent/parasol_snow)
		return

	//Caustic Edit - Attempt to turn off that cold damage in cold weathers if you wear any kind of cloak-slot item. Simple check for now, can possibly make it more detailed with 'warm clothes' later?
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(!H.cloak)
			L.adjust_bodytemperature(-rand(5, 15))
	else
		L.adjust_bodytemperature(-rand(5, 15))
	//Caustic Edit End

/turf/Exited(atom/movable/gone, direction)
	if(!istype(gone))
		return
	SEND_SIGNAL(src, COMSIG_TURF_EXITED, gone, direction)
	SEND_SIGNAL(gone, COMSIG_MOVABLE_TURF_EXITED, src, direction)


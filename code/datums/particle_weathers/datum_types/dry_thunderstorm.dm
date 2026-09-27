/particles/weather/static_spark
	icon_state = "spark"
	color = "#f8ff30"
	position = generator("box", list(-400, -300, 0), list(400, 300, 0))
	gravity = list(0, 0, 0)
	drift = generator("circle", 0, 0.6)
	scale = generator("num", 0.4, 0.7)
	lifespan = 50
	maxSpawning = 3
	minSpawning = 1

/datum/particle_weather/dry_thunderstorm
	name = "Dry Thunderstorm"
	desc = "Lightning without rain, la la description."
	particleEffectType = /particles/weather/static_spark
	warning_message = span_greenannounce("Dark clouds roll across the sky, echo's of thunder rumbling across the dry realm.")
	late_warning_message = span_greenannounce("Thunder cracks overhead, but no rain follows.")
	wind_down_message = span_greenannounce("A few final flashes of lightning can be seen in the distance as the dark clouds have all but moved on.")
	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/drythunder)
	indoor_weather_sounds = list(/datum/looping_sound/drythunder/indoors)

	minSeverity = 4
	maxSeverity = 100
	maxSeverityChange = 50
	severitySteps = 50
	immunity_type = TRAIT_RAINSTORM_IMMUNE
	probability = 40
	target_trait = PARTICLEWEATHER_RAIN
	forecast_tag = "rain"

	COOLDOWN_DECLARE(thunder)

/datum/particle_weather/dry_thunderstorm/tick()
	if(!COOLDOWN_FINISHED(src, thunder))
		return

	var/lightning_strikes = 6

	for(var/i = 1 to lightning_strikes)
		var/atom/lightning_destination
		var/list/viable_players = list()
		for(var/client/client in GLOB.clients)
			if(!isliving(client.mob))
				continue
			var/mob/living/L = client.mob
			viable_players += L
		if(!viable_players.len)
			return

		lightning_destination = pick(viable_players)
		//var/mob/living/humann= pick(viable_players)
		//var/turf/humann_turf = get_turf(humann)
		//var/area/A = get_area(humann)
		/*if(humann.badluck(4) && istype(A, /area/rogue/outdoors))
			humann.Immobilize(0.5 SECONDS)
			humann.apply_status_effect(/datum/status_effect/debuff/clickcd, 6 SECONDS)
			humann.electrocute_act(1, src, 1, SHOCK_NOSTUN)
			humann.apply_status_effect(/datum/status_effect/buff/lightningstruck, 6 SECONDS)
			new /obj/effect/temp_visual/lightning/storm(get_turf(humann_turf))*/
		if(lightning_destination)
			var/list/turfs = list()
			for(var/turf/open/turf in range(lightning_destination, 7))
				if(!turf.outdoor_effect || turf.outdoor_effect.weatherproof)
					continue
				turfs |= turf
			if(!length(turfs))
				return
			lightning_destination = pick(turfs)

		else
			lightning_destination = pick(SSParticleWeather.weathered_turfs)

		var/turf/target = get_turf(lightning_destination)
		for(var/mob/living/L in target)
			L.Immobilize(1 SECONDS)
			L.apply_status_effect(/datum/status_effect/debuff/clickcd, 6 SECONDS)
			L.apply_status_effect(/datum/status_effect/buff/lightningstruck, 6 SECONDS)
			L.electrocute_act(25, src)
		new /obj/effect/temp_visual/lightning/storm(target)

		COOLDOWN_START(src, thunder, rand(5, 40) * 1 SECONDS)

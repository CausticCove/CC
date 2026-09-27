// Sandstorm particles - fast, horizontal, abrasive
/particles/weather/sand
	icon_state = "dot"
	color      = "#c2b280" // sandy tan
	position   = generator("box", list(-600,-256,5), list(600,500,0))
	spin       = null

	// Mostly horizontal movement
	gravity = list(0.3, 0, 0)
	drift = list( generator("num", 2, 4), generator("num", -0.5, 0.5), 0)
	fade = 0.5
	fadein = 1
	friction   = 0.05 //
	transform = null
	// Weather tuning
	maxSpawning = 80
	minSpawning = 20
	wind        = 20

/particles/weather/sand/gentle
	wind        = 5
	count                  = 150 // 15 particles

/datum/particle_weather/sand_gentle
	name = "Dry gusts"
	desc = "A dry wind kicks sand through the air."
	particleEffectType = /particles/weather/sand/gentle
	warning_message = span_greenannounce("Dry gusts winds their way across the realm, pulling at loose ground.")
	late_warning_message = span_greenannounce("The wind groans lowly, carrying specs of sand and dust.")
	wind_down_message = span_greenannounce("The sands start to grow heavy and settle, as the winds steadily calm down once more.")
	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/sandstorm)
	indoor_weather_sounds = list(/datum/looping_sound/wind)
	minSeverity = 5
	maxSeverity = 25
	maxSeverityChange = 10
	severitySteps = 5
	immunity_type = TRAIT_SANDSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_SAND
	forecast_tag = "winds"

	COOLDOWN_DECLARE(dustdevil)

/turf/proc/is_town_turf()
	return istype(get_area(src), /area/rogue/outdoors/town)

/datum/particle_weather/sand_gentle/weather_act(mob/living/L)
	if(HAS_TRAIT(L, TRAIT_SANDSTORM_IMMUNE))
		return

	if(!HAS_TRAIT(L, TRAIT_SANDSTORM_GOGGLES) && !L.has_sandstorm_hood() && prob(5))
		L.adjust_blurriness(rand(1,3))

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(!H.cloak)
			H.adjust_bodytemperature(rand(1,3))
	else
		L.adjust_bodytemperature(rand(1,3))

/datum/particle_weather/sand_gentle/tick()
	if(!COOLDOWN_FINISHED(src, dustdevil))
		return

	var/max_devils = 0 //Caustic - No Dust Devils on a Gentle Sandstorm!
	var/spawn_chance = 3 //Caustic - Moving the spawn chance to a Var, down from 30 to 3 - if they actually spawned

	// Count active dust devils
	var/current_devils = GLOB.active_dust_devils.len

	if(current_devils >= max_devils)
		return

	if(!prob(spawn_chance))	//Caustic - Moved it to a var above!
		return
	// Build viable player list
	var/list/viable_players = list()
	for(var/client/C in GLOB.clients)
		if(!isliving(C.mob))
			continue
		var/mob/living/L = C.mob
		var/turf/T = get_turf(L)
		if(!T)
			continue
		if(!T.outdoor_effect)
			continue
		viable_players += L

	if(!viable_players.len)
		return

	var/spawn_attempts = 2

	for(var/i = 1 to spawn_attempts)
		if(current_devils >= max_devils)
			break

		var/mob/living/target = pick(viable_players)
		if(!target)
			continue

		var/turf/center = get_turf(target)
		if(!center)
			continue

		// Count devils near this player
		var/nearby = 0
		for(var/obj/effect/weather/tornado/dust_devil/D in range(center, 7))
			nearby++

		if(nearby >= 2)
			continue

		// Pick a valid outdoor turf near them
		var/list/turfs = list()
		for(var/turf/open/T in range(center, 7))
			if(!T.outdoor_effect || T.outdoor_effect.weatherproof)
				continue
			if(T.density)
				continue
			if(T.is_town_turf())
				continue
			turfs += T

		if(!turfs.len)
			continue

		var/turf/spawn_turf = pick(turfs)

		new /obj/effect/weather/tornado/dust_devil(spawn_turf)

		current_devils++

	COOLDOWN_START(src, dustdevil, rand(15, 40) * 1 SECONDS)


/datum/particle_weather/sand_gentle/stop_weather_sound_effect(mob/living/L)
	..() // stop sounds normally

/datum/particle_weather/sand_gentle/end()
	running = FALSE
	for(var/mob/living/M in currentSounds)
		if(M.client)
			stop_weather_sound_effect(M)
		if(HAS_TRAIT(M, TRAIT_SANDSTORMED))
			REMOVE_TRAIT(M, TRAIT_SANDSTORMED, TRAIT_GENERIC)
	SSParticleWeather.stopWeather()

/datum/particle_weather/sand_storm
	name = "Sandstorm"
	desc = "A howling wall of sand scours the land."
	particleEffectType = /particles/weather/sand
	warning_message = span_greenannounce("Ferocious winds howl their way across the realm, building thick clouds close to the earth.")
	late_warning_message = span_greenannounce("The wind screams, carrying blinding dust and forming small but powerful vortexes.")
	wind_down_message = span_greenannounce("The last of the vortexes start to die off as the winds finally begin to calm. In the distance, the sandy haze is dissipating.")
	scale_vol_with_severity = TRUE
	weather_sounds = list(/datum/looping_sound/sandstorm)
	indoor_weather_sounds = list(/datum/looping_sound/wind)
	minSeverity = 40
	maxSeverity = 100
	maxSeverityChange = 50
	severitySteps = 50

	immunity_type = TRAIT_SANDSTORM_IMMUNE
	probability = 1
	target_trait = PARTICLEWEATHER_SAND
	forecast_tag = "winds"

	COOLDOWN_DECLARE(dustdevil)

/datum/particle_weather/sand_storm/weather_act(mob/living/L)
	if(HAS_TRAIT(L, TRAIT_SANDSTORM_IMMUNE))
		return
	if(!HAS_TRAIT(L, TRAIT_SANDSTORMED))
		ADD_TRAIT(L, TRAIT_SANDSTORMED, TRAIT_GENERIC)
	// Heat + abrasion
	if(!HAS_TRAIT(L, TRAIT_SANDSTORM_GOGGLES) && !L.has_sandstorm_hood() && prob(25))
		L.adjust_blurriness(rand(1,3))

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(!H.cloak)
			H.adjust_bodytemperature(rand(3,5))
	else
		L.adjust_bodytemperature(rand(3,5))

	if(!L.has_sandstorm_hood())
		if(prob(33))
			L.energy_add(-10)

/datum/particle_weather/sand_storm/tick()
	if(!COOLDOWN_FINISHED(src, dustdevil))
		return

	var/max_devils = 3 //Caustic - Down from 10 to 3 at a time - Maximum will actually be (max_devils - 1) + spawn_attempts but only in the WORST CASE scenario. See below for spawn_attempts's definition and explanation of this.
	// Count active dust devils
	var/current_devils = GLOB.active_dust_devils.len

	if(current_devils >= max_devils)
		return

	// Build viable player list
	var/list/viable_players = list()
	for(var/client/C in GLOB.clients)
		if(!isliving(C.mob))
			continue
		var/mob/living/L = C.mob
		var/area/A = get_area(L)
		if(A?.allow_extreme_weather)
			var/turf/T = get_turf(L)
			if(!T)
				continue
			if(!T.outdoor_effect)
				continue
			viable_players += L

	if(!viable_players.len)
		return

	var/spawn_attempts = 2 // Check the commented block in the for loop below, and at the setting of the cooldown timer at the end of the tick() proc as well!
	var/spawn_chance = 15 //Caustic - Moving the spawn chance to a Var, down from 50 to 15

	for(var/i = 1 to spawn_attempts)
		//if(current_devils >= max_devils) //Since I've added the much longer timer for if the max is hit, this will only ever allow for a maximum of (max_devils - 1) + spawn_attempts to spawn, if all spawn attempts succeed and current_devils was at max - 1 already
		//	break

		if(!prob(spawn_chance))	//Caustic - Moving the spawn chance to a Var above! And make it per-devil as well!
			continue

		var/mob/living/target = pick(viable_players)
		if(!target)
			continue

		var/turf/center = get_turf(target)
		if(!center)
			continue

		// Count devils near this player
		var/nearby = 0
		for(var/obj/effect/weather/tornado/dust_devil/D in range(center, 7))
			nearby++

		if(nearby >= 2)
			continue

		// Pick a valid outdoor turf near them
		var/list/turfs = list()
		for(var/turf/open/T in range(center, 7))
			if(!T.outdoor_effect || T.outdoor_effect.weatherproof)
				continue
			if(T.density)
				continue
			if(T.is_town_turf())
				continue
			var/area/A = get_area(T)
			if(!A?.allow_extreme_weather)
				continue
			turfs += T

		if(!turfs.len)
			continue

		var/turf/spawn_turf = pick(turfs)

		new /obj/effect/weather/tornado/dust_devil(spawn_turf)

		current_devils++

	if(current_devils < max_devils) //If we have not hit the max Dust Devil amount, randomly set the cooldown in 30-60 seconds
		COOLDOWN_START(src, dustdevil, rand(30, 60) * 1 SECONDS)
	else //But if we have hit max_devils or somehow greater, set a longer static cooldown that will go over their lifespan + a small amount of rng variance
		COOLDOWN_START(src, dustdevil, (180 SECONDS /* Dust Devil Lifetime */ * 1.75 /* Constant Multiplier against that value */) + (rand(0, 90) * 1 SECONDS)) //Dust Devil lifespan is currently 180 SECONDS, and I don't want to move it into a global var right now just to get this working. It probably should be one though for consistency.
		//This comes out to, when the max count is hit, starting a much longer timer that ensures all dust devils will time out, and give a minimum grace period of .75x devil lifespan + up to another .5x devil lifespan based on RNG

/datum/particle_weather/sand_storm/stop_weather_sound_effect(mob/living/L)
	..() // stop sounds normally

	if(HAS_TRAIT(L, TRAIT_SANDSTORMED))
		REMOVE_TRAIT(L, TRAIT_SANDSTORMED, TRAIT_GENERIC)

/datum/particle_weather/sand_storm/end()
	running = FALSE
	for(var/mob/living/M in currentSounds)
		if(M.client)
			stop_weather_sound_effect(M)
		if(HAS_TRAIT(M, TRAIT_SANDSTORMED))
			REMOVE_TRAIT(M, TRAIT_SANDSTORMED, TRAIT_GENERIC)
	SSParticleWeather.stopWeather()


/mob/living/proc/has_sandstorm_hood()
	var/obj/item/clothing/head/H = get_item_by_slot(ITEM_SLOT_HEAD)
	if(!H)
		H = get_item_by_slot(ITEM_SLOT_MASK)
		if(!H)
			return FALSE

	// Generic hood subtype
	if(istype(H, /obj/item/clothing/head/roguetown/roguehood))
		return TRUE

	// Specific exceptions
	switch(H.type)
		if(
			/obj/item/clothing/head/roguetown/menacing,
			/obj/item/clothing/head/roguetown/necromhood,
			/obj/item/clothing/head/roguetown/necrahood,

		)
			return TRUE

	return FALSE

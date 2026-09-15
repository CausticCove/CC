//Caustic Edit - This file is being updated (and tweaked to fit us) to the Ratwood version!  The AP one is probably from Vanderlin itself?

GLOBAL_LIST_INIT(vanderlin_weather, list(PARTICLEWEATHER_RAIN, PARTICLEWEATHER_BLOODRAIN, PARTICLEWEATHER_LEAVES))
SUBSYSTEM_DEF(ParticleWeather)
	name = "Particle Weather"
	flags = SS_BACKGROUND
	wait = 10
	runlevels = RUNLEVEL_GAME
	var/list/elligble_weather = list()
	var/datum/particle_weather/runningWeather

	var/datum/weather_effect/weather_special_effect
	var/queued_weather_start_time  //Used by barometers to know when the next storm is coming
	var/datum/particle_weather/queued_weather
	var/particles/weather/particleEffect
	var/obj/weatherEffect

	var/list/turfs_to_process = list()
	var/list/weathered_turfs = list()

	var/datum/forecast/selected_forecast

	var/list/currentrun_mobs
	var/list/currentrun_objs

	var/obj_act_interval = 3 SECONDS
	var/next_obj_act = 0

/datum/controller/subsystem/ParticleWeather/fire(resumed = FALSE)
	if(!runningWeather || !runningWeather.running)
		return

	if(!resumed)
		runningWeather.tick()
		currentrun_mobs = GLOB.player_list.Copy()
		// Every registered obj's weather_act_on() gates on PARTICLEWEATHER_RAIN, and target_trait is
		// what we pass it - so only rain-trait weather (incl. fog) can affect objs. Skip the whole
		// sweep for leaves/snow/blood rain, and throttle it otherwise.
		if(runningWeather.target_trait == PARTICLEWEATHER_RAIN && world.time >= next_obj_act)
			next_obj_act = world.time + obj_act_interval
			currentrun_objs = GLOB.weather_act_upon_list.Copy()
		else
			currentrun_objs = null

	var/list/curr_mobs = currentrun_mobs
	while(curr_mobs.len)
		var/mob/act_on = curr_mobs[curr_mobs.len]
		curr_mobs.len--
		if(isliving(act_on))
			runningWeather.try_weather_act(act_on)
		if(MC_TICK_CHECK)
			return

	var/list/curr_objs = currentrun_objs
	while(curr_objs?.len)
		var/obj/act_on = curr_objs[curr_objs.len]
		curr_objs.len--
		runningWeather.weather_obj_act(act_on)
		if(MC_TICK_CHECK)
			return


//This has been mangled - currently only supports 1 weather effect serverwide so I can finish this
/datum/controller/subsystem/ParticleWeather/Initialize(start_timeofday)
	for(var/V in subtypesof(/datum/particle_weather))
		var/datum/particle_weather/W = V
		var/probability = initial(W.probability)
		var/target_trait = initial(W.target_trait)

		// any weather with a probability set may occur at random
		if (prob(probability) && (target_trait in GLOB.vanderlin_weather)) //TODO VANDERLIN: Map trait this.
			LAZYINITLIST(elligble_weather)
			elligble_weather[W] = probability

	switch(SSmapping.config.map_name)
		if("Cove World")
			selected_forecast = new /datum/forecast/cove()
		if("Desert Town")
			selected_forecast = new /datum/forecast/alashur()
		if("Pilgrim")
			selected_forecast = new /datum/forecast/cove()
		else
			selected_forecast = new /datum/forecast/cove()	//Default to cove if no configs match so we have some weather

	return ..()

/datum/controller/subsystem/ParticleWeather/proc/run_weather(datum/particle_weather/weather_datum_type, force = 0, color)
	if(runningWeather || queued_weather)
		if(!force)
			log_game("Run_Weather was called while a weather was running and without forced set to true. Ignoring this weather change.")
			return
		if(runningWeather)
			runningWeather.end()
	if (istext(weather_datum_type))
		for (var/V in subtypesof(/datum/particle_weather))
			var/datum/particle_weather/W = V
			if (initial(W.name) == weather_datum_type)
				weather_datum_type = V
				break
	if (!ispath(weather_datum_type, /datum/particle_weather))
		CRASH("run_weather called with invalid weather_datum_type: [weather_datum_type || "null"]")

	runningWeather = new weather_datum_type()

	if(force)
		runningWeather.start(color)
	else
		var/randTime = rand(30 SECONDS, 1 MINUTES) //+ initial(runningWeather.weather_duration_upper) //Caustic Edit - Lets just make it a bit more consistent when it will actually start? Otherwise it's like... anywhere from almost immediately to 10 minutes later, plus the upper duration which... goodness.

		queued_weather = runningWeather
		queued_weather_start_time = world.time + randTime

		// Early forecast warning
		runningWeather.send_warning()

		// Schedule late warning 30 seconds before start
		if(randTime > 30 SECONDS)
			addtimer(CALLBACK(runningWeather, /datum/particle_weather/proc/send_late_warning),randTime - (30 SECONDS),TIMER_UNIQUE|TIMER_STOPPABLE)
		// Schedule actual start
		addtimer(CALLBACK(runningWeather, /datum/particle_weather/proc/start),randTime,TIMER_UNIQUE|TIMER_STOPPABLE)


/datum/controller/subsystem/ParticleWeather/proc/make_eligible(possible_weather)
	elligble_weather = possible_weather
// 	next_hit = null

/datum/controller/subsystem/ParticleWeather/proc/getweatherEffect()
	if(!weatherEffect)
		weatherEffect = new /obj()
		weatherEffect.particles = particleEffect
		weatherEffect.filters += filter(type="alpha", render_source=WEATHER_RENDER_TARGET)
		weatherEffect.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	return weatherEffect

/datum/controller/subsystem/ParticleWeather/proc/SetparticleEffect(particles/P, blend_type, filter_type, color, secondary_filter_type)
	particleEffect = P
	weatherEffect.particles = particleEffect
	if(color)
		weatherEffect.color = color
	if(!blend_type)
		weatherEffect.blend_mode = BLEND_DEFAULT
	else
		weatherEffect.blend_mode = blend_type
	weatherEffect.filters = list()
	weatherEffect.filters += filter(type="alpha", render_source=WEATHER_RENDER_TARGET)
	if(filter_type)
		weatherEffect.filters += filter_type
	if(secondary_filter_type)
		weatherEffect.filters += secondary_filter_type

/datum/controller/subsystem/ParticleWeather/proc/stopWeather()
	for(var/obj/act_on as anything in GLOB.weather_act_upon_list)
		if(!act_on)	//guard against nulls from deletions
			continue
		act_on.weather = FALSE
	weatherEffect.particles = null
	QDEL_NULL(runningWeather)
	QDEL_NULL(particleEffect)

/datum/controller/subsystem/ParticleWeather/proc/check_forecast(time_of_day)

	// Do not roll new forecast if weather is active or queued
	if(queued_weather) //(runningWeather || queued_weather) //Caustic Edit - Changing this to instead only refuse to interrupt a queued weather - and we can just call to wind down weathers here.
		return

	if(!selected_forecast)
		log_game("No selected_forecast set!")
		return

	var/datum/particle_weather/weather_type = selected_forecast.pick_weather(time_of_day)

	if(!weather_type)
		if(prob(50)) //Coin Flip for now to see if we just let the water continue or swap to 'clear' weather, by ending the current.
			log_game("Forecast roll chose to extend the current weather for [time_of_day]")
			return

	var/time_to_start_next
	if(runningWeather && !runningWeather.sent_winddown) //Just in case. Lets make sure nothing else accidentally ended it already.
		runningWeather.sent_winddown = TRUE
		time_to_start_next = particleEffect.lifespan + particleEffect.fade + 5 SECONDS //Lets add a constant here as well to ensure that it runs _after_ the current has ended.
		runningWeather.wind_down()
		runningWeather.send_winddown_message()

	if(!weather_type) //If there is no weather and this point is it, it means the prob above failed to continue the weather!
		log_game("Forecast rolled 'clear skies' for [time_of_day]")
		return

	if(!time_to_start_next)
		time_to_start_next = 5 SECONDS
	GLOB.forecast = initial(weather_type.forecast_tag)

	log_game("Forecast picked [weather_type] for [time_of_day]. It will run in [time_to_start_next] ticks.")

	addtimer(CALLBACK(src, PROC_REF(run_weather), weather_type), time_to_start_next, TIMER_UNIQUE|TIMER_STOPPABLE)

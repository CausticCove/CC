/datum/forecast
	var/name = "Base Forecast"

	var/list/dawn_weather = list()
	var/list/day_weather = list()
	var/list/dusk_weather = list()
	var/list/night_weather = list()

	var/dawn_prob  = 35
	var/day_prob  = 35
	var/night_prob  = 35
	var/dusk_prob = 35

/datum/forecast/proc/pick_weather(time_of_day)
	var/list/weather_pool	//Needed so that if the storytellers change we don't still keep eoran/zizo/graggar unique weathers

	switch(time_of_day)
		if("dusk")
			if(!prob(dusk_prob))
				return
			weather_pool = dusk_weather

		if("night")
			if(!prob(night_prob))
				return
			weather_pool = night_weather.Copy()
			if(SSgamemode.current_storyteller?.name == "Zizo" || SSgamemode.current_storyteller?.name == "Graggar")
				weather_pool[/datum/particle_weather/blood_rain_storm] = 10

		if("dawn")
			if(!prob(dawn_prob))
				return
			weather_pool = dawn_weather.Copy()

			if(SSgamemode.current_storyteller?.name == "Eora")
				weather_pool[/datum/particle_weather/sakura_gentle] = 15

		if("day")
			if(!prob(day_prob))
				return
			weather_pool = day_weather.Copy()

			if(SSgamemode.current_storyteller?.name == "Eora")
				weather_pool[/datum/particle_weather/sakura_gentle] = 15

			if(SSgamemode.current_storyteller?.name == "Abyssor")
				weather_pool[/datum/particle_weather/hurricane] = 10	//Intended to be very rare, as it is destructive - Removed the destruction, so we might be able to have it a bit more likely.

	if(!weather_pool || !length(weather_pool))
		return

	return pickweight(weather_pool)

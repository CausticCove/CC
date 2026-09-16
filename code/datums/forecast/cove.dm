//Cove is meant to be wet, leafy, snowy sort of weather. On occasion, ash storms from mountdecap and fireflies.
/datum/forecast/cove
	dawn_weather = list(
		/datum/particle_weather/rain_gentle = 25,
		/datum/particle_weather/rain_storm = 15,
		/datum/particle_weather/ashstorm = 15, //Mount Decap can herald a new day...! Maybe.
		/datum/particle_weather/fog = 15, //... Or the dreaded FOG.
		/datum/particle_weather/snow_gentle = 10,
		/datum/particle_weather/fireflies = 10,
		/datum/particle_weather/snow_storm = 5,
		/datum/particle_weather/leaves_gentle = 5,
		/datum/particle_weather/leaves_storm = 5,
		/datum/particle_weather/hail = 5,
	)
	day_weather = list(
		/datum/particle_weather/rain_gentle = 25, //More likely to rain during the day since it's warmer.
		/datum/particle_weather/rain_storm = 20,
		/datum/particle_weather/snow_gentle = 10,
		/datum/particle_weather/hail = 10,
		/datum/particle_weather/fog = 10,
		/datum/particle_weather/snow_storm = 5,
		/datum/particle_weather/ashstorm = 5,
		/datum/particle_weather/leaves_gentle = 5,
		/datum/particle_weather/leaves_storm = 2,
	)
	dusk_weather = list(
		/datum/particle_weather/rain_gentle = 20,
		/datum/particle_weather/snow_gentle = 15,
		/datum/particle_weather/rain_storm = 15,
		/datum/particle_weather/fireflies = 15,
		/datum/particle_weather/hail = 15, //Hail is a bit of an anomaly, perhaps? Better to not happen in the dark night though.
		/datum/particle_weather/leaves_gentle = 10,
		/datum/particle_weather/leaves_storm = 5,
		/datum/particle_weather/snow_storm = 5,
		/datum/particle_weather/fog = 5,
		/datum/particle_weather/ashstorm = 5,
	)
	night_weather =  list(
		/datum/particle_weather/snow_gentle = 25, //More likely to snow at night cause colder!
		/datum/particle_weather/fireflies = 20, //Pretty fireflies :3
		/datum/particle_weather/rain_gentle = 15,
		/datum/particle_weather/snow_storm = 15,
		/datum/particle_weather/rain_storm = 10,
		/datum/particle_weather/leaves_gentle = 5,
		/datum/particle_weather/leaves_storm = 2,
		/datum/particle_weather/hail = 5,
		/datum/particle_weather/ashstorm = 5,
	)

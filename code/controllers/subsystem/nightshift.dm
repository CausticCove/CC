GLOBAL_LIST_EMPTY(TodUpdate)

SUBSYSTEM_DEF(nightshift)
	name = "Night Shift"
	wait = 10 SECONDS
	flags = SS_NO_TICK_CHECK
	priority = 1
	var/current_tod = null

	//Caustic Edit - Adjusting the hours of daylight vs nighttime - To account for Weather Ticking on it's own time-frame, try to ensure that the 4 TOD regions each have a weather tick that lands in them. Currently it's running starting at 1:00 AM, and every 3 hours it will tick, so 4:00 AM, 7:00 AM, etc.
	var/nightshift_active = FALSE //The times below are all in station time
	var/nightshift_start_time = 612000		//612000=	 5:30pm - 13 hours of night
	var/nightshift_dawn_start = 234000		//234000=    6:30am - 2 hours of dawn
	var/nightshift_day_start = 306000		//306000=    8:30am - 7 hours of day - Totalling 11 daylight hours
	var/nightshift_dusk_start = 558000		//558000=    3:30pm - 2 hours of dusk

	/* Default AP Config
	var/nightshift_start_time = 576000		//576000=	 4:00pm - 16 hours of night
	var/nightshift_dawn_start = 288000		//288000=    8:00am - 2 hours of dawn
	var/nightshift_day_start = 360000		//360000=    10:00am - 4 hours of day
	var/nightshift_dusk_start = 504000		//504000=    2:00pm - 2 hours of dusk <- These times are kinda insane wow
	*/
	//Caustic Edit End

	/* Default STONEKEEP config.
	var/nightshift_start_time = 756000	//9:00 PM - 2100 hrs
	var/nightshift_dawn_start = 216000	//6:00 AM - 0600 hrs
	var/nightshift_day_start = 324000	//9:00 AM - 0900 hrs
	var/nightshift_dusk_start = 648000	//6:00 PM - 1800 hrs
	*/

	//1hr = 36000
	//30m = 18000

	var/nightshift_first_check = 2 SECONDS

	var/high_security_mode = FALSE

/datum/controller/subsystem/nightshift/Initialize()
	if(!CONFIG_GET(flag/enable_night_shifts))
		can_fire = FALSE
	current_tod = settod()

	//CC Edit - Desert Map time shift
	if(SSmapping.config.map_name == "Desert Town")
		//Longer days in favor of shorter nights compared to default Cove World
		//Nights are also slightly brighter in the desert due to a lack of foliage and often clear skies
		nightshift_start_time = 738000		//738000=	8:30pm - 9 hours night
		nightshift_dawn_start = 198000		//198000=   5:30am - 2 hours dawn
		nightshift_day_start =  270000		//270000=   7:30am - 11 hours day - Totalling 15 daylight hours
		nightshift_dusk_start = 666000		//660000=   6:30pm - 2 hours dusk

		if(!GLOB.mirage_controller)
			GLOB.mirage_controller = new
			GLOB.mirage_controller.MoveOasis()

	return ..()

/datum/controller/subsystem/nightshift/fire(resumed = FALSE)
	if(world.time - SSticker.round_start_time < nightshift_first_check)
		return
	check_nightshift()
	if(SSticker?.sunscorched)
		process_sunscorch()

/datum/controller/subsystem/nightshift/proc/announce(message)
	priority_announce(message, sound='sound/misc/bell.ogg')

/datum/controller/subsystem/nightshift/proc/check_nightshift()
//	var/emergency = GLOB.security_level >= SEC_LEVEL_RED
//	var/announcing = FALSE
//	var/time = station_time()
/*	var/night_time = (time < nightshift_day_start) || (time > nightshift_dusk_start) || (settod() in list("night", "dawn", "dusk"))
	if(high_security_mode != emergency)
		high_security_mode = emergency
		if(night_time)
			announcing = FALSE
			if(!emergency)
				announce("Restoring night lighting configuration to normal operation.")
			else
				announce("Disabling night lighting: Station is in a state of emergency.")
	if(emergency)
		night_time = FALSE
	if(nightshift_active != night_time)
		update_nightshift(night_time, announcing)*/
	var/curtod = settod()
	if(current_tod != curtod)

		current_tod = GLOB.tod
		update_nightshift()

/datum/controller/subsystem/nightshift/proc/update_nightshift()
	set waitfor = FALSE
	for(var/obj/A in GLOB.TodUpdate)
		A.update_tod(GLOB.tod)
	for(var/mob/living/M in GLOB.mob_list)
		M.update_tod(GLOB.tod)

/datum/controller/subsystem/nightshift/proc/process_sunscorch()
	if(world.time < SSticker.sunscorch_burn_start_time)
		return
	if(!SSticker.sunscorch_burn_warning_sent)
		SSticker.sunscorch_burn_warning_sent = TRUE
		to_chat(world, span_userdanger("THE WORM CONSUMES THE SUN. Deadly radiance falls on Azuria. Those outside will be unmade. The back of my amygdala itches."))
	for(var/mob/living/M as anything in GLOB.mob_living_list)
		if(M.stat == DEAD || !isturf(M.loc))
			continue
		var/turf/current_turf = M.loc
		if(!current_turf.can_see_sky())
			continue
		M.fire_act(1, 5)
		CHECK_TICK

/obj/proc/update_tod(todd)
	return

/mob/living/proc/update_tod(todd)
	return

/mob/living/carbon/human/update_tod(todd)
	if(client)
		var/area/areal = get_area(src)
		if(!cmode)
			SSdroning.play_area_sound(areal, src.client)
		SSdroning.play_loop(areal, src.client)
	if(ai_controller)
		return
	switch(todd)
		if("day")
			if(HAS_TRAIT(src, TRAIT_VAMP_DREAMS))
				apply_status_effect(/datum/status_effect/debuff/vamp_dreams)
				handle_sleep_triumphs() //CC Edit: Moving triumphs to whenever the character becomes eepy sleepies
			if(HAS_TRAIT(src, TRAIT_NIGHT_OWL))
				apply_status_effect(/datum/status_effect/debuff/sleepytime)
				handle_sleep_triumphs()//CC Edit: Moving triumphs to whenever the character becomes eepy sleepies
			if(HAS_TRAIT(src, TRAIT_INFINITE_STAMINA))
				handle_sleep_triumphs()
			if(HAS_TRAIT(src, TRAIT_NOSLEEP))
				if(prob(30))
					handle_sleep_triumphs()
		if("night")
			SEND_SIGNAL(src, COMSIG_SLEEPY_TIME)
			if(HAS_TRAIT(src, TRAIT_INFINITE_STAMINA) || HAS_TRAIT(src, TRAIT_NOSLEEP))
				return ..()
			if(HAS_TRAIT(src, TRAIT_NIGHT_OWL))
				add_stress(/datum/stressevent/night_owl)
			else
				handle_sleep_triumphs()//CC Edit: Moving triumphs to whenever the character becomes eepy sleepies
				apply_status_effect(/datum/status_effect/debuff/sleepytime)
				add_stress(/datum/stressevent/sleepytime)

///CC Edit: Moving dreampoints to whenever triumph gets dispensed
/mob/living/carbon/human/proc/handle_sleep_triumphs()
	if(!mind)
		return
	allmig_reward++
	var/triumphs_to_add = 1
	var/static/list/towner_jobs
	towner_jobs = GLOB.peasant_positions | GLOB.burgher_positions | GLOB.sidefolk_positions
	//CC Edit Begin
	if(mind.assigned_role in towner_jobs) //If you play a towner-related role, you get an additonal triumph. Fixed as of 3/18/26.
		triumphs_to_add++
	if(dna.species.dietary_goals_met)
		triumphs_to_add++
	//CC Edit End
	adjust_triumphs(triumphs_to_add)
	to_chat(src, span_notice("An another dae passes in Azuria...\nNights Survived: \Roman[allmig_reward]. \n"), MESSAGE_TYPE_INFO)

	var/int = mind.current.STAINT

	if(int < 10)
		to_chat(src, span_boldwarning("I'm trying my best to learn, even if it is a little difficult..."), MESSAGE_TYPE_INFO)
	else
		to_chat(src, span_notice("I reflect on my journey, my experiences, and the lessons others, and lyfe has taught me..."), MESSAGE_TYPE_INFO)
	if(mind.sleep_adv)
		mind.sleep_adv.retained_dust += mind.current.STAINT * DREAM_DUST_PER_INT //25% dream points for each int
		switch(mind.sleep_adv.retained_dust)
			if(0 to 500)
				to_chat(src, span_notice("I managed to focus on learning a thing or two lately, but to really solidify the lessons, I think I'll need to meditate and dream on it..."), MESSAGE_TYPE_INFO)
			else
				to_chat(src, span_notice("My mind has been absorbing knoweledge like a sponge... whatever that is. Curiosity drives me forwards, but reality holds me back... I really should reflect on my lessons now, if I want to realize my potential"), MESSAGE_TYPE_INFO)

		if(!stat)
			to_chat(src, span_warning("Staying alive in these uncertain times is it's own achievement. With the spark of my mind intact, and the embers of my heart and soul burning bright, at least at the moment, I feel slightly better about todae."), MESSAGE_TYPE_INFO)
			mind.sleep_adv.retained_dust += 100	//Free skillpoint for you <3




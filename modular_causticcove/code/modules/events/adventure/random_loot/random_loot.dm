//Need to think about this more. Saving here just in case however.

/* /datum/round_event_control/random_loot
	name = "Random Loot"
	track = EVENT_TRACK_MUNDANE
	typepath = /datum/round_event/random_loot
	weight = 5
	//max_occurrences = 5 //Not used currently. Not yet at least...
	min_players = 0
	earliest_start = 1 SECONDS

	tags = list(
		TAG_COMBAT,
		TAG_BATTLE,
	)

/datum/round_event/random_loot/start()
	. = ..()

	var/amt2spawn
	amt2spawn = rand(1,4)

	for(var/obj/structure/flora/bush/B in world)
		if(prob(1))
			new /obj/item/roguegem/random(B)
 */

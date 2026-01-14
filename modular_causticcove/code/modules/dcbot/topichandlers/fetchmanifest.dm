/datum/world_topic/fetchmanifest
	keyword = "fetchmanifest"
	log = FALSE

/datum/world_topic/fetchmanifest/Run(list/input)
	var/dat
	var/list/sortedActors = get_sorted_actors_list()
	for(var/X in sortedActors)
		dat += ("[sortedActors[X]["data"]["name"]]" + " as " + "[sortedActors[X]["data"]["rank"]]")
	return dat

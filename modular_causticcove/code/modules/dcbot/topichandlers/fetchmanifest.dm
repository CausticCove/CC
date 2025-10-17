/datum/world_topic/fetchmanifest
	keyword = "fetchmanifest"
	log = FALSE

/datum/world_topic/fetchmanifest/Run(list/input)
	var/dat
	for(var/X in GLOB.actors_list)
		dat += "[GLOB.actors_list[X]]"
	return dat

/datum/world_topic/fetchplayers
	keyword = "fetchplayers"
	log = FALSE

/datum/world_topic/fetchplayers/Run(list/input)
	var/dat = ""
	for (var/client/C in GLOB.clients)
		dat += "[C.ckey]\n"
	return dat

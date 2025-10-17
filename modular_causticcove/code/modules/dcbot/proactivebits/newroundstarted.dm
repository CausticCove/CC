/proc/newroundstarted()
	if(CONFIG_GET(flag/amia_enabled))
		var/constring =  amia_constring() + "newroundstarted"
		var/list/actors = list()
		for(var/X in GLOB.actors_list)
			actors += "[GLOB.actors_list[X]]"
		
		var/data = "?actors=" + url_encode(json_encode(list(actors))) + "&totalplayers=[GLOB.clients.len]"
		var/list/response = world.Export(constring + data)
		if(!islist(response))
			log_runtime("Can't reach AMIA")

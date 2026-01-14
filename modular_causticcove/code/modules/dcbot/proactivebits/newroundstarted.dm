/proc/newroundstarted()
	if(CONFIG_GET(flag/amia_enabled))
		var/constring =  amia_constring() + "newroundstarted"
		var/list/actors = list()
		var/list/sortedActors = get_sorted_actors_list()
		for(var/X in sortedActors)
			actors += ("[sortedActors[X]["data"]["name"]]" + " as " + "[sortedActors[X]["data"]["rank"]]")
		
		var/data = "?actors=" + url_encode(json_encode(list(actors))) + "&totalplayers=[GLOB.clients.len]"
		var/list/response = world.Export(constring + data)
		if(!islist(response))
			log_runtime("Can't reach AMIA")

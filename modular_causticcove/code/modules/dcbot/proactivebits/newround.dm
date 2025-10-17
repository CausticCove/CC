/proc/newround()
	if(CONFIG_GET(flag/amia_enabled))
		var/constring =  amia_constring() + "newround"
		var/list/response = world.Export(constring)
		if(!islist(response))
			log_runtime("Can't reach AMIA")



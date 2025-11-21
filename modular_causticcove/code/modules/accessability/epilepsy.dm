/client/proc/check_epilepsy()
	return prefs.epilepsy

/mob/proc/check_epilepsy()
	if(client)
		return client.check_epilepsy()
	return FALSE

/mob/living
	//oh no vore time
	var/voremode = FALSE

/mob/living/proc/toggle_vore_mode()
	if(cmode)
		return FALSE
	voremode = !voremode
	//init_vore()
	if(voremode)
		to_chat(src, span_info("I feel voracious."))
	else
		to_chat(src, span_info("I no longer feel voracious."))
	return TRUE

/mob/proc/disable_vore_mode()
	return

/mob/living/disable_vore_mode()
	voremode = FALSE

/mob/living/carbon/verb/toggle_vore_mode_verb()
	set name = "Toggle Vore Mode"
	set category = "Vore"
	toggle_vore_mode()
/datum/preferences
	var/datum/virtue/extravirtue = new /datum/virtue/none

/datum/preferences/proc/load_extra_virtue(S)
	var/extravirtue_type
	S["extravirtue"] >> extravirtue_type
	if(extravirtue_type)
		extravirtue = new extravirtue_type
	else
		extravirtue = new /datum/virtue/none

/datum/preferences/proc/save_extra_virtue(S)
	WRITE_FILE(S["extravirtue"], extravirtue.type)

/datum/preferences/proc/get_extra_virtue_htmlpick()
	return "<b>Extra Virtue:</b> <a href='?_src_=prefs;preference=extravirtue;task=input'>[extravirtue]</a><BR>"

/datum/preferences/proc/get_extra_virtue_input(mob/user)
	var/list/virtue_choices = list()
	for (var/path as anything in GLOB.virtues)
		var/datum/virtue/V = GLOB.virtues[path]
		if (!V.name)
			continue
		if (V.name == virtue.name || V.name == virtuetwo.name || V.name == extravirtue.name)
			continue
		if (istype(V, /datum/virtue/heretic) && !istype(selected_patron, /datum/patron/inhumen))
			continue
		if (istype(V, /datum/virtue/utility/noble) && (pref_species == /datum/species/construct/metal))		//Stops bypass of nobility for constructs.
			continue
		virtue_choices[V.name] = V
	var/result = tgui_input_list(user, "Select a virtue", "VIRTUES",virtue_choices)
	if (result)
		var/datum/virtue/virtue_chosen = virtue_choices[result]
		extravirtue = virtue_chosen
		to_chat(user, process_virtue_text(virtue_chosen))
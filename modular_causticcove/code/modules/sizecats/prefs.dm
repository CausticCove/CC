/datum/preferences
	var/datum/sizecat/sizecat

/datum/preferences/proc/_load_sizecat(S)
	var/datum/sizecat/sc
	S["sizecat"] >> sc
	if(!sc)
		sc = new /datum/sizecat/none
	sizecat = sc

/datum/preferences/proc/save_sizecat(S)
	WRITE_FILE(S["sizecat"], sizecat)

/datum/preferences/proc/select_sizecat(mob/user)
	var/list/sizecat_choices = list()
	for (var/path as anything in GLOB.sizecats)
		var/datum/sizecat/sc = GLOB.sizecats[path]
		sizecat_choices[sc.name] = sc
	var/result = tgui_input_list(user, "Select a size category", "Caustic Cove", sizecat_choices)
	if (result)
		var/datum/sizecat/sizecatchosen = sizecat_choices[result]
		sizecat = sizecatchosen
		to_chat(user, process_sizecat_text(sizecatchosen))

/datum/preferences/proc/process_sizecat_text(datum/sizecat/V)
	var/dat
	if(V.desc)
		dat += "<font size = 3>[span_purple(V.desc)]</font><br>"
	if(length(V.added_skills))
		dat += "<font color = '#a3e2ff'><font size = 3>This Virtue adds the following skills: <br>"
		for(var/list/L in V.added_skills)
			var/name
			if(ispath(L[1],/datum/skill))
				var/datum/skill/S = L[1]
				name = initial(S.name)
			dat += "["\Roman[L[2]]"] level[L[2] > 1 ? "s" : ""] of <b>[name]</b>[L[3] ? ", up to <b>[SSskills.level_names_plain[L[3]]]</b>" : ""] <br>"
		dat += "</font>"
	if(length(V.added_traits))
		dat += "<font color = '#a3ffe0'><font size = 3>This size category grants the following traits: <br>"
		for(var/TR in V.added_traits)
			dat += "[TR] — <font size = 2>[GLOB.roguetraits[TR]]</font><br>"
		dat += "</font>"
	if(length(V.added_stashed_items))
		dat += "<font color = '#eeffa3'><font size = 3>This size category adds the following items to your stash: <br>"
		for(var/I in V.added_stashed_items)
			dat += "<i>[I]</i> <br>"
		dat += "</font>"
	if(V.custom_text)
		dat += "<font color = '#ffffff'><font size = 3>This size category has this special behaviour: <br>"
		dat += "[V.custom_text]"
		dat += "</font>"
	return dat

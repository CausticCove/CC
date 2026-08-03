/datum/preferences
	var/datum/virtue/extravirtue = new /datum/virtue/none

/datum/preferences/proc/load_extra_virtue(S)
	var/extravirtue_type
	S["extravirtue"] >> extravirtue_type
	var/error_check = FALSE
	var/error_found = FALSE
	if (istype(extravirtue_type, /datum/virtue))
		extravirtue = extravirtue_type
		error_check = TRUE
	else if(ispath(extravirtue_type, /datum/virtue))
		extravirtue = new extravirtue_type
	else
		extravirtue = new /datum/virtue/none

	if(error_check)
		//Future-proofing sanity checks in case virtues get adjusted later. We do a full reset if we find any discrepancies.
		var/datum/virtue/sane_virtue = new extravirtue.type
		if(extravirtue.name != sane_virtue.name)	//We should keep the names & descs updated across saves, too
			extravirtue.name = sane_virtue.name

		if(extravirtue.desc != sane_virtue.desc)	//Not errors warranting a full reset, in theory, anyway.
			extravirtue.desc = sane_virtue.desc

		if(length(extravirtue.picked_choices) > sane_virtue.max_choices)
			error_found = TRUE

		if(sane_virtue.max_choices != extravirtue.max_choices)
			error_found = TRUE

		if(length(extravirtue.extra_choices) != length(sane_virtue.extra_choices))
			error_found = TRUE

		if(!error_found)
			for(var/choice in extravirtue.extra_choices)
				if(!(choice in sane_virtue.extra_choices))
					error_found = TRUE
					break

			var/total_ours = 0
			var/total_sane = 0

			for(var/cost in extravirtue.choice_costs)
				total_ours += cost
			for(var/cost in sane_virtue.choice_costs)
				total_sane += cost

			if(total_ours != total_sane)
				error_found = TRUE

		if(error_found)
			qdel(extravirtue)
			extravirtue = sane_virtue
		else
			qdel(sane_virtue)
			extravirtue.on_load()

/datum/preferences/proc/save_extra_virtue(S)
	WRITE_FILE(S["extravirtue"], extravirtue)

/datum/preferences/proc/get_extra_virtue_htmlpick()
	var/virtue_html
	var/tricost_virt = 0
	if(length(extravirtue.extra_choices) && length(extravirtue.picked_choices))
		for(var/i in 1 to length(extravirtue.picked_choices))
			tricost_virt += extravirtue.choice_costs[i]
	virtue_html += "<b>Extra Virtue[tricost_virt ? " <font color = '#d1c8bb'>([tricost_virt] TRI)</font>" : ""]:</b> <a href='?_src_=prefs;preference=extravirtue;task=input'><b><font color = '#cfa971'>[extravirtue]</font></b></a><BR>"
	if(length(extravirtue.picked_choices))
		for(var/i = 1 to extravirtue.picked_choices.len)
			var/choice = extravirtue.picked_choices[i]
			var/tooltip
			var/choice_string = choice
			var/dat_html = "   <a href='?_src_=prefs;preference=subextravirtue;task=remove;index=[i]'><i>[choice_string]</i></a>"
			if(LAZYACCESS(extravirtue.choice_tooltips, choice))
				tooltip = TRUE
			var/tooltip_html = tooltip ? "<a href='?_src_=prefs;preference=subextravirtue;task=tooltip;tooltip=[choice]'>(?)</a><br>" : "<br>"
			virtue_html += "[dat_html][tooltip_html]"
	if(length(extravirtue.picked_choices) < extravirtue.max_choices)
		virtue_html += "   <a href='?_src_=prefs;preference=subextravirtue;task=input'>[(extravirtue.choice_costs[(extravirtue.picked_choices.len + 1)] <= 0) ? "<font color = '#a08357'>" : ""]Pick Bonus[(extravirtue.choice_costs[(extravirtue.picked_choices.len + 1)] <= 0) ? "</font>" : ""] [(extravirtue.choice_costs[(extravirtue.picked_choices.len + 1)] > 0) ? "([extravirtue.choice_costs[(extravirtue.picked_choices.len + 1)]] TRI)" : ""] </a><br>"

	return virtue_html

/datum/preferences/proc/get_extra_virtue_input(mob/user)
	var/list/virtue_choices = list()
	for (var/path as anything in GLOB.virtues)
		var/datum/virtue/V = GLOB.virtues[path]
		if (!V.name)
			continue
		if ((V.name == virtue.name || V.name == virtuetwo.name || V.name == extravirtue.name) && !istype(V, /datum/virtue/none))
			if(!V.stackable)
				continue
		if (istype(V, /datum/virtue/origin))
			continue
		if(V.unlisted)
			continue
		if (istype(V, /datum/virtue/heretic) && !istype(selected_patron, /datum/patron/inhumen))
			continue
		if (V.restricted == TRUE)
			if((pref_species.type in V.races))
				continue
		if(V.virtuous_only && !statpack.virtuous)
			continue
		virtue_choices[V.name] = V
	virtue_choices = sort_list(virtue_choices)
	var/result = tgui_input_list(user, "What strength shall you wield?", "VIRTUES",virtue_choices)

	if (result)
		var/datum/virtue/virtue_chosen = virtue_choices[result]
		extravirtue = new virtue_chosen.type
		to_chat(user, process_virtue_text(virtue_chosen))
		if(!istype(virtue, /datum/virtue/combat/second_chance) && !istype(virtuetwo, /datum/virtue/combat/second_chance) && !istype(extravirtue, /datum/virtue/combat/second_chance))
			if(skin_tone == SKIN_COLOR_ROT)
				var/new_tone = random_skin_tone()
				skin_tone = new_tone
				features["mcolor"] = sanitize_hexcolor(new_tone)
				try_update_mutant_colors()

//Overriding the Titles selection to return the old method of selecting it from the Global List, instead of the toggle flip it is by default.
/datum/preferences/handle_title_pref_selection(mob/user)
	var/old = titles_pref
	var/titles_input = tgui_input_list(user, "Choose your character's titles", "TITLES", GLOB.titles_list)
	if(titles_input)
		titles_pref = titles_input
		verbose_pref_log_change(user, "notice", "Titles", old, titles_pref)

//Adding in the Copying and Deleting of Vore Prefs along with the character slot.
/datum/preferences/do_copy_slot(savefile/S, from_index, to_index)
	. = ..()
	if(parent.prefs_vr)
		parent.prefs_vr.copy_vore(from_index, to_index)

/datum/preferences/do_delete_slot(savefile/S, murder_index)
	. = ..()
	if(parent.prefs_vr)
		parent.prefs_vr.delete_vore(murder_index)

//Add in our Extra Virtue!
/datum/preferences/get_all_virtues()
	var/list/data = ..()
	data += extravirtue
	return data

/datum/preferences/set_virtue_by_index(index, datum/virtue/new_virtue)
	if(index == 3)
		QDEL_NULL(extravirtue)
		extravirtue = new_virtue
		return TRUE
	return ..()

/datum/preferences/get_virtue_slot_names()
	var/list/data = ..()
	data += "Extra Virtue"
	return data

//Add in Pliant and Manor stuffs to our Character Creation Menu!
// Act
/datum/preferences/ui_act_character_creator(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	var/mob/user = ui.user
	switch(action)
		//Class Panel
		// -- Pliant Settings
		if("open_pliant")
			tat_build.ui_interact(user)
			return CHARACTER_ACT_DATA_UPDATE //Maybe this isn't really needed, cause it's only opening the extra menu. But it even does this for Familiar Prefs so... Guess I'll keep to it?

		//Identity Panel
		// -- Manors
		if("manor_name")  //CC + TA EDIT START
			var/new_name = tgui_input_text(user, "Choose a name for your manor (only matters for Keep-based nobility roles):", "MANOR NAME", encode = FALSE)
			if(new_name)
				new_name = reject_bad_name(new_name)
				if(new_name)
					manor_name = new_name
				else
					to_chat(user, "<font color='red'>Invalid manor name. It should be at least 2 and at most [MAX_NAME_LEN] characters long. It may only contain the characters A-Z, a-z, -, ', . and ,.</font>")
			return CHARACTER_ACT_DATA_UPDATE
		if("manor_type")
			var/list/manor_type_choices = list(
				"Manor" = "manor",
				"Hunter Mansion" = "hunter_mansion",
				"Village" = "village",
				"Fisher Hamlet" = "fisher_hamlet",
				"Mining Settlement" = "mining_settlement"
			)
			var/new_manor_type = tgui_input_list(user, "Choose the type of manor you'd like to manage:", "MANOR TYPE", manor_type_choices, get_manor_type_display_name(manor_type))
			if(new_manor_type)
				manor_type = manor_type_choices[new_manor_type]
			return CHARACTER_ACT_DATA_UPDATE

		// -- Directory and RP Guidance
		if("show_in_directory")
			show_in_directory = !show_in_directory
			return CHARACTER_ACT_DATA_UPDATE
		if("directory_tag")
			var/new_choice = tgui_input_list(user, "Pick a new Vore tag for the character directory", "Character Tag", GLOB.char_directory_tags)
			if(new_choice)
				directory_tag = new_choice
			return CHARACTER_ACT_DATA_UPDATE
		if("directory_erptag")
			var/new_choice = tgui_input_list(user, "Pick a new ERP tag for the character directory", "Character ERP Tag", GLOB.char_directory_erptags)
			if(new_choice)
				directory_erptag = new_choice
			return CHARACTER_ACT_DATA_UPDATE
		if("directory_gendertag")
			var/new_choice = tgui_input_list(user, "Pick a new Gender tag for the character directory. This is YOUR gender, not what you prefer.", "Character Gender Tag", GLOB.char_directory_gendertags)
			if(new_choice)
				directory_gendertag = new_choice
			return CHARACTER_ACT_DATA_UPDATE
		if("directory_sexualitytag")
			var/new_choice = tgui_input_list(user, "Pick a new Sexuality/Orientation tag for the character directory", "Character Sexuality/Orientation Tag", GLOB.char_directory_sexualitytags)
			if(new_choice)
				directory_sexualitytag = new_choice
			return CHARACTER_ACT_DATA_UPDATE
		if("directory_ad")
			var/new_dir_ad = tgui_input_text(user, "Change your character ad", "Character Ad", directory_ad, multiline = TRUE,  encode = FALSE, bigmodal = TRUE)
			if(!isnull(new_dir_ad))
				set_character_ad_value(ishuman(user) ? user : null, src, user?.mind, new_dir_ad)
			return CHARACTER_ACT_DATA_UPDATE
		if("rp_guidance")
			var/list/choices = list("Mechanics Willing & Hunted Trait", "Mechanics Willing", "Alternatives Preferred", "Neutral")
			var/choice = tgui_input_list(user, "Choose your Roleplay Guidance", "RP Guidance", choices)

			to_chat(user, span_notice("Roleplay Guidance is intended to allow players to more easily indicate their desires for Mechanical Conflict, or not. It is expected to only be used to better find other players interested in mechanical antagonism. \
										It does not allow you to attack anyone without proper escalation, or to avoid combat altogether, the server rules still apply. Failure to follow them may be met with punishment. \
										\n If a player Discourages Combat, it does not mean they are immune. Their actions can and will still have consequences IC, if you or anyone else so deems it fitting. \
										If someone has it set to Discouraged and repeatedly escalates situations with their actions or otherwise misuses it, please feel free to adminhelp to let us know, and we can chat with them."))

			switch(choice)
				if("Neutral")
					to_chat(user, span_warn("I have no strong feelings, one way or the other."))
					rp_guidance = 3 //The not opted in option and the default.

				if("Alternatives Preferred")
					to_chat(user, span_green("Conflict Discouraged - Other Players will see that you do not prefer mechanical conflict. This does not mean you are immune to \
											combat altogether, your actions still can have consequences. This option means that you are less likely to enjoy Mechanical Conflict, and if someone else is searching for a fight, they might be better off with someone else. \
											It is still partially your duty to de-escalate situations when desired, or to attempt to solve situations through roleplayed means instead. Try to provide other avenues of resolution! \
											\nOnce again, this does not mean you are immune to mechanical combat. Your actions still have consequences if someone so deems it fitting, and respecting the escalation rules."))
					rp_guidance = FALSE
				if("Mechanics Willing")
					to_chat(user, span_red("Conflict Encouraged - Other Players will see that you do enjoy engaging in mechanical conflict. It does not mean others are free to attack you without proper escalation, \
											and for you to attack others without it as well. This option means you enjoy partaking in Mechanical Conflict as part of Roleplay, and those who similarly are looking for a fight may find one with you. \
											You are still free to escalate or de-escalate situations as you wish, any situation can play out depending on how you interact with it!\
											\nOnce again, this does not mean you are forced to a mechanical resolution, only that you wish for others to know you are welcoming it. It is still expected that all parties will follow proper escalation rules."))
					rp_guidance = TRUE
				if("Mechanics Willing & Hunted Trait")
					to_chat(user, span_purple("Conflict Encouraged + Hunted - Other Players will see that you do enjoy engaging in mechanical conflict. It does not mean others are free to attack you without proper escalation, \
											and for you to attack others without it as well. This option means you enjoy partaking in Mechanical Conflict as part of Roleplay, and those who similarly are looking for a fight may find one with you. \
											You are still free to escalate or de-escalate situations as you wish, any situation can play out depending on how you interact with it!\
											\nOnce again, this does not mean you are forced to a mechanical resolution, only that you wish for others to know you are welcoming it. It is still expected that all parties will follow proper escalation rules. \
											\n\
											\nSelecting this option, you also opt into the Hunted list! Certain antags may use abilities to seek you out directly. The Hunters still are beholden to the Rules of Escalation, and so do you if you happen to stumble upon them first."))
					rp_guidance = 2 //Wildcard option to become hunted as we no longer have the Hunted flaw/vice.

			if(!isnewplayer(user))
				log_admin("[user.ckey] has updated their Roleplay Guidance preference to [choice] whilst in-game.")
			return CHARACTER_ACT_DATA_UPDATE

// Data
/datum/preferences/ui_data_character_creator_identity(mob/user)
	var/list/data = ..()

	data += list(
		"manor_name" = (!manor_name || manor_name == "") ? "Unknown Manor" : manor_name,
		"manor_type" = get_manor_type_display_name(manor_type),
	)

	data += list(
		"show_in_directory" = show_in_directory,
		"directory_tag" = directory_tag,
		"directory_erptag" = directory_erptag,
		"directory_gendertag" = directory_gendertag,
		"directory_sexualitytag" = directory_sexualitytag,
		"rp_guidance" = rp_guidance,
	)
	return data

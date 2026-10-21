/datum/preferences
	var/show_in_directory = 1	//Show in Character Directory
	var/directory_tag = "Unset" //Sorting tag to use in character directory <- Vore specific prefs
	var/directory_erptag = "Unset"	//ditto, but for non-vore scenes
	var/directory_gendertag = "Unset" // Gender stuff!
	var/directory_sexualitytag = "Unset" // Sexuality!
	var/directory_ad = ""		//Advertisement stuff to show in character directory.

	var/vore_health_bars = TRUE
	var/digestion_noises = TRUE
	var/eating_noises = TRUE
	var/belch_noises = TRUE
	///If they are currently in the process of swapping slots, don't let them open 999 windows for it and get confused
	//var/selecting_slots = FALSE //Was only used in one place to load belly info, in living_vr.dm

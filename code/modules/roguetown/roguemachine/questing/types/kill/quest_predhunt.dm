// EVIL VORNY QUEST
/datum/quest/kill/predhunt
	quest_type = QUEST_PREDHUNT
	mob_types_to_spawn = QUEST_PREDATOR_HUNT_LIST
	count_min = 3
	count_max = 4

/datum/quest/kill/predhunt/get_title()
	if(title)
		return title
	return "Stop a group of [pick("maneater", "devourerer", "gourmand", "creature")]"

/datum/quest/kill/predhunt/get_objective_text()
	return "Eliminate [progress_required] [initial(target_mob_type.name)]."

/datum/quest/kill/raid/get_location_text()
	return target_spawn_area ? "Reported raid in [target_spawn_area] region." : "Reported infestations in Azuria region."

/datum/quest/kill/predhunt/generate(obj/effect/landmark/quest_spawner/landmark)
	..()
	if(!landmark)
		return FALSE
	spawn_kill_mobs(landmark)	

	return TRUE

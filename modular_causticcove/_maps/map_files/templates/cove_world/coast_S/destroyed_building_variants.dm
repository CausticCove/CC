/obj/effect/landmark/map_load_mark/variant/coast_S/destroyed_building
	name = "Destroyed Building"
	templates = list("destroyed_building_default", "destroyed_building_hoblin_takeover")
	
/datum/map_template/destroyed_building
	name = "destroyed_building_default"
	width = 13
	height = 11
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/coast_S/variants/destroyed_building/destroyed_building_default.dmm"

//Features a lot of Hoblins, but skeletons on a nearby map can and will attack when their AI is triggered due to the differing factions. 
//Sometimes they may fight, sometimes they may not. If they do, this results in some emergent interaction and lowered difficulty.
/datum/map_template/destroyed_building/hoblin_takeover
	name = "destroyed_building_hoblin_takeover"
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/coast_S/variants/destroyed_building/destroyed_building_hoblin_takeover.dmm"
 

/obj/effect/landmark/map_load_mark/variant/forest_grove_S/riverside_cliff_building
	name = "Riverside Cliff Building"
	templates = list("riverside_cliff_building_default", "riverside_cliff_building_difficult")
	
/datum/map_template/riverside_cliff_building
	name = "riverside_cliff_building_default"
	width = 21
	height = 18
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_S/variants/riverside_cliffs_building/variants/riverside_cliff_building_default.dmm"

//Higher tier mobs, slightly better rewards, more complete structure with more traps. Some extra info:
//The other skeletons on this map have been VV edited to be apart of the "lich" faction. The lick skeleton at the end on the coffin is technically a boss. (They attack eachother otherwise.)
//The lich skeleton's real_name was edited to be "Undead Sentinel".
/datum/map_template/riverside_cliff_building/difficult
	name = "riverside_cliff_building_difficult"
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_S/variants/riverside_cliffs_building/variants/riverside_cliff_building_difficult.dmm"

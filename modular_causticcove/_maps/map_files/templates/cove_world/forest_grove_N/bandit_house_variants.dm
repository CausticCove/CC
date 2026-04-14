//Unsure what variants to add here just yet.
/obj/effect/landmark/map_load_mark/variant/forest_grove_N/bandit_house
	name = "Bandit House"
	templates = list("bandit_house_default", "bandit_house_drug_ring")
	
/datum/map_template/bandit_house
	name = "bandit_house_default"
	width = 13
	height = 6
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_N/variants/bandit_house/bandit_house_default.dmm"

//Removes the treasure chest and instead players can now find... DRUGS! And a lot of angry thieves/bandits, whatever or whoever they are. They're scary in numbers... Stabby stabby!
// Idea is that someone can find it, enter it, stumble back out and climb up the ladder so that enemies don't path to them. 
// Then, they would call for help from authorities, and have them bust the drug ring!
/datum/map_template/bandit_house/drug_ring
	name = "bandit_house_drug_ring"
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_N/variants/bandit_house/bandit_house_drug_ring.dmm"

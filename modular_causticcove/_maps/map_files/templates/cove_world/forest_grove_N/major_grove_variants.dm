/obj/effect/landmark/map_load_mark/variant/forest_grove_N/major_grove
	name = "Bandit House"
	templates = list("major_grove_default", "major_grove_courtyard")
	
/datum/map_template/major_grove
	name = "major_grove_default"
	width = 23
	height = 21 //X102 Y288
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_N/variants/major_grove/major_grove_default.dmm"

//Very Calm, Very Peaceful, Shut off from the rest of the world, designed to be a nice place. There is a back entrance/exit if things go awry, however...
//Also uses a bookcase to hide a very ugly sprite issue with the carpet I didn't wanna fuck with.

// Side Note; Not an amazing mapper. This definitely needs improvement to the scenery and whatnot. So do edit this as you see fit! Remove this comment once this map is epic B)
/datum/map_template/major_grove/courtyard
	name = "major_grove_courtyard"
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_N/variants/major_grove/major_grove_courtyard.dmm"

//Graveyard! Hosts a lot of undead here as opposed to that pretty courtyard. Good spot for fighting a lot of weak unarmed skeletons and digging up old graves for those treasure hunters.
//Who doesn't like a horde of enemies on the occasion? 
//Only like 2-3 skeletons here may actually be armed and strong. This site was desecrated by Zizo...
//Skeletons will group up at the gate when you first encounter this location. So be prepared! Spells can and should 100% be cast through the cemetary bars, and it's intended that way.
//The gate here has only 500 integrity as opposed to 5000 HP, meaning mobs can and will break it if and when given the chance to, hence the desired intention of casting throguh the cemetary bars.
/datum/map_template/major_grove/graveyard
	name = "major_grove_graveyard"
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_N/variants/major_grove/major_grove_graveyard.dmm"

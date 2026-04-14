/obj/effect/landmark/map_load_mark/variant/coast_S/ancient_church
	name = "Ancient Church"
	templates = list("ancient_church_default", "ancient_church_extended")
	
/datum/map_template/ancient_church
	name = "ancient_church_default"
	width = 14
	height = 12
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/coast_S/variants/ancient_church/ancient_church_default.dmm"

//Extended a little further to allow ladder travel down, far far down.
//This place also looks a little... Off. On purpose. Just like the original. Weird mapping and structural design. Feels more like a 'front' than anything, especially with how deep
//	the ladder system goes... More difficult skeletons as compensation for the ability to go further down down down.
/datum/map_template/ancient_church/extended
	name = "ancient_church_extended"
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/coast_S/variants/ancient_church/ancient_church_extended.dmm"
 

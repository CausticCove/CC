//DO NOT ADD THIS TO THE .DME, THIS IS AN EXAMPLE FILE MEANT TO EXPLAIN HOW THIS WORKS AND POINTERS/TIPS FOR MAPPING.
//THIS FILE IS AN EXAMPLE FROM abandoned_buildings.dm LOCATED AT modular_causticcove\_maps\map_files\templates\cove_world\forest_grove\abandoned_buildings.dm
//IT IS HIGHLY SUGGESTED TO VIEW abandoned_buildings.dm AFTER READING THROUGH THIS EXAMPLE FILE.
//IF YOU HAVE EXPERIENCE WITH SDMM AND MAP TEMPLATES, PLEASE JUST VIEW abandoned_buildings.dm FOR THE UNEDITED VERSION.

//Maps will not generate with their associated generators, I.E. Random Plants or Trees. It's highly suggested to add your own tree's and foliage if the location calls for it.
// Make sure to also try and reduce the usage of extra space/border tiles, not only for the first issue above listed but also for making it easier for mapping.

//When creating a new location on the map that is missing template variants, make sure to include the associated areas as well by hitting CTR+1, if you do NOT see the areas, 
// you will NOT copy them. They must be visible to copy them.
// When making a new variant, you will not need to do this. Simply copy the default map file, rename it, and work from there.
// Maps also respect the Z-levels. If you have a map that shouldn't edit the lowest Z-level on your map file, only use the Z-levels you need to utilize for your changes to avoid overlapping
// 	with any dungeons that may be below, or above, the location that you're adding variants for.

//This datum path simply holds information to be used with the map_load_mark object. You must defin the width, and height. You will only need to change the name. 
//	Keep the names simple and easy to copy. Example provided below. Treat the names as if they are also ID's for the map templates.
/datum/map_template/skeleton_taverninn
	name = "tavern_inn_default"

	//Defaults to the name of the template if null/empty. Please stick to just editing the name and not touching the ID unless you know what you're doing.
	//id = "tavern_inn_default"

	// Utilizing the GRAB tool, or by pressing 3, (The BOX icon on SDMM), you can click and drag an area selection on a map.
	//  When locating the size and height of your selection, at the bottom left you can see 6 coordinates. The first two on the far left are your cursors current coordinates. 
	//   The second set in the middle is the box's current Width and Height. This is where you want to grab the WIDTH and HEIGHT.
	//	  The third box is your selection's starting coordinates, and your selection's ending coordinates. You can ignore these.
	//	   Once you locate your Width and Height, NEVER CHANGE THIS FOR ANY SUBSEQUENT VARIANTS. This is only for the default variant. Every other map should be the same Width and Height.
	width = 17
	height = 13

	//The path to the map itself. You must define this or it will not load a map and runtime. It will also leave an empty space in the world. DO NOT leave this empty.
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_S/variants/skeleton_tavern/skeleton_tavern_default.dmm"

//This datum path is a CHILD of the default path. You will not need to define the width, or height here, as every variant should involve/include the same width/height.
//All you will need to do is ensure you change the name and add the variant's typepath.

					// | Default Path   |  - This is the variant's type path.
					// V 				V
/datum/map_template/skeleton_taverninn/drunken_brawl

	//Make sure when making a new child variant to also change the name of it as well. Maps with the same name's / ID's will override eachother.
	name = "tavern_inn_drunken_brawl"
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_S/variants/skeleton_tavern/skeleton_tavern_default.dmm"

//This is what is placed on the map itself to load the map in.
/obj/effect/landmark/map_load_mark/variant/forest_grove_S/skeleton_tavern_inn
	name = "Skeleton Tavern / Inn"

	//These load markers will contain a list of possible maps to randomly choose from. You must input a map ID or Name for each template you create.
	//	ID's will default to using the name of the map if none is provided.
	//	All maps have even odds, remember this when creating your maps and balance them accordingly.
	templates = list("tavern_inn_default", "tavern_inn_drunken_brawl")

//File Path layouts involve the main map's name (cove_world at the time of writing), the area the location resides in along with cardinal direction 
//	(for this document, the forest grove just outside of town), the associated templates to the grove that holds the .dm's for each variant type, and then the map folder itself for the variant.

// Example: A location in the grove at X118, Y268, a mana fountain exists here. You would make a file path like so:

// cove_world\forest_grove_SW\variants\mana_fountain

// the "/variants/" directory will hold the .dm's for each structure or location, the "/mana_fountain/" directory will contain the SDMM files/maps themselves.

// When adding a new location, be sure to also include the .dm to the game's DME file. These will always be near the very bottom of the .dme within our modular_causticcove filepath.

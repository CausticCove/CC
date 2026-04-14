/obj/effect/landmark/map_load_mark/variant/forest_grove_S/river_bridge
	name = "River Bridge"
	templates = list("river_bridge_default", "river_bridge_tall", "river_bridge_gave_up", "river_bridge_awkward")
	
/datum/map_template/river_bridge
	name = "river_bridge_default"
	width = 4
	height = 11
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_S/variants/river_bridge/river_bridge_default.dmm"

//Taller variant. Goes up a Z-Level briefly, and goes back down. Unironically very good at preventing a good majority of hostile mobs from crossing.
//Also change of scenery! How nice! It's even FULLY BUILT! This is the best type of bridge that can appear at the river crossing!!!
/datum/map_template/river_bridge/tall
	name = "river_bridge_tall"
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_S/variants/river_bridge/river_bridge_tall.dmm"

//Whoever was building this just straight up gave up before even reaching the other side. What a dick...
//Can't leap across. You will need to build or take the alternate bridge that has a garunteed path to take.
//Good spot for towners to build like carpenter to finish the gap and add their own flair to the bridge.
/datum/map_template/river_bridge/gave_up
	name = "river_bridge_gave_up"
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_S/variants/river_bridge/river_bridge_gave_up.dmm"

//This bridge... Bends... Like... In a weird way... It's awkward to get across it. But it's fully built at the start of the round.
//Xylix probably thought this would be a funny joke...
//Fix this up and make it look right!
/datum/map_template/river_bridge/awkward
	name = "river_bridge_awkward"
	mappath = "modular_causticcove/_maps/map_files/templates/cove_world/forest_grove_S/variants/river_bridge/river_bridge_awkward.dmm"

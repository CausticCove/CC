//Find unconscious bodies to execute them with a headstomp.
/datum/ai_planning_subtree/find_unconscious_bodies
	var/vision_range = 9
	var/datum/ai_behavior/find_and_set/unconscious_person/behavior = /datum/ai_behavior/find_and_set/unconscious_person
	var/unconscious_key = BB_BASIC_MOB_UNCONSCIOUS_TARGET

/datum/ai_planning_subtree/find_unconscious_bodies/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()

	var/atom/target = controller.blackboard[unconscious_key]
	if(!QDELETED(target))
		// Busy with something
		return

	controller.queue_behavior(behavior, unconscious_key, controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET], vision_range)

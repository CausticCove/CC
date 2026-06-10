/datum/ai_behavior/find_and_set/unconscious_person
	vision_range = 12

/datum/ai_behavior/find_and_set/unconscious_person/atom_allowed(atom/movable/checking, locate_path, atom/pawn)
	if(checking == pawn)
		return FALSE
	if(!ishuman(checking))
		return FALSE
	var/mob/living/carbon/human/human = checking
	if(!IS_DEAD_OR_INCAP(human) || !human.mind) //Basically conscious person but we check for if they are dead or incap.
		return FALSE
	return TRUE

/datum/ai_behavior/find_and_set/unconscious_person/search_tactic(datum/ai_controller/controller, locate_path, search_range)
	var/list/customers = list()
	for(var/mob/living/carbon/human/target in oview(search_range, controller.pawn))
		if(!IS_DEAD_OR_INCAP(target) || !target.mind) //Basically conscious person but we check for if they are dead or incap.
			continue
		customers += target
	if(customers.len)
		return pick(customers)
	return null

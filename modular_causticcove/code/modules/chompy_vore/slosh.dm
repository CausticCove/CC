/datum/element/slosh
	element_flags = ELEMENT_DETACH_ON_HOST_DESTROY|ELEMENT_BESPOKE
	var/vore_organs_reagents

/datum/element/slosh/Attach(datum/target)
	. = ..()
	if(!isliving(target))
		return ELEMENT_INCOMPATIBLE

	RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(handle_sloshstep), override = TRUE)
	vore_organs_reagents = list()
	return

/datum/element/slosh/Detach(datum/source)
	UnregisterSignal(source, COMSIG_MOVABLE_MOVED)
	return ..()

/datum/element/slosh/proc/handle_sloshstep(mob/living/source)
	SIGNAL_HANDLER

	if(ishuman(source))
		var/mob/living/carbon/human/source_human = source
		if(source_human.m_intent == MOVE_INTENT_WALK && prob(5))
			return
		if(source_human.m_intent == MOVE_INTENT_RUN && prob(50))
			return
		choose_vorefootstep(source)


/datum/element/slosh/proc/choose_vorefootstep(mob/living/source)
	//if(step_count++ >= 5)	
	var/vore_footstep_volume = 0
	var/vore_footstep_chance = 0
	vore_organs_reagents = list()
	var/total_volume = 0
	for(var/obj/belly/B in source.vore_organs)
		if(B.vorefootsteps_sounds)
			total_volume += B.reagents.total_volume
		/*vore_organs_reagents += total_volume
		if(B.show_liquids && B.vorefootsteps_sounds && highest_vol < total_volume)
			highest_vol = total_volume
	*/
	if(total_volume < 20)
		vore_footstep_volume = 0
		vore_footstep_chance = 0
	else
		vore_footstep_volume = min(total_volume / 3, 200)
		vore_footstep_chance = total_volume / 3
	if(!vore_footstep_volume || !vore_footstep_chance)
		return
	if(prob(vore_footstep_chance))
		handle_vorefootstep(source, vore_footstep_volume)

/datum/element/slosh/proc/handle_vorefootstep(mob/living/source, volume)
	var/S = pick(GLOB.slosh)
	if(!S) return



	if(source.buckled || source.lying || source.throwing)
		return

	playsound(source.loc, S, volume, FALSE, preference = "digestion_noises")
	return

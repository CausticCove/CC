//OV FILE
/mob/living/verb/vore_player()
	set name = "Vore Player"
	set desc = "Attempt to eat an adjacent player."
	set category = "Vore"

	if(stat)
		to_chat(src,span_warning("You can't do that right now."))
		return
	if(restrained(FALSE))
		to_chat(src,span_warning("You can't do that while restrained."))
		return
	if(IsSleeping())
		to_chat(src,span_warning("You can't do that while sleeping."))
		return
	if(!isturf(loc))
		to_chat(src,span_warning("You need to be on the open ground to do that."))
		return

	var/list/potential_targets = list()

	for(var/mob/living/L in view(1))
		if(L == src)	//Don't eat yourself
			continue
		if(!isliving(L))	//Only target living
			continue
		if(!vore_pref_compat(src,L))
			continue
		potential_targets |= L

	// CC does not have micro content yet
	// for(var/thing in contents)
	// 	if(!istype(thing,/obj/item/micro))	//U can also eat players in your hand
	// 		continue
	// 	var/obj/item/micro/M = thing
	// 	if(M.held_mob == src)
	// 		continue
	// 	if(!vore_pref_compat(src,M.held_mob))
	// 		continue

	// 	potential_targets |= M.held_mob

	if(potential_targets.len <= 0)
		to_chat(src, span_warning("There are no valid targets in range."))
		return

	var/mob/living/choice = tgui_input_list(src,"Who would you like to eat?","Vore Target",potential_targets)

	if(!choice)
		return
	if(get_dist(get_turf(src),get_turf(choice)) > 1)
		to_chat(src, span_warn("\The [choice] is too far away."))
		return

	return feed_grabbed_to_self(src,choice)

/proc/vore_pref_compat(var/mob/living/pred,var/mob/living/prey,var/reject_combat = TRUE)	//The other vore check sends an admin log to complain about you eating people against their prefs, so I made this one quieter since it only happens when gathering a list of compatible targets
	if(!pred || !prey)
		return FALSE
	if(reject_combat)	//We probably shouldn't target people who are trying to fight you unless you want that.
		if(prey.cmode)
			return FALSE

	if(!prey.devourable)
		return FALSE

	return TRUE

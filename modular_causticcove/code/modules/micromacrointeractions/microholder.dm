/obj/item/micro
	name = "micro"
	desc = "A person? A toy? A snack? All three! They fit into your hand, how convinient!"
	flags_1 = HEAR_1
	var/mob/living/held_mob
	var/matrix/original_transform
	var/original_vis_flags = NONE
	
/obj/item/micro/Initialize(mapload, mob/held)
	. = ..()
	held.forceMove(src)
	START_PROCESSING(SSobj, src)

/obj/item/micro/examine(mob/user)
	. = list()
	for(var/mob/living/M in contents)
		. += M.examine(user)

/obj/item/micro/dropped(mob/user, silent)
	if (held_mob?.loc != src || isturf(loc))
		var/held = held_mob
		dump_mob()
		held_mob = held
	. = ..()

/obj/item/micro/proc/dump_mob()
	if(!held_mob)
		return
	if (held_mob.loc == src || isnull(held_mob.loc))
		held_mob.set_resting(FALSE,FALSE)
		held_mob.transform = original_transform
		held_mob.update_transform()
		held_mob.forceMove(get_turf(src))
		held_mob = null
		process()

/obj/item/micro/process()
	if(held_mob?.loc != src || isturf(loc))
		qdel(src)
	
/obj/item/micro/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(held_mob)
		dump_mob()
	if(ismob(loc))
		var/mob/M = loc
		M.forceMove(get_turf(src))
	return ..()

/obj/item/micro/container_resist(mob/living/held)
	if(ismob(loc))
		var/mob/M = loc
		var/wrestling_diff = 0
		var/resist_chance = 55
		var/combat_modifier = 0.45 // -30 and -25 from being in combat mode diff and aggro grab, apply those immidietly
		if(held_mob.mind)
			wrestling_diff += (held_mob.get_skill_level(/datum/skill/combat/wrestling)) //NPCs don't use this
		if(M.mind)
			wrestling_diff -= (M.get_skill_level(/datum/skill/combat/wrestling))
		resist_chance += max((wrestling_diff * 10), -20)
		resist_chance *= combat_modifier
		resist_chance = clamp(resist_chance, 5, 95)
		if(!prob(resist_chance))
			to_chat(M, span_warning("[held] uselessly wiggles against my grip!"))
			to_chat(held, span_warning("You struggle against [M]'s grip!"))
		else
			dump_mob()
			to_chat(M, span_warning("\The [held] wriggles out of your grip!"))
			to_chat(held, span_warning("You wiggle out of [M]'s grip!"))
	else if(isitem(loc))
		to_chat(held, span_warning("You struggle free of [loc]."))
		dump_mob()
	
	process()

/obj/item/micro/Entered(mob/held, atom/OldLoc)
	. = ..()
	if(ismob(held))
		held_mob = held
		original_vis_flags = held.vis_flags
		held.vis_flags = VIS_INHERIT_ID|VIS_INHERIT_LAYER|VIS_INHERIT_PLANE
		vis_contents += held
		name = held.name
		original_transform = held.transform
		held.transform = null
		held.transform *= 0.7

/obj/item/micro/Exited(mob/held, atom/newLoc)
	var/mob/living/current_held = held_mob

	//I cannot do anything about spatials getting removed because that would be touching azure code in inappropriate places, so here is the shitcode we are doing

	//First we save the spatials that are about to be removed
	var/list/nested_locs = get_nested_locs(src)
	var/list/preremovespatials = list()
	for(var/channel in important_recursive_contents)
		for(var/atom/movable/location as anything in nested_locs)
			preremovespatials[location] = list()
			switch(channel)
				if(RECURSIVE_CONTENTS_CLIENT_MOBS, RECURSIVE_CONTENTS_HEARING_SENSITIVE)
					preremovespatials[location] += channel

	//We do the holder removal thing as per usual
	if(held == current_held) //<-- not sure what is the purpose of this single line and the indent that it makes but Lira probably knows??? Not touching it.
		current_held.set_resting(FALSE,FALSE)
		current_held.transform = original_transform
		current_held.update_transform()
		current_held.vis_flags = original_vis_flags
		vis_contents -= current_held
		original_transform = null
		original_vis_flags = NONE
		held_mob = null
	. = ..()
	
	//Then we reapply it
	for(var/reapplylocation in preremovespatials)
		for(var/channeltoreapply in reapplylocation)
			SSspatial_grid.add_grid_awareness(reapplylocation,channeltoreapply)


/obj/item/micro/MouseDrop(mob/living/M)
	..()
	if(isliving(usr))
		var/mob/living/livingusr = usr
		if(!Adjacent(usr))
			return
		/*if(M.voremode) <-- commented out until is fixed!
			if(Adjacent(M))
				livingusr.vore_attack(livingusr, held_mob, M)
			else
				to_chat(livingusr,span_notice(M + " is too far!"))*/
		else
			for(var/mob/living/carbon/human/O in contents)
				O.show_inv(livingusr)

/datum/element/spontaneous_vore
	var/mob/living/parent

/datum/element/spontaneous_vore/Attach(datum/target)
	. = ..()
	if(!isliving(target))
		return ELEMENT_INCOMPATIBLE
	parent = target
	RegisterSignal(target, COMSIG_LIVING_STUMBLED_INTO, PROC_REF(handle_stumble))
	RegisterSignal(target, COMSIG_ATOM_INTERCEPT_Z_FALL, PROC_REF(handle_fall))
	RegisterSignal(target, COMSIG_LIVING_HIT_BY_THROWN_ENTITY, PROC_REF(handle_hitby))
	RegisterSignal(target, COMSIG_MOVABLE_CROSS, PROC_REF(handle_crossed))

/datum/element/spontaneous_vore/Detach(datum/target)
	. = ..()
	parent = null
	UnregisterSignal(target, list(COMSIG_LIVING_STUMBLED_INTO, COMSIG_ATOM_INTERCEPT_Z_FALL, COMSIG_LIVING_HIT_BY_THROWN_ENTITY, COMSIG_MOVABLE_CROSS))

///Source is the one being bumped into (Owner of this component)
///Target is the one bumping into us.
/datum/element/spontaneous_vore/proc/handle_stumble(mob/living/source, mob/living/target)
	SIGNAL_HANDLER

	//Prevents slipping into ourselves if we have a blobform.
	if(!isturf(target.loc) || !isturf(source.loc)) //No slipping into things that aren't even on a valid turf.
		return
	//Prevents eating ourselves with our own stomach.
	if(source.vore_selected == target.vore_selected)
		return

	//We are able to eat the person stumbling into us.
	if(can_stumble_vore(prey = target, pred = source)) //This is if the person stumbling into us is able to eat us!
		source.visible_message(span_warning("[target] flops carelessly into [source]!"))
		var/obj/belly/destination_belly = source.get_current_spont_belly(target)
		source.begin_instant_nom(source, prey = target, pred = source, belly = destination_belly)
		//target.stop_flying()
		return CANCEL_STUMBLED_INTO

	//The person stumbling into us is able to eat us.
	if(can_stumble_vore(prey = source, pred = target)) //This is if the person stumbling into us is able to be eaten by us! BROKEN!
		source.visible_message(span_warning("[target] flops carelessly into [source]!"))
		target.forceMove(get_turf(source))
		var/obj/belly/destination_belly = target.get_current_spont_belly(source)
		source.begin_instant_nom(target, prey = source, pred = target, belly = destination_belly)
		//source.stop_flying()
		return CANCEL_STUMBLED_INTO

//Parent is the mob this element is attached to
//AM can be any movable, so falling items can be item-vored if valid
//levels is the number of Z's the object fell, if we want to use that for anything
/datum/element/spontaneous_vore/proc/handle_fall(atom/movable/AM, levels)//(mob/living/source, turf/landing, mob/living/drop_mob)
	SIGNAL_HANDLER

	if(isitem(AM))
		var/obj/item/O = AM
		var/obj/belly/destination_belly = parent.get_current_spont_belly(O)
		if(!destination_belly)
			return
		if(parent.stat != DEAD && parent.trash_catching)
			if(parent.adminbus_trash || destination_belly.validate_item_size(O) ||/*is_type_in_list(O, GLOB.edible_trash) &&*/ O.trash_eatable && !is_type_in_list(O, GLOB.item_vore_blacklist)) //Caustic - Trash Eatable was unused really, we'd otherwise have to go through and add it in to all items.
				parent.visible_message(span_warning("[O] is thrown directly into [parent]'s [lowertext(destination_belly.name)]!"))
				destination_belly.nom_atom(O)
				return FALL_STOP_INTERCEPTING

	if(isliving(AM))
		var/mob/living/fallen = AM
		if(!fallen || fallen == parent)
			return

		//pred = fallen
		//prey = parent
		//result: parent is eaten by fallen
		if(can_drop_vore(prey = parent, pred = fallen))
			fallen.feed_grabbed_to_self_falling_nom(fallen, prey = parent)
			fallen.visible_message(span_danger("\The [fallen] falls right onto \the [parent]!"))
			return FALL_STOP_INTERCEPTING

		//pred = parent
		//prey = fallen
		//result: fallen is eaten by parent
		if(can_drop_vore(prey = fallen, pred = parent))
			parent.feed_grabbed_to_self_falling_nom(parent, prey = fallen)
			parent.OffBalance(3 SECONDS)
			parent.visible_message(span_danger("\The [fallen] falls right into \the [parent]!"))
			return FALL_STOP_INTERCEPTING

//Parent above is the mob this element is attached to
//hitby is the item or mob that has been thrown at Parent
//throwingdatum is all of the throwing data
/datum/element/spontaneous_vore/proc/handle_hitby(atom/movable/hitby, datum/thrownthing/throwingdatum) //(mob/living/source, atom/movable/hitby, mob/thrower, speed)
	SIGNAL_HANDLER

	//Handle object throw vore
	if(isitem(hitby) && !istype(hitby, /obj/item/holder/micro))
		var/obj/item/O = hitby
		var/obj/belly/destination_belly = parent.get_current_spont_belly(O)
		if(!destination_belly)
			return
		if(parent.stat != DEAD && parent.trash_catching)
			if(parent.adminbus_trash || destination_belly.validate_item_size(O) ||/*is_type_in_list(O, GLOB.edible_trash) &&*/ O.trash_eatable && !is_type_in_list(O, GLOB.item_vore_blacklist)) //Caustic - Trash Eatable was unused really, we'd otherwise have to go through and add it in to all items.
				parent.visible_message(span_warning("[O] is thrown directly into [parent]'s [lowertext(destination_belly.name)]!"))
				destination_belly.nom_atom(O)
				return COMPONENT_CANCEL_THROW

	//Throwing a prey into a pred takes priority. After that it checks to see if the person being thrown is a pred.
	if(isliving(hitby) || istype(hitby, /obj/item/holder/micro))
		var/mob/living/thrown_mob
		if(istype(hitby, /obj/item/holder/micro))
			var/obj/item/holder/micro/tiny = hitby
			thrown_mob = tiny.held_mob
		else
			thrown_mob = hitby

		//If we don't allow mobvore and the thrown mob is an NPC animal, stop here.
		if(!parent.allowmobvore && isanimal(thrown_mob) && !thrown_mob.ckey)
			return

		//If we're an NPC animal and the person thrown into us doesn't allow mobvore, stop here.
		if(!thrown_mob.allowmobvore && isanimal(parent) && !parent.ckey)
			return

		var/mob/thrower = throwingdatum?.thrower
		// PERSON BEING HIT: CAN BE DROP PRED, ALLOWS THROW VORE.
		// PERSON BEING THROWN: DEVOURABLE, ALLOWS THROW VORE, CAN BE DROP PREY.
		if(can_throw_vore(prey = thrown_mob, pred = parent))
			var/obj/belly/destination_belly = parent.get_current_spont_belly(thrown_mob)
			if(!destination_belly)
				return
			destination_belly.nom_atom(thrown_mob) //Eat them!!!
			parent.visible_message(span_warning("[thrown_mob] is thrown right into [parent]'s [lowertext(destination_belly.name)]!"))
			parent.on_throw_vore_special(TRUE, thrown_mob)

			if(thrower)
				log_combat(thrower, thrown_mob, "threw", addition = "to be devoured by [parent.name] via throw vore.")
			else
				log_combat(parent, thrown_mob, "devoured", addition = "via throw vore.")
			return COMPONENT_CANCEL_THROW //We can stop here. We don't need to calculate damage or anything else. They're eaten.

		// PERSON BEING HIT: CAN BE DROP PREY, ALLOWS THROW VORE, AND IS DEVOURABLE.
		// PERSON BEING THROWN: CAN BE DROP PRED, ALLOWS THROW VORE.
		else if(can_throw_vore(prey = parent, pred = thrown_mob))//Pred thrown into prey.
			var/obj/belly/destination_belly = thrown_mob.get_current_spont_belly(parent)
			if(!destination_belly)
				return
			parent.visible_message(span_warning("[parent] suddenly slips inside of [thrown_mob]'s [lowertext(destination_belly.name)] as [thrown_mob] flies into them!"))
			destination_belly.nom_atom(parent) //Eat them!!!
			if(parent.loc != thrown_mob.vore_selected)
				parent.forceMove(thrown_mob.vore_selected) //Double check. Should never happen but...Weirder things have happened!
			if(thrower)
				log_combat(thrower, thrown_mob, "threw", addition = "to devour [parent.name] via throw vore.")
			else
				log_combat(parent, thrown_mob, "was devoured by", addition = "via throw vore.")
			return COMPONENT_CANCEL_THROW

//source = person standing up
//crossed = person sliding
/datum/element/spontaneous_vore/proc/handle_crossed(mob/living/source, mob/living/crossed)
	SIGNAL_HANDLER

	if(source == crossed || !istype(crossed))
		return

	//Person being slipped into eats the person slipping
	if(can_slip_vore(pred = source, prey = crossed))	//If we can vore them go for it
		var/obj/belly/destination_belly = source.get_current_spont_belly(crossed)
		if(!destination_belly)
			return
		source.begin_instant_nom(source, prey = crossed, pred = source, belly = destination_belly)
		return //COMPONENT_BLOCK_CROSS

	//The person slipping eats the person being slipped into
	else if(can_slip_vore(pred = crossed, prey = source))
		var/obj/belly/destination_belly = crossed.get_current_spont_belly(source)
		if(!destination_belly)
			return
		source.begin_instant_nom(crossed, prey = source, pred = crossed, belly = destination_belly) //Must be
		return //We DON'T block it here. Pred can slip onto the prey's tile, no problem.

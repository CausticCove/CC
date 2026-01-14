/obj/effect/proc_holder/spell/invoked/mending
	name = "Mending"
	desc = "Uses arcyne energy to mend an item. Effect of repair scales off of your Intelligence."
	overlay_state = "mending"
	releasedrain = 50
	chargetime = 5
	recharge_time = 1.5 SECONDS
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	cost = 2
	spell_tier = 2 // Utility. Faster repairs.
	glow_color = GLOW_COLOR_ARCANE
	glow_intensity = GLOW_INTENSITY_LOW

	miracle = FALSE

	invocations = list("Reficio")
	invocation_type = "shout" //can be none, whisper, emote and shout

	var/repair_percent = 0.15
	var/lesser_modifier = 0 //For use with lesser mending.
	var/int_bonus = 0.00

/obj/effect/proc_holder/spell/invoked/mending/cast(list/targets, mob/living/user)
	if(!istype(targets[1], /obj/item))
		to_chat(user, span_warning("There is no item here!"))
		revert_cast()
		return

	var/obj/item/I = targets[1]

	if(!user.Adjacent(I))
		to_chat(user, span_warning("I can't reach the item from here!"))
		return

	if(!I.anvilrepair && !I.sewrepair)
		to_chat(user, span_warning("Not even magic can mend this item!"))
		revert_cast()
		return

	if(I.obj_integrity >= I.max_integrity && I.body_parts_covered_dynamic == I.body_parts_covered && !I.peel_count)
		to_chat(user, span_info("[I] appears to be in perfect condition."))
		revert_cast()
		return

	var/arcane_skill = user.get_skill_level(associated_skill)
	var/cast_time = (lesser_modifier + 40) - ((arcane_skill * 4) + (user.STAINT / 4))

	for(var/i in 1 to 10)

		if(!user.Adjacent(I)) //Check if the item is always near during the loop.
			to_chat(user, span_warning("I can't reach the item from here!"))
			break

		if(do_after(user, cast_time, target = I))
			int_bonus = (user.STAINT * 0.01)
			repair_percent = (int_bonus * max_integrity)

			I.obj_integrity = min(I.obj_integrity + repair_percent, I.max_integrity)
			user.visible_message(span_info("[I] glows in a faint mending light."))
			playsound(I, 'sound/magic/mending.ogg', 35, TRUE, -2)

			if(I.obj_integrity >= I.max_integrity)
				if(I.obj_broken)
					I.obj_fix()
				if(I.peel_count)
					I.peel_count--
					to_chat(user, span_info("[I]'s shorn layers mend together. ([I.peel_count])."))
				else
					if(I.body_parts_covered_dynamic != I.body_parts_covered)
						I.repair_coverage()
						to_chat(user, span_info("[I]'s shorn layers mend together, completely."))
				break //We finished repairs!
		else //We gotta stand still, same with the item!
			return
	return //Finished the mending; Lets stop trying to repair.


/obj/effect/proc_holder/spell/invoked/mending/lesser
	name = "Lesser Mending"
	desc = "Uses arcyne energy to mend an item. Effect of repair scales off of your Intelligence. The Lesser variant repairs significantly slower."
	recharge_time = 3 SECONDS
	cost = 1
	spell_tier = 1 //Lesser Mending, still just like mending but rather akin to snails pace, and is only 1 point.
	lesser_modifier = 2.5 SECONDS //2.5 second slower per tick. Much much slower than regular mending.
	repair_percent = 0.7
 
//Returns True if the Scry succeeds, otherwise it failed for some reason.
// Requires a user, a target, and the name of whatever is being used, but everything else is technically optional if expected to be setup and sent to run properly.
/proc/scry_on_mob(mob/living/carbon/human/user, mob/living/carbon/human/target, eyetype = /mob/dead/observer/eye/screye, scry_length = 8 SECONDS, used_item = "something unhandled", notify_target = TRUE, on_use_vismessage = null, on_use_tochat = null, datum/client_colour/apply_color_filter = null)
	if(is_in_denyscry_area(target))
		to_chat(user, span_warning("You attempt to locate them, but all you get is a fog. They appear to be too far away or in a location that cannot be discerned..."))
		return

	var/turf/T = get_turf(target)
	if(!T)
		return

	message_admins("SCRYING: [user.real_name] ([user.ckey]) has used the [used_item] to look at [target.real_name] ([target.ckey])")
	log_game("SCRYING: [user.real_name] ([user.ckey]) has used the [used_item] to look at [target.real_name] ([target.ckey])")

	ADD_TRAIT(user, TRAIT_NOSSDINDICATOR, "scrying")
	var/mob/dead/observer/eye/S = user.scry_ghost(eyetype)
	if(!S)
		return
	if(apply_color_filter)
		S.add_client_colour(apply_color_filter)
	S.ManualFollow(target)

	if(on_use_vismessage) //If they don't send a use message, lets just not do anything.
		user.visible_message(on_use_vismessage)

	if(on_use_tochat) //Similarly here as above
		to_chat(user, on_use_tochat)

	addtimer(CALLBACK(S, TYPE_PROC_REF(/mob/dead/observer, reenter_corpse)), scry_length)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(clear_scry_noSSD), user), scry_length + 1)

	if(notify_target)
		target.throw_alert("scryingeye", /atom/movable/screen/alert/scryingeye, override = TRUE)
		addtimer(CALLBACK(target, TYPE_PROC_REF(/mob/, clear_alert), "scryingeye", TRUE), scry_length)

		if(target.stat != DEAD && target.stat != UNCONSCIOUS)
			if(target.STAPER >= 15)
				if(target.mind)
					if(target.mind.do_i_know(name=user.real_name))
						to_chat(target, span_warning("I can clearly see the face of [user.real_name] staring at me!."))
						return TRUE
					to_chat(target, span_warning("I can clearly see the face of an unknown [user.gender == FEMALE ? "woman" : "man"] staring at me!"))
					return TRUE
			to_chat(target, span_warning("I feel a pair of unknown eyes on me."))
			target.playsound_local(target, 'sound/magic/scryed_on.ogg', 75, TRUE)

	return TRUE

/proc/scry_on_obj(mob/living/carbon/human/user, obj/target, eyetype = /mob/dead/observer/eye/screye, scry_length = 8 SECONDS, used_item = "something unhandled", on_use_vismessage = null, on_use_tochat = null, target_vismessage = null, datum/client_colour/apply_color_filter = null)
	var/turf/T = get_turf(target)
	if(!T)
		return

	message_admins("SCRYING: [user.real_name] ([user.ckey]) has used the [used_item] to look at [target.name] [ADMIN_JMP(target)]")
	log_game("SCRYING: [user.real_name] ([user.ckey]) has used the [used_item] to look at [target.name] [ADMIN_JMP(target)]")

	ADD_TRAIT(user, TRAIT_NOSSDINDICATOR, "scrying")
	var/mob/dead/observer/eye/S = user.scry_ghost(eyetype)
	if(!S)
		return
	if(apply_color_filter)
		S.add_client_colour(apply_color_filter)
	S.ManualFollow(target)

	if(on_use_vismessage) //If they don't send a use message, lets just not do anything.
		user.visible_message(on_use_vismessage)

	if(on_use_tochat) //Similarly here as above
		to_chat(user, on_use_tochat)

	if(target_vismessage)
		target.visible_message(target_vismessage)

	addtimer(CALLBACK(S, TYPE_PROC_REF(/mob/dead/observer, reenter_corpse)), scry_length)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(clear_scry_noSSD), user), scry_length + 1)

	return TRUE

/proc/clear_scry_noSSD(mob/living/carbon/human/user)
	REMOVE_TRAIT(user, TRAIT_NOSSDINDICATOR, "scrying")

/proc/is_in_denyscry_area(mob/living/carbon/human/target) //This probably could be done a bit better, but ugh.
	var/area/target_area = get_area(target)

	switch(target_area.type)
		if(/area/rogue/outdoors/woods/wretch_lair)
			return TRUE
		if(/area/rogue/under/cave/inhumen)
			return TRUE
		if(/area/rogue/indoors/vampire_manor)
			return TRUE
		if(/area/rogue/outdoors/woods/vampire_lair)
			return TRUE
		if(/area/rogue/indoors/shelter/bog_hag)
			return TRUE
		if(/area/rogue/indoors/banditcamp)
			return TRUE
		if(/area/rogue/outdoors/banditcamp)
			return TRUE
		else
			return FALSE

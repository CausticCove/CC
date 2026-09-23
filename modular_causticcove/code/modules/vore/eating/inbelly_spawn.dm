/mob/living/proc/inbelly_spawn_prompt(mob/dead/observer/potential_prey)
	if(!potential_prey || !istype(potential_prey))		// Did our prey cease to exist?
		return

	if(!potential_prey.started_as_observer && potential_prey.body_backup == null) //Lets check this, just to be sure no one spawns over and over this way... You gotta at least go to the main menu and observe to in-belly spawn, OR you died to Digestion Death and have a body properly set up on your ghost.
		to_chat(potential_prey, span_notice("In order to In-Belly Spawn, you need to join the round as an observer, or have died to a Vore Scene. Please don't attempt to use this as a free respawn!"))
		return

	var/prey_name = potential_prey.client.prefs.real_name
	// Are we cool with this prey spawning in at all?
	var/answer = tgui_alert(src, "[prey_name] wants to spawn in [potential_prey.body_backup ? "- or enter as a ghost to - " : ""]one of your bellies. Do you accept?", "Inbelly Spawning", list("Yes", "No"))
	if(answer != "Yes")
		to_chat(potential_prey, span_notice("Your request was turned down."))
		return

	// Let them know so that they don't spam it.
	to_chat(potential_prey, span_notice("Predator agreed to your request. Wait a bit while they choose a belly."))

	// Where we dropping?
	var/obj/belly/belly_choice = tgui_input_list(src, "Choose Target Belly", "Belly Choice", src.vore_organs)

	// Wdym nowhere?
	if(!belly_choice || !istype(belly_choice))
		to_chat(potential_prey, span_notice("Something went wrong with predator selecting a belly. Try again?"))
		to_chat(src, span_notice("No valid belly selected. Inbelly spawn cancelled."))
		return

	// Extra caution never hurts
	if(belly_choice.digest_mode == DM_DIGEST)
		var/digest_answer = tgui_alert(src, "[belly_choice] is currently set to Digest. Are you sure you want to spawn prey there?", "Inbelly Spawning", list("Yes", "No"))
		if(digest_answer != "Yes")
			to_chat(potential_prey, span_notice("Something went wrong with predator selecting a belly. Try again?"))
			to_chat(src, span_notice("Inbelly spawn cancelled."))

	var/direct_spawn
	var/direct_spawn_answer = tgui_alert(src, "[prey_name] has died a vore-related death. Do you want to directly spawn them in your belly immediately - Or would you rather transfer them in as a Ghost and use the Reform Belly?", "Inbelly Spawning", list("Spawn", "Ghost"))
	if(direct_spawn_answer == "Ghost")
		direct_spawn = FALSE
	else
		direct_spawn = TRUE

	// Are they already fat (and/or appropriate equivalent)?
	var/absorbed = FALSE
	if(direct_spawn)
		var/absorbed_answer = tgui_alert(src, "Do you want them to start absorbed?", "Inbelly Spawning", list("Yes", "No"))

		if(absorbed_answer == "Yes")
			absorbed = TRUE

	// They disappeared?
	if(!potential_prey)
		to_chat(src, span_notice("No prey found. Something went wrong!"))
		return

	// Final confirmation for pred
	var/confirmation_pred = tgui_alert(src, "Are you certain that you want [potential_prey.client.prefs.real_name][direct_spawn ? " spawned in your " : "'s ghost moved into your "][belly_choice][absorbed ? ", absorbed" : ""]?", "Inbelly Spawning", list("Yes", "No"))

	if(confirmation_pred != "Yes")
		to_chat(potential_prey, span_notice("Your pred couldn't finish selection. Try again?"))
		to_chat(src, span_notice("Inbelly spawn cancelled."))
		return

	to_chat(src, span_notice("Waiting for prey's confirmation..."))

	// And final confirmation for prey
	var/confirmation_prey = tgui_alert(potential_prey, "Are you certain that you want to[direct_spawn ? " spawn in " : " enter into "][src]'s [belly_choice][absorbed ? ", absorbed" : ""]?", "Inbelly Spawning", list("Yes", "No"))

	if(confirmation_prey == "Yes" && potential_prey && src && belly_choice)
		//Now we finally spawn them in!
		/*if(!is_alien_whitelisted(potential_prey, GLOB.all_species[potential_prey.prefs.species])) //Caustic - I guess if we have uh, whitelists it would be added in here?
			to_chat(potential_prey, span_notice("You are not whitelisted to play as currently selected character."))
			to_chat(src, span_notice("Prey accepted the confirmation, but something went wrong with spawning their character."))
			return*/
		if(direct_spawn)
			inbelly_spawn(potential_prey, src, belly_choice, absorbed)
		else
			potential_prey.forceMove(belly_choice)
	else
		to_chat(potential_prey, span_notice("Inbelly spawn cancelled."))
		to_chat(src, span_notice("Prey cancelled their inbelly spawn request."))

/proc/inbelly_spawn(mob/dead/observer/prey, mob/living/pred, obj/belly/target_belly, var/absorbed = FALSE)
	var/mob/living/carbon/human/new_character

	new_character = new(null)		// Spawn them in nullspace first. Can't have "Defaultname Defaultnameson slides into your Stomach".

	if(!new_character)
		return

	prey.client.prefs.copy_to(new_character)
	new_character.dna.update_dna_identity()
	if(prey.mind)
		prey.mind.late_joiner = TRUE
		prey.mind.active = 0					//we wish to transfer the key manually
		prey.mind.transfer_to(new_character)					//won't transfer key since the mind is not active

	new_character.name = prey.client.prefs.real_name

	new_character.key = prey.key		//Manually transfer the key to log them in
	var/area/joined_area = get_area(pred.loc)
	if(joined_area)
		joined_area.on_joining_game(new_character)
	new_character.update_fov_angles()

	new_character.after_creation()

	GLOB.chosen_names += new_character.real_name
	new_character.islatejoin = TRUE
	SSticker.minds += new_character.mind //Is this what is needed to handle skill gain?
	GLOB.joined_player_list += new_character.ckey
	update_wretch_slots()

	new_character.regenerate_icons()
	new_character.update_transform()
	new_character.forceMove(target_belly)		// Now that they're all setup and configured, send them to their destination.

	if(absorbed)
		target_belly.absorb_living(new_character)	// Glorp.

	log_admin("[prey] (as [new_character.real_name]) has spawned inside one of [pred]'s bellies.")				// Log it. Avoid abuse.
	message_admins("[prey] (as [new_character.real_name]) has spawned inside one of [pred]'s bellies.")

	return new_character			// incase its ever needed

/proc/ghost_enter_belly(mob/dead/observer/prey, obj/belly/target_belly)
	var/pred = target_belly.loc
	if(pred)
		prey.forceMove(target_belly)

		log_admin("[prey] (who has died to a vore-related death elsewhere) has entered one of [pred]'s bellies using the Inbelly-Spawn system.")				// Log it. Avoid abuse.
		message_admins("[prey] (who has died to a vore-related death elsewhere) has entered one of [pred]'s bellies using the Inbelly-Spawn system.")

/proc/ghost_return_to_pred(mob/dead/observer/prey, obj/belly/target_belly)

/mob/dead/observer
	var/enable_inbelly_spawn_attempts = FALSE
	var/datum/weakref/return_belly

/mob/dead/observer/verb/ToggleInBellySpawnAttempts()
	set name = "Toggle In-Belly Spawn"
	set desc = "Toggles the ability to attempt to In-Belly spawn on someone on Middle Mouse Click. Defaults to off to not cause any accidents!"
	set category = "VORE.Prefs"

	enable_inbelly_spawn_attempts = !enable_inbelly_spawn_attempts
	to_chat(src, span_notice("In-Belly spawn attempts [enable_inbelly_spawn_attempts ? "enabled! Middle-Mouse click on your pred to request a spawn (if they have it set up!) This is generally for ease of continuing a scene, you will spawn without any gear or stats and skills." : "disabled! Middle-Mouse clicks will revert to their usual actions."]"))

/mob/dead/observer/MiddleClickOn(atom/A, params)
	if(enable_inbelly_spawn_attempts && isliving(A))
		var/mob/living/alive = A
		alive.inbelly_spawn_prompt(src)
	else
		. = ..()

/*/mob/living/proc/soulcatcher_spawn_prompt(mob/observer/dead/prey, req_time) //We don't have soulcatchers or NIFs
	if(tgui_alert(src, "[prey.name] wants to join into your Soulcatcher.","Soulcatcher Request",list("Deny", "Allow"), timeout=1 MINUTES) != "Allow")
		to_chat(prey, span_warning("[src] has denied your request."))
		return

	if((world.time - req_time) > 1 MINUTES)
		to_chat(src, span_warning("The request had already expired. (1 minute waiting max)"))
		return

	if(!soulgem)
		return

	if(prey && prey.key && !stat && soulgem.flag_check(SOULGEM_ACTIVE | SOULGEM_CATCHING_GHOSTS, TRUE))
		if(!prey.mind) //No mind yet, aka haven't played in this round.
			prey.mind = new(prey.key)

		prey.mind.name = prey.name
		prey.mind.current = prey
		prey.mind.active = TRUE

		soulgem.catch_mob(prey) //This will result in the prey being deleted so...

/mob/living/carbon/human/proc/nif_soulcatcher_spawn_prompt(mob/observer/dead/prey, req_time)
	if(tgui_alert(src, "[prey.name] wants to join into your Soulcatcher.","Soulcatcher Request",list("Deny", "Allow"), timeout=1 MINUTES) != "Allow")
		to_chat(prey, span_warning("[src] has denied your request."))
		return

	if((world.time - req_time) > 1 MINUTES)
		to_chat(src, span_warning("The request had already expired. (1 minute waiting max)"))
		return

	if(!nif)
		return

	var/datum/nifsoft/soulcatcher/SC = nif.imp_check(NIF_SOULCATCHER)
	if(!SC)
		to_chat(prey, span_warning("[src] doesn't have the Soulcatcher NIFSoft installed, or their NIF is unpowered."))
		return

	//Final check since we waited for input a couple times.
	if(prey && prey.key && !stat && nif && SC)
		if(!prey.mind) //No mind yet, aka haven't played in this round.
			prey.mind = new(prey.key)

		prey.mind.name = prey.name
		prey.mind.current = prey
		prey.mind.active = TRUE

		SC.catch_mob(prey)*/ //This will result in the prey being deleted so...

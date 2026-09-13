//Contains every related code to second winds on a human mob.
///////////////
//MOB DEFINES//
///////////////
/mob/living/carbon
	var/can_second_wind = TRUE //True by default.

/mob/living/carbon/proc/clear_second_wind()
	to_chat(src, span_greenannounce("Second Wind! - (You can now use your Second Wind ability.)"))
	can_second_wind = TRUE

///////////////
//SECOND WIND//
///////////////
/datum/status_effect/buff/second_wind
	id = "second_wind"
	alert_type = /atom/movable/screen/alert/status_effect/buff/healing
	duration = 2.5 MINUTES //Half the time.
	tick_interval = 10 SECONDS //Triggers 15 times.
	examine_text = "SUBJECTPRONOUN is pushing themselves to their limits!"
	var/healing_on_tick = 6 //Total healing of 90 over 2:30 minutes.
	var/outline_colour = "#ffffff"

/datum/status_effect/buff/second_wind/on_apply()
	var/filter = owner.get_filter("second_wind")
	if (!filter)
		owner.add_filter("second_wind", 2, list("type" = "rays", "x" = 7, "y" = 4, "color" = outline_colour, "flags" = FILTER_OVERLAY))
	return TRUE

/datum/status_effect/buff/second_wind/on_remove()
	var/filter = owner.get_filter("second_wind")
	if (filter)
		owner.remove_filter(filter)
	if(owner.cmode_music_override)
		owner.cmode_music_override = null
		owner.cmode_music_override_name = null
		if(owner.cmode) //Only if we're still in combat.
			SSdroning.play_combat_music(owner.cmode_music, owner.client)
	return TRUE

/datum/status_effect/buff/second_wind/tick()
	var/obj/effect/temp_visual/heal/H = new /obj/effect/temp_visual/heal_blood(get_turf(owner))
	H.color = outline_colour

	//Can heal up to normal blood volume amounts.
	if(owner.blood_volume < BLOOD_VOLUME_NORMAL)
		owner.blood_volume = min(owner.blood_volume*4, BLOOD_VOLUME_NORMAL) //360 Bloodloss Recovered

	//Halved healing, it might barely help you. You use this primarily for energy and bloodloss to *prevent* death.
	owner.adjustBruteLoss(-(healing_on_tick/2), 0)
	owner.adjustFireLoss(-(healing_on_tick/2), 0)
	owner.adjustToxLoss(-(healing_on_tick/2), 0)

	//The benefit of using second wind while alive will be its massive benefit to energy and stamina.
	owner.energy_add(healing_on_tick * 5) //450 energy restored.
	owner.stamina_add(-(healing_on_tick)) //7.5 stamina per tick.

/////////////////
//SECOND CHANCE//
/////////////////
/datum/status_effect/buff/second_chance
	id = "second_chance"
	alert_type = /atom/movable/screen/alert/status_effect/buff/healing
	duration = 5 MINUTES
	tick_interval = 5 SECONDS //Triggers 80 times.
	examine_text = "SUBJECTPRONOUN appears to be pulling themselves back from death!"
	var/healing_on_tick = 5 //Total of 400 healing over 5 minutes.
	var/outline_colour = "#c4ffff"

/datum/status_effect/buff/second_chance/on_apply()
	var/filter = owner.get_filter("second_chance")
	if (!filter)
		owner.add_filter("second_chance", 2, list("type" = "rays", "x" = 7, "y" = 4, "color" = outline_colour, "flags" = FILTER_OVERLAY))
	return TRUE

/datum/status_effect/buff/second_chance/on_remove()
	var/filter = owner.get_filter("second_chance")
	if (filter)
		owner.remove_filter(filter)
	if(owner.cmode_music_override)
		owner.cmode_music_override = null
		owner.cmode_music_override_name = null
		if(owner.cmode) //Only if we're still in combat.
			SSdroning.play_combat_music(owner.cmode_music, owner.client)
	return TRUE

/datum/status_effect/buff/second_chance/tick()
	var/obj/effect/temp_visual/heal/H = new /obj/effect/temp_visual/heal_blood(get_turf(owner))
	H.color = outline_colour

	//Heal up to bad blood amount, heals far more this way.
	if(owner.blood_volume < BLOOD_VOLUME_BAD)
		owner.blood_volume = min(owner.blood_volume+15, BLOOD_VOLUME_NORMAL)
	var/list/wCount = owner.get_wounds()
	if(length(wCount))
		//So we can heal and recover and escape from enemies, close our wounds over this time.
		owner.heal_wounds(healing_on_tick * 5) //Lets close these wounds really quickly so we can get back to business.
		owner.update_damage_overlays()

	//Oxy healing to ensure that you can actually get around.
	owner.adjustOxyLoss(-healing_on_tick * 1.5, 0)

	owner.adjustBruteLoss(-healing_on_tick, 0)
	owner.adjustFireLoss(-healing_on_tick, 0)
	owner.adjustToxLoss(-healing_on_tick, 0)
	owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, -healing_on_tick)
	owner.adjustCloneLoss(-healing_on_tick, 0)

////////////////////
//SECOND_WIND VERB//
////////////////////

//Using Second Wind early will provide you a small, temporary buff that grants you bonus Energy and Stamina, with heavily reduced healing.
//Using Second Wind whilst dead, will fully revive you, yet inflict a very heavy self-revival debuff that you must wait off.
/mob/living/carbon/verb/second_wind()
	set category = "IC.Actions"
	set name = "SECOND WIND"
	set desc = "Use your Second Wind, allowing you to revive yourself once every 1:30 hours. If you are already alive; Grant yourself a temporary buff for 1 minute."

	if(can_second_wind)
		switch(alert("Do you wish to take your Second Wind?",,"Yes","No"))
			if("Yes")
			//Revive them, but don't fully heal them, only works if the target has died, and has been dead long enough to trigger this.
				if(stat == DEAD)
					balloon_alert_to_viewers("Second Chance!")
					visible_message(span_good("[src] pulls away from Necra's grasp, affording themselves a second wind!"), span_green("I can't die, not yet! Not now!"))
					to_chat(src, span_danger("I breathe once more, my body aches, and my mind feels hazy. I can't accurately recall what happened..."))
					emote("breathgasp")
					Jitter(100)
					//Second Chance is stronger than Second Wind in terms of healing.
					apply_status_effect(/datum/status_effect/buff/second_chance)
					//Actual revival starts here.
					adjustOxyLoss(-getOxyLoss())
					revive(full_heal = FALSE)
					grab_ghost(force = TRUE) // Just in case.
					update_body()
					mind.remove_antag_datum(/datum/antagonist/zombie)
					remove_status_effect(/datum/status_effect/debuff/rotted_zombie)//Removes the rotted-zombie debuff if they have it - Failsafe for it.
					apply_status_effect(/datum/status_effect/debuff/self_revived) //Heavily penalize them for self revival.
					can_second_wind = FALSE
					//Swap and refresh combat music. So you know how long it's lasting for.
					cmode_music_override = 'modular_causticcove/sound/music/SECOND_WIND.ogg'
					cmode_music_override_name = "Chop Shop Jungle Breaks - ChristmasKrumble666"
					SSdroning.play_combat_music(cmode_music_override, client)
					//After 1:30 hours you can second wind again. So use it WISELY! You can revive yourself with it!!!
					addtimer(CALLBACK(src, PROC_REF(clear_second_wind)), 1.5 HOURS)

				else
					balloon_alert_to_viewers("Second Wind!")
					visible_message(span_good("[src] steels themselves against all odds!"), span_green("NOW IS NOT MY TIME!!!"))
					emote("warcry")
					Jitter(25)
					apply_status_effect(/datum/status_effect/buff/second_wind)
					can_second_wind = FALSE
					//Swap and refresh combat music. So you know how long it's lasting for.
					cmode_music_override = 'modular_causticcove/sound/music/SECOND_WIND.ogg'
					cmode_music_override_name = "Chop Shop Jungle Breaks - ChristmasKrumble666"
					SSdroning.play_combat_music(cmode_music_override, client)
					//After 1:30 hours you can second wind again. So use it WISELY! You can revive yourself with it!!!
					addtimer(CALLBACK(src, PROC_REF(clear_second_wind)), 1.5 HOURS)

			if("No")
				to_chat(src, span_warn("I change my mind..."))
	else
		to_chat(src, span_warningbig("I can't use my Second Wind at this moment!"))

//Contains every related code to second winds on a human mob.
///////////////
//MOB DEFINES//
///////////////
/mob/living/carbon
	var/can_second_wind = TRUE //True by default.

/mob/living/carbon/proc/clear_second_wind()
	to_chat(src, span_good("Your body feels ready to take on anything again. - (You can use your Second Wind once more.)"))
	can_second_wind = TRUE

///////////////
//SECOND WIND//
///////////////
/datum/status_effect/buff/second_wind
	id = "second_wind"
	alert_type = /atom/movable/screen/alert/status_effect/buff/healing
	duration = 1 MINUTES //Far less
	tick_interval = 5 SECONDS //Triggers 12 times.
	examine_text = "SUBJECTPRONOUN is pushing themselves to their limits!"
	var/healing_on_tick = 7.5 //Total healing of 90 over 1 minute.
	var/outline_colour = "#4e4538"

/datum/status_effect/buff/second_wind/on_apply()
	var/filter = owner.get_filter("second_wind")
	if (!filter)
		owner.add_filter("second_wind", 2, list("type" = "bloom", "color" = outline_colour, "alpha" = 120, "size" = 1))
	return TRUE

/datum/status_effect/buff/second_wind/on_remove()
	var/filter = owner.get_filter("second_wind")
	if (filter)
		owner.remove_filter(filter)
	return TRUE

/datum/status_effect/buff/second_wind/tick()
	var/obj/effect/temp_visual/heal/H = new /obj/effect/temp_visual/heal_blood(get_turf(owner))
	H.color = outline_colour

	//Can heal up to normal blood volume amounts.
	if(owner.blood_volume < BLOOD_VOLUME_NORMAL)
		owner.blood_volume = min(owner.blood_volume*4, BLOOD_VOLUME_NORMAL) //360 Bloodloss Recovered

	//However, does not heal wounds, and only heals limb damage. Use it wisely.
	owner.adjustBruteLoss(-healing_on_tick, 0)
	owner.adjustFireLoss(-healing_on_tick, 0)
	owner.adjustToxLoss(-healing_on_tick, 0)

	//The benefit of using second wind while alive will be its massive benefit to energy and stamina.
	owner.energy_add(healing_on_tick * 5) //450 energy restored.
	owner.stamina_add(healing_on_tick * 2) //15 stamina per tick.

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
	var/outline_colour = "#ffe1ba"

/datum/status_effect/buff/second_chance/on_apply()
	var/filter = owner.get_filter("second_chance")
	if (!filter)
		owner.add_filter("second_chance", 2, list("type" = "bloom", "color" = outline_colour, "alpha" = 120, "size" = 1))
	return TRUE

/datum/status_effect/buff/second_chance/on_remove()
	var/filter = owner.get_filter("second_chance")
	if (filter)
		owner.remove_filter(filter)
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

	owner.adjustOxyLoss(-healing_on_tick * 10, 0) //We can't die from oxy during this time.

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
/client/proc/second_wind()
	set name = "SECOND WIND"
	set category = "IC.Actions"

	if(istype(mob, /mob/living/carbon))
		var/mob/living/carbon/C = mob

		switch(alert("Do you wish to take your Second Wind?",,"Yes","No"))
			if("Yes")
				//Revive them, but don't fully heal them, only works if the target has died, and has been dead long enough to trigger this.
				if(C.stat == DEAD)
					C.visible_message(span_good("[C] pulls away from Necra's grasp, affording themselves a second wind!"), span_green("I can't die, not yet! Not now!"))
					to_chat(C, span_danger("I breathe once more, my body aches, and my mind feels hazy. I can't accurately recall what happened..."))
					C.emote("breathgasp")
					C.Jitter(100)
					//Second Chance is stronger than Second Wind in terms of healing.
					C.apply_status_effect(/datum/status_effect/buff/second_chance)

					//Actual revival starts here.
					C.adjustOxyLoss(-C.getOxyLoss())
					C.revive(full_heal = FALSE)
					C.grab_ghost(force = TRUE) // Just in case.
					C.update_body()
					C.mind.remove_antag_datum(/datum/antagonist/zombie)
					C.remove_status_effect(/datum/status_effect/debuff/rotted_zombie)//Removes the rotted-zombie debuff if they have it - Failsafe for it.
					C.apply_status_effect(/datum/status_effect/debuff/self_revived) //Heavily penalize them for self revival.
					can_second_wind = FALSE
				else
					C.visible_message(span_good("[C] steels themselves against all odds!"), span_green("NOW IS NOT MY TIME!!!"))
					C.emote("warcry")
					C.apply_status_effect(/datum/status_effect/buff/second_wind)
					C.can_second_wind = FALSE

				//After 1:30 hours you can second wind again. So use it WISELY! You can revive yourself with it!!!
				addtimer(CALLBACK(C, PROC_REF(clear_second_wind)), 1.5 HOURS)

			if("No")
				to_chat(src, span_warn("Perhaps Necra is more comforting than I thought..."))
	else
		to_chat(src, span_warn("I must be inside of a body to be able to utilize my Second Wind."))

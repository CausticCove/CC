//Contains every related code to second winds on a human mob.
///////////////
//MOB DEFINES//
///////////////
/mob/living/carbon
	var/can_second_wind = TRUE //True by default.

/mob/living/carbon/proc/clear_second_wind()
	to_chat(src, span_greenannounce("You feel like your body has been able to recover from the stresses you pushed it through - You can use your Second Wind ability again."))
	can_second_wind = TRUE

///////////////
//SECOND WIND//
///////////////
/atom/movable/screen/alert/status_effect/buff/second_wind
	name = "Second Wind"
	desc = "I've gotten close to death - and need to get out of here before it's too late! Run! Run and get help while I still can!"
	icon_state = "phaseroll"

/datum/status_effect/buff/second_wind
	id = "second_wind" //Second iteration of Second Wind starts off strong to get you out of immediate danger, then tapers off it's benefits as it ticks over the duration.
	alert_type = /atom/movable/screen/alert/status_effect/buff/second_wind
	duration = 5 MINUTES
	tick_interval = 2 SECONDS //Life appears to tick every 2 seconds, so lets match that.
	examine_text = "SUBJECTPRONOUN is pushing themselves to their limits!"
	effectedstats = list(STATKEY_STR = -4, STATKEY_PER = -3, STATKEY_INT = -4, STATKEY_SPD = 5, STATKEY_CON = 4, STATKEY_WIL = 4)

	var/original_alpha = 255
	var/outline_colour = "#ffffff"
	var/healing_on_tick = 6 //Used to determine healing, energy and stamina gains
	var/min_health = 20 //If their current health is equal or greater then this value, do not heal them anymore. Health goes from -100 to 100
	var/blood_regen_cap = BLOOD_VOLUME_OKAY //Must be below this amount of blood volume to recieve any benefits from this.
	var/blood_regen_start = 2 //Default regen is simply 0.5 per bleed tick
	var/blood_regen_loss_tick = 8 SECONDS //Reduce the regen rate by the loss amount every this many game ticks. Goes for 2 minutes at 8 Sec
	var/blood_regen_loss = 0.1
	var/bleed_reduction_start = 0.95 //This amount of your current bleed rate will be subtracted from it, for the first minute. Then it gradually tapers off and your bleeding ramps up again.
	var/bleed_reduction_loss_tick = 6 SECONDS //After the first minute of Second Wind being applied, it will reduce the current bleed rate reduction after this many ticks have passed
	var/bleed_reduction_loss = 0.05 //This amount is what is removed from the reduction each tick. From 1 - 3 minutes it will taper down this reduction.

	var/min_blood_on_apply = BLOOD_VOLUME_SURVIVE
	var/npc_stun_length = 3 SECONDS //Time to stun nearby NPCs, and only NPCs, when activating.
	var/npc_stun_range = 3 //Stuns only NPCs that are within 3 squares
	var/phase_length = 10 SECONDS //Applies the Phasing effect for this long!
	var/bleed_reduction_taperdown_start = 1 MINUTES //From 1-3 minutes it tapers down the bleed rate protection
	var/blood_regen_taperdown_start = 3 MINUTES //From 3-5 minutes it tapers down the regen

	var/start_time
	var/phase_over = FALSE
	var/current_blood_regen
	var/last_regen_tick
	var/current_bleed_reduction
	var/last_reduction_tick
	var/initial_tox //All Toxins damage !!will!! return on buff expire!
	var/other_tox_heal //Tracking Var for additional toxins healing on top of what the Wind heals
	var/last_tox_tick //Toxin damage last tick

	/*id = "second_wind" //The first iteration's version
	alert_type = /atom/movable/screen/alert/status_effect/buff/healing
	duration = 2.5 MINUTES //Half the time.
	tick_interval = 10 SECONDS //Triggers 15 times.
	examine_text = "SUBJECTPRONOUN is pushing themselves to their limits!"
	var/healing_on_tick = 6 //Total healing of 90 over 2:30 minutes.
	var/outline_colour = "#ffffff"*/

/datum/status_effect/buff/second_wind/on_apply()
	var/filter = owner.get_filter("second_wind")
	if (!filter)
		owner.add_filter("second_wind", 2, list("type" = "rays", "x" = 7, "y" = 4, "color" = outline_colour, "flags" = FILTER_OVERLAY))

	//Initialize the tracking vars
	start_time = world.time
	current_blood_regen = blood_regen_start
	current_bleed_reduction = bleed_reduction_start
	last_regen_tick = start_time + blood_regen_taperdown_start
	last_reduction_tick = start_time + bleed_reduction_taperdown_start
	initial_tox = owner.getToxLoss()
	other_tox_heal = 0
	last_tox_tick = initial_tox

	//Add the initial effects here!
	if(owner.blood_volume < min_blood_on_apply)
		owner.blood_volume = min_blood_on_apply

	if(owner.health < 5) //Small grace zone before crit where they heal to a point where they are out of crit, starting with Oxyloss, likely the most common offender
		if(owner.getOxyLoss())
			owner.breath_remaining = owner.max_breath //Account for multi-Z water too, hopefully
			owner.adjustOxyLoss(-(owner.getOxyLoss())) //Give them a fresh full breath of air!

		if(owner.health < 5)
			if(initial_tox)
				var/tox_recovery = -(5 - owner.health)
				owner.adjustToxLoss(tox_recovery) //This SHOULD be enough to get them out of crit and mobile, with the breath of fresh air. But this is going to return when the buff expires...
				last_tox_tick = owner.getToxLoss()

	owner.energy_add(owner.max_energy) //Refill their blue... cause it's gone when this runs out!
	if(owner.stamina > (owner.max_stamina - 50)) //Give them a minimum of 50 stamina as well as a starting amount.
		owner.stamina_add(-(owner.stamina - (owner.max_stamina - 50)))

	//Apply the phasing effect from the Dagger Special
	owner.pass_flags |= PASSMOB
	ADD_TRAIT(owner, TRAIT_GRABIMMUNE, TRAIT_STATUS_EFFECT)
	ADD_TRAIT(owner, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_STATUS_EFFECT)
	original_alpha = owner.alpha
	animate(owner, alpha = 180, time = 2)

	//Stun the surrounding NPCs
	for(var/mob/living/M in viewers(npc_stun_range, owner))
		if(!M.client && !M.ckey) //If it has no client or ckey, it probably isn't a player! The Key check means we also won't stun DC'd players.
			M.Stun(npc_stun_length)

	return TRUE

/datum/status_effect/buff/second_wind/on_remove()
	var/filter = owner.get_filter("second_wind")
	if (filter)
		owner.remove_filter("second_wind")
	if(owner.cmode_music_override)
		owner.cmode_music_override = null
		owner.cmode_music_override_name = null
		if(owner.cmode) //Only if we're still in combat.
			SSdroning.play_combat_music(owner.cmode_music, owner.client)

	//Apply on removal effects!
	owner.energy_add(-owner.energy)
	owner.stamina_add(owner.max_stamina)

	if(other_tox_heal < 200) //If anything else fully heals your toxins while this is running, and counting the small heal from this, then we won't reset toxins to simulate it having been purged by other means.
		var/adjusted_tox = initial_tox - other_tox_heal
		if(owner.getToxLoss() < adjusted_tox)
			owner.adjustToxLoss(adjusted_tox - owner.getToxLoss()) //Hopefully this will preserve any alternate forms of toxins heals

	return TRUE

/datum/status_effect/buff/second_wind/tick()
	var/obj/effect/temp_visual/heal/H = new /obj/effect/temp_visual/heal_blood(get_turf(owner))
	H.color = outline_colour

	//Process the ticks various effects first
	//Can heal up to blood_regen_cap volume amounts. This recovers current_blood_regen per tick
	if(owner.blood_volume < blood_regen_cap && current_blood_regen)
		owner.blood_volume = min(owner.blood_volume + current_blood_regen, blood_regen_cap)
	//Bleeding Rate Reduction is mainly handled in blood.dm, but we calculate the bleed reduction percent and store it in here.

	//Track other Tox healing just in case
	if(last_tox_tick != owner.getToxLoss()) //Check before we adjust it in here...
		var/tox_diff = last_tox_tick - owner.getToxLoss()
		if(tox_diff > 0)
			other_tox_heal += tox_diff

	//Halved healing, it might barely help you. You use this primarily for stamina and bloodloss to *prevent* death.
	if(owner.health < min_health)
		owner.adjustOxyLoss(-(healing_on_tick/2), 0)
		if(owner.getToxLoss() > 50)
			owner.adjustToxLoss(-(healing_on_tick/2), 0)

	last_tox_tick = owner.getToxLoss() //And record this tick's last seen toxloss after we might've healed some.
	if(last_tox_tick == 0)
		other_tox_heal = 200

	owner.stamina_add(-(healing_on_tick)) //6 stamina per tick. Since the Energy Bar has been filled for free, this ensures they have energy to keep running if needed.

	//Now account for the various reductions over time here, starting with the Phasing effect
	var/time = world.time
	if(!phase_over && time > start_time + phase_length)
		owner.pass_flags &= ~PASSMOB
		REMOVE_TRAIT(owner, TRAIT_GRABIMMUNE, TRAIT_STATUS_EFFECT)
		animate(owner, alpha = original_alpha, time = 2)
		phase_over = TRUE

	if(current_blood_regen > 0 && time > last_regen_tick)
		if(current_blood_regen == blood_regen_start)
			to_chat(owner, span_warningbig("I feel my heartrate starting to slow! The last of the rush is leaving me. Am I safe?"))
		current_blood_regen -= blood_regen_loss
		last_regen_tick = time + blood_regen_loss_tick

	if(current_bleed_reduction > 0 && time > last_reduction_tick)
		if(current_bleed_reduction == bleed_reduction_start)
			REMOVE_TRAIT(owner, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_STATUS_EFFECT)
			to_chat(owner, span_warningbig("My wounds are starting to bleed like before! I need to patch them up before it's too late..."))
		current_bleed_reduction -= bleed_reduction_loss
		last_reduction_tick = time + bleed_reduction_loss_tick

//Debuff for coming off of it! (And a slight will + con boost just to not heavily nuke them after)
/atom/movable/screen/alert/status_effect/debuff/second_wind_crash
	name = "Adrenaline Crash"
	desc = "I- I've hit my limit. I can't keep pushing forward. Was that enough to save me?"
	icon_state = "sluggish"

/datum/status_effect/debuff/second_wind_crash
	id = "second_wind_crash"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/second_wind_crash
	duration = 10 MINUTES
	examine_text = "SUBJECTPRONOUN seems out of it and in partial shock! Just what did they go through?"
	effectedstats = list(STATKEY_STR = -5, STATKEY_PER = -6, STATKEY_INT = -4, STATKEY_CON = 1, STATKEY_WIL = 1)

/////////////////
//SECOND CHANCE//
/////////////////
/datum/status_effect/buff/second_chance //This buff is not used in the second iteration!
	id = "second_chance"
	alert_type = /atom/movable/screen/alert/status_effect/buff/healing
	duration = 5 MINUTES
	tick_interval = 5 SECONDS //Triggers 80 times.
	examine_text = "SUBJECTPRONOUN is beaming with resolve!"
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
		owner.remove_filter("second_chance")
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
	set name = "Second Wind"
	set desc = "Use your Second Wind, granting yourself a temporary buff to get the hell out of that situation. Various effects have different times associated with them."

	if(can_second_wind)
		if(stat == DEAD)
			to_chat(src, span_warningbig("It's unfortunately too late for me to push myself to my limits..."))
			return

		//Limiting Factors!
		var/num_players_nearby_max = 2 //If there are more then this many OTHER (alive and well) players around, you can't activate this along with one of the following conditions.
		var/players_within_range = 7 //Players within this many tiles count towards the nearby max. Currently if they are on-screen at all!
		var/blood_volume_max = BLOOD_VOLUME_OKAY //You have to have less then this amount of blood in you...
		var/cumulative_bruteburntox_threshold = 250 //Or at least this much combined brute, burn and tox damage.
		//This should make it so you can't use it when fully healthy, I guess unless you bleed yourself out but, there's no real way to check for that being done manually or not.

		var/players_in_range = 0
		var/too_many_players = FALSE
		for(var/mob/living/M in get_hearers_in_range(players_within_range, src))
			if(M.client && M.stat == CONSCIOUS)
				players_in_range += 1

			if(players_in_range > num_players_nearby_max)
				too_many_players = TRUE
				break

		if(too_many_players)
			to_chat(src, span_warningbig("I have others around - I'll be okay!"))
			return

		var/bruteburntox = getBruteLoss() + getFireLoss() + getToxLoss()
		if(blood_volume < blood_volume_max || bruteburntox >= cumulative_bruteburntox_threshold) //If either of these are true, second wind activates.
			balloon_alert_to_viewers("Second Wind!")
			visible_message(span_good("[src] steels themselves against all odds!"), span_green("NOW IS NOT MY TIME!!! I need to get out of here!"))
			emote("warcry")
			Jitter(25)
			apply_status_effect(/datum/status_effect/buff/second_wind)
			can_second_wind = FALSE
			//Swap and refresh combat music. So you know how long it's lasting for.
			cmode_music_override = 'modular_causticcove/sound/music/SECOND_WIND.ogg'
			cmode_music_override_name = "Chop Shop Jungle Breaks - ChristmasKrumble666"
			SSdroning.play_combat_music(cmode_music_override, client)
			return
		else
			to_chat(src, span_warningbig("I'm doing fine right now! I don't need my Second Wind yet."))
			return

		/*switch(alert("Do you wish to take your Second Wind?",,"Yes","No")) //The old methods still remain here, but commented out!
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
					addtimer(CALLBACK(src, PROC_REF(clear_second_wind)), 1.5 HOURS)*/

			//if("No")
			//	to_chat(src, span_warn("I change my mind..."))
	else
		to_chat(src, span_warningbig("I can't use my Second Wind at this moment!"))

/////////////////////////////
//SECOND_WIND REGEN SURGERY//
/////////////////////////////
/obj/item/alch/vigor_mix
	name = "reinvigorating mixture"
	desc = "A potent mix of herbs and a touch of the alchemical that can help allow one's body to recover from intense stress and strain resulting from a near-death experience."
	icon_state = "whimsydust"
	major_pot = null
	med_pot = null
	minor_pot = null

/datum/crafting_recipe/roguetown/alchemy/vigor_mix
	name = "reinvigorating mixture"
	category = "Table"
	result = list(
		/obj/item/alch/vigor_mix
	)
	reqs = list(
		/obj/item/alch/manabloompowder = 1,
		/obj/item/alch/ozium = 1,
		/obj/item/alch/airdust = 1,
		/obj/item/alch/calendula = 1
	)
	craftdiff = 4
	verbage_simple = "mix"

/datum/surgery/wind_infusion
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp,
		/datum/surgery_step/retract,
		/datum/surgery_step/infuse_wind,
		/datum/surgery_step/cauterize
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_CHEST)

/datum/surgery_step/infuse_wind
	name = "Apply Reinvigorating Mix"
	implements = list(
		/obj/item/alch/vigor_mix = 80,
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	time = 10 SECONDS
	surgery_flags = SURGERY_BLOODY | SURGERY_INCISED | SURGERY_CLAMPED | SURGERY_RETRACTED
	skill_min = SKILL_LEVEL_EXPERT
	preop_sound = 'sound/surgery/organ2.ogg'
	success_sound = 'sound/surgery/organ1.ogg'
	possible_locs = list(BODY_ZONE_CHEST)

/datum/surgery_step/infuse_wind/validate_target(mob/user, mob/living/carbon/target, target_zone, datum/intent/intent)
	if(target.stat != CONSCIOUS)
		to_chat(user, "[target] is unconcious! They won't be able to respond to the infusion this way, and they might need medical help!")
		return FALSE
	. = ..()
	if(!target.can_second_wind)
		to_chat(user, "They already seem full of extra vigor and energy.")
		return FALSE
	var/obj/item/organ/heart/H = target.getorganslot(ORGAN_SLOT_HEART)
	if(!H)
		to_chat(user, "[target] is missing their heart!")
		return FALSE

/datum/surgery_step/infuse_wind/preop(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	display_results(user, target, span_notice("I begin to revitalize [target]..."),
		span_notice("[user] begins to rub the invigorating mix into [target]'s chest."),
		span_notice("[user] begins to rub the invigorating mix into [target]'s chest."))
	return TRUE

/datum/surgery_step/infuse_wind/success(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	var/revive_pq = PQ_GAIN_REVIVE
	var/mob/living/carbon/C = target
	if(!C)
		to_chat(user, "Only those who can call upon a second wind in their time of need can benefit from this.")
		return FALSE
	display_results(user, target, span_notice("You succeed in revitalizing [target]'s body from the stresses they escaped from."),
		"[user] works the invigorating mix into [target]'s chest.",
		"[user] works the invigorating mix into [target]'s chest.")
	C.can_second_wind = TRUE
	qdel(tool)
	if(target.mind)
		if(revive_pq && user?.ckey)
			adjust_playerquality(revive_pq, user.ckey)
	target.remove_status_effect(/datum/status_effect/debuff/second_wind_crash)	//Removes the Adrenaline Crash debuff if they still have it
	return TRUE

/datum/surgery_step/infuse_wind/failure(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent, success_prob)
	display_results(user, target, span_warning("I screwed up!"),
		span_warning("[user] screws up!"),
		span_notice("[user] works the invigorating mix into [target]'s chest."), TRUE)
	return TRUE


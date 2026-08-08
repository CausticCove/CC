///////////////////// NUTRITION REAGENT PRODUCTION /////////////////

/obj/belly/proc/HandleBellyReagents()
	if(show_liquids && reagentbellymode && reagent_mode_flags & DM_FLAG_REAGENTSNUTRI && reagents.total_volume < custom_max_volume && !isnewplayer(owner))
		if(owner.nutrition >= gen_cost && gen_interval >= gen_time)
			if(owner.nutrition_percent() >= reagent_gen_cost_limit)
				GenerateBellyReagents()
			gen_interval = 0
			return
		gen_interval++

/obj/belly/proc/HandleBellyReagentEffects(var/list/touchable_atoms)
	if(LAZYLEN(contents))
		if(show_liquids && reagent_touches && reagents.total_volume >= 5)
			var/affecting_amt = reagents.total_volume / max(LAZYLEN(touchable_atoms), 1)
			if(affecting_amt > 5)
				affecting_amt = 5
			if(affecting_amt >= 1)
				for(var/mob/living/L in touchable_atoms)
					if(!L.apply_reagents || L.absorbed)
						continue
					if((L.digestable && digest_mode == DM_DIGEST))
						if(!L.permit_healbelly && is_beneficial) // Healing reagents turned off in preferences!
							continue
						if(reagents.total_volume)
							reagents.trans_to(L, affecting_amt, 1, FALSE)
					if(L.permit_healbelly && digest_mode == DM_HEAL)
						if(is_beneficial && reagents.total_volume)
							reagents.trans_to(L, affecting_amt, 1, FALSE)
				for(var/obj/item/I in touchable_atoms)
					if(is_type_in_list(I, GLOB.item_digestion_blacklist))
						continue
					if(reagents.total_volume)
						reagents.trans_to(I, affecting_amt, 1, FALSE)
		SEND_SIGNAL(src, COMSIG_BELLY_UPDATE_VORE_FX, reagents.total_volume) // Signals vore_fx() reagents updates.
		for(var/mob/living/L in contents)
			vore_fx(L, reagents.total_volume)
	if(owner.previewing_belly == src)
		vore_fx(owner, reagents.total_volume)

/obj/belly/proc/GenerateBellyReagents()
	owner.adjust_nutrition(-gen_cost)
	for(var/reagent in generated_reagents)
		reagents.add_reagent(reagent, generated_reagents[reagent])
	if(count_liquid_for_sprite)
		owner.handle_belly_update() //This is run whenever a belly's contents are changed.
	if(LAZYLEN(belly_surrounding))
		SEND_SIGNAL(src, COMSIG_BELLY_UPDATE_VORE_FX, reagents.total_volume) // Signals vore_fx() reagents updates.

//////////////////////////// REAGENT_DIGEST ////////////////////////

/obj/belly/proc/GenerateBellyReagents_digesting()	//The rate isnt based on selected reagent, due to the fact that the price of the reagent is already paid by nutrient not gained.
	if(reagents.total_volume + (digest_nutri_gain * gen_amount) <= custom_max_volume) //By default a reagent with an amount of 1 should result in pred getting 100 units from a full health prey
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] * digest_nutri_gain / gen_cost)
	else
		owner_adjust_nutrition(digest_nutri_gain * owner.get_digestion_efficiency_modifier())
	digest_nutri_gain = 0

/obj/belly/proc/GenerateBellyReagents_digested()
	if(reagents.total_volume <= custom_max_volume - 25 * gen_amount)
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] * 25)
	else
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] / gen_amount * (custom_max_volume - reagents.total_volume))
	digest_nutri_gain = 0

//////////////////////////// REAGENT_ABSORB ////////////////////////

/obj/belly/proc/GenerateBellyReagents_absorbing()
	if(reagents.total_volume <= custom_max_volume - 1.5 * gen_amount) //Going for 1.5 amount of reagent per cycle, can be adjusted in future if need adjustments
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] * 1.5)
	else
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] / gen_amount * (custom_max_volume - reagents.total_volume))

/obj/belly/proc/GenerateBellyReagents_absorbed()
	if(reagents.total_volume <= custom_max_volume - 25 * gen_amount) //Going for 25 amount of reagent for absorbing the prey, can be adjusted in future if need adjustments
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] * 10)
	else
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] / gen_amount * (custom_max_volume - reagents.total_volume))

//////////////////////////// REAGENT_DRAIN ///////////////////////// //Currently not needed, maybe later a specific proc for drain needs to be made - Jack



/////////////////////// FULLNESS MESSAGES //////////////////////

// Get the line that should show up in Examine message if the owner of this belly is examined.
// Returns a string which shoul be appended to the Examine output.
// Yes I know it doesnt look great with 5 almost identical procs in a row, I didnt have a better idea at the time - Jack
/obj/belly/proc/get_reagent_examine_msg1()
	if(!fullness1_messages.len)
		return ""
	var/formatted_message
	var/raw_message = pick(fullness1_messages)

	formatted_message = replacetext(raw_message,"%belly", get_belly_name())
	formatted_message = replacetext(formatted_message, "%pred", owner)

	return(span_red("[formatted_message]<BR>"))

/obj/belly/proc/get_reagent_examine_msg2()
	if(!fullness1_messages.len)
		return ""
	var/formatted_message
	var/raw_message = pick(fullness2_messages)

	formatted_message = replacetext(raw_message,"%belly", get_belly_name())
	formatted_message = replacetext(formatted_message, "%pred", owner)

	return(span_red("[formatted_message]<BR>"))

/obj/belly/proc/get_reagent_examine_msg3()
	if(!fullness1_messages.len)
		return ""
	var/formatted_message
	var/raw_message = pick(fullness3_messages)

	formatted_message = replacetext(raw_message,"%belly", get_belly_name())
	formatted_message = replacetext(formatted_message, "%pred", owner)

	return(span_red("[formatted_message]<BR>"))

/obj/belly/proc/get_reagent_examine_msg4()
	if(!fullness1_messages.len)
		return ""
	var/formatted_message
	var/raw_message = pick(fullness4_messages)

	formatted_message = replacetext(raw_message,"%belly", get_belly_name())
	formatted_message = replacetext(formatted_message, "%pred", owner)

	return(span_red("[formatted_message]<BR>"))

/obj/belly/proc/get_reagent_examine_msg5()
	if(!fullness1_messages.len)
		return ""
	var/formatted_message
	var/raw_message = pick(fullness5_messages)

	formatted_message = replacetext(raw_message,"%belly", get_belly_name())
	formatted_message = replacetext(formatted_message, "%pred", owner)

	return(span_red("[formatted_message]<BR>"))

/////////////////////////// Process Cycle Lite /////////////////////////// CHOMP PCL
/obj/belly/proc/quick_cycle() //For manual belly cycling without straining the bellies subsystem.
	HandleBellyReagents()	//reagent belly stuff.
	// VERY early exit
	if(!contents.len)
		return

	var/to_update = FALSE //Did anything update worthy happen?

/////////////////////////// Exit Early //////////////////////////// CHOMP PCL
	var/list/touchable_atoms = contents - items_preserved
	if(!length(touchable_atoms))
		return

	var/datum/digest_mode/DM = GLOB.digest_modes["[digest_mode]"]
	if(!DM)
		log_runtime("Digest mode [digest_mode] didn't exist in the digest_modes list!!")
		return FALSE
	if(DM.handle_atoms(src, touchable_atoms))
		updateVRPanels()
		return

	var/list/touchable_mobs = null

	var/list/hta_returns = handle_touchable_atoms(touchable_atoms)
	if(islist(hta_returns))
		if(hta_returns["touchable_mobs"])
			touchable_mobs = hta_returns["touchable_mobs"]
		if(hta_returns["to_update"])
			to_update = hta_returns["to_update"]

	if(!LAZYLEN(touchable_mobs))
		return

///////////////////// Time to actually process mobs ///////////////////// CHOMP PCL
	for(var/target in touchable_mobs)
		var/mob/living/L = target
		if(!istype(L))
			continue
		var/list/returns = DM.process_mob(src, target)
		if(istype(returns) && returns["to_update"])
			to_update = TRUE

	if(to_update)
		updateVRPanels()
/////////////////////////// CHOMP PCL END ///////////////////////////

/obj/belly/proc/update_internal_overlay()
	if(LAZYLEN(belly_surrounding))
		SEND_SIGNAL(src, COMSIG_BELLY_UPDATE_VORE_FX, TRUE) // Signals vore_fx() to listening atoms. Atoms must handle appropriate isliving() checks.
	for(var/A in belly_surrounding)
		if(isliving(A))
			vore_fx(A,1)
	if(owner.previewing_belly == src)
		if(isbelly(owner.loc))
			owner.previewing_belly = null
			return
		vore_fx(owner,1)

/obj/belly/deserialize(var/list/data)
	..()
	reagent_chosen = reagentid
	ReagentSwitch()
	STOP_PROCESSING(SSbellies, src)
	STOP_PROCESSING(SSobj, src)
	if(speedy_mob_processing)
		START_PROCESSING(SSobj, src)
	else
		START_PROCESSING(SSbellies, src)

//Our own version of the numbing agent.
/datum/reagent/consumable/numbing_agent
	name = "numbing agent"
	description = "A liquid that causes you to feel numb to pain..."
	reagent_state = LIQUID
	color = "#fAfAfA"
	taste_description = "numbing sensation"
	metabolization_rate = REAGENTS_METABOLISM
	alpha = 200
	nutriment_factor = 0

/datum/reagent/consumable/numbing_agent/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/buff/numbing)
	..()

/datum/status_effect/buff/numbing
	id = "numbing agent"
	alert_type = /atom/movable/screen/alert/status_effect/buff
	duration = 30 SECONDS

/datum/status_effect/buff/numbing/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_NOPAIN, id)

/datum/status_effect/buff/numbing/on_remove()
	REMOVE_TRAIT(owner, TRAIT_NOPAIN, id)
	. = ..()

/mob/living/carbon/proc/ingest(var/datum/reagents/from, var/datum/reagents/target, var/amount = 1, var/multiplier = 1, var/copy = 0)
	if(last_taste_time + 50 < world.time)
		var/datum/reagents/temp = new(amount) //temporary holder used to analyse what gets transfered.
		from.trans_to(temp, amount, multiplier, 1)
		taste(temp)
	return from.trans_to(target,amount,multiplier,copy) //complete transfer

/datum/reagents/proc/get_free_space() // Returns free space.
	return maximum_volume - total_volume

/mob/proc/checkClickCooldown()
	if(next_click > world.time)
		return FALSE
	return TRUE

/mob/proc/setClickCooldown(var/timeout)
	next_click = max(world.time + timeout, next_click)

/atom/proc/living_mobs_in_view(var/range = world.view, var/count_held = FALSE)
	var/list/viewers = oviewers(src, range)
	if(count_held)
		viewers = viewers(src,range)
	var/list/living = list()
	for(var/mob/living/L in viewers)
		living += L
		if(count_held)
			for(var/obj/item/micro/H in L.contents)
				if(istype(H.held_mob, /mob/living))
					living += H.held_mob
	return living

/proc/log_and_message_admins(var/message as text, var/mob/user = usr)
	log_admin(user ? "[key_name(user)] [message]" : "EVENT [message]")
	message_admins(user ? "[key_name_admin(user)] [message]" : "EVENT [message]")

/obj/proc/animate_shake()
	var/init_px = pixel_x
	var/shake_dir = pick(-1, 1)
	animate(src, transform=turn(matrix(), 8*shake_dir), pixel_x=init_px + 2*shake_dir, time=1)
	animate(transform=null, pixel_x=init_px, time=6, easing=ELASTIC_EASING)


/obj/item/storage/proc/drop_contents() // why is this a proc? literally just for RPEDs
	emptyStorage()

/proc/readd_quotes(var/t)
	var/list/repl_chars = list("&#34;" = "\"","&#39;" = "'")
	for(var/char in repl_chars)
		var/index = findtext(t, char)
		while(index)
			t = copytext(t, 1, index) + repl_chars[char] + copytext(t, index+5)
			index = findtext(t, char)
	return t


GLOBAL_LIST_EMPTY(icon_state_lists)
/// Gets the cached icon_state for the provided icon (only cached if its a file).
/// mode=0 will only show the sub-states ("open 0,0" and so on)
/// mode=1 will show the main state names ("open")
/// mode=2 will show all of the states
/proc/cached_icon_states(icon/I, mode=1)
	if(!I)
		return list()
	var/key = I
	var/returnlist = GLOB.icon_state_lists[key]
	if(!returnlist)
		returnlist = icon_states(I, mode)
		if(isfile(I)) // It's something that will stick around
			GLOB.icon_state_lists[key] = returnlist
	return returnlist

/proc/expire_states_cache(key)
	if(GLOB.icon_state_lists[key])
		GLOB.icon_state_lists -= key
		return TRUE
	return FALSE


/*/**
 * handles adding verbs and updating the stat panel browser
 *
 * pass the verb type path to this instead of adding it directly to verbs so the statpanel can update
 * Arguments:
 * * target - Who the verb is being added to, client or mob typepath
 * * verb - typepath to a verb, or a list of verbs, supports lists of lists
 */
/proc/add_verb(client/target, verb_or_list_to_add)
	if(!target)
		CRASH("add_verb called without a target")
	if(IsAdminAdvancedProcCall())
		return
	var/mob/mob_target = null

	if(ismob(target))
		mob_target = target
		target = mob_target.client
	else if(!istype(target, /client))
		CRASH("add_verb called on a non-mob and non-client")
	var/list/verbs_list = list()
	if(!islist(verb_or_list_to_add))
		verbs_list += verb_or_list_to_add
	else
		var/list/verb_listref = verb_or_list_to_add
		var/list/elements_to_process = verb_listref.Copy()
		while(length(elements_to_process))
			var/element_or_list = elements_to_process[length(elements_to_process)] //Last element
			elements_to_process.len--
			if(islist(element_or_list))
				elements_to_process += element_or_list //list/a += list/b adds the contents of b into a, not the reference to the list itself
			else
				verbs_list += element_or_list

	if(mob_target)
		mob_target.verbs += verbs_list
		if(!target)
			return //Our work is done.
	else
		target.verbs += verbs_list

	var/list/output_list = list()
	for(var/thing in verbs_list)
		var/procpath/verb_to_add = thing
		output_list[++output_list.len] = list(verb_to_add.category, verb_to_add.name, verb_to_add.desc)

	//target.statpanel..send_message("add_verb_list", output_list)


/**
 * handles removing verb and sending it to browser to update, use this for removing verbs
 *
 * pass the verb type path to this instead of removing it from verbs so the statpanel can update
 * Arguments:
 * * target - Who the verb is being removed from, client or mob typepath
 * * verb - typepath to a verb, or a list of verbs, supports lists of lists
 */
/proc/remove_verb(client/target, verb_or_list_to_remove)
	if(IsAdminAdvancedProcCall())
		return

	var/mob/mob_target = null
	if(ismob(target))
		mob_target = target
		target = mob_target.client
	else if(!istype(target, /client))
		CRASH("remove_verb called on a non-mob and non-client")

	var/list/verbs_list = list()
	if(!islist(verb_or_list_to_remove))
		verbs_list += verb_or_list_to_remove
	else
		var/list/verb_listref = verb_or_list_to_remove
		var/list/elements_to_process = verb_listref.Copy()
		while(length(elements_to_process))
			var/element_or_list = elements_to_process[length(elements_to_process)] //Last element
			elements_to_process.len--
			if(islist(element_or_list))
				elements_to_process += element_or_list //list/a += list/b adds the contents of b into a, not the reference to the list itself
			else
				verbs_list += element_or_list

	if(mob_target)
		mob_target.verbs -= verbs_list
		if(!target)
			return //Our work is done.
	else
		target.verbs -= verbs_list

	var/list/output_list = list()
	for(var/thing in verbs_list)
		var/procpath/verb_to_remove = thing
		output_list[++output_list.len] = list(verb_to_remove.category, verb_to_remove.name)

	target.statpanel.send_message("remove_verb_list", output_list)
*/


/atom/proc/living_mobs(var/range = world.view, var/count_held = FALSE) //CHOMPEdit Start
	var/list/viewers = oviewers(src,range)
	if(count_held)
		viewers = viewers(src,range)
	var/list/living = list()
	for(var/mob/living/L in viewers)
		living += L
		/*if(count_held) TODO once micros items work again
			for(var/obj/item/holder/H in L.contents)
				if(istype(H.held_mob, /mob/living))
					living += H.held_mob //CHOMPEdit End
					*/
	return living

//Proc to check if a flag is active to use in universal math
/proc/global_flag_check(element, flag)
	if(element & flag)
		return 1
	else
		return 0

/mob/living/proc/getActualFuckingHealth()
	return health

/mob/living/carbon/human/getActualFuckingHealth()
	return getMaxHealth() - ((getBruteLoss() + getFireLoss() + getToxLoss() + getOxyLoss()))

//Siphon the time out of a contract, ending it early and awarding a TRIUMPH to the mob that siphons it.
//This spell works *EXCLUSIVELY* with contracts, it is not intended to be used with any normal loadout or job.
/obj/effect/proc_holder/spell/invoked/siphon_time
	name = "Siphon Time"
	desc = "Siphon the time from the scroll of those that are hunting you. Use this to end their hunt early and to TRIUMPH from your battle! \n\
	Be warned, this will leave you <b>VULNERABLE and EXPOSED<b> for the time being, only use this when you're absolutely sure you can siphon the scroll! \n\
	<b><i>The scroll may ONLY be siphoned from a person's body, or upon your self. It takes 10 seconds to fully channel the spell.</i></b>"
	releasedrain = 50
	chargedrain = 0
	chargetime = 0
	recharge_time = 1 SECONDS
	antimagic_allowed = TRUE
	range = 1 //Requires adjacency, pretty much.

/obj/effect/proc_holder/spell/invoked/siphon_time/cast(list/targets, mob/user = usr)
	if(istype(targets[1], /mob/living) || istype(targets[1], /obj/item/quest_writ))
		var/obj/item/quest_writ/writ

		//If we just target the scroll alone we can siphon.
		if(istype(targets[1], /obj/item/quest_writ))
			writ = targets[1]
			if(!istype(writ.assigned_quest, /datum/quest/kill))
				to_chat(user, span_warningbig("This isn't a kill contract!!!"))
				return
			to_chat(user, span_warning("I must wield the scroll on my person to siphon it."))
			return
		else
			//If there's a better way do tweak this but this is the best I got for finding the writ on a target.
			var/mob/living/M = targets[1]
			for(var/i in M.get_contents())
				if(istype(i, /obj/item/quest_writ))
					writ = i
					if(istype(writ.assigned_quest, /datum/quest/kill))
						break //We found the ACTUAL kill scroll to check.
					else //Keep searching at least.
						continue
			if(isnull(writ))
				to_chat(user, span_warningbig("There's no contract on them to be found!"))
				return
			check_and_siphon_writ(targets[1], writ.assigned_quest, user)
	else//If we aren't a living mob or a contract writ.
		to_chat(user, span_warn("This wouldn't have a contract!"))
		return

//Check if we're actually apart of the tracked atoms and then siphon the quest's time to force it to end early.
/obj/effect/proc_holder/spell/invoked/siphon_time/proc/check_and_siphon_writ(list/targets, datum/quest/kill/quest, mob/living/user)
	var/datum/quest/kill/Q = quest
	var/mob/living/resolved_mob

	//Weakref Resolve...
	for(var/datum/weakref/W in Q.tracked_atoms)
		resolved_mob = W.resolve()

	//If they are the same mob, then channel for 10 seconds to close the battle out.
	if(user == resolved_mob)
		Q.announce_to_bearer("<i><b>They're siphoning the time out of your contract! Stop them!</b></i>")
		user.apply_status_effect(/datum/status_effect/debuff/vulnerable) //Both currently last 10 seconds - Perfect!
		user.apply_status_effect(/datum/status_effect/debuff/exposed)

		 //10 seconds for victory... Come on, you can do it!
		if(do_after(user, 10 SECONDS, target = targets[1]))
			//Announce to the bearer, and the siphoner.
			Q.announce_to_bearer("<b>The quarry siphons the time from your scroll, ending it early...</b>")
			to_chat(user, span_good("<b>You've siphoned the scroll! You feel TRIUMPHANT!</b>"))

			//Clear the quest timers and force a hunt timeout to end the contract early.
			Q.clear_hunt_timers()
			Q.on_hunt_timeout()


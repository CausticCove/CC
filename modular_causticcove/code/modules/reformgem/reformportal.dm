//Testing respawn bullshit because fuck you
/obj/structure/respawn_portal
	name = "mysterious portal"
	desc = "A gate that's said to spit out Necra's unwanted denizens."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "shitportal"
	max_integrity = 99999
	anchored = TRUE
	density = FALSE
	layer = BELOW_OBJ_LAYER
	var/datum/looping_sound/boneloop/soundloop
	var/spawning = FALSE

	attacked_sound = 'sound/vo/mobs/ghost/skullpile_hit.ogg'

/obj/structure/respawn_portal/Initialize()
	. = ..()
	soundloop = new(list(src), FALSE)
	soundloop.start()

/obj/structure/respawn_portal/attack_ghost(mob/dead/observer/user) //Bit Jank for now but just copied over the Reform Option code... Maybe this will work? If a Ghost escapes the belly somehow lol
	/*if(QDELETED(user))
		return
	if(!in_range(src, user))
		return
	user.bring_body()
	user.rise_body()*/

	if(isobserver(user))
		var/mob/dead/observer/T = user
		if(!ismob(T.body_backup))
			//to_chat(user,span_warning("They don't seem to be reformable!"))
			return

		/*var/accepted = tgui_alert(T, "[host] is trying to reform your body! Would you like to get reformed inside [host]'s [lowertext(host.vore_selected.name)]?", "Reforming Attempt", list("Yes", "No"))
		if(accepted != "Yes")
			to_chat(user,span_warning("[T] refused to be reformed!"))
			return
		if(!isbelly(T.loc))
			to_chat(user,span_warning("[T] is no longer inside to be reformed!"))
			to_chat(T,span_warning("You can't be reformed outside of a belly!"))
			return*/

		if(isliving(T.body_backup))
			var/mob/living/body_backup = T.body_backup
			body_backup.revive(TRUE, TRUE) //Second true enables removal of the Zombie Antag Datum
			body_backup.forceMove(src.loc) //Make sure to move the body to the TILE of the portal! Whoops lol
			body_backup.enabled = TRUE
			//body_backup.ajourn = 0
			body_backup.key = T.key
			//body_backup.teleop = null
			T.body_backup = null
			//host.vore_selected.release_specific_contents(T, TRUE)
			/*if(istype(body_backup, /mob/living/simple_animal))
				var/mob/living/simple_animal/sm = body_backup
				if(sm.icon_rest && sm.resting)
					sm.icon_state = sm.icon_rest
				else
					sm.icon_state = sm.icon_living*/
			T.update_icon()
			//announce_ghost_joinleave(T.mind, 0, "They now occupy their body again.")

	qdel(src)

/obj/structure/respawn_portal/Destroy()
	soundloop.stop()
	. = ..()

/mob/dead/observer/proc/bring_body()
	if(!client)
		return
	if(!mind || QDELETED(mind.current))
		to_chat(src, span_warning("I have no body."))
		return
	if(!can_reenter_corpse)
		to_chat(src, span_warning("I cannot re-enter my body."))
		return
	if(mind.current.key && copytext(mind.current.key,1,2)!="@")	//makes sure we don't accidentally kick any clients
		to_chat(usr, span_warning("Another consciousness is in my body... It is resisting me."))
		return
//	stop_all_loops()
	SSdroning.kill_rain(src.client)
	SSdroning.kill_loop(src.client)
	SSdroning.kill_droning(src.client)
	remove_client_colour(/datum/client_colour/monochrome)
	client.change_view(CONFIG_GET(string/default_view))
	client?.verbs -= GLOB.ghost_verbs
	SStgui.on_transfer(src, mind.current) // Transfer NanoUIs.
	mind.remove_antag_datum(/datum/antagonist/zombie)
	mind.current.forceMove(get_turf(src))
	mind.current.key = key
	return TRUE

/mob/dead/observer/proc/rise_body()
	var/mob/living/carbon/human/bigbad = mind.current
	bigbad.revive(TRUE, TRUE)
	bigbad.alpha = 255

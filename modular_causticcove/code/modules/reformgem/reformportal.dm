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

/obj/structure/respawn_portal/attack_ghost(mob/dead/observer/user)
	if(QDELETED(user))
		return
	if(!in_range(src, user))
		return
	user.bring_body()
	user.rise_body()
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

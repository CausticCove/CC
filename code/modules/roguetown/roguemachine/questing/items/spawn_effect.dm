/obj/effect/quest_spawn
	name = "quest spawner"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x"
	anchored = TRUE
	layer = MID_LANDMARK_LAYER
	invisibility = INVISIBILITY_OBSERVER
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

	var/atom/movable/contained_atom
	var/datum/proximity_monitor/proximity_monitor

	//CC Edit - Range var to ahndle prox ranges.
	var/prox_range = 7

/obj/effect/quest_spawn/Initialize(mapload)
	. = ..()
	proximity_monitor = new(src, prox_range) //CC Edit - Proximity Range

/obj/effect/quest_spawn/Destroy(force)
	QDEL_NULL(contained_atom)
	proximity_monitor = null
	. = ..()

/obj/effect/quest_spawn/HasProximity(mob/nearby)
	if(!contained_atom)
		return

	if(!istype(nearby))
		return

	var/datum/component/quest_object/quest_component = GetComponent(/datum/component/quest_object)
	if(!istype(quest_component))
		return

	var/datum/quest/quest = quest_component.quest_ref?.resolve()
	if(!istype(quest))
		return

	var/turf/our_turf = get_turf(src)
	var/turf/scroll_turf = get_turf(quest.quest_scroll_ref?.resolve())
	if(!our_turf || !scroll_turf)
		return

	// Matches blockade_defense's check_arrival() - get_dist alone lets a bearer one level up
	// or down trip the pod.
	if(our_turf.z != scroll_turf.z)
		return

	if(get_dist(our_turf, scroll_turf) > prox_range) //CC Edit - Prox Range
		return

	// Pop every spawner this quest owns at once so the whole encounter materializes together.
	quest.pop_all_spawners()

/// Materializes the contained mob onto our turf with the warning flash + sound.
/obj/effect/quest_spawn/proc/reveal_contained()
	if(!contained_atom)
		return

	var/image/I = image(icon = 'icons/effects/effects.dmi', loc = get_turf(src), icon_state = "mobwarning", layer = 18)
	I.layer = 18
	I.plane = 18
	I.alpha = 125
	I.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	flick_overlay_view(I, 5 SECONDS)

	contained_atom.forceMove(get_turf(src))
	contained_atom = null

	playsound(loc, "plantcross", 100, FALSE, 3)

	qdel(src)

/obj/effect/quest_spawn/ex_act()
	return

//CC Edit - PvP specific quest spawn range.
/obj/effect/quest_spawn/pvp
	name = "pvp quest spawner"
	prox_range = 35
	var/polling = FALSE //So we don't spam polls

/obj/effect/quest_spawn/pvp/reveal_contained()
	if(polling) //Because pollGhostCandidates will sleep/hang the proc chain otherwise...
		return
	poll_ghosts()
	. = ..() //It'll continue after the poll completes.

/obj/effect/quest_spawn/pvp/proc/poll_ghosts()
	if(istype(contained_atom, /mob/living/carbon/human)) //Should only work with human mobs.
		//Handle mind transfer.
		var/mob/living/M = contained_atom

		polling = TRUE //We only attempt to poll once every time a player comes near. If they don't accept quick enough they can't play as one.
		//Defaults to NPC AI if no one accepts the poll.
		var/list/candidates = pollGhostCandidates("A challenger approaches! Will you assume the position as [M.name], and defend yourself?!", ROLE_ASCENDED_BOUNTY, null, null, 10 SECONDS, POLL_IGNORE_ASCENDED_BOUNTY)
		if(!LAZYLEN(candidates))
			return

		var/mob/C = pick(candidates)
		if(!C || !istype(C, /mob/dead))
			return FALSE

		if(istype(C, /mob/dead/new_player))
			var/mob/dead/new_player/N = C
			N.close_spawn_windows()

		M.key = C.key
		REMOVE_TRAIT(M, TRAIT_NPC_EXAMINE, TRAIT_GENERIC)

		//Just something to warn other players that an actual player has accepted the ghost role poll.
		//We assume that the person playing doesn't just give up neither.
		M.add_filter("pvp_outline", 1, list("type" = "drop_shadow", "color" = "#ffee00", "size" = 0.1))

		//Now, to grant the mob special Traits and Skills to assist it in battle and roaming.
		ADD_TRAIT(M, TRAIT_TEMPO, TRAIT_GENERIC) //To deal with bigger parties.
		ADD_TRAIT(src, TRAIT_LONGSTRIDER, TRAIT_GENERIC) //So they can free roam on bad turfs and actually retreat to heal.
		M.adjust_skillrank(/datum/skill/misc/tracking, 6, TRUE) //You should be able to hunt your hunters back!
		M.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE) //You should be able to go anywhere you'd like!
		M.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		M.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE) //RP and reading or some shit.
		M.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/siphon_time) //So you can siphon the scroll early and earn a TRIUMPH.
		return
//CC Edit End - PvP specific quest spawn range.

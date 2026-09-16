/mob/living/Bump(atom/movable/AM)
	//. = ..()
	if(isliving(AM))
		var/mob/living/L = AM
		if(buckled != AM && (((confused || IsOffBalanced() || has_status_effect(/datum/status_effect/buff/drunk) || is_blind(L)) && stat == CONSCIOUS && prob(50) && m_intent==MOVE_INTENT_RUN) /*|| flying && flight_vore*/)) //Caustic - Flying Vore will require Harpy support? Or... something.
			L.stumble_into(src)
	return ..()

// Because flips toggle density
/mob/living/Crossed(var/atom/movable/AM)
	if(isliving(AM) && isturf(loc) && AM != src)
		var/mob/living/AMV = AM
		if(AMV.buckled != src && (((AMV.confused || AMV.IsOffBalanced() || AMV.has_status_effect(/datum/status_effect/buff/drunk) || is_blind(AMV)) && AMV.stat == CONSCIOUS && prob(50) && AMV.m_intent==MOVE_INTENT_RUN) /*|| AMV.flying && AMV.flight_vore*/))
			INVOKE_ASYNC(src,TYPE_PROC_REF(/mob/living, stumble_into), AMV)
	..()

/mob/living/proc/stumble_into(mob/living/M)
	if(buckled || M.buckled)
		return

	//Stumblevore occurs here. Look at the 'stumblevore' element for more information.
	if(SEND_SIGNAL(src, COMSIG_LIVING_STUMBLED_INTO, M) & CANCEL_STUMBLED_INTO)
		return

	playsound(src, "punch", 25, 1, -1)
	M.Stun(4)
	//M.stop_flying()

	/*if(ishuman(src))
		var/mob/living/carbon/human/S = src
		if(S.species.lightweight == 1)
			visible_message(span_warning("[M] carelessly bowls [src] over!"))
			M.forceMove(get_turf(src))
			M.apply_damage(0.5, BRUTE)
			Stun(4)
			//stop_flying()
			apply_damage(0.5, BRUTE)
			return*/

	if(round(weight) > 474)
		var/throwtarget = get_edge_target_turf(M, REVERSE_DIR(M.dir))
		visible_message(span_warning("[M] bounces backwards off of [src]'s plush body!"))
		M.throw_at(throwtarget, 5, 1) //it's funny and nobdy ever takes weight >474 so this is extremely rare
		return

	visible_message(span_warning("[M] trips over [src]!"))
	M.forceMove(get_turf(src))
	M.apply_damage(1, BRUTE)

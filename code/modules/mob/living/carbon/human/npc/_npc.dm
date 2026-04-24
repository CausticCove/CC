#define ATTACKS_UNTIL_SWITCHING_UP 3 // How many attack a NPC will use on the same place before switching it up
GLOBAL_LIST_INIT(eatlines, world.file2list("strings/rt/evileatlines.txt"))

//CC Edit Begin

// These are internal variables that are handled with the check_target_type() proc
// These are cached in last_targets in an alist for quickly referencing the targets so we do not have to check on each retaliate

//For simple mobs or mobs with no mind.
#define TARGET_SIMPLE 0 
//For ranged mobs, this includes archers, mages, and throwers alike.
#define TARGET_LIKELY_RANGED 1
//For melee mobs. This is self explanatory.
#define TARGET_LIKELY_MELEE 2
//For when the likelihood is above a certain threshold on both. Treat our targets in a special way.
#define TARGET_LIKELY_BOTH 3
//For when we are uncertain and need to check. Resets when we go back to idle.
#define TARGET_UNCERTAIN 4

//This is the actual style type, we compare this to the target type and return true or false.
#define STYLE_BOTH 3

#define STYLE_MELEE 2

#define STYLE_RANGED 1

#define STYLE_SIMPLE 0

//Spells will not be casted if under A FOURTH of our stamina.
#define SPELL_STAM_LIMIT_QUARTER 4
//Spells will not be casted if under A THIRD of our stamina.
#define SPELL_STAM_LIMIT_THIRD 3
//Spells will not be casted if under HALF of our stamina.
#define SPELL_STAM_LIMIT_HALF 2

//CC Edit End

/mob/living/carbon/human
	var/aggressive=0 //0= retaliate only
	var/frustration=0
	var/pathing_frustration=0
	var/pickupTimer=0
	var/list/enemies = list()
	var/list/friends = list()
	var/mob/living/target
	var/obj/item/pickupTarget
	var/atom/pathfinding_target
	var/mode = NPC_AI_OFF
	var/list/myPath = list()
	var/is_currently_pathing = FALSE
	var/list/blacklistItems = list()
	var/maxStepsTick = 7 // can move a screen's width in one turn
	var/resisting = FALSE
	var/pickpocketing = FALSE
	var/del_on_deaggro = null
	var/last_aggro_loss = null
	var/wander = TRUE
	var/ai_when_client = FALSE
	var/next_idle = 0
	var/next_seek = 0
	var/next_passive_detect = 0
	var/flee_in_pain = FALSE
	/// When is the next time we'll attempt to stand up?
	var/next_stand_attempt = 0
	var/resist_attempts = 0
	var/ai_currently_active = FALSE
	var/attack_speed = 0

	/// (BOOL) If TRUE, the mob will taunt players in certain situations. Psychological warfare!
	var/rude = FALSE
	/// (BOOL) If TRUE, the mob will attempt to climb trees to chase players. Evil!
	var/tree_climber = FALSE
	/// The number of steps moved so far, used to limit the total number of steps per turn + affect attack reaction time
	var/steps_moved_this_turn = 0
	/// Whether or not to check for targets above us.
	var/find_targets_above = TRUE

	// LEAPING
	/// The probability that an NPC will leap/jump if certain conditions are met.
	var/npc_jump_chance = 5
	/// If the NPC's target is more than this many tiles away, they will try to leap ahead on their path.
	var/npc_jump_distance = 4
	/// When above this amount of stamina (Stamina is stamina damage), the NPC will not attempt to jump.
	var/npc_max_jump_stamina = 50

	/// Attack Selection
	var/attack_on_zone = 1

	///What distance should we be checking for interesting things when considering idling/deidling? Defaults to AI_DEFAULT_INTERESTING_DIST
	var/interesting_dist = AI_DEFAULT_INTERESTING_DIST
	///our current cell grid
	var/datum/cell_tracker/our_cells

	//If we utilize special attacks or not; All is handled within do_best_melee_attack() chain.
	var/special_attacker = FALSE

	//If we utilize our intents further outside of strong intent.
	var/smart_combatant = FALSE

	//CC Edit Begin
	//////
	//Do not use or define these variables unless you know what you're doing.

	//Internal Var - utilized for stationary spellcasting spells. Please see the '/obj/effect/proc_holder/spell/invoked/blood_heal/cast(' proc for a better example.
	var/allow_movement = TRUE

	//Internal Var - Determines the target's fighting style. Picks between Melee, Ranged, or Both. Simple mobs are handled differently.
	//This is used internally alongside check_target_style() to check if the target is ranged, or melee, upon first encounter.
	var/target_type = TARGET_UNCERTAIN 

	//Internal Var - The last targets we were targeting until we went back to idle. Cache all of the target's fighting styles unless a new target joins us.
	var/list/last_targets = alist()

	//Internal Var - Retains the target we need to keep healing until said target is back to a certain threshold.
	var/list/cur_heal_target = list()

	//////

	//If we utilize spells when casting. Spell casting logic is handled in the proc /handle_spell_casting_logic()
	var/spell_caster = FALSE
	
	//The offset to apply to spells on mobs so they take longer to cast each time they're cast. By default this is 1 second. You can also reduce spell CD's with this as well.
	//If a spell's CD is below 0 it will not apply any CD on a spell. The mob will still burn through energy upon casting.
	var/spell_cd_offset = 1 SECONDS

	//How long we will channel stationary spells for until we are allowed to move again. Default is 3 seconds. Negative values do not work.
	var/spell_channel_duration = 3 SECONDS

	//The limit at which mobs will not fire spells if their /STAMINA/ gets below THIS amount. Default is set to SPELL_COST_QUARTER
	//You can override this with a custom input to set a certain limit outside of these defines as well.
	var/spell_cost_limit = SPELL_STAM_LIMIT_THIRD

	//The minimum distance we should path towards our target. This is primarily for ranged mobs like mages who are not active fighters. 
	//They do not have appropriate fleeing AI or kiting AI, I do not want this nor should they have this as it'd be REALLY annoying to fight NPC's with those mechanics.
	//They WILL however chase after a target that hits them with a melee weapon or ANY object for as long as they remain within their aggro range for making them not have awkward melee fighting mechanics.
	var/min_dis_to_target = 1

	//Added to the value for when to consider going back to their minimum distance. For example: When min_dis_to_target is set to 3, and tether_distance is set to 1, an NPC will chase a target
	// For up to 4 tiles before returning to their default 3 tile minimum distance. Useful for handling melee combat and making the melee combat flow feel better for when an NPC returns to their default ranged state.
	var/tether_distance = 3 // Default is 3. Mobs will most likely not lose melee aggro unless the target fully runs away.

	//CC Edit End

/mob/living/carbon/human/Initialize()
	. = ..()
	our_cells = new(interesting_dist, interesting_dist, 1)
	set_new_cells()

/mob/living/carbon/human/Destroy()
	our_cells = null
	return ..()

/mob/living/carbon/human/proc/IsStandingStill()
	return doing || resisting || pickpocketing

/mob/living/carbon/human/proc/handle_ai()
	if(client)
		if(!ai_when_client)
			return
	START_PROCESSING(SShumannpc,src)

/mob/living/carbon/human/proc/check_mouth_grabbed()
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	if(!head)
		return FALSE
	for(var/obj/item/grabbing/grab in head.grabbedby)
		if(grab.sublimb_grabbed == BODY_ZONE_PRECISE_MOUTH)
			return TRUE
	return FALSE

/mob/living/carbon/human/proc/npc_should_resist(ignore_grab = FALSE)
	// zombie antags don't try to resist non-mouthgrabs
	if(mind?.has_antag_datum(/datum/antagonist/zombie) && !check_mouth_grabbed())
		ignore_grab ||= TRUE
	if(on_fire || buckled || restrained(ignore_grab = ignore_grab))
		return TRUE
	if(istype(loc,/obj/item/holder))
		return TRUE
	return FALSE

/mob/living/carbon/human/proc/process_ai()
	if(IsDeadOrIncap())
		walk_to(src,0)
		return stat == DEAD // only stop processing if we're dead-dead
	// we assume we're conscious after this point since we aren't dead or incapacitated
	if(client)
		if(!ai_when_client)
			walk_to(src,0)
			return TRUE //remove us from processing
	cmode = 1
	update_cone_show()
	steps_moved_this_turn = 0
	if(resisting) // already busy from a prior turn! stop!
		walk_to(src, 0)
		NPC_THINK("Still resisting, passing turn!")
		return // Your turn is already being used to continue a resist.
	if(npc_should_resist())
		resisting = TRUE
		walk_to(src,0)
		NPC_THINK("Starting to resist!")
		resist()
		resisting = FALSE
		return // Resisting passes your turn, you can't attack.
	if((mobility_flags & MOBILITY_CANSTAND) && !(mobility_flags & MOBILITY_STAND) && (world.time >= next_stand_attempt))
		resisting = TRUE
		npc_stand()
		resisting = FALSE
		return // Standing passes your turn, you can't attack.
	// If we're pathfinding somewhere, move along that path
	if(length(myPath))
		steps_moved_this_turn += move_along_path()
		// We could return here if we wanted to make moving use your turn.
	// Special case: Taunt people hiding in trees directly above us.
	var/turf/my_turf = get_turf(src)
	var/turf/their_turf = get_turf(target)
	if(!IsDeadOrIncap() && !length(myPath) && their_turf && my_turf.z < their_turf.z && my_turf.Distance_cardinal_3d(their_turf, src) == 1 && istransparentturf(their_turf))
		// They're directly above us, now are they in a tree?
		var/obj/structure/flora/newbranch/the_branch = locate() in their_turf
		var/should_try_taunt = prob(5) // this is a var so that when debugging i can just set it to TRUE
		if(tree_climber && can_zTravel(their_turf, UP)) // TIME TO BE EVIL
			if(the_branch)
				// follow the branch to get to the tree
				var/obj/structure/flora/newtree/the_tree = locate() in get_step_multiz(the_branch, GLOB.reverse_dir[the_branch.dir]|DOWN)
				the_tree.attack_hand(src)
				return TRUE // climbing uses your turn
		else if(rude && should_try_taunt) // taunt the enemy!
			npc_taunt_target()
			// don't return, taunting is a free action
	if(!handle_combat())
		if(mode == NPC_AI_IDLE && !pickupTarget)
			allow_movement = TRUE // CC Edit - Default to allowing movement to ensure we aren't frozen when we go out of combat.
			npc_idle()
			if(del_on_deaggro && last_aggro_loss && (world.time >= last_aggro_loss + del_on_deaggro))
				if(deaggrodel())
					return TRUE

// separate override to ensure it happens last
/mob/living/carbon/human/process_ai()
	. = ..()
	// TODO: Better converted-deadite AI than this.
	if(mind?.has_antag_datum(/datum/antagonist/zombie))
		try_do_deadite_idle() // sort of a misnomer, just handles zombie noises

/mob/living/carbon/human/proc/npc_stand()
	if(next_move > world.time)
		return
	walk_to(src, 0) // no walking while you stand up
	NPC_THINK("Trying to stand!")
	if(stand_up())
		next_stand_attempt = world.time
	else
		// Wait 1-3 seconds between attempts.
		next_stand_attempt = world.time + rand(1 SECONDS, 3 SECONDS)

/mob/living/carbon/human/proc/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle + rand(3 SECONDS, 5 SECONDS))
		return
	NPC_THINK("Idle...")
	next_idle = world.time + rand(3 SECONDS, 5 SECONDS)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc))
		if(wander)
			if(prob(50))
				var/turf/T = get_step(loc,pick(GLOB.cardinals))
				if(T.can_traverse_safely(src)) // Don't wander into lava or open space unless we're immune to it/can't fall.
					step_towards(src, T, cached_multiplicative_slowdown)
			else
				setDir(turn(dir, pick(90,-90)))
		else
			setDir(turn(dir, pick(90,-90)))
	if(prob(3))
		emote("idle")

/mob/living/carbon/human/proc/deaggrodel()
	//Caustic Edit - Add expel everything for VNPCs
	if(vore_organs.len >0)
		for(var/obj/belly/B in vore_organs)
			if(B.contents.len > 0)
				return FALSE
	//Caustic Edit End
	if(aggressive)
		for(var/mob/living/L in view(7)) // scan for enemies
			if( should_target(L) && (L != src))
				if(L.stat != DEAD)
					retaliate(L)
					return FALSE
	if(!target)
//		var/escape_path
//		for(var/obj/structure/flora/RT in view(6, src))
//			if(istype(RT,/obj/structure/table/wood/treestump))
//				continue
//			if(istype(RT,/obj/structure/flora/roguetree))
//				escape_path = RT
//				break
//			if(istype(RT,/obj/structure/flora/rogueshroom))
//				escape_path = RT
//				break
	//	if(escape_path)
		qdel(src)
		return TRUE

/// Attempts to jump towards our next pathfinding step if it's far enough, or our target if we don't have a path planned.
/mob/living/carbon/human/proc/npc_try_jump(force = FALSE)
	if(!prob(npc_jump_chance))
		return FALSE
	if(next_move > world.time) // Jumped too recently!
		return FALSE
	if(stamina > npc_max_jump_stamina)
		NPC_THINK("Too little stamina to jump, skipping! My current stamina is [stamina], max is [npc_max_jump_stamina].")
		return FALSE
	var/turf/our_turf = get_turf(src)
	if(our_turf.Distance_cardinal(get_turf(target), src) <= npc_jump_distance)
		return FALSE
	if(!check_armor_skill() || get_item_by_slot(SLOT_LEGCUFFED)) // don't even try if we could only make it 1 tile
		return FALSE
	// Find the turf to jump to.
	var/atom/jump_destination
	var/old_m_intent = m_intent
	m_intent = MOVE_INTENT_RUN
	var/jump_range = get_jump_range()
	var/squared_jump_range = jump_range ** 2
	/// used when trying to intentionally overshoot to move quicker
	var/squared_jump_range_bonus = HAS_TRAIT(src, TRAIT_LEAPER) ? squared_jump_range : (jump_range + 1) ** 2
	// if we have no path or can try to jump ahead in a straight line, try it
	if(!length(myPath) || inLineOfTravel(src, target))
		jump_destination = target
	else
		// Find the farthest-along tile in our path that's within range and closest to our target.
		// Basically: Try to cut ahead.
		var/min_squared_distance = INFINITY
		for(var/i in 1 to length(myPath))
			var/turf/new_destination = myPath[i]
			var/new_squared_distance = get_dist_euclidean_squared(target, new_destination)
			var/new_jump_dist = get_dist_euclidean_squared(src, new_destination)
			if(!new_destination.can_traverse_safely(src))
				continue
			if(new_squared_distance > min_squared_distance)
				continue
			// Handle intentional overshoot
			if(new_jump_dist > squared_jump_range && squared_jump_range_bonus > new_jump_dist)
				var/turf/prior_turf = get_step_towards(new_destination, src) // backtrack a tile
				if(!prior_turf.can_traverse_safely(src)) // we'd be in danger if we tried to overshoot
					continue
			if(new_jump_dist <= squared_jump_range_bonus && inLineOfTravel(src, new_destination))
				jump_destination = new_destination
				min_squared_distance = new_squared_distance
	if(!jump_destination)
		return FALSE
	var/jump_dist = get_dist_euclidean_squared(src, jump_destination)
	if(jump_dist < (jump_range - 1) ** 2) // check if we can just do a slower jump to save stam
		m_intent = MOVE_INTENT_WALK
	else if(!HAS_TRAIT(src, TRAIT_LEAPER)) // handle overshoot checks
		if(jump_dist <= squared_jump_range) // we're not intending to explicitly overshoot
			var/overshoot_dir = get_dir(src, jump_destination)
			var/turf/overshoot_turf = get_step(jump_destination, overshoot_dir)
			if(overshoot_turf.density || !overshoot_turf.can_traverse_safely(src))
				// we'd overshoot and land somewhere unsafe, or slam into a wall
				return FALSE
	if(jump_dist > 1)
		NPC_THINK("Trying to jump to [jump_destination]!")
		if(mmb_intent?.type != INTENT_JUMP)
			mmb_intent = new INTENT_JUMP(src) // switch to jump intent
		used_intent = mmb_intent
		. = jump_action(jump_destination) // return whether the jump succeeded or failed
		used_intent = null
		QDEL_NULL(mmb_intent) // unset our intent after
		m_intent = old_m_intent
		if(.)
			clear_path()
			start_pathing_to(target) // regenerate path now that we've jumped
		return
	m_intent = old_m_intent
	return FALSE

/// Force the NPC to jump to a specific destination. Handles 
/mob/living/carbon/human/proc/npc_try_jump_to(atom/jump_destination)
	if(!jump_destination)
		return FALSE
	if(next_move > world.time) // Jumped too recently!
		return FALSE
	var/old_m_intent = m_intent
	m_intent = MOVE_INTENT_RUN
	var/jump_range = get_jump_range()
	var/jump_dist = get_dist_euclidean_squared(src, jump_destination)
	if(jump_dist < (jump_range - 2) ** 2) // check if we can just do a slower jump to save stam
		m_intent = MOVE_INTENT_WALK
	if(jump_dist > 0)
		NPC_THINK("Trying to jump to [jump_destination]!")
		if(mmb_intent?.type != INTENT_JUMP)
			mmb_intent = new INTENT_JUMP(src) // switch to jump intent
		used_intent = mmb_intent
		. = jump_action(jump_destination) // return whether the jump succeeded or failed
		used_intent = null
		QDEL_NULL(mmb_intent) // unset our intent after
		m_intent = old_m_intent
		return
	m_intent = old_m_intent
	return FALSE

/// unsets my_path if it's not valid. that's it that's the proc
/mob/living/carbon/human/proc/validate_path()
	var/give_up = FALSE
	if(pathing_frustration > 8)
		NPC_THINK("Giving up on this path because of frustration!")
		give_up = TRUE
	if(length(myPath) && get_dist(src, myPath[1]) > 5)
		NPC_THINK("Giving up on this path because of distance!")
		give_up = TRUE
	if(give_up)
		clear_path()
	return !give_up // returns TRUE if the path is valid, FALSE otherwise

/mob/living/carbon/human/proc/clear_path()
	myPath = list()
	pathing_frustration = 0
	pathfinding_target = null

/// progress along an existing path or cancel it
/// returns # of steps taken
/mob/living/carbon/human/proc/move_along_path()
	//CC Edit
	//If we are not allowed to move, we shouldn't move again until we are able to.
	if(!allow_movement)
		return
	//CC Edit
	if(!length(myPath))
		// no path, quit early
		NPC_THINK("Tried to move along a nonexistent path?!")
		return 0

	if(get_dist(src, myPath[1]) > 3) // too far away from our current path to continue
		if(!npc_try_jump()) // try jumping to get back on course
			pathing_frustration++
			NPC_THINK("TOO FAR! Strike [pathing_frustration]!")
			return 0
	// var/move_started = world.time
	var/old_pathfinding_target = pathfinding_target
	var/steps_to_take = maxStepsTick - steps_moved_this_turn // if this isn't our first movement step, limit how many we can take
	for(var/movement_turn in 1 to steps_to_take)
		if(!length(myPath))
			NPC_THINK("MOVEMENT TURN [movement_turn]: Path complete!")
			return
		// Try jumping prior to validation to avoid losing our path from being too far away.
		// Basically a catch-up step. Won't run every time.
		if(npc_try_jump())
			NPC_THINK("MOVEMENT TURN [movement_turn]: Jumped, waiting 1ds!")
			sleep(1)
			continue
		if(!validate_path())
			NPC_THINK("MOVEMENT TURN [movement_turn]: Path invalidated!")
			return
		if(pathfinding_target != old_pathfinding_target)
			NPC_THINK("Changed pathfinding target, ending movement!")
			return
		// We have a valid path, but our target might be next to us due to movement. Check and bail if so.
		// Only apply this to movables; if we're going to a specific turf we want to go ONTO it.
		else if(ismovable(pathfinding_target) && z == pathfinding_target.z && Adjacent(pathfinding_target))
			clear_path()
			return
		var/movespeed = cached_multiplicative_slowdown // this is recalculated on Moved() so we don't need to do it ourselves
		if(!(mobility_flags & MOBILITY_MOVE) || IsDeadOrIncap() || IsStandingStill() || is_move_blocked_by_grab())
			NPC_THINK("MOVEMENT TURN [movement_turn]: Waiting to move!")
			sleep(1) // wait 1ds to see if we're finished/recovered
			continue
		// this is unnecessary, we don't re-call handle_ai until this is done
/* 		if(world.time > (move_started + /datum/controller/subsystem/humannpc::wait))
			// we ran out of time and started the next tick!
			NPC_THINK("MOVEMENT TURN [movement_turn]: Out of time to move!")
			return */
		var/turf/next_path_turf = myPath[1]
		var/move_dir = get_dir(src, myPath[1])
		var/turf/next_step = get_step(src, move_dir)
		if(next_path_turf.z != z) // if moving up or down z-levels, need specific checks
			var/obj/structure/stairs/the_stairs = locate() in get_turf(src)
			if(!the_stairs && HAS_TRAIT(src, TRAIT_ZJUMP)) // do a fancy Z-jump!
				if(npc_try_jump_to(next_path_turf))
					pathing_frustration = 0
					myPath -= myPath[1]
					NPC_THINK("MOVEMENT TURN [movement_turn]: Z-jump succeeded, movement on cooldown for [movespeed/10] seconds!")
					sleep(movespeed) // wait until next move
				else
					var/time_to_wait = AmountOffBalanced() || (1 SECONDS)
					NPC_THINK("MOVEMENT TURN [movement_turn]: Z-jump failed, trying again in [time_to_wait/10] seconds!")
					pathing_frustration++
					sleep(time_to_wait)
				continue
			// if moving up, go in the direction of the stairs, else go the opposite direction
			if(the_stairs)
				move_dir = next_path_turf.z > z ? the_stairs.dir : GLOB.reverse_dir[the_stairs.dir]
				next_step = the_stairs.get_target_loc(move_dir)
		if(!next_step)
			pathing_frustration++
			NPC_THINK("MOVEMENT TURN [movement_turn]: Unable to find turf to move to! Strike [pathing_frustration]!")
			myPath -= myPath[1]
			continue
		if(!next_step.can_traverse_safely(src)) // some sort of hazard we'd want to jump over!
			var/old_m_intent = m_intent
			var/turf/jump_turf = LAZYACCESS(myPath, 2)
			if(jump_turf && !jump_turf.can_traverse_safely(src)) // we can jump 2-tile gaps if we sprint
				jump_turf = LAZYACCESS(myPath, 3)
				if(jump_turf)
					m_intent = MOVE_INTENT_RUN
			if(!jump_turf) // our path's screwed, give up and try again later
				clear_path()
				return
			var/did_jump = npc_try_jump_to(jump_turf)
			m_intent = old_m_intent
			if(did_jump)
				myPath.Cut(1, 3)
				pathing_frustration = 0
				NPC_THINK("MOVEMENT TURN [movement_turn]: Movement on cooldown for [movespeed/10] seconds!")
				sleep(movespeed) // wait until next move
			else
				var/time_to_wait = AmountOffBalanced() || (1 SECONDS)
				NPC_THINK("MOVEMENT TURN [movement_turn]: Jump failed, trying again in [time_to_wait/10] seconds!")
				pathing_frustration++
				sleep(time_to_wait)
			continue
		else if(!step(src, move_dir, cached_multiplicative_slowdown)) // try to move onto or along our path
			for(var/obj/structure/O in next_step)
				if(O.density && O.climbable)
					NPC_THINK("MOVEMENT TURN [movement_turn]: Trying to climb over [O]!")
					O.climb_structure(src)
					break
		if(loc != next_step) // movement failed and so did climb_structure
			pathing_frustration++
			NPC_THINK("MOVEMENT TURN [movement_turn]: Move failed! Strike [pathing_frustration]!")
			sleep(1)
		else if(loc == myPath[1]) // if we made it to the right part of our path
			.++
			pathing_frustration = 0
			myPath -= myPath[1]
			NPC_THINK("MOVEMENT TURN [movement_turn]: Movement on cooldown for [movespeed/10] seconds!")
			sleep(movespeed) // wait until next move	
// blocks, but only while path is being calculated
/mob/living/carbon/human/proc/start_pathing_to(new_target)
	if(!new_target)
		back_to_idle()
		return FALSE
	pathfinding_target = new_target
	var/turf/turf_of_target = get_turf(new_target)
	if(!turf_of_target)
		back_to_idle()
		return FALSE
	if(is_currently_pathing)
		NPC_THINK("Already pathing!")
		return FALSE
	if(!length(myPath)) // need a new path
		var/const/MAX_RANGE_FIND = 32
		NPC_THINK("Pathfinding to [pathfinding_target]...")
		is_currently_pathing = TRUE
		myPath = get_path_to(src, turf_of_target, TYPE_PROC_REF(/turf, Heuristic_cardinal_3d), MAX_RANGE_FIND + 1, 250, 1, adjacent = TYPE_PROC_REF(/turf, reachableTurftest3d), mintargetdist = min_dis_to_target) //CC Edit added in the mintargetdist; Wow this line is long!
		is_currently_pathing = FALSE
		if(length(myPath))
			myPath -= get_turf(src) // remove the turf we start on
			pathing_frustration = 0
			NPC_THINK("Found a path with length [length(myPath)]!")
			return TRUE
	NPC_THINK("Failed to find a path!")
	//too far away or pathing failed; don't immediately lose aggro though
	return FALSE

// taken from /mob/living/carbon/human/interactive/
/mob/living/carbon/human/proc/IsDeadOrIncap(checkDead = TRUE)
	if(!(mobility_flags & MOBILITY_FLAGS_INTERACTION))
		return TRUE
	if(health <= 0 && checkDead)
		return TRUE
	if(incapacitated(ignore_restraints = TRUE))
		return TRUE
	return FALSE

/mob/living/carbon/human/proc/equip_item(obj/item/I)
	if(I.loc == src)
		return TRUE

	if(I.anchored)
		blacklistItems[I] ++
		return FALSE

	// WEAPONS
	if(istype(I, /obj/item))
		if(put_in_hands(I))
			return TRUE

	blacklistItems[I] ++
	return FALSE

/mob/living/carbon/human/proc/pickup_and_wear(obj/item/clothing/C)
	if(!equip_to_appropriate_slot(C))
		monkeyDrop(get_item_by_slot(C)) // remove the existing item if worn
		addtimer(CALLBACK(src, PROC_REF(equip_to_appropriate_slot), C), 5)

/mob/living/carbon/human/proc/monkeyDrop(obj/item/A)
	if(A)
		dropItemToGround(A, TRUE)

/mob/living/carbon/human/resist_restraints()
	var/obj/item/I = null
	if(handcuffed)
		I = handcuffed
	else if(legcuffed)
		I = legcuffed
	if(I)
		changeNext_move(CLICK_CD_BREAKOUT)
		last_special = world.time + CLICK_CD_BREAKOUT
		cuff_resist(I)

/mob/living/carbon/human/proc/should_target(mob/living/L)
	if(HAS_TRAIT(src, TRAIT_PACIFISM))
		return FALSE

	//CC Edit Begin
	if(src.z != L.z) //If our target isn't on our Z level then we should move around randomly to prevent cheese.
		var/possible_turfs = list()
		for(var/turf/T in view(5, src)) //Lets not roam TOO far now...
			possible_turfs += T
		var/turf/my_turf = get_turf(src)
		var/turf/target_turf = get_turf(pick(possible_turfs))
		if(my_turf.Distance_cardinal_3d(target_turf, src) > 1)
			if(!length(myPath)) // create a new path to the target
				clear_path()
				start_pathing_to(target_turf)
		return FALSE
	//CC Edit End

	if(L == src)
		return FALSE

	if (L.alpha == 0 && L.rogue_sneaking)
		return FALSE

	if(!is_in_zweb(src.z,L.z))
		return FALSE

	if(L.stat == DEAD)
		return FALSE

	if(L.InFullCritical())
		return FALSE

	if(L.name in friends)
		return FALSE

	if(enemies[L])
		return TRUE

	if(aggressive && !faction_check_mob(L))
		return TRUE

	return FALSE

/mob/living/carbon/human/proc/npc_try_backstep()
	// JUKE: backstep after attacking if you're fast and have movement left
	// Also made base chance 30% instead of 5% as per original
	var/const/base_juke_chance = 15
	// for every point of STASPD above 10 you get an extra 5% juke chance
	var/const/min_spd_for_juke = 10
	var/const/juke_per_overspd = 5 
	if(mind?.has_antag_datum(/datum/antagonist/zombie)) // deadites cannot juke
		return FALSE
	if(!target)
		return FALSE
	if(steps_moved_this_turn >= maxStepsTick) // no movement left over
		return FALSE
	var/juke_spd_bonus = STASPD > min_spd_for_juke ? (STASPD - min_spd_for_juke) * juke_per_overspd : 0
	if(!prob(base_juke_chance + juke_spd_bonus))
		NPC_THINK("Failed juke roll ([base_juke_chance + juke_spd_bonus]%)!")
		return FALSE
	NPC_THINK("Succeeded juke roll ([base_juke_chance + juke_spd_bonus]%)!")
	tempfixeye = TRUE //Change icon to 'target' red eye
	if(!fixedeye) //If fixedeye isn't already enabled, we need to set this var
		nodirchange = TRUE
	var/list/newPath = list()
	var/turf/lastTurf
	// Use up to half your remaining distance, with a minimum of one tile.
	var/juke_distance = 1 // Make it single step juke only.
	for(var/i in 1 to juke_distance)
		// pick random turfs to juke to until we're out of movement
		var/list/turf/juke_candidates = get_dodge_destinations(target, lastTurf)
		if(!length(juke_candidates))
			break
		lastTurf = pick(juke_candidates)
		newPath += lastTurf
	if(!length(newPath))
		return FALSE
	// temporarily force us to use the juke path
	myPath = newPath
	var/old_pathfinding_target = pathfinding_target
	pathfinding_target = myPath[1]
	steps_moved_this_turn += move_along_path()
	pathfinding_target = old_pathfinding_target
	tempfixeye = FALSE
	if(!fixedeye)
		nodirchange = FALSE
	return TRUE // juke succeeded

/mob/living/carbon/human/proc/handle_combat()
	switch(mode)
		if(NPC_AI_IDLE)		// idle
			if(world.time >= next_seek)
				NPC_THINK("Seeking for targets...")
				next_seek = world.time + 3 SECONDS
				// If we search for targets above, we need to do this twice.
				// Yes, this is kind of terrible, but it works(?). If it's enabled we do it a second time with is_checking_above = TRUE.
				for(var/is_checking_above in FALSE to find_targets_above)
					var/atom/search_location = src
					if(is_checking_above)
						var/turf/turf_above = GET_TURF_ABOVE(get_turf(src)) // may be null
						if(istransparentturf(turf_above))
							search_location = turf_above
						else // null or not transparent
							break // don't check above, we can't see through that turf
					for(var/mob/living/L in view(7, search_location)) // scan for enemies
						if(should_target(L))
							retaliate(L)
						// don't detect sneaking enemies if you're looking above you
						if (!is_checking_above && world.time >= next_passive_detect && L.alpha == 0 && L.rogue_sneaking && prob(STAPER / 2))
							if (!npc_detect_sneak(L, -20)) // attempt a passive detect with 20% increased difficulty
								next_passive_detect = world.time + STAPER SECONDS

		if(NPC_AI_HUNT)		// hunting for attacker
			// basic behavior chain: targeting > fleeing > picking up a weapon > attacking
			// VALIDATE TARGET
			if(target)
				if(!should_target(target))
					if (target.alpha == 0 && target.rogue_sneaking) // attempt one detect since we were just fighting them and have lost them
						if (npc_detect_sneak(target))
							retaliate(target)
					else
						back_to_idle()
						return TRUE
				m_intent = MOVE_INTENT_WALK
				validate_path()
				var/turf/my_turf = get_turf(src)
				var/turf/target_turf = get_turf(target)
				var/distance = my_turf.Distance_cardinal_3d(target_turf, src)
				// only path if we're more than one tile away
				if(distance > min_dis_to_target) //CC Edit
					if(distance > initial(min_dis_to_target) + tether_distance) // CC Edit - Only reset our min_dis to target if they're outside our initial distance + tether_distance.
						min_dis_to_target = initial(min_dis_to_target)
					if(!length(myPath)) // create a new path to the target
						start_pathing_to(target)

			// Flee before trying to pick up a weapon.
			if(flee_in_pain && target && (target.stat == CONSCIOUS))
				var/paine = get_complex_pain()
				if(paine >= ((STAWIL * 10)*0.9)) 
					NPC_THINK("Ouch! Entering flee mode!")
					mode = NPC_AI_FLEE
					m_intent = MOVE_INTENT_RUN
					clear_path()
					return TRUE

			if(!get_active_held_item() && !HAS_TRAIT(src, TRAIT_CHUNKYFINGERS) && (mobility_flags & MOBILITY_PICKUP))
				// pickup any nearby weapon
				for(var/obj/item/I in view(1,src))
					if(!isturf(I.loc))
						continue
					if(blacklistItems[I])
						continue
					if(I.force > 7 && equip_item(I))
						// Picked up an item, end turn.
						return TRUE

			// if can't reach target for long enough, go idle
			if(frustration >= 15)
				back_to_idle()
				return TRUE
			
			//CC Edit Begin
			//Unused until the sidestep proc can be figured out. I am currently stumped.
/* 
			if(check_target_style(STYLE_RANGED)) //Attempt to dodge ranged attacks
				face_atom(target)
				npc_try_sidestep_projectile()
				//Someone with more knowledge on debugging touch this I do not know what this is sadly. Im sorry in advance.
				NPC_THINK("Sidestepped an attack using [steps_moved_this_turn] moves out of [maxStepsTick]!") 
				//Update our pathing and immediately continue heading towards our target after attempting a sidestep.
				if(.)
					validate_path()
					clear_path()
					start_pathing_to(target) // regenerate path now that we've jumped
 */
			//CC Edit End

			//Attempt to cast a spell at the enemy in our LOS. Do not cast without LOS.
			//Spellcasters can be expensive mobs so try and use them sparingly.
			//If you're stood on top of a spellcaster they will not cast spells on you.
			if(spell_caster && !has_status_effect(/datum/status_effect/debuff/spell_cooldown_npc))
				if(target in oview(7, src)) //Only called if we don't have a cooldown active.
					handle_spell_casting_logic()

			// if we COULD attack, check rection time
			var/should_frustrate = TRUE
			if(Adjacent(target) && isturf(target.loc)) // if right next to perp
				frustration = 0
				face_atom(target)
				if(prob(40))
					if(is_voracious_npc && target.devourable && target.allowmobvore && pulling == target && grab_state == GRAB_AGGRESSIVE && target.stat != DEAD)
						var/npcbelly = src.vore_selected
						NPC_THINK("Hungry! Trying to eat [target]!")
						say(pick(GLOB.eatlines))
						attempt_to_devour_prey(src, target, src, npcbelly, 7 SECONDS)
						return
				if(is_voracious_npc && target.devourable && target.allowmobvore && target.lying && target.stat != DEAD) //If you're lying down, you're getting stunned and eaten, gg bozo.
					if(prob(45))
						target.Stun(7 SECONDS)
						var/npcbelly = src.vore_selected
						NPC_THINK("Hungry! Trying to eat [target]!")
						say(pick(GLOB.eatlines))
						attempt_to_devour_prey(src, target, src, npcbelly, 5 SECONDS)
				. = monkey_attack(target)
				steps_moved_this_turn++ // an attack costs, currently, 1 movement step
				NPC_THINK("Used [steps_moved_this_turn] moves out of [maxStepsTick]!")
				if(. && check_target_style(STYLE_MELEE)) // attack was successful, try to backstep only if they mainly use melee. todo: generalise to post-attack behaviour?
					npc_try_backstep()
					return
			else if(should_frustrate) // not next to perp, and we didn't fail due to reaction time, or they're a ranged user we can't backstep
				frustration++

		if(NPC_AI_FLEE)
			var/const/NPC_FLEE_DISTANCE = 8
			if(!target || get_dist(src, target) >= NPC_FLEE_DISTANCE)
				// try to flee from any enemies who aren't incapacitated
				for(var/mob/living/bystander in view(src, 7))
					if(ishuman(bystander))
						var/mob/living/carbon/human/human_bystander = bystander
						if(human_bystander.IsDeadOrIncap())
							continue
					else if(stat != CONSCIOUS)
						continue
					// found an enemy who might be able to hurt us!
					// if our current candidate is closer, ignore this one
					if(target && (get_dist(src, target) <= get_dist(src, bystander)))
						continue
					// we assume if we want to hurt them they want to hurt us back
					if(should_target(bystander))
						target = bystander // We're trying to run from this person now
			if(!target || get_dist(src, target) >= NPC_FLEE_DISTANCE)
				NPC_THINK("Done fleeing!")
				back_to_idle()
			else if(!is_move_blocked_by_grab()) // try to run offscreen if we aren't being grabbed by someone else
				NPC_THINK("Fleeing from [target]!")
				// todo: use A* to find the shortest path to the farthest tile away from the flee target?
				walk_away(src, target, NPC_FLEE_DISTANCE, cached_multiplicative_slowdown)
			else // can't flee and can't move, stop walking!
				NPC_THINK("I can't flee from [target]!")
				walk(src, 0)
			return TRUE

	return IsStandingStill()


/mob/living/carbon/human/proc/back_to_idle()
	last_aggro_loss = world.time
	NPC_THINK("Losing interest in [target]!")
	if(pulling)
		stop_pulling()
	myPath = list()
	mode = NPC_AI_IDLE
	m_intent = MOVE_INTENT_WALK
	target = null
	a_intent = INTENT_HELP
	frustration = 0
	walk_to(src,0)

// attack using a held weapon otherwise bite the enemy, then if we are angry there is a chance we might calm down a little
/// Try to attack using an offhand grab.
/mob/living/carbon/human/proc/npc_try_use_grab(mob/living/victim, obj/item/grabbing/the_grab)
	// set the intent 'intelligently'
	if(isitem(the_grab.sublimb_grabbed) && prob(30))
		rog_intent_change(1) // 30% chance to remove the embedded weapon, 70% to twist it
	else
		rog_intent_change(2) // 2 -> choke for neck, twist for limb/embed, smash for precise
	// now use it
	if(used_intent.type == /datum/intent/grab/smash) // special, need to smash them into something
		var/atom/smash_target // structure or turf
		// first check for a structure to smash someone into
		for(var/obj/structure/smashy_struct in view(1, src))
			if(!victim.Adjacent(smashy_struct)) // have to find a structure we're both adjacent to
				continue
			if(smashy_struct.blade_dulling != DULLING_CUT) // smashable!
				smash_target = smashy_struct
				break
		if(!smash_target) // now check turfs
			// if standing you have to slam them into a wall; otherwise slam them into the floor
			var/victim_standing = victim.mobility_flags & MOBILITY_STAND
			for(var/turf/smashy_turf in view(1, src))
				if(victim_standing)
					if(isopenturf(smashy_turf))
						continue
				else
					if(isclosedturf(smashy_turf))
						continue
				if(!victim.Adjacent(smashy_turf))
					continue
				smash_target = smashy_turf
				break
		if(smash_target) // now actually smash!
			NPC_THINK("Trying to smash [victim] into [smash_target]!")
			the_grab.melee_attack_chain(src, smash_target)
			return TRUE
		NPC_THINK("Failed to find something to smash [victim] into!")
		return FALSE
	// otherwise just use it normally
	NPC_THINK("Trying to [used_intent.name] a grab on [victim]!")
	the_grab.melee_attack_chain(src, victim)
	return TRUE

/mob/living/carbon/human/proc/npc_try_make_grab(mob/living/victim)
	NPC_THINK("Trying to grab [victim]!")
	swap_hand() // switch to offhand
	rog_intent_change(3) // grab intent
	npc_choose_grab_zone(victim)
	UnarmedAttack(victim, TRUE) // instead of start_pulling(victim)
	var/stam_penalty = used_intent.releasedrain
	if(istype(rmb_intent, /datum/rmb_intent/strong) || istype(rmb_intent, /datum/rmb_intent/swift))
		stam_penalty += 4 // as opposed to 10 for a weapon; these are your hands, it's easier to move them
	stamina_add(stam_penalty)
	if(pulling != victim)
		aftermiss()
	rog_intent_change(1) // and back to normal intent to avoid getting stuck on grabs
	swap_hand() // switch back to mainhand
	return TRUE // end your turn

/// A proc used in monkey_attack. Selects and performs our preferred attack.
/// Returns TRUE if our turn has been used.
/mob/living/carbon/human/proc/do_best_melee_attack(mob/living/victim)
	// TODO: Better converted-deadite AI than this.
	// My life for a refactor of this system to use the new AI controllers... maybe.
	if(mind?.has_antag_datum(/datum/antagonist/zombie))
		if(do_deadite_attack(victim))
			return TRUE // turn was used by biting
	var/obj/item/Weapon = get_active_held_item()
	var/obj/item/OffWeapon = get_inactive_held_item()
	// if we're weaponless or our offhand is stronger, switch hands
	// since grabs have a force of 0 this has the fun effect of putting embed grabs in the offhand too, which is useful later
	if(OffWeapon && (!Weapon || OffWeapon.force > Weapon.force))
		NPC_THINK("Switching active hand to [OffWeapon]!")
		swap_hand()
	// in case we swapped, reset weapon/offweapon
	Weapon = get_active_held_item()
	OffWeapon = get_inactive_held_item()

	//Feint Riposte check before we do any further attacks to teach our enemy a lesson.
	if(smart_combatant && istype(Weapon, /obj/item/rogueweapon)) //Make sure we have a proper weapon in hand. No feinting with a stick or some shit.
		if(!has_status_effect(/datum/status_effect/debuff/feintcd) && target.has_status_effect(/datum/status_effect/buff/clash))
			if(possible_rmb_intents & /datum/rmb_intent/feint)
				swap_rmb_intent(/datum/rmb_intent/feint)
				if(Adjacent(target))
					try_special_attack(target)
					return TRUE //Attempt to feint and ruin their clash...

	// What is the chance we try to grab with our offhand?
	var/make_grab_chance = Weapon ? 5 : 20 // If unarmed, 20% chance; otherwise 5%
	var/use_grab_chance = 30 // 30% chance to use a grab if we already have one
	var/const/upgrade_grab_chance = 20 // make this non-const if anything ever wants to change it
	if(HAS_TRAIT(victim, TRAIT_CHUNKYFINGERS))
		make_grab_chance = 30 // we can't use normal weapons, so try to grapple harder because we don't care about having a free hand
		use_grab_chance = 50
  //Caustic Edit - Add VNPC handling
	if(prob(25) && is_voracious_npc && target.allowmobvore && target.devourable)
		make_grab_chance = 70
		use_grab_chance = 80
  //Caustic Edit End
	//CC Edit Begin
	if(check_target_style(STYLE_RANGED)) //If target is ranged we shouldn't give them the chance to run away again just to shoot us later.
		make_grab_chance = Weapon ? 15 : 40
	//CC Edit End
	// we always try to move our grab into our offhand where possible, so no need to worry about main-hand weapons
	var/obj/item/grabbing/the_grab = OffWeapon
	if(istype(the_grab)) // if we already have a grab in our offhand, we might want to use it
		if(prob(use_grab_chance) && the_grab.grabbee == victim) // already pulling, fuck with them a bit
			swap_hand() // switch to grab
			if(grab_state < GRAB_AGGRESSIVE && prob(upgrade_grab_chance)) // upgrade!
				stamina_add(rand(7,15))
				victim.grippedby(src)
				return TRUE // used our turn
			npc_try_use_grab(victim, the_grab) // twist, smash, choke, whatever
			swap_hand() // switch back to mainhand to avoid fucking up the rest of combat
			return TRUE // and end turn
	else if(!OffWeapon && prob(make_grab_chance)) // grab with our empty offhand instead of attack
		if(npc_try_make_grab(victim)) // returns TRUE if we've finished our turn, not if we succeeded at the grab
			return TRUE 

	// attack with weapon if we have one
	if(Weapon)
		if(!Weapon.wielded && Weapon.force_wielded > Weapon.force)
			// todo: decide to drop the offhand maybe?
			if(!OffWeapon) // wield it!
				Weapon.attack_self(src)

		//Lets spice things up.
		var/did_we_change_intent = FALSE
		if(istype(Weapon, /obj/item/rogueweapon))
			var/obj/item/rogueweapon/actual_weapon = Weapon
			var/weapon_intents = actual_weapon.possible_item_intents
			var/weapon_special_intents = actual_weapon.special
			
			if(length(weapon_intents) > 1 && !has_status_effect(/datum/status_effect/debuff/swapped_intent_npc))
				did_we_change_intent = TRUE
				rog_intent_change(rand(1, length(weapon_intents))) 
				apply_status_effect(/datum/status_effect/debuff/swapped_intent_npc) //45 seconds before we swap to a new weapon intent entirely.

			if(special_attacker && prob(50) && !has_status_effect(/datum/status_effect/debuff/specialcd)) //Only if we use specials...
				if(weapon_special_intents)
					if(possible_rmb_intents & /datum/rmb_intent/strong)
						swap_rmb_intent(/datum/rmb_intent/strong)
						try_special_attack(target)
						return TRUE //We used our special intent on the target as soon as we could.
			//CC Edit - check_target_style
			if(check_target_style(STYLE_MELEE || check_target_style(STYLE_BOTH)) && smart_combatant && prob(50)) // Only if we use rmb intents and the target is melee
				if(possible_rmb_intents)
					if(!has_status_effect(/datum/status_effect/debuff/feintcd))
						if(possible_rmb_intents & /datum/rmb_intent/feint && rmb_intent != /datum/rmb_intent/feint && prob(50))
							swap_rmb_intent(/datum/rmb_intent/feint)
							try_special_attack(target)
							return TRUE
					else if(!has_status_effect(/datum/status_effect/debuff/clashcd))
						if(possible_rmb_intents & /datum/rmb_intent/riposte && rmb_intent != /datum/rmb_intent/riposte && prob(50))
							swap_rmb_intent(/datum/rmb_intent/riposte)
							try_special_attack(target)
							return TRUE
					else if(!has_status_effect(/datum/status_effect/debuff/baitcd)) //May work sometimes; more than likely it wont however.
						if(possible_rmb_intents & /datum/rmb_intent/aimed && rmb_intent != /datum/rmb_intent/aimed) //Default to aimed as the final choice to attempt baiting.
							swap_rmb_intent(/datum/rmb_intent/aimed)
							try_special_attack(target)
							return TRUE

		if(!did_we_change_intent) //Always default regardless.
			rog_intent_change(1)
		used_intent = a_intent
		Weapon.melee_attack_chain(src, victim)
		// attackby and attack_obj handles cooldowns already
		return TRUE
	else //Unarmed
		rog_intent_change(4) // punch
		used_intent = a_intent
		UnarmedAttack(victim, 1)
		// handle cooldowns since that's not done directly in UnarmedAttack
		var/adf = used_intent.clickcd
		if(istype(rmb_intent, /datum/rmb_intent/aimed))
			adf = round(adf * 1.4)
		if(istype(rmb_intent, /datum/rmb_intent/swift))
			adf = round(adf * 0.6)
		changeNext_move(adf)
		return TRUE

/mob/living/carbon/human/proc/npc_choose_grab_zone(mob/living/victim)
	// My life for a better way to handle deadite AI.
	var/victim_is_deadite = istype(victim, /mob/living/carbon/human/species/npc/deadite) || victim.mind?.has_antag_datum(/datum/antagonist/zombie)
	// if we're standing, or neither of us are, then we can grab mouth
	var/can_mouthgrab = (mobility_flags & MOBILITY_STAND) || !(victim.mobility_flags & MOBILITY_STAND)
	var/deadite_mouthgrab_chance = clamp(50 + (STAINT - 10)*5, 25, 100) // int of 5 -> 25%, int of 15 -> 75%, int of 20 -> 100%
	if(prob(deadite_mouthgrab_chance) && can_mouthgrab && victim_is_deadite && !istype(victim.get_item_by_slot(SLOT_MOUTH), /obj/item/grabbing/bite)) // 60% chance to go for the mouth to stop biting
		zone_selected = BODY_ZONE_PRECISE_MOUTH
	else
		npc_choose_attack_zone(victim)

/mob/living/carbon/human/proc/npc_choose_attack_zone(mob/living/victim)
	if(attack_on_zone <= ATTACKS_UNTIL_SWITCHING_UP)
		attack_on_zone++
		return
	else
		attack_on_zone = 1
	// My life for a better way to handle deadite AI.
	if(mind?.has_antag_datum(/datum/antagonist/zombie))
		aimheight_change(deadite_get_aimheight(victim))
		return
	if(!(mobility_flags & MOBILITY_STAND))
		aimheight_change(rand(1, 4)) // Go for the knees!
		return
	if(HAS_TRAIT(victim, TRAIT_BLOODLOSS_IMMUNE)) // Go for the head!
		aimheight_change(rand(12, 19))
		return
	aimheight_change(pick(rand(5, 8), rand(9, 11), rand(12, 19))) // Arms, chest, head. Equal chance for each.

// attack using a held weapon otherwise bite the enemy, then if we are angry there is a chance we might calm down a little
/mob/living/carbon/human/proc/monkey_attack(mob/living/L)
	if(next_move > world.time)
		return FALSE // no time to attack this turn!
	if(has_status_effect(/datum/status_effect/buff/clash))
		return FALSE //We're clashing right now! Don't fuck us up! Also give the player a chance to respond with a feint.

	npc_choose_attack_zone(L)
	NPC_THINK("Aiming for \the [zone_selected]!")
	return do_best_melee_attack(L)

// get angry at a mob
/mob/living/carbon/human/proc/retaliate(mob/living/L)
	if(!wander)
		wander = TRUE
	if(L == src)
		return
	if(mode != NPC_AI_OFF)
		if(L.alpha == 0 && L.rogue_sneaking)
			// we just got hit by something hidden so try and find them
			if (prob(5))
				visible_message(span_notice("[src] begins searching around frantically..."))
			var/extra_chance = (health <= maxHealth * 50) ? 30 : 0 // if we're below half health, we're way more alert
			if (!npc_detect_sneak(L, extra_chance))
				return
		NPC_THINK("Hunting [L]!")
		mode = NPC_AI_HUNT
		// Interrupt ongoing actions on-hit, except for standing up or resisting.
		if(!resisting && (mobility_flags & MOBILITY_STAND))
			doing = FALSE
		last_aggro_loss = null
		face_atom(L)
		if(!target)
			emote("aggro")
		target = L
		//CC Edit Begin
		//Handle the target's combat type and check if it's the same type or not if we are in combat.
		if(!(last_targets[target])) //If we are not apart of last_targets
			check_target_type() //Target is added to the list after checking.
		else
			target_type = last_targets[target] //Update our target type to change how we approach our new target
		//CC Edit End
		if(pathfinding_target != target)
			clear_path() // Cancel pathfinding so that we can pursue our new enemy.
		enemies |= L


/mob/living/carbon/human/attackby(obj/item/W, mob/user, params)
	. = ..()
	min_dis_to_target = 1 //CC Edit - Reduce our minimum distance to 1 if we get attacked by our target
	if((W.force) && (!target) && (W.damtype != STAMINA))
		retaliate(user)

/mob/living/carbon/human/proc/npc_taunt_target()
	var/list/possible_taunts = list("laugh" = null)
	if(!restrained() && get_num_arms() != 0)
		possible_taunts["point"] = "\the [target]"
	var/the_emote = pick(possible_taunts)
	emote(the_emote, message = possible_taunts[the_emote])

/mob/living/proc/npc_detect_sneak(mob/living/target, extra_prob = 0)
	if (target.alpha > 0 || !target.rogue_sneaking)
		return TRUE
	var/probby = 4 * STAPER //this is 10 by default - npcs get an easier time to detect to slightly thwart cheese
	probby += extra_prob
	var/sneak_bonus = 0
	if(target.mind)
		if (world.time < target.mob_timers[MT_INVISIBILITY])
			// we're invisible as per the spell effect, so use the highest of our arcane magic (or holy) skill instead of our sneaking
			sneak_bonus = (max(target.get_skill_level(/datum/skill/magic/arcane), target.get_skill_level(/datum/skill/magic/holy)) * 10)
			probby -= 20 // also just a fat lump of extra difficulty for the npc since spells are hard, you know?
		else
			sneak_bonus = (target.get_skill_level(/datum/skill/misc/sneaking) * 5)
		probby -= sneak_bonus
	if(!target.check_armor_skill())
		probby += 85 //armor is loud as fuck
		if (sneak_bonus)
			probby += sneak_bonus // you don't get sneak bonus in heavy armor at all, on top of that
	if (target.badluck(5))
		probby += (10 - target.STALUC) * 5 // drop 5% chance for every bit of fortune we're missing
	if (target.goodluck(5))
		probby -= (10 - target.STALUC) * 5 // make it 5% harder for every bit of fortune over 10 that we do have

	if (prob(probby))
		// whoops it saw us
		target.mob_timers[MT_FOUNDSNEAK] = world.time
		to_chat(target, span_danger("[src] sees me! I'm found!"))
		target.update_sneak_invis(TRUE)
		return TRUE
	else
		return FALSE

/mob/living/carbon/human/proc/on_client_enter(datum/source, atom/target)
	SIGNAL_HANDLER
	if(mode == NPC_AI_OFF)
		return

	if(mode == NPC_AI_SLEEP)
		mode = NPC_AI_IDLE

/mob/living/carbon/human/proc/on_client_exit(datum/source, datum/exited)
	SIGNAL_HANDLER
	if(mode == NPC_AI_OFF)
		return

	consider_wakeup()

/mob/living/carbon/human/proc/set_new_cells()
	if(QDELETED(src)) // Move to nullspace causes move and causes this.
		return
	var/turf/our_turf = get_turf(src)
	if(isnull(our_turf))
		return

	var/list/cell_collections = our_cells?.recalculate_cells(our_turf)

	for(var/datum/old_grid as anything in cell_collections[2])
		UnregisterSignal(old_grid, list(SPATIAL_GRID_CELL_ENTERED(SPATIAL_GRID_CONTENTS_TYPE_CLIENTS), SPATIAL_GRID_CELL_EXITED(SPATIAL_GRID_CONTENTS_TYPE_CLIENTS)))

	for(var/datum/spatial_grid_cell/new_grid as anything in cell_collections[1])
		RegisterSignal(new_grid, SPATIAL_GRID_CELL_ENTERED(SPATIAL_GRID_CONTENTS_TYPE_CLIENTS), PROC_REF(on_client_enter))
		RegisterSignal(new_grid, SPATIAL_GRID_CELL_EXITED(SPATIAL_GRID_CONTENTS_TYPE_CLIENTS), PROC_REF(on_client_exit))
	consider_wakeup()

/mob/living/carbon/human/proc/update_grid()
	SIGNAL_HANDLER
	set_new_cells()

/mob/living/carbon/human/proc/consider_wakeup()
	if(mode == NPC_AI_OFF)
		return

	for(var/datum/spatial_grid_cell/grid as anything in our_cells.member_cells)
		if(length(grid.client_contents))
			if(mode != NPC_AI_SLEEP && mode != NPC_AI_IDLE)
				return TRUE
			mode = NPC_AI_IDLE
			return TRUE

	mode = NPC_AI_SLEEP
	return FALSE

/mob/living/carbon/human/Moved()
	. = ..()
	if(mode != NPC_AI_OFF)
		update_grid()

//NPC SPECIFIC DEBUFF FOR INTENT HANDLING, DO NOT USE ANYWHERE ELSE.
/datum/status_effect/debuff/swapped_intent_npc
	id = "swapped_intent_npc"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/swapped_intent_npc
	duration = 10 SECONDS
	status_type = STATUS_EFFECT_UNIQUE

/atom/movable/screen/alert/status_effect/debuff/swapped_intent_npc
	name = "Swapped Intent Cooldown (NPC)"
	desc = "I swapped my weapon intent, I must wait before I can do it again."
	icon_state = "strikecd"

//CC Edit Begin

//In essence this proc checks the target and determines what type of combatant they are.
// Check Target -> Is target Melee? -> Is target Ranged? -> Is target Both?
// Caches the target by type : Melee, Ranged, or Both

//Checks by evaluating what kind of combatant the target may be and should only run once per target, we then cache our target to an alist with the associated type.
// We will ALWAYS assume what we see first on our target is what they will remain to be when we first encounter them.
// This can make combat varied in many ways.
/mob/living/carbon/human/proc/check_target_type()
	//We are assuming at this point we do have a target.
	if(!(target.mind)) //Other NPC's are treated with basic logic so we do not try fancy tricks on our opponents.
		return TARGET_SIMPLE
		
	//The likelihood of being a ranged target.
	var/ranged_likelihood
	//The likelihood of being a melee target. We give leniency towards people primarily being melee.
	var/melee_likelihood

	var/obj/item/targets_primary_weapon = target.get_active_held_item()
	var/obj/item/targets_secondary_weapon = target.get_inactive_held_item()

	
	//Check how many spells the target has and divide the total for a rating.
	var/targets_spell_count = length(target.mind.spell_list)
	if(targets_spell_count)
		var/spell_rating = rating_divisor(targets_spell_count, 2) //Every 2 spells earns 1 rating
		for(var/i in 1 to spell_rating)
			ranged_likelihood++

	//The more powerful the melee weapon, the more likely they're melee. Every 7 force combined
	var/rating_force = rating_divisor(targets_primary_weapon?.force_dynamic, 7) + rating_divisor(targets_secondary_weapon?.force_dynamic, 7)

	if(rating_force)
		for(var/i in 1 to rating_force)
			melee_likelihood++
	
	//Then we check more of the finer details.
	if(istype(targets_primary_weapon, /obj/item/gun) || istype(targets_secondary_weapon, /obj/item/gun)) //They're holding a ranged weapon.
		ranged_likelihood += 5 //Ranged weapon. Most likely ranged.

	//We cache our targets to the list after running this proc once.
	if(melee_likelihood > ranged_likelihood)
		if(!(last_targets[target])) //If not in last_targets put them there
			last_targets[target] = TARGET_LIKELY_MELEE
			target_type = TARGET_LIKELY_MELEE 
		return TARGET_LIKELY_MELEE
	else if(ranged_likelihood > melee_likelihood)
		if(!(last_targets[target])) //If not in last_targets put them there
			last_targets[target] = TARGET_LIKELY_RANGED
			target_type = TARGET_LIKELY_RANGED
		return TARGET_LIKELY_RANGED
	else if(ranged_likelihood == melee_likelihood)
		if(!(last_targets[target])) //If not in last_targets put them there
			last_targets[target] = TARGET_LIKELY_BOTH
			target_type = TARGET_LIKELY_BOTH
		return TARGET_LIKELY_BOTH
	else
		return TARGET_UNCERTAIN //We should only make a check if we're actually hurt.

//More amt = higher rating
//This is used to calculate the rating of a target's abilities to measure their likelihood of being ranged or melee.
/mob/living/carbon/human/proc/rating_divisor(num, dividen)
	if(num < dividen)
		return FALSE //Cannot make a divisor out of a value lower than this or num is NULL or ZERO
	num = (num / dividen)
	return floor(num) //Floor it!!!

// This proc is what actually checks and compares the style types and effectively acts as a key to access different movesets. 
// If a target is melee, and the type of combat is melee, return true.
/mob/living/carbon/human/proc/check_target_style(type_of_combat)
	switch(type_of_combat)
		if(STYLE_MELEE)
			if(last_targets[target] == STYLE_MELEE)
				return TRUE
		if(STYLE_RANGED)
			if(last_targets[target] == STYLE_RANGED)
				return TRUE
		if(STYLE_SIMPLE)
			if(last_targets[target] == STYLE_SIMPLE)
				return TRUE
		if(STYLE_BOTH)
			if(last_targets[target] == STYLE_BOTH)
				return TRUE
	return FALSE //If we don't match the same style don't consider doing these attacks/moves/mechanics, etc.


//Sidestepping Projectile Mob Logic

//In essence this proc will make it so that when running at a target they will attempt to sidestep projectiles on occasion in order to attempt to avoid being hit.

//Not sure how to implement this at the time. I'll need some extra help regarding this.
/* 
/mob/living/carbon/human/proc/npc_try_sidestep_projectile(atom/dodge_tile)
	var/const/base_sidestep_chance = 100 //DO NOT COMMIT THIS PLEASE I SWEAR TO GOD ME IF THIS GOES IN 
	// For every point of STASPD above 10 you get an extra 5% juke chance
	var/const/min_spd_for_sidestep = 8
	var/const/sidestep_chance_per_spd = 5
	if(mind?.has_antag_datum(/datum/antagonist/zombie)) // Deaddites cannot sidestep
		return 
	if(!target)
		return 
	if(steps_moved_this_turn >= maxStepsTick) // no movement left over
		return 
	var/sidestep_spd_bonus = STASPD > min_spd_for_sidestep ? (STASPD - min_spd_for_sidestep) * sidestep_chance_per_spd : 0

	if(!prob(base_sidestep_chance + sidestep_spd_bonus))
		NPC_THINK("Failed projectile sidestep roll ([base_juke_chance + juke_spd_bonus]%)!")
		return FALSE
	NPC_THINK("Succeeded projectile sidestep roll ([base_juke_chance + juke_spd_bonus]%)!")

	var/list/newPath = list()
	for(var/turf/T in get_adjacent_turfs(src))
		newPath += T //Add all of the side turfs into our possible path's

	if(!length(newPath))
		return FALSE
	// Pick only one of these path's to choose from
	myPath = pick(newPath)
	var/old_pathfinding_target = pathfinding_target
	pathfinding_target = myPath[1]
	steps_moved_this_turn += move_along_path()
	pathfinding_target = old_pathfinding_target
	tempfixeye = FALSE
	if(!fixedeye)
		nodirchange = FALSE
	return TRUE // Sidestep Succeeded
 */

/mob/living/carbon/human/proc/handle_spell_casting_logic()
	//Check if we have any spells in our spell list.
	if(!length(mob_spell_list))
		if(spell_caster) //Secondary check to make sure the mob isn't actually a spell caster with a messed up spell list.
			//If we ARE messed up, default to an arcyne bolt and notify admins.
			AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/arcynebolt)
			message_admins("NOTICE: NPC - A [src.real_name] AT [AREACOORD(src)] ATTEMPTED TO CAST A SPELL WITHOUT A SPELL LIST. DEFAULTING TO ARCYNE BOLT.")
		return

	//Do not cast on anything that isn't living.
	if(!isliving(target))
		return

	var/old_target = target

	//We randomly select an available spell from our spell list.
	var/obj/effect/proc_holder/spell/cur_spell = pick(mob_spell_list)

	//Clamp our spellss range for calculation between 1-8 tiles. NPC's cannot look very far.
	var/spell_range = clamp(cur_spell?.range, 1, 8)

	//Calculate our spell resources before we continue.
	if(!handle_spell_resources(cur_spell)) //Returns FALSE if we cannot cast the spell.
		return

	//If we have logic.
	if(cur_spell?.spell_logic && prob(75)) //Don't garuntee casting the spell ALL the time.
		ranged_ability = cur_spell
		switch(cur_spell.spell_logic)

			if(1) //No Logic - Cast at our target directly without any other special checks. Often the default for most granted spells.
				NPC_THINK("ATTEMPTED TO CAST SPELL WITH NO LOGIC! DEFAULTING TO CASTING AT TARGET!")
				cast_spell_at(cur_spell, target)

			if(2) //Combat Logic - Cast at our target and avoid allies.
				if(target.faction[1] != faction[1])
					//Check for mobs in a line and return FALSE if we find an ally.
					if(check_line_for_allies(src, target))
						return FALSE
					//Until I can find a way to "fake" charging with a proc check, we'll just have to cast normally like this without any telegraphing... Like simplemobs...
					cast_spell_at(cur_spell, target)
				else
					NPC_THINK("ATTEMPTED TO CAST A COMBATIVE SPELL AT AN ALLY SOMEHOW! ABORTING!!!")

			if(3) //Support Logic - Attempt to cast on one of our allies. Do not cast on our enemy.
				if(target.faction[1] != faction[1])
					for(var/mob/living/M in view(spell_range, src))
						if(M.stat == DEAD || M.stat == UNCONSCIOUS)
							continue //Can't support what's already down.
						if(M.faction[1] == faction[1])
							target = M
							break
				if(target.faction[1] == faction[1]) //We found an ally!
					cast_spell_at(cur_spell, target)
					target = old_target //Reset our target back to our original target.
				else
					NPC_THINK("FAILED TO LOCATE AN ALLY TO CAST A SUPPORTIVE SPELL! ABORTING!!!")

			if(4) //Utility Logic - Cast either on our target, or on our allies. Attempt to prioritze allies.
				if(target.faction[1] != faction[1])
					for(var/mob/living/M in view(spell_range, src))
						if(M.stat == DEAD || M.stat == UNCONSCIOUS)
							continue //Can't support what's already down.
						if(M.faction[1] == faction[1])
							target = M
							break
				//If we can't find an ally we can just cast it at our enemy.
				cast_spell_at(cur_spell, target)
				target = old_target //Reset our target back to our original target.

			if(5) //Self Casting Logic - Cast only on ourselves. This spell is better that way for us.
				target = src
				cast_spell_at(cur_spell, target)
				target = old_target

			if(6) //Healing Logic - Only heals allies that are actively injured. Keeps healing the same target until they are fully healed.
				if(length(cur_heal_target))
					var/mob/living/M = cur_heal_target[1]
					if(M.stat != DEAD || M.stat != UNCONSCIOUS)
						cur_heal_target -= M
						return //Can't heal what's already dead!
					else if(length(M.get_wounds()))
						target = M
					else
						NPC_THINK("Our allies are fully healed! No longer casting healing miracles!")
						cur_heal_target -= M //Get outta here!
						return
				else if(target.faction[1] != faction[1])
					for(var/mob/living/M in view(spell_range, src))
						if(M.stat == DEAD || M.stat == UNCONSCIOUS)
							continue //Can't heal what's already downed.
						if(M.faction[1] == faction[1])
							if(length(M.get_wounds()))
								target = M
								cur_heal_target += M
								break
							else
								NPC_THINK("Can't locate a wound on this target, checking the next one!")
								continue
				if(target.faction[1] == faction[1])
					cast_spell_at(cur_spell, target)
					target = old_target
 
			if(7) //Structure Logic - Place anywhere nearby that is not in the path to our target. Might be a bit expensive but shouldn't affect too much.
				var/list/possible_loc = list()
				for(var/turf/open/T in oview(3, src))
					if(T in get_line(src, target))
						continue
					possible_loc += T
				target = pick(possible_loc)
				cast_spell_at(cur_spell, target)
				target = old_target

			if(8) //Stationary Logic - Will cast a spell and attempt to remain still for as long as possible. Useful for blood transfer spells for example.
				if(length(cur_heal_target))
					var/mob/living/M = cur_heal_target[1]
					if(M.stat != DEAD || M.stat != UNCONSCIOUS)
						cur_heal_target -= M
						return //Can't heal what's already dead!
					else if(length(M.get_wounds()))
						target = M
					else
						NPC_THINK("Our allies are fully healed! No longer casting healing miracles!")
						cur_heal_target -= M //Get outta here!
						return
				else if(target.faction[1] != faction[1])
					for(var/mob/living/M in oview(spell_range, src))
						if(M.faction[1] == faction[1])
							if(length(M.get_wounds())) // If wounded provide heals.
								target = M
								cur_heal_target += M
							break
				if(target.faction[1] == faction[1])
					cast_spell_at(cur_spell, target, stationary = TRUE)
					target = old_target

			if(9) // Dead Logic - Spell will only target mobs that are dead. Primarily for spells that require a corpse. Currently untested.
				for(var/mob/living/M in view(spell_range, src))
					if(M.stat == DEAD)
						target = M
						break
				if(target == old_target)
					NPC_THINK("Failed to locate a corpse!")
					return 
				cast_spell_at(cur_spell, target)
				target = old_target //Reset our target back to our original target.

		//Apply the spell casting CD regardless of if wether they could cast it or not. Duration lasts as long as the used spell's recharge time.
		var/duration = spell_cd_offset //Defaults to the spell_cd_offset if we do not have a recharge time.
		if(cur_spell.recharge_time)
			duration = cur_spell.recharge_time + spell_cd_offset
		if(duration > 0)
			apply_status_effect(/datum/status_effect/debuff/spell_cooldown_npc, duration)

//Handles the resources for casting spells. Only affects energy and devotion costs.
/mob/living/carbon/human/proc/handle_spell_resources(obj/effect/proc_holder/spell/cur_spell)
	//Handle stamina check.
	if(stamina > (max_stamina / spell_cost_limit))
		return FALSE // We are below our limit, give us a moment to recover!

	//Handle devotion costs
	if(cur_spell?.devotion_cost)
		if(!devotion)
			message_admins("NOTICE: NPC - A [src.real_name] AT [AREACOORD(src)] ATTEMPTED TO CAST A SPELL WITH DEVOTION COST /WITHOUT/ A DEVOTION DATUM ATTACHED.")
			return FALSE //These mobs should spawn with a devotion datum or else they can't cast miracle spells.
		if(cur_spell.devotion_cost > devotion.devotion)
			NPC_THINK("I don't have enough resources to cast this!")
			return FALSE
		sleep(1) //Don't run too quickly now.
		devotion?.update_devotion(-cur_spell.devotion_cost)
		return TRUE

	//Handle energy costs
	if(cur_spell?.releasedrain)
		if(cur_spell.releasedrain > energy)
			NPC_THINK("I don't have enough resources to cast this!")
			return FALSE
		sleep(1) //Don't run too quickly now.
		stamina_add(cur_spell.releasedrain)
		return TRUE

//Simple get_line proc that iterates and checks each tile if there's mobs of the same faction in it.
/mob/living/carbon/human/proc/check_line_for_allies(us, them)
	var/list/line = get_line(us, them)
	for(var/i in 1 to length(line))
		var/turf/turf = line[i]
		for(var/mob/living/M in turf.contents)
			if(M.faction[1] == faction[1])
				NPC_THINK("Couldn't cast a spell at a target because an ally was in the way!")
				return TRUE

//Will need to add more. For now simply retains the spell.
/mob/living/carbon/human/proc/cast_spell_at(obj/effect/proc_holder/spell/cur_spell, target, stationary)
	target = list(target) //Make the target a list so that it doesn't return nothing when indexing on spells.
	cur_spell.perform(target, user = src)
	if(stationary)
		steps_moved_this_turn = 100 //We shouldn't move any further.
		allow_movement = FALSE
		addtimer(CALLBACK(src, PROC_REF(allow_movement_again), TRUE), spell_channel_duration)

/mob/living/carbon/human/proc/allow_movement_again(bool)
	if(bool)
		allow_movement = TRUE
		for(var/mob/living/L in view(7, src)) // Check for enemies around us to immediately on the same Z as we are and start moving again if we do find them.
			if(should_target(L))
				if(retaliate(L))
					start_pathing_to(target)
		return
	allow_movement = FALSE

//This proc gets rid of spells that are not able to be utilized within given parameters. Called only at the end of an pre_equip for an outfit.
/mob/living/carbon/human/proc/prepare_spell_list(list/logic_types)
	if(length(logic_types))
		logic_types = logic_types
	else //If no given types dish out everything except for LOGIC_NONE, remove that.
		logic_types = list(0)
	//Only check for spells that actually can be used.
	if(!client || !mind)
		for(var/obj/effect/proc_holder/spell/S in mob_spell_list)
			if((S.spell_logic in logic_types))
				mob_spell_list -= S //Remove spells with matching logic from our list.

//NPC SPECIFIC DEBUFF FOR SPELL CASTING, DO NOT USE ANYWHERE ELSE.
/datum/status_effect/debuff/spell_cooldown_npc
	id = "spell_cooldown_npc"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/spell_cooldown_npc
	duration = 5 SECONDS //Overridden by the spell duration. Defaults to 5 seconds if otherwise.
	status_type = STATUS_EFFECT_UNIQUE

/atom/movable/screen/alert/status_effect/debuff/spell_cooldown_npc
	name = "Spell Cooldown (NPC)"
	desc = "I've casted my spell! I must wait before I can cast again."
	icon_state = "strikecd"

//CC Edit End

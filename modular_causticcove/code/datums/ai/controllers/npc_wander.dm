// Humanoid NPC idling, ported from Scarlet Reach's /mob/living/carbon/human/proc/npc_idle().
//
// SR drives its human NPCs with a hand-rolled process_ai() state machine and has no ai_controller
// for them at all, so this is a reimplementation of its *behaviour* on our subtree architecture
// rather than a copy of its plumbing. Semantics kept identical: a 3-5 second throttle, then either
// a single cardinal step or a 90 degree turn on the spot, and a rare idle emote.
//
// Before this existed /datum/ai_controller/human_npc set no idle_behavior whatsoever, which meant
// the loot subtree was the only thing a human NPC did with an empty plan - hence the NPCs that
// spend the round walking to whatever bottle they can see.
/datum/idle_behavior/idle_npc_wander
	/// Seconds between idle ticks. SR rerolls this every time it idles.
	var/min_delay = 3 SECONDS
	var/max_delay = 5 SECONDS
	/// Chance to take a step rather than turn in place.
	var/step_chance = 50
	/// Chance of an idle emote on any given idle tick.
	var/emote_chance = 3
	/// world.time of the next permitted idle tick.
	var/next_idle = 0

/datum/idle_behavior/idle_npc_wander/perform_idle_behavior(delta_time, datum/ai_controller/controller)
	. = ..()
	var/mob/living/pawn = controller.pawn
	if(!istype(pawn))
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(min_delay, max_delay)

	// Sneaking NPCs hold still - SR bails here too, before the emote.
	if(pawn.m_intent == MOVE_INTENT_SNEAK)
		return
	if(pawn.doing)
		return

	if(!controller.blackboard[BB_NPC_STAY_PUT] && (pawn.mobility_flags & MOBILITY_MOVE) && isturf(pawn.loc) && !pawn.pulledby)
		if(prob(step_chance))
			var/turf/target_turf = get_step(pawn.loc, pick(GLOB.cardinals))
			// can_traverse_safely keeps them out of lava and open space.
			if(target_turf?.can_traverse_safely(pawn))
				step_towards(pawn, target_turf, pawn.cached_multiplicative_slowdown)
		else
			pawn.setDir(turn(pawn.dir, pick(90, -90)))

	if(prob(emote_chance))
		pawn.emote("idle")

/// Set dressing: guards and sentries that should hold their post. They still turn and emote.
/datum/idle_behavior/idle_npc_wander/stationary
	step_chance = 0

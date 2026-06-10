#define BB_HEADLESS_REND_COOLDOWN	"rend_cooldown"
#define BB_HEADLESS_KNOCKOUT_COOLDOWN "knockout_cooldown"
#define BB_HEADLESS_STOMP_COOLDOWN	"stomp_cooldown"

///what corpse we'll next try to head stomp
#define BB_BASIC_MOB_UNCONSCIOUS_TARGET "BB_basic_mob_unconscious_target"

/datum/ai_controller/headless
	movement_delay = 0.35 SECONDS

	ai_movement = /datum/ai_movement/hybrid_pathing

	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic(),
		BB_HEADLESS_REND_COOLDOWN = 0,
		BB_HEADLESS_KNOCKOUT_COOLDOWN = 0,
		BB_HEADLESS_STOMP_COOLDOWN = 0
	)

	//CC Edit - Custom Planning.
	planning_subtrees = list(
		/datum/ai_planning_subtree/flee_target,

		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/rend_target, //Use abilities first before we try to attack.
		/datum/ai_planning_subtree/knockout_target, //JUMP AWAY once you see the little red warning!
		/datum/ai_planning_subtree/basic_melee_attack_subtree,

		//We don't eat corpses. We stomp em.
		/datum/ai_planning_subtree/find_unconscious_bodies, //Scan the nearest target to stomp.
		/datum/ai_planning_subtree/head_stomp,
	)

//CC Edit - We use our own Headless with custom mechanics.

// KNOCKOUT BEGIN ==================================

/datum/ai_planning_subtree/knockout_target

/datum/ai_planning_subtree/knockout_target/SelectBehaviors(datum/ai_controller/controller, delta_time)
	var/atom/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(QDELETED(target))
		return

	if(!controller.pawn.Adjacent(target))
		return

	if(controller.blackboard[BB_HEADLESS_KNOCKOUT_COOLDOWN] > world.time)
		return

	controller.queue_behavior(/datum/ai_behavior/knockout_target, BB_BASIC_MOB_CURRENT_TARGET)
	return SUBTREE_RETURN_FINISH_PLANNING

/datum/ai_behavior/knockout_target
    //action_cooldown = 1 MINUTES //Only do this every 1 Minute.

/datum/ai_behavior/knockout_target/perform(seconds_per_tick, datum/ai_controller/controller, target_key)
	. = ..()
	var/mob/living/simple_animal/pawn = controller.pawn
	var/mob/living/target = controller.blackboard[target_key]
	if (!target || QDELETED(target) || !isliving(target))
		finish_action(controller, FALSE, target_key)
		return

	if(!target.Adjacent(pawn)) //Failsafe.
		finish_action(controller, FALSE, target_key)
		return
	
	//Only attempt if we are immobilized, often caused by stam critting or by the rend attack.
	if(!target.has_status_effect(/datum/status_effect/incapacitating/immobilized))
		finish_action(controller, FALSE, target_key)
		return

	if(!target.stat) //If we are conscious.
		var/knockout_turf = get_turf(target)
		playsound(target, 'sound/combat/wooshes/blunt/wooshlarge (3).ogg', 75, TRUE) //Telegraphing audio.
		new /obj/effect/temp_visual/knockout_warning(knockout_turf)
		if(do_after(pawn, 1 SECONDS, FALSE, target, progress = FALSE)) //Don't show our progress bar.
			if(get_turf(target) == knockout_turf)
				var/atom/throw_target = get_edge_target_turf(pawn, get_dir(pawn, target))
				target.throw_at(throw_target, 4, 2)
				//Feedback for the hit.
				playsound(target, pick('sound/combat/hits/punch/p1 (1).ogg', 'sound/combat/hits/punch/p1 (2).ogg', 'sound/combat/hits/punch/p1 (3).ogg'), 75, TRUE)
				playsound(target, 'sound/villain/newheart.ogg', 33, TRUE) //Extra feedback using the Dreamer's "newheart" sound effect showing that they're slowly knocking out.
				//This attack goes through armor, give people a delay before fully conking out. The idea is that you got hit so hard you're slowly fading, and not instantly.
				target.SetSleeping(5 SECONDS) //Knockout strength of 5 seconds.
				finish_action(controller, TRUE, target_key)
				
	controller.set_blackboard_key(BB_HEADLESS_KNOCKOUT_COOLDOWN, world.time + 1 MINUTES)
	finish_action(controller, FALSE, target_key)

// REND BEGIN ==================================

/datum/ai_planning_subtree/rend_target

/datum/ai_planning_subtree/rend_target/SelectBehaviors(datum/ai_controller/controller, delta_time)
	var/atom/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(QDELETED(target))
		return
	
	if(!controller.pawn.Adjacent(target))
		return
	
	if(controller.blackboard[BB_HEADLESS_REND_COOLDOWN] > world.time)
		return

	controller.queue_behavior(/datum/ai_behavior/rend_target, BB_BASIC_MOB_CURRENT_TARGET)
	return SUBTREE_RETURN_FINISH_PLANNING

/datum/ai_behavior/rend_target
    //action_cooldown = 5 SECONDS //Only do this every 5 seconds. We're a deadly threat.

/datum/ai_behavior/rend_target/perform(seconds_per_tick, datum/ai_controller/controller, target_key)
	. = ..()
	var/mob/living/simple_animal/pawn = controller.pawn
	var/mob/living/target = controller.blackboard[target_key]
	var/const/rend_damage = 30
	
	if (!target || QDELETED(target) || !isliving(target))
		finish_action(controller, FALSE, target_key)
		return
	
	if(!target.Adjacent(pawn)) //Failsafe.
		finish_action(controller, FALSE, target_key)
		return
	
	//Unique to Rend Target, check if they are already immobilized. We want to limit stacking immobilization.
	if(target.has_status_effect(STATUS_EFFECT_IMMOBILIZED))
		return

	if(!target.stat) //If we are conscious.
		var/rend_turf = get_turf(target)
		playsound(target, 'sound/combat/wooshes/blunt/wooshhuge (2).ogg', 75, TRUE)
		new /obj/effect/temp_visual/rend_warning(rend_turf)
		if(do_after(pawn, 0.3 SECONDS, FALSE, target, progress = FALSE)) //Don't show our progress bar, but do show our special telegraph.
			if(get_turf(target) == rend_turf)
				target.Immobilize(25) //2.5 Seconds, enough to follow up with a headbutt.
				shake_camera(target, 2, 2)
				playsound(target, 'sound/combat/caught.ogg', 75, TRUE)
				var/def_zone = pick(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG, BODY_ZONE_CHEST, BODY_ZONE_HEAD, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM)

				//Three nasty hits afterwards as long as you're in range.
				if(do_after(pawn, 0.1 SECONDS, FALSE, target, progress = FALSE))
					target.apply_damage(rend_damage, BRUTE, def_zone, target.run_armor_check(def_zone, "stab", armor_penetration = PEN_HEAVY, damage = rend_damage))
					playsound(target, 'sound/combat/hits/bladed/largeslash (1).ogg', 75, TRUE)
				if(do_after(pawn, 0.1 SECONDS, FALSE, target, progress = FALSE))
					target.apply_damage(rend_damage, BRUTE, def_zone, target.run_armor_check(def_zone, "stab", armor_penetration = PEN_HEAVY, damage = rend_damage))
					playsound(target, 'sound/combat/hits/bladed/largeslash (2).ogg', 75, TRUE)
				if(do_after(pawn, 0.1 SECONDS, FALSE, target, progress = FALSE))
					target.apply_damage(rend_damage, BRUTE, def_zone, target.run_armor_check(def_zone, "stab", armor_penetration = PEN_HEAVY, damage = rend_damage))
					playsound(target, 'sound/combat/hits/bladed/largeslash (3).ogg', 75, TRUE)
					finish_action(controller, TRUE, target_key)

	controller.set_blackboard_key(BB_HEADLESS_REND_COOLDOWN, world.time + rand(5 SECONDS, 10 SECONDS)) //Random between 5-10 seconds intentional.
	finish_action(controller, FALSE, target_key)

// HEAD STOMP / EXECUTE BEGIN ==================================

/datum/ai_planning_subtree/head_stomp
	var/datum/ai_behavior/head_stomp/behavior = /datum/ai_behavior/head_stomp

/datum/ai_planning_subtree/head_stomp/SelectBehaviors(datum/ai_controller/controller, delta_time)
	var/atom/target = controller.blackboard[BB_BASIC_MOB_UNCONSCIOUS_TARGET] //Specifically check for unconscious targets.
	if(QDELETED(target))
		return

	if(!controller.pawn.Adjacent(target))
		return

	if(controller.blackboard[BB_HEADLESS_STOMP_COOLDOWN] > world.time)
		return

	controller.queue_behavior(/datum/ai_behavior/head_stomp, BB_BASIC_MOB_UNCONSCIOUS_TARGET) //Specifically check for unconscious targets.
	return SUBTREE_RETURN_FINISH_PLANNING

/datum/ai_behavior/head_stomp
    //action_cooldown = 5 MINUTES //This is an execute ability that should only ever be done once during combat with anyone. Bring your friends.

/datum/ai_behavior/head_stomp/perform(seconds_per_tick, datum/ai_controller/controller, target_key)
	. = ..()
	var/mob/living/simple_animal/pawn = controller.pawn
	var/mob/living/target = controller.blackboard[target_key]

	if (!target || QDELETED(target) || !isliving(target))
		finish_action(controller, FALSE, target_key)
		return

	if(!target.Adjacent(pawn)) //Failsafe.
		finish_action(controller, FALSE, target_key)
		return

	//Just crush the simple mobs with a huge 200 brute.
	if(issimple(target))
		if(do_after(pawn, 3 SECONDS, FALSE, target, progress = FALSE))
			target.adjustBruteLoss(200)
			controller.set_blackboard_key(BB_HEADLESS_STOMP_COOLDOWN, world.time + action_cooldown)
			finish_action(controller, TRUE, target_key)
			return

	if(target.stat > CONSCIOUS) //If we are unconscious.
		if(do_after(pawn, 3 SECONDS, FALSE, target, progress = TRUE)) //Do show our progress bar.
			playsound(target, 'sound/combat/caught.ogg', 75, TRUE)
			target.Stun(10)
			target.death() //Instantly kill the target as well.
			var/obj/item/bodypart/head = target.get_bodypart(BODY_ZONE_HEAD)
			var/CON_prob = ((target.STACON / pawn.STASTR * 100) - 100) // Target CON vs Headless STR
			
			//Always garuntee the head gets SKULLCRACKED.
			head.add_wound(/datum/wound/fracture/head)

			//Other extra shit based on CON probability.
			if(prob(CON_prob)) //CON CHECK!
				head.add_wound(/datum/wound/fracture/head/brain)
			if(prob(CON_prob)) //CON CHECK!
				head.add_wound(/datum/wound/fracture/head/eyes)
			if(prob(CON_prob)) //CON CHECK!
				head.add_wound(/datum/wound/fracture/head/ears)
			if(prob(CON_prob)) //CON CHECK!
				head.add_wound(/datum/wound/fracture/head/nose)
			finish_action(controller, TRUE, target_key)

			
	controller.set_blackboard_key(BB_HEADLESS_STOMP_COOLDOWN, world.time + 5 MINUTES)
	finish_action(controller, FALSE, target_key)

//Clear our current target after stomping them.
/datum/ai_behavior/head_stomp/finish_action(datum/ai_controller/controller, succeeded, target_key)
    . = ..()
    if(!succeeded)
        controller.clear_blackboard_key(target_key)
    controller.clear_blackboard_key(target_key)

#undef BB_HEADLESS_REND_COOLDOWN
#undef BB_HEADLESS_KNOCKOUT_COOLDOWN
#undef BB_HEADLESS_STOMP_COOLDOWN

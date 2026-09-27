/*
*/
/datum/action/cooldown/spell/telegraphed_strike/dragons_breath/mob_ability
	abstract_type = /datum/action/cooldown/spell/telegraphed_strike/dragons_breath/mob_ability
	button_icon = 'icons/mob/actions/mob_actions.dmi'
	button_icon_state = "dragons_breath"
	panel = null
	cooldown_time = 25 SECONDS
	npc_min_range = 0
	npc_max_range = 4
	use_chance = 45
	shared_cooldown = "mob_special"
	lockout_time = 5 SECONDS

	invocations = list()
	invocation_type = INVOCATION_NONE
	sound = null
	primary_resource_type = SPELL_COST_NONE
	spell_requirements = SPELL_REQUIRES_SAME_Z
	associated_stat = null
	has_visual_effects = FALSE
	glow_intensity = 0
	spell_impact_intensity = SPELL_IMPACT_NONE
	charge_slowdown = CHARGING_SLOWDOWN_NONE
	blocked_by_antimagic = FALSE
	spare_allies = TRUE
	require_target_in_pattern = TRUE
	freeze_cast = FALSE
	track_target = TRUE
	damage_structures = FALSE

	telegraph_type = /obj/effect/temp_visual/telegraph/primordial/fire
	telegraph_sound = list('sound/magic/fireball.ogg')

	damage = 55
	push_dist = 0
	detonate_sound = list('sound/misc/explode/incendiary (1).ogg','sound/misc/explode/incendiary (2).ogg')
	hit_sound = list('sound/items/firelight.ogg')

/datum/action/cooldown/spell/telegraphed_strike/dragons_breath/mob_ability/drakkyn
	name = "Dragon's Breath"
	desc = "Exhale a cone of flame."
	required_zones = list(BODY_ZONE_HEAD)
	cast_effect_x_offset = 32
	cast_effect_y_offset = 32

/datum/action/cooldown/spell/telegraphed_strike/dragons_breath/mob_ability/drakkyn/greater
	cooldown_time = 20 SECONDS
	damage = 60
	cone_range = 5
	npc_max_range = 5
	scorch_stacks = 2


/datum/action/cooldown/spell/projectile/fireball/mob_ability
	abstract_type = /datum/action/cooldown/spell/projectile/fireball/mob_ability
	panel = null
	use_chance = 100
	shared_cooldown = "mob_special"
	lockout_time = 5 SECONDS
	cooldown_time = 20 SECONDS
	npc_min_range = 4
	npc_max_range = 9

	retrigger_after_cooldown = FALSE
	self_cast_possible = FALSE
	invocations = list()
	invocation_type = INVOCATION_NONE
	sound = null
	primary_resource_type = SPELL_COST_NONE
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC
	associated_stat = null
	has_visual_effects = FALSE
	glow_intensity = 0
	weapon_cast_penalized = FALSE

	charge_required = TRUE
	charge_time = TELEGRAPH_HIGH_IMPACT
	charge_sound = null
	charge_slowdown = CHARGING_SLOWDOWN_NONE
	charge_swingdelay_type = SWINGDELAY_NORMAL
	hold_drain = 0
	freeze_cast = FALSE

	telegraph_sound = list('sound/magic/fireball.ogg')

	var/damage_mult = 1

/datum/action/cooldown/spell/projectile/fireball/mob_ability/cast(atom/cast_on)
	if(!npc_controlled() || can_use(cast_on))
		return ..()
	return TRUE

/datum/action/cooldown/spell/projectile/fireball/mob_ability/ready_projectile(obj/projectile/to_fire, atom/target, mob/user, iteration)
	. = ..()
	if(damage_mult == 1)
		return
	to_fire.damage *= damage_mult
	var/obj/projectile/magic/aoe/fireball/rogue/bolt = to_fire
	if(istype(bolt))
		bolt.arcyne_aoe_damage *= damage_mult

/datum/action/cooldown/spell/projectile/fireball/mob_ability/drakkyn
	name = "Drakkyn Fireball"
	button_icon = 'icons/mob/actions/mob_actions.dmi'
	button_icon_state = "drakkyn_fireball"
	use_chance = 15
	required_zones = list(BODY_ZONE_HEAD)
	cast_effect_x_offset = 32
	cast_effect_y_offset = 32

/datum/action/cooldown/spell/projectile/fireball/mob_ability/drakkyn/greater
	cooldown_time = 15 SECONDS
	damage_mult = 1.5

/datum/action/cooldown/spell/projectile/fireball/mob_ability/watcher
	name = "Eye of Fire"
	button_icon = 'icons/mob/actions/mob_actions.dmi'
	button_icon_state = "eye_of_fire"
	cooldown_time = 8 SECONDS
	npc_min_range = 2
	npc_max_range = 9
	use_chance = 70

//Caustic Edit - Add in the Mass Fire ability for the Ifrit Matriarch in Desert Town!
// Burst fire from the ground in a pattern of expanding rings
// Reworking it to instead cast expanding walls of flame that will first target the cardinals, and step outward, getting 1 tile longer for each step so it makes a cone effect. Direct Diagonals are safe!
// If anyone is hit by this, it does not cast the Diagonal pattern. Otherwise it has a percent chance to do that after.
/datum/action/cooldown/spell/matriarchs_flame
	//click_to_activate = FALSE
	//self_cast_possible = TRUE
	weapon_cast_penalized = FALSE
	charge_required = FALSE

	abstract_type = /datum/action/cooldown/spell/matriarchs_flame
	name = "Matriarch's Flame"
	desc = "Blast away nearby foes with expanding rings of flame all around you!"
	button_icon = 'icons/mob/actions/mob_actions.dmi'
	button_icon_state = "drakkyn_fireball"
	panel = null
	cooldown_time = 60.5 SECONDS
	npc_min_range = 0
	npc_max_range = 2
	use_chance = 25
	shared_cooldown = "mob_special"
	lockout_time = 10 SECONDS

	invocations = list()
	invocation_type = INVOCATION_NONE
	sound = null
	primary_resource_type = SPELL_COST_NONE
	spell_requirements = SPELL_REQUIRES_SAME_Z
	associated_stat = null
	has_visual_effects = FALSE
	glow_intensity = 0
	spell_impact_intensity = SPELL_IMPACT_HIGH
	charge_slowdown = CHARGING_SLOWDOWN_NONE
	blocked_by_antimagic = FALSE
	spare_allies = TRUE
	//freeze_cast = TRUE

	telegraph_sound = list('sound/magic/charged.ogg')

	// Constant amount of time added before the blasts actually go off!
	var/static_delay = 1 SECONDS
	// How long is the delay between each set of expanding rings?
	var/consecutive_ring_delay = 0.4 SECONDS
	// Number of Rings to create? The first always starts adjacent and the later ones expand outward
	var/num_rings = 3
	// Chance to Recast on Diagonals if no one is hit? If anyone IS hit, then it will never cast a second time.
	var/recast_chance = 75
	var/scorch_stacks = 2
	var/knockback = 3
	var/successful_hit = FALSE

/obj/effect/temp_visual/telegraph/matriarchs_flame
	duration = 10 SECONDS
	layer = MASSIVE_OBJ_LAYER
	plane = GAME_PLANE

/obj/effect/temp_visual/matriarchs_flame_flicker
	icon = 'icons/effects/fire.dmi'
	icon_state = "1"
	light_outer_range = 2
	light_color = "#FF6A00"
	duration = 1.2 SECONDS

/obj/effect/temp_visual/matriarchs_flame_flicker/proc/erupt()
	icon = 'icons/effects/fire.dmi'
	icon_state = "3"

/datum/action/cooldown/spell/matriarchs_flame/cast(atom/cast_on, var/secondary = FALSE)
	. = ..()
	var/mob/living/user = owner
	var/turf/source_turf = get_turf(user)
	if(!secondary)
		if(!istype(user))
			return FALSE
		var/turf/T = get_turf(cast_on)
		if(!T)
			return FALSE
		if(T.z != user.z)
			return FALSE
	else
		if(successful_hit)
			return TRUE

	var/list/centers = list()
	var/list/step_dir = list()

	if(!secondary)
		successful_hit = FALSE

		centers |= get_step(source_turf, NORTH)
		step_dir |= NORTH//list(EAST, WEST)
		centers |= get_step(source_turf, SOUTH)
		step_dir |= SOUTH//list(EAST, WEST)
		centers |= get_step(source_turf, EAST)
		step_dir |= EAST//list(NORTH, SOUTH)
		centers |= get_step(source_turf, WEST)
		step_dir |= WEST//list(NORTH, SOUTH)
	else
		centers |= get_step(source_turf, NORTHEAST)
		step_dir |= NORTHEAST//list(WEST, SOUTH)
		centers |= get_step(source_turf, NORTHWEST)
		step_dir |= NORTHWEST//list(EAST, SOUTH)
		centers |= get_step(source_turf, SOUTHEAST)
		step_dir |= SOUTHEAST//list(NORTH, WEST)
		centers |= get_step(source_turf, SOUTHWEST)
		step_dir |= SOUTHWEST//list(NORTH, EAST)

	for(var/distance = 1, distance <= num_rings, distance++)
		var/list/current_ring = centers.Copy()
		var/width = distance - 1

		var/left_dir
		var/right_dir

		for(var/offset = 1, offset <= width, offset++)
			for(var/i = 1, i <= 4, i++)
				var/turf/L = centers[i]
				var/turf/R = centers[i]
				var/step_in = step_dir[i]

				switch(step_in)
					if(NORTH, SOUTH)
						left_dir = EAST
						right_dir = WEST
					if(EAST, WEST)
						left_dir = NORTH
						right_dir = SOUTH
					if(NORTHEAST)
						left_dir = WEST
						right_dir = SOUTH
					if(NORTHWEST)
						left_dir = EAST
						right_dir = SOUTH
					if(SOUTHEAST)
						left_dir = WEST
						right_dir = NORTH
					if(SOUTHWEST)
						left_dir = EAST
						right_dir = NORTH

				for(var/j = 1, j <= offset, j++)
					L = get_step(L, left_dir)
					if(L)
						current_ring |= L

					R = get_step(R, right_dir)
					if(R)
						current_ring |= R

		var/tile_delay = static_delay + (consecutive_ring_delay * distance)

		for(var/turf/affected_turf in current_ring)
			if(!(affected_turf in view(source_turf)))
				continue

			new /obj/effect/temp_visual/telegraph/matriarchs_flame(affected_turf, tile_delay)
			addtimer(CALLBACK(src, PROC_REF(ignite), affected_turf, source_turf), tile_delay)

		if(distance <= num_rings) //No need to repeat this if it's the last iteration
			var/list/next_centers = list()
			if(!secondary)
				next_centers |= get_step(centers[1], NORTH)
				next_centers |= get_step(centers[2], SOUTH)
				next_centers |= get_step(centers[3], EAST)
				next_centers |= get_step(centers[4], WEST)
			else
				next_centers |= get_step(centers[1], NORTHEAST)
				next_centers |= get_step(centers[2], NORTHWEST)
				next_centers |= get_step(centers[3], SOUTHEAST)
				next_centers |= get_step(centers[4], SOUTHWEST)

			centers = next_centers

	var/delayTime = (static_delay + (consecutive_ring_delay * num_rings))
	if(!secondary)
		user.visible_message(span_yellow("[user] starts to glow, the burning heat growing intense! Cracks of flame creep outwards along the ground as they threaten to burst skyward!"))
		user.Stun(delayTime + (0.4 SECONDS), ignore_canstun = TRUE) //Immobilized for the duration of the attack, plus a little extra to account for a small cooldown time, and the potential second wave
		addtimer(CALLBACK(src, PROC_REF(cast), cast_on, TRUE), delayTime + (0.2 SECONDS))
	else
		user.Stun(delayTime + (0.2 SECONDS), ignore_canstun = TRUE) //Slightly reduced immobilize time if it is the second one, since there's no need to hold it for too long here

	return TRUE

/datum/action/cooldown/spell/matriarchs_flame/proc/ignite(turf/damage_turf, turf/source_turf)
	var/obj/effect/temp_visual/matriarchs_flame_flicker/spark = new /obj/effect/temp_visual/matriarchs_flame_flicker(damage_turf)
	addtimer(CALLBACK(spark, TYPE_PROC_REF(/obj/effect/temp_visual/matriarchs_flame_flicker, erupt)), 0.1 SECONDS) // Is this even efficient? I'm unsure heh
	playsound(damage_turf, 'sound/misc/explode/incendiary (1).ogg', 50, TRUE)

	for(var/mob/living/L in damage_turf)
		if(L == owner)
			continue
		successful_hit = TRUE
		apply_scorch_stack(L, scorch_stacks)
		var/push_dir = get_dir(source_turf, L)
		if(!push_dir)
			push_dir = telegraph_cardinal(owner.dir)
		L.safe_throw_at(get_ranged_target_turf(L, push_dir, knockback), knockback, 2, owner, TRUE, force = MOVE_FORCE_STRONG)
		to_chat(L, span_userdanger("The flames blast you away as they leave you scorched!"))
//Caustic Edit End

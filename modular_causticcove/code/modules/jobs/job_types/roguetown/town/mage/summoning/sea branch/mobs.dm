/mob/living/simple_animal/hostile/retaliate/rogue/deepsea
	anatomy_type = /datum/anatomy/construct/tough
	obj_damage = 75
	blood_toll_bucket = STATS_KILLED_ELEMENTALS

	icon = 'modular_causticcove/icons/mob/monster/summons/sea.dmi'

	icon_dead = "vvd"
	gender = MALE
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 3
	see_in_dark = 6
	butcher_results = list()
	faction = list(FACTION_ELEMENTAL)
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	simple_detect_bonus = 20
	retreat_distance = 0
	minimum_distance = 0
	food_type = list()
	base_intents = list(/datum/intent/simple/bite)
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	simple_detect_bonus = 20
	deaggroprob = 0
	candodge = TRUE
	retreat_health = 0
	food = 0
	attack_sound = 'sound/combat/hits/onstone/wallhit.ogg'
	dodgetime = 30
	aggressive = 1


/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/Initialize()
	. = ..()
	desc += span_bold(" It does not belong to this plane.") // To hint that they may be summoned.
	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NPC_EXAMINE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAINSTUN, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/attackby(obj/item/I, mob/living/carbon/human/user, params)
	if(istype(I, /obj/item/magic))
		var/obj/item/magic/magicmaterial = I
		if(istype(magicmaterial, /obj/item/magic/deepsea))
			if(health == maxHealth)
				to_chat(user, "[src] is already healthy!")
				return
			to_chat(user, "I start healing [src] with [magicmaterial].")
			if(do_mob(user, src, 20))
				var/tier_diff = magicmaterial.tier / summon_tier //find the percentage of the guy we're healing based on the tier of our magic material
				visible_message("[src] absorbs [magicmaterial] and is healed.")
				adjustBruteLoss(-maxHealth * tier_diff)
				qdel(magicmaterial)
				return
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/stingray
	name = "ocean glider"
	desc = "An abnormal stinyray, gliding through the coral depths of the sea."
	summon_primer = "You are an ocean glider."
	summon_tier = 2
	icon_state = "ray"
	icon_living = "ray"

	move_to_delay = 2

	health = 450
	maxHealth = 450
	melee_damage_lower = 65
	melee_damage_upper = 65

	defprob = 70

	AIStatus = AI_OFF
	can_have_ai = FALSE
	ai_controller = /datum/ai_controller/minotaur
	move_base_delay = MOVEMENT_DELAY_SPD_17

	STACON = 10
	STAWIL = 12
	STASTR = 12
	STASPD = 18
	STAPER = 16

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/stingray/death(gibbed)
	..()
	var/turf/deathspot = get_turf(src)
	for(var/i =1 to 3)
		new /obj/item/magic/deepsea/tierone(deathspot)
	update_icon()
	spill_embedded_objects()
	qdel(src)

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/stingray/Initialize(mapload)
	. = ..()
	var/datum/action/cooldown/spell/telegraphed_strike/mob_ability/minotaur_charge/stingray/charge = new(src)
	charge.Grant(src)

/datum/action/cooldown/spell/telegraphed_strike/mob_ability/minotaur_charge/stingray
	name = "Wave Crash"
	desc = "Lowers your horns and runs your quarry down."
	button_icon_state = "gore_charge"
	cooldown_time = 0.5 SECONDS
	freeze_cast = FALSE

	use_chance = 100
	npc_min_range = 0
	npc_max_range = 8
	required_zones = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM)

	windup_time = TELEGRAPH_DODGEABLE
	track_target = FALSE
	lock_direction = TRUE
	committed_strike = TRUE
	interruptible = FALSE
	damage_structures = TRUE
	strike_sound = 'sound/combat/clash_charge.ogg'
	recovery_time = 0.5 SECONDS
	telegraph_sound = list('sound/combat/wooshes/blunt/wooshhuge (1).ogg','sound/combat/wooshes/blunt/wooshhuge (2).ogg','sound/combat/wooshes/blunt/wooshhuge (3).ogg')
	cast_effect_x_offset = 16
	cast_effect_y_offset = 16

	lane_length = 7
	gore_damage = 50
	gore_exposed = 0.5 SECONDS
	slam_stun = 0.5 SECONDS
	slam_exposed = 0.5 SECONDS
	brace_damage = 30
	brace_recovery = 0.5 SECONDS

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/coralback
	name = "living heartstone"
	desc = "A large hunk of beating heartstone."
	summon_primer = "You are a living heartstone."
	summon_tier = 2
	icon_state = "coralback"
	icon_living = "coralback"

	health = 600
	maxHealth = 600
	melee_damage_lower = 45
	melee_damage_upper = 45

	move_to_delay = 12

	defprob = 30

	STACON = 14
	STAWIL = 14
	STASTR = 12
	STASPD = 12
	STAPER = 12

	ai_controller = /datum/ai_controller/infernal/harasser
	move_base_delay = MOVEMENT_DELAY_SPD_10

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/coralback/death(gibbed)
	..()
	var/turf/deathspot = get_turf(src)
	for(var/i =1 to 3)
		new /obj/item/magic/deepsea/tiertwo(deathspot)
	update_icon()
	spill_embedded_objects()
	qdel(src)

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/coralback/Initialize(mapload)
	. = ..()
	var/datum/action/cooldown/spell/projectile/gravel_blast/coralstone_ability/magicprojectile = new(src)
	magicprojectile.Grant(src)

/datum/action/cooldown/spell/projectile/gravel_blast/coralstone_ability
	abstract_type = /datum/action/cooldown/spell/projectile/fireball/mob_ability
	panel = null
	use_chance = 100
	shared_cooldown = "mob_special"
	lockout_time = 1 SECONDS
	cooldown_time = 3 SECONDS
	npc_min_range = 0
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


/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/ghostlight
	name = "deepsea ghostlight"
	desc = "A giant jellyfish from the deep sea."
	summon_primer = "You are a deepsea ghostlight."
	summon_tier = 2
	icon_state = "jellyfish"
	icon_living = "jellyfish"

	health = 650
	maxHealth = 650
	melee_damage_lower = 45
	melee_damage_upper = 45

	move_to_delay = 1

	STACON = 16
	STAWIL = 16
	STASTR = 14
	STASPD = 14
	STAPER = 14

	defprob = 50

	ai_controller = /datum/ai_controller/infernal
	move_base_delay = MOVEMENT_DELAY_SLOW

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/ghostlight/death(gibbed)
	..()
	var/turf/deathspot = get_turf(src)
	for(var/i =1 to 3)
		new /obj/item/magic/deepsea/tierthree(deathspot)
	update_icon()
	spill_embedded_objects()
	qdel(src)

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/ghostlight/Initialize(mapload)
	. = ..()
	var/datum/action/cooldown/spell/telegraphed_strike/mob_ability/ground/lighting_storm/storm = new(src)
	storm.Grant(src)
	var/datum/action/cooldown/spell/telegraphed_strike/mob_ability/ground/hurled_rock/lighting_toss/magicprojectile = new(src)
	magicprojectile.Grant(src)

/datum/action/cooldown/spell/telegraphed_strike/mob_ability/ground/lighting_storm
	name = "Lighting Storm"
	desc = "Calls a rain of lighting down."
	button_icon_state = "meteor_storm"
	cooldown_time = 12 SECONDS
	lockout_time = 8 SECONDS
	npc_min_range = 0
	npc_max_range = 9
	cast_range = 9
	use_chance = 80
	required_zones = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM)

	windup_time = TELEGRAPH_ULTIMATE
	telegraph_type = /obj/effect/temp_visual/telegraph/hellfire
	telegraph_sound = list('sound/magic/lightning.ogg')
	recovery_time = 3 SECONDS
	recovery_status = /datum/status_effect/debuff/vulnerable
	recovery_slowdown = CHARGING_SLOWDOWN_MEDIUM

	blast_radius = 3
	damage = 30
	strike_damage_type = BURN
	blade_class = BCLASS_BURN
	strike_armor_pen = PEN_LIGHT
	damage_structures = TRUE
	structure_damage = 60
	strike_sound = null
	detonate_sound = null
	hit_sound = list('sound/misc/explode/incendiary (1).ogg','sound/misc/explode/incendiary (2).ogg')


/datum/action/cooldown/spell/telegraphed_strike/mob_ability/ground/lighting_storm/on_pattern_turf(turf/T, mob/living/H, facing)
	new /obj/effect/temp_visual/thunderstrike_actual(T)

/datum/action/cooldown/spell/telegraphed_strike/mob_ability/ground/hurled_rock/lighting_toss
	name = "Lighting Toss"
	desc = "Toss a bolt of lighting at your target."
	button_icon_state = "stone_throw"
	cooldown_time = 20 SECONDS
	npc_min_range = 0
	npc_max_range = 7
	cast_range = 7
	use_chance = 100
	required_zones = list(BODY_ZONE_R_LEG, BODY_ZONE_L_LEG)

	windup_time = TELEGRAPH_AREA_DENIAL
	telegraph_sound = list('sound/items/dig_shovel.ogg')
	recovery_time = 5 SECONDS
	recovery_slowdown = CHARGING_SLOWDOWN_MEDIUM
	recovery_status = /datum/status_effect/debuff/vulnerable

	blast_radius = 2
	damage = 40
	damage = 30
	strike_damage_type = BURN
	blade_class = BCLASS_BURN
	strike_armor_pen = PEN_LIGHT
	damage_structures = TRUE
	structure_damage = 60
	strike_sound = 'sound/magic/lightning.ogg'
	hit_sound = list('sound/magic/lightning.ogg')
	impact_sound = list('sound/magic/lightning.ogg')
	rock_type = /obj/effect/projectile/tracer/stun

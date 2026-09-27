/mob/living/simple_animal/hostile/retaliate/rogue/ifrit	//This way don't need new unqiue AI controller. Wolves are modular anyway.
	threat_point = THREAT_ELITE
	anatomy_type = /datum/anatomy/biped
	attack_aim = MOB_AIM_LEVEL
	icon = 'modular_ratwood/icons/roguetown/mob/monster/ifrit.dmi'
	name = "ifrit"
	desc = "Heat from the desert brought to lyfe, it stares at you with a canine visage filled with smoke and anger."
	icon_state = "ifrit"
	icon_living = "ifrit"
	icon_dead = "ifrit_dead"
	ambushable = FALSE
	base_intents = list(/datum/intent/simple/bite/bear)
	faction = list("ifrit")
	mob_biotypes = MOB_ORGANIC|MOB_SPIRIT
	blood_toll_bucket = STATS_KILLED_INFERNALS
	melee_damage_lower = 50
	melee_damage_upper = 60
	vision_range = 6
	aggro_vision_range = 8
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES // silly furniture won't stop our boy
	milkies = FALSE
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	health = 500	//volf is 120, saigabuck is 400, antlions 660
	maxHealth = 500
	food_type = list(/obj/item/reagent_containers/food/snacks,
				/obj/item/bodypart, 	//Woe be upon ye
				/obj/item/organ, 		//Woe be upon ye
				/obj/effect/decal/remains,
				)
	STACON = 12
	STASTR = 13
	STASPD = 9
	simple_detect_bonus = 40	//No sneaking by our boy..
	deaggroprob = 0
	defprob = 40
	del_on_deaggro = FALSE //we dont despawn, our boy chills
	food = 0
	remains_type = null
	attack_sound = list('sound/vo/mobs/direbear/direbear_attack1.ogg','sound/vo/mobs/direbear/direbear_attack2.ogg','sound/vo/mobs/direbear/direbear_attack3.ogg')
	dodgetime = 30
	aggressive = 1
	stat_attack = UNCONSCIOUS	//You falling unconcious won't save you, little one..
	eat_forever = TRUE
	canparry = TRUE
	minbodytemp = 250
	maxbodytemp = INFINITY

//new ai, old ai off
	AIStatus = AI_OFF
	can_have_ai = FALSE
	ai_controller = /datum/ai_controller/ifrit

/datum/action/cooldown/spell/telegraphed_strike/dragons_breath/mob_ability/ifrit
	name = "Dragon's Breath"
	desc = "Exhale a cone of flame."
	required_zones = list(BODY_ZONE_HEAD)
	cone_range = 4

/mob/living/simple_animal/hostile/retaliate/rogue/ifrit/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/magic/charging_fire.ogg')	//Placeholder till we get more sounds
		if("pain")
			return pick('sound/magic/charging_fire.ogg')	//Placeholder till we get more sounds
		if("death")
			return pick('sound/magic/charging_fire.ogg')


/datum/intent/simple/bite/frit
	clickcd = WOLF_ATTACK_SPEED

/mob/living/simple_animal/hostile/retaliate/rogue/ifrit/Initialize(mapload)
	. = ..()
	var/datum/action/cooldown/spell/telegraphed_strike/dragons_breath/mob_ability/ifrit/fire = new(src)
	fire.Grant(src)
	ai_controller.set_blackboard_key(BB_TARGETED_ACTION, fire)
	ADD_TRAIT(src, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOFIRE, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/ifrit/matriarch
	threat_point = THREAT_LEGENDARY
	icon = 'modular_ratwood/icons/roguetown/mob/monster/ifritmatriarch.dmi'
	health = DRAGON_BROODMOTHER_HEALTH
	maxHealth = DRAGON_BROODMOTHER_HEALTH
	name = "ifrit Matriarch"
	desc = "The desert's heat demonically made manifest and sealed away. Run or Fight for your lyfe."
	health = 8000
	maxHealth = 8000
	icon_state = "ifrit_queen"
	icon_living = "ifrit_queen"
	icon_dead = "ifrit_queen_dead"
	wander = 0
	base_intents = list(/datum/intent/unarmed/dragonclaw)
	ranged_cooldown_time = 20 SECONDS
	var/datum/action/cooldown/spell/telegraphed_strike/dragons_breath/mob_ability/ifrit/fire_breath
	var/datum/action/cooldown/spell/matriarchs_flame/firewheel
	pixel_x = -32
	STACON = 20
	STASTR = 20
	STASPD = 13
	move_base_delay = MOVEMENT_DELAY_SPD_10

/mob/living/simple_animal/hostile/retaliate/rogue/ifrit/matriarch/Initialize(mapload)
	. = ..()
	firewheel = new(src)
	firewheel.Grant(src)
	//fire_breath = new(src)
	//fire_breath.Grant(src)

	//ai_controller.set_blackboard_key(BB_TARGETED_ACTION, fire_breath)
	ai_controller.movement_delay = MOVEMENT_DELAY_SPD_10
	ai_controller.set_blackboard_key(BB_TARGETED_ACTION, firewheel)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_INFINITE_STAMINA, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOFIRE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NIGHT_VISION, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BASHDOORS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_STRONGBITE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOFALLDAMAGE1, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)
	//ADD_TRAIT(src, TRAIT_GUIDANCE, TRAIT_GENERIC)	//The ifrit boss si dangerious //This is a remnant from the old Guidance before Mage 2+3
	src.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)

/mob/living/simple_animal/hostile/retaliate/rogue/ifrit/matriarch/Destroy()
	//fire_breath.Remove(src)
	//QDEL_NULL(fire_breath)
	firewheel.Remove(src)
	QDEL_NULL(firewheel)
	.=..()

/mob/living/simple_animal/hostile/retaliate/rogue/ifrit/matriarch/boss
	loot = list(/obj/item/roguekey/mage/ifrit)

/obj/item/roguekey/mage/ifrit
	name = "drakian key"
	desc = "An ancient drakian key. Once embedded in an ifrit matriach's flame, now no more than a trophy."
	icon = 'modular_ratwood/icons/roguetown/items/keys.dmi'
	icon_state = "voidkey"//Temp. I hate temp sprites!!!!
	lockid = "ifrit"

/obj/effect/oneway/ifrit
	name = "magical barrier"
	max_integrity = 99999
	desc = "Victory or death - once you pass this point you will either triumph or fall. Recommended 5 players or more."
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	invisibility = SEE_INVISIBLE_LIVING
	anchored = TRUE

/obj/effect/oneway/ifrit/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, /obj/item/roguekey/mage/ifrit))
		visible_message(span_boldannounce("The magical barrier disperses!"))
		qdel(src)

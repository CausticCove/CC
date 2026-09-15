/mob/living/simple_animal/hostile/retaliate/rogue/antlion
	threat_point = THREAT_MODERATE
	anatomy_type = /datum/anatomy/spider
	attack_aim = MOB_AIM_LOW
	icon = 'modular_ratwood/icons/roguetown/mob/monster/antlion.dmi'
	name = "antlion"
	desc = ""
	pixel_x = -2
	pixel_y = 7
	faction = list("antlion")
	gender = MALE
	icon_state = "antlion"
	icon_living = "antlion"
	icon_dead = "antlion_dead"
	animal_species = null
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 2,
						/obj/item/natural/bone = 2,
						/obj/item/alch/viscera = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 3,
						/obj/item/natural/hide = 1,
						/obj/item/natural/bone = 3,
						/obj/item/alch/viscera = 1)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 3,
						/obj/item/natural/hide = 2,
						/obj/item/natural/bone = 3,
						/obj/item/alch/viscera = 2)
	base_intents = list(/datum/intent/simple/bite/mirespider_lurker)
	health = 660
	maxHealth = 660
	pass_flags = PASSTABLE | PASSMOB
	mob_size = MOB_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BUG
	blood_toll_bucket = STATS_KILLED_GREATER_BEASTS
	milkies = FALSE
	melee_damage_lower = 60
	melee_damage_upper = 90
	retreat_distance = 0
	minimum_distance = 0
	retreat_health = 0.3
	STASPD = 10
	STACON = 15
	STASTR = 12
	tame = FALSE
	food_type = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat/steak,
		/obj/item/reagent_containers/food/snacks/rogue/meat/fatty,
		/obj/item/reagent_containers/food/snacks/rogue/meat/pork_belly,
		/obj/item/reagent_containers/food/snacks/rogue/meat/bacon,
		/obj/item/reagent_containers/food/snacks/rogue/meat/spider,
		/obj/item/reagent_containers/food/snacks/rogue/meat/wolf,
		/obj/item/reagent_containers/food/snacks/rogue/meat/crab,
		/obj/item/reagent_containers/food/snacks/rogue/meat/poultry,
		/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet,
		/obj/item/reagent_containers/food/snacks/rogue/meat/rabbit,
		/obj/item/reagent_containers/food/snacks/rogue/meat/rat,
		/obj/item/reagent_containers/food/snacks/rogue/meat/bear,
		/obj/item/reagent_containers/food/snacks/rogue/meat/steak/troll,
		/obj/item/reagent_containers/food/snacks/rogue/meat/fish,
		/obj/item/reagent_containers/food/snacks/rogue/meat/shellfish,
		/obj/item/reagent_containers/food/snacks/rogue/meat/mince,
		/obj/item/reagent_containers/food/snacks/rogue/truffles,
		/obj/item/reagent_containers/food/snacks/grown/apple,
	)
	tame_chance = 5
	bonus_tame_chance = 5
	can_saddle = TRUE
	can_buckle = TRUE
	aggressive = 1
	see_in_dark = 6
	move_to_delay = 8
	remains_type = /obj/effect/decal/remains/antlion

/obj/effect/decal/remains/antlion
	name = "remains"
	gender = PLURAL
	icon_state = "bones"
	icon = 'modular_ratwood/icons/roguetown/mob/monster/antlion.dmi'

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/tame
	tame = TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOFALLDAMAGE2, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOFIRE, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/update_icon()
	cut_overlays()
	..()
	if(stat != DEAD)
		if(ssaddle)
			var/mutable_appearance/saddlet = mutable_appearance(icon, "saddle-above", 4.3)
			add_overlay(saddlet)
			saddlet = mutable_appearance(icon, "saddle")
			add_overlay(saddlet)

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/tamed()
	..()
	deaggroprob = 20
	if(can_buckle)
		var/datum/component/riding/D = LoadComponent(/datum/component/riding)
		D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 9), TEXT_SOUTH = list(0, 9), TEXT_EAST = list(-1, 9), TEXT_WEST = list(-1, 9)))
		D.set_riding_offsets(2, list(TEXT_NORTH = list(0, 1), TEXT_SOUTH = list(0, 17), TEXT_EAST = list(-9, 9), TEXT_WEST = list(7, 9)))
		D.set_vehicle_dir_layer(NORTH, MOB_LAYER+0.5)
		D.set_vehicle_dir_layer(SOUTH, OBJ_LAYER)
		D.set_vehicle_dir_layer(EAST, OBJ_LAYER)
		D.set_vehicle_dir_layer(WEST, OBJ_LAYER)

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/spider/aggro (1).ogg','sound/vo/mobs/spider/aggro (2).ogg','sound/vo/mobs/spider/aggro (3).ogg')
		if("pain")
			return pick('sound/vo/mobs/spider/pain.ogg')
		if("death")
			return pick('sound/vo/mobs/spider/death.ogg')
		if("idle")
			return pick('sound/vo/mobs/spider/idle (1).ogg','sound/vo/mobs/spider/idle (2).ogg','sound/vo/mobs/spider/idle (3).ogg','sound/vo/mobs/spider/idle (4).ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/eat_plants()
	..()
	var/obj/structure/vine/SV = locate(/obj/structure/vine) in loc
	if(SV)
		SV.eat(src)
		food = max(food + 30, 100)

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/Life()
	..()
	if(stat == CONSCIOUS)
		if(!pulledby)
			for(var/direction in shuffle(list(1,2,4,8,5,6,9,10)))
				var/step = get_step(src, direction)
				if(step)
					if(locate(/obj/structure/vine) in step || locate(/obj/structure/glowshroom) in step)
						Move(step, get_dir(src, step))
	if(stat != DEAD)
		if(has_buckled_mobs())
			icon_state = "antlion_mounted"
			icon_living = "antlion_mounted"
		else
			icon_state = "antlion"
			icon_living = "antlion"

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "snout"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "snout"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "foreleg"
		if(BODY_ZONE_L_ARM)
			return "foreleg"
	return ..()

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/saddled/Initialize(mapload)
	. = ..()
	var/obj/item/natural/saddle/S = new(src)
	ssaddle = S
	update_icon()

/mob/living/simple_animal/hostile/retaliate/rogue/antlion/tame/saddled/Initialize(mapload)
	. = ..()
	var/obj/item/natural/saddle/S = new(src)
	ssaddle = S
	update_icon()

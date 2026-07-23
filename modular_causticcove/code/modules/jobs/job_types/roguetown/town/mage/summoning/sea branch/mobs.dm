/mob/living/simple_animal/hostile/retaliate/rogue/deepsea
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

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
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
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
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
	summon_tier = 1
	icon_state = "ray"
	icon_living = "ray"

	move_to_delay = 2
	
	health = 100
	maxHealth = 100
	melee_damage_lower = 12
	melee_damage_upper = 15

	defprob = 70

	STACON = 10
	STAWIL = 10
	STASTR = 10
	STASPD = 16

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/stingray/death(gibbed)
	..()
	var/turf/deathspot = get_turf(src)
	for(var/i =1 to 6)
		new /obj/item/magic/deepsea/tierone(deathspot)
	update_icon()
	spill_embedded_objects()
	qdel(src)

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/coralback
	name = "coralback"
	desc = "A beast similiar to the mossback, found deep within the oceam."
	summon_primer = "You are an ocean coralback."
	summon_tier = 1
	icon_state = "coralback"
	icon_living = "coralback"
	
	health = 360
	maxHealth = 360
	melee_damage_lower = 20
	melee_damage_upper = 24

	move_to_delay = 5
	
	defprob = 30

	STACON = 16
	STAWIL = 16
	STASTR = 12
	STASPD = 8

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/coralback/death(gibbed)
	..()
	var/turf/deathspot = get_turf(src)
	for(var/i =1 to 6)
		new /obj/item/magic/deepsea/tiertwo(deathspot)
	for(var/i =1 to 4)
		new /obj/item/magic/deepsea/tierone(deathspot)
	update_icon()
	spill_embedded_objects()
	qdel(src)

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/ghostlight
	name = "deepsea ghostlight"
	desc = "A giant jellyfish from the deep sea."
	summon_primer = "You are a deepsea ghostlight."
	summon_tier = 1
	icon_state = "jellyfish"
	icon_living = "jellyfish"
	
	health = 750
	maxHealth = 750
	melee_damage_lower = 30
	melee_damage_upper = 35

	move_to_delay = 1
	
	STACON = 12
	STAWIL = 13
	STASTR = 13
	STASPD = 16

	defprob = 50

/mob/living/simple_animal/hostile/retaliate/rogue/deepsea/ghostlight/death(gibbed)
	..()
	var/turf/deathspot = get_turf(src)
	for(var/i =1 to 2)
		new /obj/item/magic/deepsea/tierthree(deathspot)
	for(var/i =1 to 2)
		new /obj/item/magic/deepsea/tiertwo(deathspot)
	for(var/i =1 to 4)
		new /obj/item/magic/deepsea/tierone(deathspot)
	new /obj/item/magic/melded/t1(deathspot)
	update_icon()
	spill_embedded_objects()
	qdel(src)

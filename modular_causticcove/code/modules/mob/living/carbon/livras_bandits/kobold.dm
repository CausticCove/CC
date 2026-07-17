/mob/living/carbon/human/species/kobold/npc
	name = "kobold"
	skin_tone = LIZARD_SKIN_SUNNY
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

	race = /datum/species/kobold
	gender = MALE
	blood_toll_bucket = STATS_KILLED_ORCS
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					/obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	ambushable = FALSE
	
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	d_intent = INTENT_DODGE
	possible_mmb_intents = list(INTENT_SPECIAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	faction = list(FACTION_ORCS, FACTION_STATION)
	ai_controller = /datum/ai_controller/human_npc
	cmode_music = FALSE

	var/kobold_outfit = /datum/outfit/job/roguetown/kobold_tinker_bandit

/mob/living/carbon/human/species/kobold/npc/Initialize()
	. = ..()
	set_species(/datum/species/kobold)
	gender = pick(MALE, FEMALE)
	dna.species.random_character(src)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/kobold/npc/after_creation()
	..()
	AddComponent(/datum/component/ai_aggro_system)
	equipOutfit(new kobold_outfit)
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	head.sellprice = 30

	src.set_patron(/datum/patron/inhumen/matthios)
	ADD_TRAIT(src, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_DUALWIELDER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

/datum/outfit/job/roguetown/kobold_tinker_bandit/pre_equip(mob/living/carbon/human/H)
	head =  /obj/item/clothing/head/roguetown/helmet/leather
	if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/artijacket
	else
		armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced

	H.STASTR = 10
	H.STASPD = 16
	H.STACON = 6
	H.STAWIL = 12
	H.STAINT = 18
	var/loadout = rand(1,6)
	switch(loadout)
		if(1)
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			beltl = /obj/item/quiver/bolt/pyro
		if(2)
			backr = /obj/item/twstrap/bombstrap/firebomb
		if(3)
			belt = /obj/item/storage/belt/rogue/leather/knifebelt/iron
			if(prob(15))
				r_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/fire
			else
				r_hand = /obj/item/rogueweapon/huntingknife/idagger/silver
		if(4)
			r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			backl = /obj/item/quiver/randomfill/highwayman
		if(5)
			r_hand = /obj/item/rogueweapon/huntingknife/idagger/steel
			belt = /obj/item/twstrap/bombstrap
		if(6)
			r_hand = /obj/item/rogueweapon/sword/long
			if(prob(15))
				l_hand = /obj/item/rogueweapon/shield/steam
			else
				l_hand = /obj/item/rogueweapon/shield/tower/metal/gold

	//light labor skills for armor repairs and such, equipment is so-so, with good stats
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)

	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)

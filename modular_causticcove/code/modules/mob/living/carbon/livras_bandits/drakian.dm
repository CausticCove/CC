/mob/living/carbon/human/species/drakian/npc
	name = "drakian"
	skin_tone = LIZARD_SKIN_SUNNY
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

	race = /datum/species/dracon
	gender = MALE
	blood_toll_bucket = STATS_KILLED_ORCS
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					/obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	ambushable = FALSE
	
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	d_intent = INTENT_PARRY
	possible_mmb_intents = list(INTENT_SPECIAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	faction = list(FACTION_ORCS, FACTION_STATION)
	ai_controller = /datum/ai_controller/human_npc
	cmode_music = FALSE

	var/drakian_outfit = /datum/outfit/job/roguetown/drakian_npc

/mob/living/carbon/human/species/drakian/npc/Initialize()
	. = ..()
	set_species(/datum/species/dracon)
	gender = pick(MALE, FEMALE)
	dna.species.random_character(src)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/drakian/npc/after_creation()
	..()
	AddComponent(/datum/component/ai_aggro_system)
	equipOutfit(new drakian_outfit)
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
	ADD_TRAIT(src, TRAIT_PARRYEXPERT, TRAIT_GENERIC)

/datum/outfit/job/roguetown/drakian_npc/pre_equip(mob/living/carbon/human/H)
	head =  /obj/item/clothing/head/roguetown/helmet/heavy/barbute
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	wrists = /obj/item/clothing/wrists/roguetown/bracers/iron
	neck = /obj/item/clothing/neck/roguetown/chaincoif/chainmantle
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/aalloy
	gloves = /obj/item/clothing/gloves/roguetown/plate
	pants = /obj/item/clothing/under/roguetown/brigandinelegs
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced

	H.STASTR = 14
	H.STASPD = 8
	H.STACON = 15
	H.STAWIL = 12
	H.STAINT = 14
	var/loadout = rand(1,6)
	switch(loadout)
		if(1)
			r_hand = /obj/item/rogueweapon/flail/sflail/silver
			l_hand = /obj/item/rogueweapon/shield/tower/metal
		if(2)
			r_hand = /obj/item/rogueweapon/sword/falx
			l_hand = /obj/item/rogueweapon/shield/tower/metal
		if(3)
			r_hand = /obj/item/rogueweapon/halberd
		if(4)
			r_hand = /obj/item/rogueweapon/halberd/glaive
		if(5)
			r_hand = /obj/item/rogueweapon/greatsword/zwei
		if(6)
			r_hand = /obj/item/rogueweapon/mace/steel

	//light labor skills for armor repairs and such, equipment is so-so, with good stats
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)

	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
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

/mob/living/carbon/human/species/drakian/npc/knight
	drakian_outfit = /datum/outfit/job/roguetown/drakian_npc_knight

/datum/outfit/job/roguetown/drakian_npc_knight/pre_equip(mob/living/carbon/human/H)
	H.adjust_skillrank(/datum/skill/combat/polearms, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 5, TRUE)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	H.STASTR = 16
	H.STASPD = 10
	H.STACON = 18
	H.STAWIL = 14
	H.STAINT = 15
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron
	
	if(prob(15))
		armor = /obj/item/clothing/suit/roguetown/armor/plate/full/blacksteel
	else
		armor = /obj/item/clothing/suit/roguetown/armor/plate/full
	if(prob(15))
		pants = /obj/item/clothing/under/roguetown/platelegs/blacksteel
	else
		pants = /obj/item/clothing/under/roguetown/platelegs
	if(prob(15))
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/blacksteel
	else
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	if(prob(15))
		gloves = /obj/item/clothing/gloves/roguetown/plate/blacksteel
	else
		gloves = /obj/item/clothing/gloves/roguetown/plate
	if(prob(15))
		head = /obj/item/clothing/head/roguetown/helmet/blacksteel
	else
		head = /obj/item/clothing/head/roguetown/helmet/heavy/barbute
	if(prob(15))
		neck = /obj/item/clothing/neck/roguetown/bevor/blacksteel
	else
		neck = /obj/item/clothing/neck/roguetown/bevor
	if(prob(15))
		wrists = /obj/item/clothing/wrists/roguetown/bracers/blacksteel
	else
		wrists = /obj/item/clothing/wrists/roguetown/bracers
	if(prob(15))
		/obj/item/rogueweapon/greatsword/grenz/flamberge/blacksteel
	else
		/obj/item/rogueweapon/greatsword/grenz/flamberge
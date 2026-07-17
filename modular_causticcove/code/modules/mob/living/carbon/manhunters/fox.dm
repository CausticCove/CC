/mob/living/carbon/human/species/venardine/npc
	name = "venardin"
	skin_tone = DARKBROWN_FUR
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

	race = /datum/species/vulpkanin
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

	var/venardin_outfit = /datum/outfit/job/roguetown/venardin_npc

/mob/living/carbon/human/species/venardin/npc/Initialize()
	. = ..()
	set_species(/datum/species/vulpkanin)
	gender = pick(MALE, FEMALE)
	dna.species.random_character(src)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/venardin/npc/after_creation()
	..()
	AddComponent(/datum/component/ai_aggro_system)
	equipOutfit(new venardin_outfit)
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	head.sellprice = 30

	src.set_patron(/datum/patron/divine/dendor)
	ADD_TRAIT(src, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_DUALWIELDER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)

/datum/outfit/job/roguetown/venardin_npc/pre_equip(mob/living/carbon/human/H)
	shirt = /obj/item/clothing/suit/roguetown/armor/regenerating/skin/manhunter

	H.STASTR = 14
	H.STASPD = 14
	H.STACON = 12
	H.STAWIL = 12
	H.STAINT = 13
	var/loadout = rand(1,6)
	switch(loadout)
		if(1)
			r_hand = /obj/item/rogueweapon/katar
			l_hand = /obj/item/rogueweapon/katar
		if(2)
			r_hand = /obj/item/rogueweapon/knuckledusters/silver
			l_hand = /obj/item/rogueweapon/knuckledusters/silver
		if(3)
			r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			backl = /obj/item/quiver/randomfill/highwayman
		if(4)
			r_hand = /obj/item/rogueweapon/handclaw
			l_hand = /obj/item/rogueweapon/handclaw

	//light labor skills for armor repairs and such, equipment is so-so, with good stats
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)

	H.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)

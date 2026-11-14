/mob/living/carbon/human/species/akula/npc
	name = "axian"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"

	race = /datum/species/akula
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

	var/axian_outfit = /datum/outfit/job/roguetown/akula_npc

/mob/living/carbon/human/species/akula/npc/Initialize()
	. = ..()
	set_species(/datum/species/akula)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/akula/npc/after_creation()
	..()
	var/obj/item/organ/tail/akula/tail = src.getorganslot(ORGAN_SLOT_TAIL)
	var/obj/item/organ/snout/akula/snout = src.getorganslot(ORGAN_SLOT_SNOUT)
	if(tail)
		tail.Remove(src,1)
		QDEL_NULL(tail)
	tail = new /obj/item/organ/tail/akula
	tail.Insert(src)
	if(snout)
		snout.Remove(src,1)
		QDEL_NULL(snout)
	snout = new /obj/item/organ/snout/akula
	snout.Insert(src)
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)

	if(organ_eyes)
		organ_eyes.eye_color = "#FF0000"
		organ_eyes.accessory_colors = "#FF0000#FF0000"
	AddComponent(/datum/component/ai_aggro_system)
	equipOutfit(new axian_outfit)
	gender = pick(MALE, FEMALE)
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	head.sellprice = 30

	src.set_patron(/datum/patron/divine/abyssor)
	ADD_TRAIT(src, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_DUALWIELDER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

/datum/outfit/job/roguetown/akula_npc/pre_equip(mob/living/carbon/human/H)
	head =  /obj/item/clothing/head/roguetown/helmet/tricorn
	neck = /obj/item/clothing/neck/roguetown/coif/padded
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/aalloy
	pants = /obj/item/clothing/under/roguetown/tights/sailor
	shoes = /obj/item/clothing/shoes/roguetown/boots/aalloy

	H.STASTR = rand(11,13)
	H.STASPD = rand(8,12)
	H.STACON = rand(8,12)
	H.STAWIL = rand(8,12)
	H.STAINT = rand(8,14)
	var/loadout = rand(1,6)
	switch(loadout)
		if(1)
			r_hand = /obj/item/rogueweapon/spear/trident
			l_hand = /obj/item/rogueweapon/shield/wood
		if(2)
			r_hand = /obj/item/rogueweapon/huntingknife/idagger/steel
			l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel
		if(3)
			r_hand = /obj/item/rogueweapon/stoneaxe/battle
			l_hand = /obj/item/rogueweapon/shield/wood
		if(4)
			r_hand = /obj/item/rogueweapon/greataxe/steel
		if(5)
			r_hand = /obj/item/rogueweapon/greatsword
		if(6)
			r_hand = /obj/item/rogueweapon/handclaw
			l_hand = /obj/item/rogueweapon/handclaw

	//light labor skills for armor repairs and such, equipment is so-so, with good stats
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)

	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)

/mob/living/carbon/human/species/akula/npc/titan
	axian_outfit = /datum/outfit/job/roguetown/akula_titan

//Mini-boss esque critter
/datum/outfit/job/roguetown/akula_titan/pre_equip(mob/living/carbon/human/H)
	if(prob(33))
		beltl = /obj/item/storage/belt/rogue/pouch/treasure
	H.STASTR = 13
	H.STASPD = 7
	H.STACON = 11
	H.STAWIL = 11
	H.STAINT = 14
	var/loadout = rand(1,4)
	switch(loadout)
		if(1)
			head =  /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
			neck = /obj/item/clothing/neck/roguetown/coif/heavypadding
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/freifechter
			wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/aalloy
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/otavan/generic
			shoes = /obj/item/clothing/shoes/roguetown/boots/aalloy
			r_hand = /obj/item/rogueweapon/spear/boar/frei
		if(2)
			head =  /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine
			neck = /obj/item/clothing/neck/roguetown/chaincoif
			wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/aalloy
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/otavan/generic
			shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
			r_hand = /obj/item/rogueweapon/greatsword
		if(3)
			head =  /obj/item/clothing/head/roguetown/helmet/leather/saiga
			neck = /obj/item/clothing/neck/roguetown/coif/padded
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy
			wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			pants = /obj/item/clothing/under/roguetown/tights/sailor
			shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
			r_hand = /obj/item/rogueweapon/spear/trident
		if(4)
			armor = /obj/item/clothing/suit/roguetown/armor/plate/bronze
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/bronze
			pants = /obj/item/clothing/under/roguetown/platelegs/iron
			shoes = /obj/item/clothing/shoes/roguetown/boots/armor/bronze
			gloves = /obj/item/clothing/gloves/roguetown/plate/iron
			wrists = /obj/item/clothing/wrists/roguetown/bracers/bronze
			head = /obj/item/clothing/head/roguetown/helmet/heavy/bronze
			neck = /obj/item/clothing/neck/roguetown/gorget/bronze
			r_hand = /obj/item/rogueweapon/greataxe/bronze

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
	H.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)

/mob/living/carbon/human/species/akula/npc/rogue
	axian_outfit = /datum/outfit/job/roguetown/akula_rogue
	a_intent = INTENT_HELP
	m_intent = MOVE_INTENT_SNEAK
	d_intent = INTENT_DODGE

/datum/outfit/job/roguetown/akula_rogue/pre_equip(mob/living/carbon/human/H)
	ADD_TRAIT(src, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	head =  /obj/item/clothing/head/roguetown/helmet/tricorn
	neck = /obj/item/clothing/neck/roguetown/coif/padded
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/aalloy
	pants = /obj/item/clothing/under/roguetown/tights/sailor
	shoes = /obj/item/clothing/shoes/roguetown/boots/aalloy
	var/loadout = rand(1,4)
	switch(loadout)
		if(1)
			r_hand =/obj/item/rogueweapon/huntingknife/idagger/steel/bone
		if(2)
			r_hand = /obj/item/rogueweapon/huntingknife/idagger/silver
		if(3)
			r_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/kazengun
		if(4)
			r_hand =/obj/item/rogueweapon/huntingknife/idagger/steel

	H.STASTR = 8
	H.STASPD = 15
	H.STACON = 8
	H.STAWIL = 10
	H.STAINT = 13

	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)

	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)

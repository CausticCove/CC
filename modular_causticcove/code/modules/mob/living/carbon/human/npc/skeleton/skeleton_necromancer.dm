/mob/living/carbon/human/species/skeleton/npc/summon/soldier
	skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/soldier

/mob/living/carbon/human/species/skeleton/npc/summon/spear
	skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/spear

/mob/living/carbon/human/species/skeleton/npc/summon/heavy
	skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/heavy

/mob/living/carbon/human/species/skeleton/npc/summon/dagger
	skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/dagger

/mob/living/carbon/human/species/skeleton/npc/summon/hammer
	skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/hammer
	

/mob/living/carbon/human/species/skeleton/npc/summon/random

/mob/living/carbon/human/species/skeleton/npc/summon/random/Initialize()
	var/outfit = rand(1, 5)
	switch(outfit)
		if(1)
			skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/soldier
		if(2)
			skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/spear
		if(3)
			skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/heavy
		if(4)
			skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/dagger
		if(5)
			skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/hammer
	..()

/datum/outfit/job/roguetown/skeleton/npc/soldier/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = rand(12,14)
	H.STASPD = 8
	H.STACON = 7
	H.STAWIL = 12
	H.STAINT = 1
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	name = "Zizite Soldier"
	cloak = /obj/item/clothing/cloak/tabard/zizo_alt
	head = /obj/item/clothing/head/roguetown/helmet/sallet/iron
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	gloves = /obj/item/clothing/gloves/roguetown/chain/iron
	l_hand = /obj/item/rogueweapon/shield/ironshzizo
	r_hand = /obj/item/rogueweapon/sword/iron

/datum/outfit/job/roguetown/skeleton/npc/spear/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = rand(12,14)
	H.STASPD = 8
	H.STACON = 7
	H.STAWIL = 12
	H.STAINT = 1
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	name = "Zizite Spearman"
	cloak = /obj/item/clothing/cloak/tabard/zizo_alt
	head = /obj/item/clothing/head/roguetown/helmet/kettle/iron
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron/kilt
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	r_hand = /obj/item/rogueweapon/spear

/datum/outfit/job/roguetown/skeleton/npc/heavy/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 14
	H.STASPD = 6
	H.STACON = 9
	H.STAWIL = 14
	H.STAINT = 1
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	name = "Zizite Heavy"
	cloak = /obj/item/clothing/cloak/tabard/zizo_alt
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket/iron
	armor = /obj/item/clothing/suit/roguetown/armor/plate/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	gloves = /obj/item/clothing/gloves/roguetown/plate/iron
	r_hand = /obj/item/rogueweapon/greatsword/iron

/datum/outfit/job/roguetown/skeleton/npc/dagger/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 12
	H.STASPD = 14
	H.STACON = 4
	H.STAWIL = 12
	H.STAINT = 1
	H.STAPER = 14
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	name = "Zizite Rogue"
	cloak = /obj/item/clothing/cloak/tabard/zizo_alt
	mask = /obj/item/clothing/mask/rogue/facemask
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron/kilt
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	l_hand = /obj/item/rogueweapon/huntingknife/idagger
	r_hand = /obj/item/rogueweapon/huntingknife/idagger

/datum/outfit/job/roguetown/skeleton/npc/hammer/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = rand(12,14)
	H.STASPD = 8
	H.STACON = 7
	H.STAWIL = 12
	H.STAINT = 1
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	name = "Zizite Breaker"
	cloak = /obj/item/clothing/cloak/tabard/zizo_alt
	head = /obj/item/clothing/head/roguetown/helmet/sallet/iron
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	gloves = /obj/item/clothing/gloves/roguetown/chain/iron
	l_hand = /obj/item/rogueweapon/shield/ironshzizo
	r_hand = /obj/item/rogueweapon/mace/warhammer

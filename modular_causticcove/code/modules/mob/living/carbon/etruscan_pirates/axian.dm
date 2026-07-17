/mob/living/carbon/human/species/akula/npc/etruscan_pirate
	axian_outfit = /datum/outfit/job/roguetown/akula_pirate_hard

/datum/outfit/job/roguetown/akula_pirate_hard/pre_equip(mob/living/carbon/human/H)
	ADD_TRAIT(src, TRAIT_PARRYEXPERT, TRAIT_GENERIC)
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
	H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 4, TRUE)

	H.STASTR = 14
	H.STASPD = 10
	H.STACON = 12
	H.STAWIL = 12
	H.STAINT = 16
	var/loadout = rand(1,4)
	switch(loadout)
		if(1) //sword and gun
			r_hand = /obj/item/rogueweapon/sword/long
			l_hand = /obj/item/gun/ballistic/blackpowder/small/arquebus_pistol
			head =  /obj/item/clothing/head/roguetown/helmet/sallet/beastskull
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine
			wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
		if(2) //archer
			backr = /obj/item/rogueweapon/sword/short/iron
			r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			backl = /obj/item/quiver/randomfill/highwayman
			head =  /obj/item/clothing/head/roguetown/helmet/sallet/beastskull
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
			wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
		if(3) //hammer wielder
			if(prob(50))
				r_hand = /obj/item/rogueweapon/mace/steel/silver
			else
				r_hand = /obj/item/rogueweapon/mace/steel
			head =  /obj/item/clothing/head/roguetown/helmet/heavy/knight/old/iron
			armor = /obj/item/clothing/suit/roguetown/armor/plate/full/iron
			wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
		if(4) //axe wielder
			if(prob(50))
				r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/silver
			else
				r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/steel
			head =  /obj/item/clothing/head/roguetown/helmet/heavy/knight/old/iron
			armor = /obj/item/clothing/suit/roguetown/armor/plate/full/iron
			wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced

/mob/living/carbon/human/species/akula/npc/etruscan_captain
	axian_outfit = /datum/outfit/job/roguetown/akula_piratecaptain_hard

/datum/outfit/job/roguetown/akula_piratecaptain_hard/pre_equip(mob/living/carbon/human/H)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_PARRYEXPERT, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/sewing, 1, TRUE)

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

	H.STASTR = 17
	H.STASPD = 13
	H.STACON = 15
	H.STAWIL = 15
	H.STAINT = 16
	var/loadout = rand(1,3)
	switch(loadout)
		if(1) //Kazengun themed
			r_hand = /obj/item/rogueweapon/sword/short/kazengun
			l_hand = /obj/item/rogueweapon/sword/short/kazengun
			head =  /obj/item/clothing/head/roguetown/helmet/heavy/kabuto
			armor = /obj/item/clothing/suit/roguetown/armor/plate/full/samsibsa
			wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced/kazengun
			gloves = /obj/item/clothing/gloves/roguetown/plate/kote
		if(2) //pure etrusca themed, well trying to be
			r_hand = /obj/item/rogueweapon/sword/long/etruscan
			head =  /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine
			wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
		if(3) //potential abyssor themed or just axe dude
			if(prob(50))
				r_hand = /obj/item/rogueweapon/stoneaxe/battle/abyssoraxe
			else
				r_hand = /obj/item/rogueweapon/stoneaxe/battle
			head =  /obj/item/clothing/head/roguetown/helmet/heavy/knight/old/iron
			armor = /obj/item/clothing/suit/roguetown/armor/plate/full/iron
			wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
/mob/living/carbon/human/species/skeleton/npc/desertguard
	skel_outfit = /datum/outfit/job/roguetown/npc/skeleton/npc/desert_skelly_threat

/datum/outfit/job/roguetown/npc/skeleton/npc/desert_skelly_threat/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	name = "Dusty Skeleton"
	H.STASTR = 12
	H.STASPD = 12
	H.STACON = 4
	H.STAWIL = 10
	H.STAINT = 1
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	var/loadout = rand(1,7)
	switch(loadout)
		if(1)
			head = /obj/item/clothing/head/roguetown/circlet
			mask = /obj/item/clothing/head/roguetown/roguehood/red
			neck = /obj/item/clothing/neck/roguetown/gorget
			cloak = /obj/item/clothing/cloak/half/rider/red
			armor = /obj/item/clothing/suit/roguetown/armor/leather
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			gloves = /obj/item/clothing/gloves/roguetown/leather
			id = /obj/item/clothing/ring/gold
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
			belt = /obj/item/storage/belt/rogue/leather/plaquesilver
			backl = /obj/item/storage/backpack/rogue/satchel/short
			l_hand = /obj/item/rogueweapon/sword/sabre/shamshir
			beltl = /obj/item/rogueweapon/scabbard/sword
		if(2)
			head = /obj/item/clothing/head/roguetown/helmet/sallet/raneshen
			mask = /obj/item/clothing/mask/rogue/facemask/steel
			neck = /obj/item/clothing/neck/roguetown/gorget/steel
			cloak = /obj/item/clothing/cloak/half/rider/red
			armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			gloves = /obj/item/clothing/gloves/roguetown/chain
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
			belt = /obj/item/storage/belt/rogue/leather/shalal
			backl = /obj/item/storage/backpack/rogue/satchel/short
			backr = /obj/item/rogueweapon/shield/tower/raneshen
			l_hand = /obj/item/rogueweapon/sword/long/marlin
			beltl = /obj/item/rogueweapon/scabbard/sword
		if(3)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/aalloy
			armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/aalloy
			gloves = /obj/item/clothing/gloves/roguetown/chain/aalloy
			r_hand = /obj/item/rogueweapon/huntingknife/idagger/navaj
			l_hand = /obj/item/rogueweapon/huntingknife/idagger/navaj
		if(4)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/aalloy
			armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/aalloy
			gloves = /obj/item/clothing/gloves/roguetown/chain/aalloy
			r_hand = /obj/item/rogueweapon/sword/long/shotel
			l_hand = /obj/item/rogueweapon/shield/tower/raneshen
		if(5)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/aalloy
			armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/aalloy
			gloves = /obj/item/clothing/gloves/roguetown/chain/aalloy
			r_hand = /obj/item/rogueweapon/sword/long/shotel
		if(6)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/aalloy
			armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/aalloy
			gloves = /obj/item/clothing/gloves/roguetown/chain/aalloy
			r_hand = /obj/item/rogueweapon/mace/goden/steel
		if(7)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/aalloy
			armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/aalloy
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/aalloy
			gloves = /obj/item/clothing/gloves/roguetown/chain/aalloy
			r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			backl = /obj/item/quiver/randomfill/highwayman
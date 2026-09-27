/mob/living/carbon/human/species/hobgoblin/boss
	hobgob_outfit = /datum/outfit/job/roguetown/npc/hobby_boss
	threat_point = 65


//Some slight RNG to keep things a little surprising and mixed up when loadouts are applied.
/datum/outfit/job/roguetown/npc/hobby_boss/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 12
	H.STAPER = 8 //We're a little stupid and blind however.
	H.STAINT = 8 //We're a little stupid and blind however.
	H.STACON = 14 //We are strong and sturdy, naturally tanky even due to our more primitive armor/gear.
	H.STAWIL = 14
	H.STASPD = 9
	H.STALUC = 10

	//We are an expert jack of all trades for most weapons.
	//Most of our power comes from traits, stats, and items. Not skills.
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)

	//Some pretty nice traits.
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAINSTUN, TRAIT_GENERIC)


	var/loadout = rand(1,10)
	switch(loadout)
		if(1) //spear + leathers - Worst roll you can get...
			if(prob(99))
				r_hand = /obj/item/rogueweapon/spear
			else //Unless...? Very rare 1% chance in an already 1-10 random loadout list, yeah, go fucking WILD if you get this. Become a legend amongst hobgobs.
				r_hand = /obj/item/rogueweapon/halberd/blacksteel
			if(prob(33))
				head = /obj/item/clothing/head/roguetown/helmet/leather/hobgoblin
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hobgoblin

		if(2) //steel axe + leathers
			r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/steel
			head = /obj/item/clothing/head/roguetown/helmet/leather/hobgoblin
			armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin

		if(3) //steel mace + leathers
			r_hand = /obj/item/rogueweapon/mace/steel
			head = /obj/item/clothing/head/roguetown/helmet/leather/hobgoblin
			armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin

		if(4) //steel messer + leathers
			r_hand = /obj/item/rogueweapon/sword/short/messer
			head = /obj/item/clothing/head/roguetown/helmet/leather/hobgoblin
			armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin

		if(5) //steel sword & shield
			r_hand = /obj/item/rogueweapon/sword/short
			l_hand = /obj/item/rogueweapon/shield/iron
			if(prob(90))
				head = /obj/item/clothing/head/roguetown/helmet/hobgoblin
			else
				head = /obj/item/clothing/head/roguetown/helmet/leather/hobgoblin
			if(prob(90))
				armor =	/obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin
			else
				armor = /obj/item/clothing/suit/roguetown/armor/leather/hobgoblin

		if(6) //steel warhammer
			r_hand = /obj/item/rogueweapon/mace/warhammer/steel
			head = /obj/item/clothing/head/roguetown/helmet/leather/hobgoblin
			armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin

		if(7) //dual steel daggers
			r_hand = /obj/item/rogueweapon/huntingknife/idagger/steel
			l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel
			head = /obj/item/clothing/head/roguetown/helmet/leather/hobgoblin
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hobgoblin
			ADD_TRAIT(src, TRAIT_DUALWIELDER, TRAIT_GENERIC) //Stabby stabby..!

		if(8) //steel knuckles + plate
			gloves = /obj/item/clothing/gloves/roguetown/knuckles
			head = /obj/item/clothing/head/roguetown/helmet/hobgoblin
			armor =	/obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin

		if(9) //short spear & shield
			r_hand = /obj/item/rogueweapon/spear/short
			l_hand = /obj/item/rogueweapon/shield/iron
			if(prob(66))
				head = /obj/item/clothing/head/roguetown/helmet/hobgoblin
			else
				head = /obj/item/clothing/head/roguetown/helmet/leather/hobgoblin
			armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin

		if(10) //steel greatsword + full plate (rare)
			r_hand = /obj/item/rogueweapon/greatsword
			head = /obj/item/clothing/head/roguetown/helmet/hobgoblin
			armor =	/obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin

	//So they can store items on their hips and hold a single strong health vial.
	belt = /obj/item/storage/belt/rogue/leather/cloth
	beltr = /obj/item/reagent_containers/glass/bottle/alchemical/healthpotnew

	//Backup sword. Also extra distinction from other hobgobs.
	backr = /obj/item/rogueweapon/sword/short/iron

	//Generic armor to cover the hands, neck, and feet as well so people can't cheese as easily.
	//Still easy to puncture...
	neck = /obj/item/clothing/neck/roguetown/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	gloves = /obj/item/clothing/gloves/roguetown/leather

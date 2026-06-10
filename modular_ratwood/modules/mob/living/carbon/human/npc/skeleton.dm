/mob/living/carbon/human/species/skeleton/npc/cultist
	skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/cultist

/datum/outfit/job/roguetown/skeleton/npc/cultist/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 12
	H.STASPD = 10
	H.STACON = 6
	H.STAWIL = 10
	H.STAINT = 1
	name = "Skeleton"
	if(prob(80))
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/noc
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	wrists = /obj/item/clothing/wrists/roguetown/nocwrappings
	if(prob(20))
		head = /obj/item/clothing/head/roguetown/roguehood/nochood
	if(prob(30))
		head = /obj/item/clothing/head/roguetown/roguehood/black
	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/tights/random
	else
		pants = /obj/item/clothing/under/roguetown/loincloth
	if(prob(20))
		belt = /obj/item/storage/belt/rogue/leather/rope
		if(prob(20))
			beltr = /obj/item/storage/belt/rogue/pouch/treasure
		else
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor/
	if(prob(5))
		id = /obj/item/clothing/ring/aalloy
	var/weapon_choice = rand(1, 4)
	switch(weapon_choice)
		if(1)
			r_hand = /obj/item/rogueweapon/sickle/aalloy
		if(2)
			r_hand = /obj/item/rogueweapon/woodstaff
		if(3)
			r_hand = /obj/item/rogueweapon/huntingknife/idagger/adagger
		if(4)
			r_hand = /obj/item/rogueweapon/mace/woodclub
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)


/mob/living/carbon/human/species/skeleton/npc/miner
	skel_outfit = /datum/outfit/job/roguetown/skeleton/npc/miner

/datum/outfit/job/roguetown/skeleton/npc/miner/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 14
	H.STASPD = 8
	H.STACON = 6
	H.STAWIL = 15
	H.STAINT = 1
	name = "Skeleton"
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	if(prob(40))
		pants =	/obj/item/clothing/under/roguetown/trou
	if(prob(25))
		head = /obj/item/clothing/head/roguetown/helmet
	if(prob(25))
		head = /obj/item/clothing/head/roguetown/helmet/horned
	neck = /obj/item/clothing/neck/roguetown/collar/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	r_hand = /obj/item/rogueweapon/pick/aalloy
	if(prob(20))
		r_hand = /obj/item/rogueweapon/shovel/aalloy
	if(prob(40))
		belt = /obj/item/storage/belt/rogue/leather/rope
		if(prob(10))
			beltr = /obj/item/storage/belt/rogue/pouch/treasure
		else
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor/
	if(prob(5))
		id = /obj/item/clothing/ring/aalloy
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)

/mob/living/carbon/human/species/human/northern/desertraider
	ai_controller = /datum/ai_controller/human_npc
	d_intent = INTENT_PARRY
	faction = list(FACTION_BANDITS, FACTION_STATION)
	ambushable = FALSE
	dodgetime = 30
	blood_toll_bucket = STATS_KILLED_GRONNMEN

/mob/living/carbon/human/species/human/northern/desertraider/Initialize()
	. = ..()
	//Begin RANDOMISE here
	set_species(pick(NPC_RACES_TYPES))
	gender = pick(MALE, FEMALE)
	dna.species.random_character(src) //Now we just randomise here, MUST be called after both race + gender
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)


/mob/living/carbon/human/species/human/northern/desertraider/after_creation()
	..()
	AddComponent(/datum/component/ai_aggro_system)
	SEND_SIGNAL(src, COMSIG_MOB_MODIFY_AGGRO_LINES, GLOB.searaider_aggro, TRUE)
	job = "Dune Raider"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NPC_EXAMINE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/human/species/human/northern/desertraider)
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	head.sellprice = HEAD_BOUNTY_SEARAIDER
	dna.species.handle_body(src)
	random_voice_NPC()
	random_hair_NPC()
	random_eye_color_NPC()
	correct_features_NPC()
	update_hair()
	update_body()
	src.regenerate_icons() //Fixes the weird body but lets check performance first


/datum/outfit/job/roguetown/human/species/human/northern/desertraider/pre_equip(mob/living/carbon/human/H)
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.STASPD = 9
	H.STACON = 12
	H.STAWIL = 13
	H.STAPER = 11
	H.STAINT = 12
	H.STASTR = 14
	var/loadout = rand(1,6)
	switch(loadout)
		if(1)
			head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/raneshen
			neck = /obj/item/clothing/neck/roguetown/gorget/copper
			mask = /obj/item/clothing/mask/rogue/facemask/copper
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/raneshen
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			wrists = /obj/item/clothing/wrists/roguetown/bracers/copper
			gloves = /obj/item/clothing/gloves/roguetown/angle
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			shoes = /obj/item/clothing/shoes/roguetown/shalal
			belt = /obj/item/storage/belt/rogue/leather/shalal
			r_hand = /obj/item/rogueweapon/sword/sabre/shamshir
			l_hand = /obj/item/rogueweapon/sword/sabre/shamshir
		if(2)
			head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/raneshen
			neck = /obj/item/clothing/neck/roguetown/gorget/copper
			mask = /obj/item/clothing/mask/rogue/facemask/copper
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/raneshen
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			wrists = /obj/item/clothing/wrists/roguetown/bracers/copper
			gloves = /obj/item/clothing/gloves/roguetown/angle
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			shoes = /obj/item/clothing/shoes/roguetown/shalal
			belt = /obj/item/storage/belt/rogue/leather/shalal
			r_hand = /obj/item/rogueweapon/spear/spellblade
			backl = /obj/item/rogueweapon/shield/tower/raneshen
		if(3)
			head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/raneshen
			neck = /obj/item/clothing/neck/roguetown/gorget/copper
			mask = /obj/item/clothing/mask/rogue/facemask/copper
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/raneshen
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			wrists = /obj/item/clothing/wrists/roguetown/bracers/copper
			gloves = /obj/item/clothing/gloves/roguetown/angle
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			shoes = /obj/item/clothing/shoes/roguetown/shalal
			belt = /obj/item/storage/belt/rogue/leather/shalal
			r_hand = /obj/item/rogueweapon/mace/warhammer/steel
		if(4)
			head = /obj/item/clothing/head/roguetown/helmet/sallet/raneshen
			mask = /obj/item/clothing/mask/rogue/facemask/steel
			neck = /obj/item/clothing/neck/roguetown/chaincoif/full
			armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
			gloves = /obj/item/clothing/gloves/roguetown/chain
			pants = /obj/item/clothing/under/roguetown/brigandinelegs
			r_hand = /obj/item/rogueweapon/mace/goden/steel
			l_hand = /obj/item/rogueweapon/shield/tower/raneshen
		if(5)
			head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/raneshen
			neck = /obj/item/clothing/neck/roguetown/leather
			mask = /obj/item/clothing/mask/rogue/facemask/steel/paalloy
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/raneshen
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
			gloves = /obj/item/clothing/gloves/roguetown/angle
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			backr = /obj/item/storage/backpack/rogue/satchel/black
			shoes = /obj/item/clothing/shoes/roguetown/shalal
			r_hand = /obj/item/rogueweapon/whip
		if(6)
			head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/raneshen
			neck = /obj/item/clothing/neck/roguetown/leather
			mask = /obj/item/clothing/mask/rogue/facemask/steel/paalloy
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/raneshen
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
			gloves = /obj/item/clothing/gloves/roguetown/angle
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			backr = /obj/item/storage/backpack/rogue/satchel/black
			shoes = /obj/item/clothing/shoes/roguetown/shalal
			r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			backl = /obj/item/quiver/arrows

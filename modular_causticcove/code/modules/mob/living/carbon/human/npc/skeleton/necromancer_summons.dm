/mob/living/carbon/human/species/skeleton/necro_summon
	ai_controller = /datum/ai_controller/human_npc/melee
	d_intent = INTENT_PARRY
	faction = list()
	ambushable = FALSE
	skel_fragile = TRUE
	skel_outfit = null

	var/arcane_scale = 3
	var/gear_tier = 1
	var/datum/weakref/summoner_ref

/mob/living/carbon/human/species/skeleton/necro_summon/Destroy()
	release_conjured_gear()
	return ..()

/mob/living/carbon/human/species/skeleton/necro_summon/after_creation()
	..()

	patron = /datum/patron/inhumen/zizo

	AddComponent(/datum/component/ai_aggro_system)

	job = "Lesser Skeleton"
	ADD_TRAIT(src, TRAIT_NPC_EXAMINE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_DUSTABLE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_DUST_DELETE_GEAR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_DUALWIELDER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CABAL, TRAIT_GENERIC)

	var/datum/component/conjured_minion/minion = GetComponent(/datum/component/conjured_minion)
	var/mob/living/master = minion?.summoner_ref?.resolve()

	if(master)
		if(master.mind && master.mind.current)
			master = master.mind.current
		summoner = master.real_name
		faction = list("[master.real_name]_faction")
		apply_fellowship_faction(master, src)
		faction -= FACTION_UNDEAD
		faction -= FACTION_SKELETON
		faction -= FACTION_DUNDEAD

	var/outfit = rand(1, 5)
	switch(outfit)
		if(1)
			outfit_skeleton(new /datum/outfit/job/roguetown/necro_summon/soldier)
		if(2)
			outfit_skeleton(new /datum/outfit/job/roguetown/necro_summon/spear)
		if(3)
			outfit_skeleton(new /datum/outfit/job/roguetown/necro_summon/heavy)
		if(4)
			outfit_skeleton(new /datum/outfit/job/roguetown/necro_summon/dagger)
		if(5)
			outfit_skeleton(new /datum/outfit/job/roguetown/necro_summon/hammer)

	def_intent_change(INTENT_PARRY)

	regenerate_icons()

/mob/living/carbon/human/species/skeleton/necro_summon/proc/outfit_skeleton(datum/outfit/outfit)
	if(!outfit)
		return

	equipOutfit(outfit)

	for(var/obj/item/gear in (get_equipped_items() + held_items))
		ADD_TRAIT(gear, TRAIT_NODROP, TRAIT_GENERIC)

/mob/living/carbon/human/species/skeleton/necro_summon/soldier
	skel_outfit = /datum/outfit/job/roguetown/necro_summon/soldier

/datum/outfit/job/roguetown/necro_summon/soldier

/datum/outfit/job/roguetown/necro_summon/soldier/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = rand(12,14)
	H.STASPD = 12
	H.STACON = 8
	H.STAWIL = rand(9,12)
	H.STAPER = 10
	H.STAINT = 1
	H.STALUC = 10
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
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

/mob/living/carbon/human/species/skeleton/necro_summon/spear
	skel_outfit = /datum/outfit/job/roguetown/necro_summon/spear

/datum/outfit/job/roguetown/necro_summon/spear

/datum/outfit/job/roguetown/necro_summon/spear/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = rand(12,14)
	H.STASPD = 12
	H.STACON = 8
	H.STAWIL = rand(9,12)
	H.STAPER = 10
	H.STAINT = 1
	H.STALUC = 10
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
	name = "Zizite Spearman"
	cloak = /obj/item/clothing/cloak/tabard/zizo_alt
	head = /obj/item/clothing/head/roguetown/helmet/kettle/iron
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron/kilt
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	r_hand = /obj/item/rogueweapon/spear

/mob/living/carbon/human/species/skeleton/necro_summon/heavy
	skel_outfit = /datum/outfit/job/roguetown/necro_summon/heavy

/datum/outfit/job/roguetown/necro_summon/heavy

/datum/outfit/job/roguetown/necro_summon/heavy/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 14
	H.STASPD = 10
	H.STACON = 10
	H.STAWIL = rand(12,14)
	H.STAPER = 9
	H.STAINT = 1
	H.STALUC = 10
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
	name = "Zizite Heavy"
	cloak = /obj/item/clothing/cloak/tabard/zizo_alt
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket/iron
	armor = /obj/item/clothing/suit/roguetown/armor/plate/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	gloves = /obj/item/clothing/gloves/roguetown/plate/iron
	r_hand = /obj/item/rogueweapon/greatsword/iron

/mob/living/carbon/human/species/skeleton/necro_summon/dagger
	skel_outfit = /datum/outfit/job/roguetown/necro_summon/dagger

/datum/outfit/job/roguetown/necro_summon/dagger

/datum/outfit/job/roguetown/necro_summon/dagger/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 12
	H.STASPD = 14
	H.STACON = 7
	H.STAWIL = rand(9,12)
	H.STAPER = 12
	H.STAINT = 1
	H.STALUC = 10
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
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

/mob/living/carbon/human/species/skeleton/necro_summon/hammer
	skel_outfit = /datum/outfit/job/roguetown/necro_summon/hammer

/datum/outfit/job/roguetown/necro_summon/hammer

/datum/outfit/job/roguetown/necro_summon/hammer/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = rand(12,14)
	H.STASPD = 11
	H.STACON = 9
	H.STAWIL = rand(9,12)
	H.STAPER = 10
	H.STAINT = 1
	H.STALUC = 10
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/combat/maces, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_JOURNEYMAN, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_JOURNEYMAN, TRUE)
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

/mob/living/carbon/human/species/hobgoblin/npc/boss
	npc_archetype = /datum/npc_archetype/hobgoblin/boss
	threat_point = THREAT_HIGH

//Some slight RNG to keep things a little surprising and mixed up when loadouts are applied.
/mob/living/carbon/human/species/hobgoblin/boss/after_creation()
	..()
	//Some pretty nice traits.
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAINSTUN, TRAIT_GENERIC)

/datum/npc_archetype/hobgoblin/boss
	statpack = /datum/npc_statpack/heavy/t3
	// No additional speed penalty
	stat_modifiers = list("strength" = -2, "perception" = -2, "constitution" = 2, "willpower" = 2, "intelligence" = -2)
	melee = SKILL_LEVEL_EXPERT
	brawl = SKILL_LEVEL_EXPERT
	survival = SKILL_LEVEL_JOURNEYMAN
	loadouts = list(
		list(
			/datum/npc_loadout/kit/hoblin_boss/soldier = 30,
			/datum/npc_loadout/kit/hoblin_boss/berserker = 20,
			/datum/npc_loadout/kit/hoblin_boss/tank = 20,
			/datum/npc_loadout/kit/hoblin_boss/rogue = 20,
			/datum/npc_loadout/kit/hoblin_boss/leader = 10,
		),
	)

/datum/npc_loadout/kit/hoblin_boss
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

/datum/npc_loadout/kit/hoblin_boss/soldier
	head = list(
		/obj/item/clothing/head/roguetown/helmet/hobgoblin = 60,
		/obj/item/clothing/head/roguetown/helmet/leather/hobgoblin = 30,
		NPC_NOTHING = 10,
	)
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hobgoblin
	weapons = list(
		list(/obj/item/rogueweapon/spear, /obj/item/rogueweapon/halberd/blacksteel, 1),
		list(/obj/item/rogueweapon/mace/steel, /obj/item/rogueweapon/shield/wood, 80),
		list(/obj/item/rogueweapon/halberd),
	)

/datum/npc_loadout/kit/hoblin_boss/berserker
	head = /obj/item/clothing/head/roguetown/helmet/leather/hobgoblin
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin
	weapons = list(
		list(/obj/item/rogueweapon/stoneaxe/woodcut/steel),
		list(/obj/item/rogueweapon/mace/steel, /obj/item/rogueweapon/shield/heater, 80),
		list(/obj/item/rogueweapon/mace/warhammer/steel),
	)

/datum/npc_loadout/kit/hoblin_boss/tank
	head = list(
		/obj/item/clothing/head/roguetown/helmet/hobgoblin = 80,
		/obj/item/clothing/head/roguetown/helmet/leather/hobgoblin = 20,
	)
	armor = list(
		/obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin = 90,
		/obj/item/clothing/suit/roguetown/armor/leather/hobgoblin = 10,
	)
	weapons = list(
		list(/obj/item/rogueweapon/sword/short/messer, /obj/item/rogueweapon/shield/heater, 80),
		list(/obj/item/rogueweapon/sword/short, /obj/item/rogueweapon/shield/iron, 100),
		list(/obj/item/rogueweapon/spear/short, /obj/item/rogueweapon/shield/iron, 100),
	)

/datum/npc_loadout/kit/hoblin_boss/rogue
	head = /obj/item/clothing/head/roguetown/helmet/leather/hobgoblin
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hobgoblin
	weapons = list(
		list(/obj/item/rogueweapon/huntingknife/idagger/steel, /obj/item/rogueweapon/huntingknife/idagger/steel, 100),
		list(/obj/item/rogueweapon/katar/punchdagger, /obj/item/rogueweapon/katar/punchdagger, 60),
		list(/obj/item/rogueweapon/sword/short, /obj/item/rogueweapon/huntingknife/idagger/steel/parrying, 100),
	)
	traits = list(
		TRAIT_DUALWIELDER = TRAIT_GENERIC,
	)

/datum/npc_loadout/kit/hoblin_boss/leader
	r_hand = /obj/item/rogueweapon/greatsword
	head = /obj/item/clothing/head/roguetown/helmet/hobgoblin
	armor =	/obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin
	weapons = list(
		list(/obj/item/rogueweapon/greatsword),
		list(/obj/item/rogueweapon/estoc),
		list(/obj/item/rogueweapon/greataxe/steel),
	)

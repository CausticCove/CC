// This whole class was formally known as datum/advclass/janissary/jezial, and was found in the DesertTown job folders

/datum/advclass/manorguard/janissary
	name = "Azurian Janissary"
	tutorial = "Adapted from the sandy nations or perhaps your own means, you are a trained Janissary joined into the service of the duchy. Firearms is your unique choice of equipment"
	outfit = /datum/outfit/job/roguetown/manorguard/janissary

	category_tags = list(CTAG_MENATARMS)

	subclass_stats = list(
		STATKEY_SPD = 1,
		STATKEY_PER = 2,
		STATKEY_WIL = 2,
		STATKEY_INT = 1,
	)
	subclass_skills = list(
		/datum/skill/combat/firearms = SKILL_LEVEL_MASTER, //Your entire point is GUN.
		/datum/skill/combat/slings = SKILL_LEVEL_MASTER, //You get these as your only backup ranged option
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN, //You always get maces training
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN, //not as acrobatic
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE, //You suck at swimming
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN, //The Sands have taught you how to ride
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/engineering = SKILL_LEVEL_NOVICE //know how your gun works
	)
	maximum_possible_slots = 2//One always tells the truth, the other only lies. Guess wrong and they both shoot you.

	extra_context = "Chooses between Light Armor (Knives and Dodge Expert) & Medium Armor (Swords)."

/datum/outfit/job/roguetown/manorguard/janissary

/datum/outfit/job/roguetown/manorguard/janissary/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/chaincoif/chainmantle
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson

	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Arquebus","Pistol","Sling")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		var/armor_options = list("Leather Armor", "Full Janissary")
		var/armor_choice = input(H, "Choose your armor.", "TAKE UP ARMS") as anything in armor_options
		H.set_blindness(0)
		switch(weapon_choice)
			if("Arquebus")
				beltr = /obj/item/quiver/bulletpouch/iron
				r_hand = /obj/item/gun/ballistic/blackpowder/arquebus
				backl = /obj/item/rogueweapon/scabbard/gwstrap
			if("Pistol")
				beltr = /obj/item/quiver/bulletpouch/iron
				r_hand = /obj/item/gun/ballistic/blackpowder/small/arquebus_pistol
			if("Sling")
				beltr = /obj/item/quiver/sling/iron
				r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/sling // Both are belt slots and it's not worth setting where the cugel goes for everyone else, sad.

		switch(armor_choice)
			if("Leather Armor")
				head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/zyb
				armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy
				wrists = /obj/item/clothing/wrists/roguetown/bracers
				pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
				H.adjust_skillrank(/datum/skill/combat/knives, SKILL_LEVEL_EXPERT, TRUE)
				ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			if("Full Janissary")
				head = /obj/item/clothing/head/roguetown/helmet/janissaryhelm
				armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/janissary
				wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
				pants = /obj/item/clothing/under/roguetown/brigandinelegs
				H.adjust_skillrank(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

		backpack_contents = list(
			/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
			/obj/item/rope/chain = 1,
			/obj/item/storage/keyring/manatarms = 1,
			/obj/item/rogueweapon/scabbard/sheath = 1,
			/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1,
			/obj/item/powderflask,
			)
		add_verb(H, /mob/proc/haltyell)

	if(H.mind)
		SStreasury.grant_savings(ECONOMIC_LOWER_MIDDLE_CLASS, H)

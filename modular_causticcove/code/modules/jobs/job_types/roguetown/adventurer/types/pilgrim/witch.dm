//Copied from witch.dm on 3/23/26, update accordingly for any changes. Re-copied over on 05/04/26.

/datum/advclass/witch
	name = "Witch"
	tutorial = "You are a witch, seen as wisefolk to some and a demon to many. Ostracized and sequestered for wrongthinks or outright heresy, your potions are what the commonfolk turn to when all else fails, and for this they tolerate you — at an arm's length. Take care not to end 'pon a pyre, for the church condemns your left handed arts."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/witch
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)
	traits_applied = list(TRAIT_DEATHSIGHT, TRAIT_WITCH, TRAIT_ALCHEMY_EXPERT)
	townie_contract_gate_exempt = TRUE
	subclass_stats = list(
		STATKEY_INT = 3,
		STATKEY_SPD = 2,
		STATKEY_LCK = 1
	)
	age_mod = /datum/class_age_mod/witch
	
	subclass_skills = list(
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/alchemy = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/farming = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/carpentry = SKILL_LEVEL_APPRENTICE,
	)
	maximum_possible_slots = 20 // Should not fill, just a hack to make it shows what types of towners are in round

/datum/outfit/job/roguetown/adventurer/witch/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/witchhat
	mask = /obj/item/clothing/head/roguetown/roguehood/black
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/phys
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
						/obj/item/reagent_containers/glass/mortar = 1,
						/obj/item/pestle = 1,
						/obj/item/candle/yellow = 2,
						/obj/item/chalk = 1
						)
	var/classes = list("Old Magick", "Godsblood", "Mystagogue")
	var/classchoice = input("How do your powers manifest?", "THE OLD WAYS") as anything in classes

	switch (classchoice)
		if("Old Magick")
			ADD_TRAIT(H, TRAIT_ARCYNE, TRAIT_GENERIC)
			H.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_APPRENTICE, TRUE)
			if(H.mind)
				H.mind.setup_mage_aspects(list("mastery" = FALSE, "major" = 1, "minor" = 1, "utilities" = 6, "ward" = TRUE))
			beltl = /obj/item/storage/magebag/starter
			backpack_contents |= /obj/item/book/spellbook
			if (H.age == AGE_OLD)
				H.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_APPRENTICE, TRUE)
		if("Godsblood")
			//miracle witch: capped at t2 miracles. cannot pray to regain devo, but has high innate regen because of it (2 instead of 1 from major)
			var/datum/devotion/D = new /datum/devotion/(H, H.patron)
			H.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_APPRENTICE, TRUE)
			D.grant_miracles(H, cleric_tier = CLERIC_T2, passive_gain = CLERIC_REGEN_WITCH, devotion_limit = CLERIC_REQ_2)
			D.max_devotion *= 0.5
			neck = /obj/item/clothing/neck/roguetown/psicross/wood
			if (H.age == AGE_OLD)
				H.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_NOVICE, TRUE)
		if("Mystagogue")
			// hybrid arcane/holy witch with t1 arcane and t1 miracles
			var/datum/devotion/D = new /datum/devotion/(H, H.patron)
			H.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_NOVICE, TRUE)
			D.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_1)
			D.max_devotion *= 0.5
			ADD_TRAIT(H, TRAIT_ARCYNE, TRAIT_GENERIC)
			H.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_NOVICE, TRUE)
			if(H.mind)
				H.mind.setup_mage_aspects(list("mastery" = FALSE, "major" = 0, "minor" = 1, "utilities" = 4))
			beltl = /obj/item/storage/magebag/starter
			backpack_contents |= /obj/item/book/spellbook
			neck = /obj/item/clothing/neck/roguetown/psicross/wood
			if (H.age == AGE_OLD)
				H.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_NOVICE, TRUE)
				H.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_NOVICE, TRUE)
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/wildshape/witch)

		switch (classchoice)
			if("Mystagogue")
				var/list/poke_options = list("Spitfire", "Frost Bolt", "Arc Bolt", "Greater Arcyne Bolt", "Stygian Efflorescence", "Arcyne Lance", "Lesser Gravel Blast")
				var/poke_choice = input(H, "Choose your offensive cantrip.", "Arcyne Training") as anything in poke_options
				switch(poke_choice)
					if("Spitfire")
						H.mind.AddSpell(new /datum/action/cooldown/spell/projectile/spitfire)
					if("Frost Bolt")
						H.mind.AddSpell(new /datum/action/cooldown/spell/projectile/frost_bolt)
					if("Arc Bolt")
						H.mind.AddSpell(new /datum/action/cooldown/spell/projectile/arc_bolt)
					if("Greater Arcyne Bolt")
						H.mind.AddSpell(new /datum/action/cooldown/spell/projectile/greater_arcyne_bolt)
					if("Stygian Efflorescence")
						H.mind.AddSpell(new /datum/action/cooldown/spell/projectile/stygian_efflorescence)
					if("Arcyne Lance")
						H.mind.AddSpell(new /datum/action/cooldown/spell/projectile/arcyne_lance)
					if("Lesser Gravel Blast")
						H.mind.AddSpell(new /datum/action/cooldown/spell/projectile/gravel_blast/lesser)
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/suit/roguetown/armor/corset
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut
		pants = /obj/item/clothing/under/roguetown/skirt/red

	switch(H.patron?.type)
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_heretic.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/matthios)
			H.cmode_music = 'sound/music/combat_matthios.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/graggar)
			H.cmode_music = 'sound/music/combat_graggar.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/baotha)
			H.cmode_music = 'sound/music/combat_baotha.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
	if(H.mind)
		SStreasury.grant_savings(ECONOMIC_LOWER_MIDDLE_CLASS, H)

//Unique wildshape spell designed specifically for witches.
/obj/effect/proc_holder/spell/self/wildshape/witch
	name = "Shapechange"
	desc = "Take on the form of another creature. Cast to select your shape."
	overlay_state = null
	clothes_req = FALSE
	human_req = FALSE
	chargedrain = 0
	chargetime = 0
	recharge_time = 5 SECONDS
	cooldown_min = 50
	//"Dyreform.", Norse for "Form of animal."
	invocations = list("Dyreform.")
	invocation_type = "none"
	action_icon_state = "shapeshift"
	devotion_cost = 0
	miracle = FALSE

	//Internal var. Empty on purpose. Fills with new mobs on first cast.
	possible_shapes = list()

	var/list/cached_items = list()
	var/picked_form = FALSE

/obj/effect/proc_holder/spell/self/wildshape/witch/cast(list/targets, mob/living/carbon/human/user)
	//Cast once to pick a form.
	if(!picked_form)
		pick_form(user)
		return
	. = ..()

/obj/effect/proc_holder/spell/self/wildshape/witch/proc/pick_form(mob/living/carbon/human/user)
	var/shapeshifts = list("Zad", "Bat", "Cabbit", "Volf", "Venard", "Cat", "Rat", "Refund My Choice")
	var/shapeshiftchoice = input(user, "What form does your second skin take?", "THE OLD WAYS") as anything in shapeshifts
	switch (shapeshiftchoice)
		if("Cabbit")
			possible_shapes += list(/mob/living/carbon/human/species/wildshape/witch/cabbit)
			action_icon_state = "familiar" //Default icon for animals without unique or similar icons.
			desc = "Take on the form of a Cabbit."
		if("Zad")
			possible_shapes += list(/mob/living/carbon/human/species/wildshape/witch/zad)
			action_icon_state = "zad"
			desc = "Take on the form of a Zad."
		if("Cat") //If someone can figure out how to get skins to work and make 2 possible_shapes for a normal and black cat without a new species entirely plz do so ty ily
			possible_shapes += list(/mob/living/carbon/human/species/wildshape/witch/cat)
			action_icon_state = "cat_transform"
			desc = "Take on the form of a Cat."
		if("Bat")
			possible_shapes += list(/mob/living/carbon/human/species/wildshape/witch/bat)
			action_icon_state = "bat_transform"
			desc = "Take on the form of a Bat."
		if("Volf")
			possible_shapes += list(/mob/living/carbon/human/species/wildshape/witch/volf)
			action_icon_state = "volf_transform"
			desc = "Take on the form of a Wolf."
		if("Venard")
			possible_shapes += list(/mob/living/carbon/human/species/wildshape/witch/venard)
			action_icon_state = "volf_transform"
			desc = "Take on the form of a Venard."
		if("Rat")
			possible_shapes += list(/mob/living/carbon/human/species/wildshape/witch/small_rous)
			action_icon_state = "familiar"
			desc = "Take on the form of a Rat."
		if("Refund My Choice") //Simply refunds the choice.
			desc = "You: 'Hey! Dendor! Get me an animal form with nothing!' Camera pans to the right: 'Nothiiiiinnnn!?'"
			return
	if(length(possible_shapes))
		picked_form = TRUE

/mob/living/carbon/human/species/wildshape/witch
	var/hand_examine = "paws"

/mob/living/carbon/human/species/wildshape/witch/Initialize()
	. = ..()
	//Place it in any inactive hand slot on transform.
	var/obj/item/unusable_hand/H = new(src)
	put_in_inactive_hand(H)
	H.name = hand_examine

/mob/living/carbon/human/species/wildshape/witch/gain_inherent_skills()
	ADD_TRAIT(src, TRAIT_DEATHSIGHT, ADVENTURER_TRAIT)
	ADD_TRAIT(src, TRAIT_ALCHEMY_EXPERT, ADVENTURER_TRAIT)
	return //Do not let this call into wildshape inherent skill gain, or else they'll get miracles and devotions

//Unique witch blocker.
/obj/item/unusable_hand
	name = "other hand"
	desc = "This is your other hand, however you cannot use it whilst shapeshifted. You CAN use your beak, claws, paws, maws, and back to carry other items however. (You can only use 1 hand when shapeshifted.)"
	icon = 'icons/mob/roguehudgrabs.dmi'
	icon_state = "grabbing_greyscale"
	w_class = WEIGHT_CLASS_BULKY
	item_flags = ABSTRACT
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	no_effect = TRUE
	experimental_inhand = FALSE

/obj/item/unusable_hand/New(loc, ...)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

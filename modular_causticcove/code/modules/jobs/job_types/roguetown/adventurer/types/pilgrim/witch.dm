//Copied from witch.dm on 3/23/26, update accordingly for any changes.

/datum/advclass/witch
	name = "Witch"
	tutorial = "You are a witch, seen as wisefolk to some and a demon to many. Ostracized and sequestered for wrongthinks or outright heresy, your potions are what the commonfolk turn to when all else fails, and for this they tolerate you — at an arm's length. Take care not to end 'pon a pyre, for the church condemns your left handed arts."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/witch
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)
	traits_applied = list(TRAIT_DEATHSIGHT, TRAIT_WITCH, TRAIT_ALCHEMY_EXPERT)
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
						/obj/item/recipe_book/alchemy = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/recipe_book/magic = 1,
						/obj/item/chalk = 1
						)
	var/classes = list("Old Magick", "Godsblood", "Mystagogue")
	var/classchoice = input("How do your powers manifest?", "THE OLD WAYS") as anything in classes

	//Shapeshifting choices are handled in the shapeshift spell itself further down the file.

	switch (classchoice)
		if("Old Magick")
			// the original witch: arcyne t2 with 9 spellpoints
			ADD_TRAIT(H, TRAIT_ARCYNE_T2, TRAIT_GENERIC)
			H.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_APPRENTICE, TRUE)
			H.mind?.adjust_spellpoints(9) // twelve if you pick arcyne potential
			beltl = /obj/item/storage/magebag/starter
			if (H.age == AGE_OLD)
				H.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_APPRENTICE, TRUE)
				H.mind?.adjust_spellpoints(3)
		if("Godsblood")
			//miracle witch: capped at t2 miracles. cannot pray to regain devo, but has high innate regen because of it (1.7 instead of 0.8 from major).
			//Cannot use miracles or gain devotion when shapeshifted.
			var/datum/devotion/D = new /datum/devotion/(H, H.patron)
			H.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_APPRENTICE, TRUE)
			D.grant_miracles(H, cleric_tier = CLERIC_T2, passive_gain = CLERIC_REGEN_WITCH, devotion_limit = CLERIC_REQ_2)
			D.max_devotion *= 0.5
			neck = /obj/item/clothing/neck/roguetown/psicross/wood
			if (H.age == AGE_OLD)
				H.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_NOVICE, TRUE)
		if("Mystagogue")
			// hybrid arcane/holy witch with t1 arcane and t1 miracles, but less spellpoints, lower max devotion and less regen (0.5). Still can't pray.
			//Also cannot use miracles or gain devotion when shapeshifted.
			var/datum/devotion/D = new /datum/devotion/(H, H.patron)
			H.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_NOVICE, TRUE)
			D.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_1)
			D.max_devotion *= 0.5
			ADD_TRAIT(H, TRAIT_ARCYNE_T1, TRAIT_GENERIC)
			H.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_NOVICE, TRUE)
			H.mind?.adjust_spellpoints(6) // nine if you pick arcyne potential
			beltl = /obj/item/storage/magebag/starter
			neck = /obj/item/clothing/neck/roguetown/psicross/wood
			if (H.age == AGE_OLD)
				H.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_NOVICE, TRUE)
				H.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_NOVICE, TRUE)
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/wildshape/witch)

		switch (classchoice)
			if("Old Magick")
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/fortitude)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/arcynebolt)
				
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
		SStreasury.give_money_account(ECONOMIC_LOWER_MIDDLE_CLASS, H, "Savings.")

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

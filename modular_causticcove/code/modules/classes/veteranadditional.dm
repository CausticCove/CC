
/datum/advclass/veteran/mhunter
	name = "Veteran Exorcist"
	tutorial = "A former Adventurer? A former Night Hunter for hire? In the end that lyfe has scarred itself into your literal soul, and your body has been forced past some of its prime, that doesn't matter much anymore, your skills are still as sharp as ever, and with it a new opportunity to settle down and pass your wisdom onto others. You specialize in one silver weapon of a select choice, and choose from one of three disciplines of your calling."
	outfit = /datum/outfit/job/roguetown/vet/exorcist

	category_tags = list(CTAG_VETERAN)
	traits_applied = list(TRAIT_SLEUTH, TRAIT_STEELHEARTED)
	subclass_stats = list(
		STATKEY_INT = 1,
		STATKEY_STR = 1,
		STATKEY_WIL = 1,
		STATKEY_CON = 1,
		STATKEY_PER = 2,
	)

	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/alchemy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/hunting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/roguetown/vet/exorcist/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/roguetown/bevor
	saiga_shoes = /obj/item/clothing/shoes/roguetown/horseshoes/steel
	backl = /obj/item/storage/backpack/rogue/satchel/black
	cloak = /obj/item/clothing/cloak/half/vet
	pants = /obj/item/clothing/under/roguetown/tights/puritan
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	gloves = /obj/item/clothing/gloves/roguetown/angle
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/roguekey/veteran = 1,
		)
	add_verb(H, /mob/proc/haltyell)
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Retirement.")

	H.adjust_blindness(-3)
	add_verb(H, /mob/living/carbon/human/proc/faith_test) //Similar to Exorcist
	add_verb(H, /mob/living/carbon/human/proc/torture_victim) //Also Just like normal Exorcist.
	if(H.mind)
		var/silver = list("Silver Dagger","Silver Shortsword","Silver Arming Sword","Silver Rapier","Silver Longsword","Silver Broadsword","Silver Mace","Silver Warhammer","Silver Morningstar","Silver Whip","Silver War Axe","Silver Tomahawk","Silver Poleaxe","Silver Spear","Silver Halberd","Silver Quarterstaff", "Stake Launcher + 24 Shotstakes")
		var/silver_choice = input(H, "Choose your WEAPON.", "PREPARE YOUR ARMS.") as anything in silver //Holy fuck its a list, basically the same as Exorcist with some cut out, namely the unarmed stuff, maybe I can add them in if people want, Honestly Vet should maybe have less choice compared to advs.
		switch(silver_choice)
			if("Silver Dagger")
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/huntingknife/idagger/silver
				beltr = /obj/item/rogueweapon/scabbard/sheath
			if("Silver Shortsword")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/sword/short/silver
				beltr = /obj/item/rogueweapon/scabbard/sword
			if("Silver Arming Sword")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/sword/silver
				beltr = /obj/item/rogueweapon/scabbard/sword
			if("Silver Rapier")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/sword/rapier/silver
				beltr = /obj/item/rogueweapon/scabbard/sword
			if("Silver Longsword")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/sword/long/silver
				beltr = /obj/item/rogueweapon/scabbard/sword
			if("Silver Broadsword")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/sword/long/kriegmesser/silver
				beltr = /obj/item/rogueweapon/scabbard/sword
			if("Silver Mace")
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/mace/steel/silver
			if("Silver Warhammer")
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/mace/warhammer/steel/silver
			if("Silver Morningstar")
				H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/flail/sflail/silver
			if("Silver Whip")
				H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/whip/silver
			if("Silver War Axe")
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/silver
			if("Silver Tomahawk")
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/stoneaxe/handaxe/silver
			if("Silver Poleaxe")
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/greataxe/steel/knight/silver
				backr = /obj/item/rogueweapon/scabbard/gwstrap
			if("Silver Spear")
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/spear/silver
				backr = /obj/item/rogueweapon/scabbard/gwstrap
			if("Silver Halberd")
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/halberd/silver
				backr = /obj/item/rogueweapon/scabbard/gwstrap
			if("Silver Quarterstaff")
				H.adjust_skillrank_up_to(/datum/skill/combat/staves, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/staves, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/rogueweapon/woodstaff/quarterstaff/silver
				backr = /obj/item/rogueweapon/scabbard/gwstrap
			if("Stake Launcher + 24 Shotstakes")
				H.adjust_skillrank_up_to(/datum/skill/combat/crossbows, SKILL_LEVEL_MASTER, TRUE)
				if(H.age == AGE_OLD)
					H.adjust_skillrank_up_to(/datum/skill/combat/crossbows, SKILL_LEVEL_LEGENDARY, TRUE)
				r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/staker
				beltr = /obj/item/quiver/bolt/stake/standard

		var/sidearm = list("Dagger", "Parrying Dagger", "Heavy Dagger", "Broadsword", "Greatshield", "Blessed Silver Stake", "Blessed Silver Hunting Knife")
		var/sidearm_choice = input(H, "Choose your SIDEARM.", "SAY YOUR PRAYERS.") as anything in sidearm
		switch(sidearm_choice)
			if("Dagger")
				l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_EXPERT, TRUE)
			if("Parrying Dagger")
				l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_EXPERT, TRUE)
			if("Heavy Dagger")
				l_hand = /obj/item/rogueweapon/huntingknife/combat
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_EXPERT, TRUE)
			if("Broadsword")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
				l_hand = /obj/item/rogueweapon/sword/long/broadsword/steel
			if("Greatshield")
				l_hand = /obj/item/rogueweapon/shield/tower/metal
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE) //The Only one that gets stays to Journeyman, Expert or Master with Shields would be too much
			if("Blessed Silver Stake")
				l_hand = /obj/item/rogueweapon/huntingknife/idagger/silver/stake/preblessed
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_EXPERT, TRUE)
			if("Blessed Silver Hunting Knife")
				l_hand = /obj/item/rogueweapon/huntingknife/combat/silver/preblessed
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_EXPERT, TRUE)

		var/discipline = list("Traditionalist - Hauberk & Alchemics (+I INT / -I LCK)", "Reformist - Chainmaille & Dodge Expert (+I SPD)", "Orthodoxist - Cuirass & Plate Training (+I CON / -I SPD)")
		var/discipline_choice = input(H, "Choose your DISCIPLINE.", "FACE YOUR NIGHTMARE.") as anything in discipline
		switch(discipline_choice)
			if("Traditionalist - Hauberk & Alchemics (+I INT / -I LCK)")
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
				ADD_TRAIT(H, TRAIT_SILVER_BLESSED, TRAIT_GENERIC) //'Witcher' archetype. Default and Well Rounded, just like normal Exorcist, Loses the Potion though.
				H.change_stat(STATKEY_INT, 1)
				H.change_stat(STATKEY_LCK, -1)
				head = /obj/item/clothing/head/roguetown/puritan/armored
				armor = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
				shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
				belt = /obj/item/storage/belt/rogue/leather/black
			if("Reformist - Chainmaille & Dodge Expert (+I SPD)")
				ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC) //'Puritan' archetype. As Regular Exorcist Worse sneaking though, those died with Retirement. You may want knives training if you didn't pick it for the belt knives though
				H.change_stat(STATKEY_SPD, 1)
				H.adjust_skillrank_up_to(/datum/skill/misc/sneaking, SKILL_LEVEL_NOVICE, TRUE)
				head = /obj/item/clothing/head/roguetown/puritan
				armor = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
				shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/besilked
				belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/silver
			if("Orthodoxist - Cuirass & Plate Training (+I CON / -I SPD)")
				ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
				ADD_TRAIT(H, TRAIT_ZOMBIE_IMMUNE, TRAIT_GENERIC) //'Templar' archetype. Just like regular Exorcist
				H.change_stat(STATKEY_CON, 1)
				H.change_stat(STATKEY_SPD, -1)
				armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/fluted
				shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
				belt = /obj/item/storage/belt/rogue/leather/black
				var/helmets = list("Puritan's Armored Hat", "Visored Sallet", "Volfskulle Bascinet", "Fluted Armet", "Fluted Armet With Greatplume", "Sugarloaf Greathelm", "Barbute Greathelm", "Pigface Bascinet", "Roundface Bascinet")
				var/helmet_choice = input(H, "Choose your VISAGE.", "GET PSYCHED.") as anything in helmets
				switch(helmet_choice)
					if("Puritan's Armored Hat")
						head = /obj/item/clothing/head/roguetown/puritan/armored
					if("Visored Sallet")
						head = /obj/item/clothing/head/roguetown/helmet/sallet/visored
					if("Volfskulle Bascinet")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/volfplate/puritan
					if("Fluted Armet")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/knight/fluted
					if("Fluted Armet With Greatplume")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/knight/greatplume/fluted
					if("Sugarloaf Greathelm")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket/crusader
					if("Barbute Greathelm")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/barbute/great
					if("Pigface Bascinet")
						head = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface
					if("Roundface Bascinet")
						head = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/roundface

		var/retirement = list("Pursue Homesteading", "Dabble in Artisan Smithing", "Write an autobiography", "Keep up with your old regimen")
		var/retirement_choice = input(H, "During your retirement, you decided to...", "PICK A HOBBY.") as anything in retirement
		switch(retirement_choice)
			if("Pursue Homesteading")
				ADD_TRAIT(H, TRAIT_HOMESTEAD_EXPERT, TRAIT_GENERIC)
				H.adjust_skillrank_up_to(/datum/skill/labor/farming, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/cooking, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/labor/butchering, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/carpentry, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/labor/fishing, SKILL_LEVEL_APPRENTICE, TRUE)
			if("Dabble in Artisan Smithing")
				ADD_TRAIT(H, TRAIT_SMITHING_EXPERT, TRAIT_GENERIC)
				H.adjust_skillrank_up_to(/datum/skill/craft/smelting, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/ceramics, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/carpentry, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/masonry, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/labor/mining, SKILL_LEVEL_APPRENTICE, TRUE)
			if("Write an autobiography")
				ADD_TRAIT(H, TRAIT_GOODWRITER, TRAIT_GENERIC)
				H.adjust_skillrank_up_to(/datum/skill/misc/reading, SKILL_LEVEL_MASTER, TRUE)
			if("Keep up with your old regimen")
				H.change_stat(STATKEY_WIL, 2)
				H.adjust_skillrank_up_to(/datum/skill/misc/athletics, SKILL_LEVEL_EXPERT, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/misc/swimming, SKILL_LEVEL_EXPERT, TRUE)
		var/discharged = list("ONE-EYED", "BRITTLE-BONAGE", "HAUNTED", "STIFF-JOINTED")
		var/discharged_choice = input(H, "What forced you into retirement?", "PICK A DEBILITATION.") as anything in discharged
		switch(discharged_choice)
			if("ONE-EYED")
				ADD_TRAIT(H, TRAIT_CYCLOPS_RIGHT, TRAIT_GENERIC)
				H.change_stat(STATKEY_PER, -1)
			if("BRITTLE-BONAGE")
				ADD_TRAIT(H, TRAIT_BRITTLE, TRAIT_GENERIC)
				H.change_stat(STATKEY_CON, -1)
			if("HAUNTED")
				ADD_TRAIT(H, TRAIT_PSYCHOSIS, TRAIT_GENERIC)
				H.change_stat(STATKEY_INT, -1)
			if("STIFF-JOINTED")
				ADD_TRAIT(H, TRAIT_NORUN, TRAIT_GENERIC)
				H.change_stat(STATKEY_SPD, -1)

	switch(H.patron?.type)
		if(/datum/patron/old_god)
			wrists = /obj/item/clothing/neck/roguetown/psicross/silver
		if(/datum/patron/divine/astrata)
			wrists = /obj/item/clothing/neck/roguetown/psicross/silver/astrata
		if(/datum/patron/divine/necra)
			wrists = /obj/item/clothing/neck/roguetown/psicross/silver/necra
		if(/datum/patron/divine/noc)
			wrists = /obj/item/clothing/neck/roguetown/psicross/silver/noc
		else
			wrists = /obj/item/clothing/neck/roguetown/psicross/silver/undivided

/datum/advclass/veteran/martyr
	name = "Retired Martyr"
	tutorial = "A rarity among the Holy See, a Martyr not gone at the hands of combat and purpose, but of time and hardship itself. You are a former Martyr, or perhaps still are in some fashion, forced by circumstance to settle down, only taking up arms when all hope with the church might be lost. Your residency and status though... is now at the mercy of the nobility as well as your church upbringing. You specialize in swords and polearms."
	outfit = /datum/outfit/job/roguetown/vet/martyr
	virtue_limits = list(/datum/virtue/utility/noble, /datum/virtue/combat/second_chance, /datum/virtue/utility/hollow, /datum/virtue/combat/dualwielder, /datum/virtue/heretic/zchurch_keyholder)
	allowed_patrons = ALL_DIVINE_PATRONS
	subclass_languages = list(/datum/language/grenzelhoftian)
	category_tags = list(CTAG_VETERAN)
	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_STEELHEARTED, TRAIT_CLERGY,)
	subclass_stats = list(
		STATKEY_CON = 1,
		STATKEY_WIL = 1,
		STATKEY_STR = 2,
		STATKEY_PER = 1,
		STATKEY_INT = 1
	)
	age_mod = /datum/class_age_mod/veteran/martyr
	subclass_skills = list(
	//No, they don't get any miracles. Regular Martyr doesn't get them either.
		/datum/skill/combat/swords = SKILL_LEVEL_MASTER,
		/datum/skill/combat/axes = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/polearms = SKILL_LEVEL_MASTER,
		/datum/skill/combat/maces = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
	)
	subclass_stashed_items = list(
		"The Verses and Acts of the Ten" = /obj/item/book/rogue/bibble,
	)

	//Unlike other Veteran Classes you get very little malleable choices, what you get is what you get
/datum/outfit/job/roguetown/vet/martyr/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	armor = /obj/item/clothing/suit/roguetown/armor/plate/	//You basically have have the footmans loadout but with some distinct differences
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight
	pants = /obj/item/clothing/under/roguetown/chainlegs
	gloves = /obj/item/clothing/gloves/roguetown/plate
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	saiga_shoes = /obj/item/clothing/shoes/roguetown/horseshoes/steel
	backr = /obj/item/storage/backpack/rogue/satchel/black
	belt = /obj/item/storage/belt/rogue/leather/black
	cloak = /obj/item/clothing/cloak/half/vet
	backl = /obj/item/rogueweapon/shield/tower/holysee
	r_hand = /obj/item/rogueweapon/sword/silver
	beltr = /obj/item/rogueweapon/scabbard/sword
	id = /obj/item/clothing/neck/roguetown/psicross/undivided
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/silver = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/roguekey/veteran = 1
	)
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_UPPER_MIDDLE_CLASS , H, "Retirement.") //You aren't as wealthy as other veteran peers

	H.adjust_blindness(-3)
	if(H.mind)
		var/retirement = list("Pursue Homesteading", "Dabble in Artisan Smithing", "Write an autobiography", "Keep up with your old regimen")
		var/retirement_choice = input(H, "During your retirement, you decided to...", "PICK A HOBBY.") as anything in retirement
		switch(retirement_choice)
			if("Pursue Homesteading")
				ADD_TRAIT(H, TRAIT_HOMESTEAD_EXPERT, TRAIT_GENERIC)
				H.adjust_skillrank_up_to(/datum/skill/labor/farming, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/cooking, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/labor/butchering, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/carpentry, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/labor/fishing, SKILL_LEVEL_APPRENTICE, TRUE)
			if("Dabble in Artisan Smithing")
				ADD_TRAIT(H, TRAIT_SMITHING_EXPERT, TRAIT_GENERIC)
				H.adjust_skillrank_up_to(/datum/skill/craft/smelting, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/ceramics, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/carpentry, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/masonry, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/labor/mining, SKILL_LEVEL_APPRENTICE, TRUE)
			if("Write an autobiography")
				ADD_TRAIT(H, TRAIT_GOODWRITER, TRAIT_GENERIC)
				H.adjust_skillrank_up_to(/datum/skill/misc/reading, SKILL_LEVEL_MASTER, TRUE)
			if("Keep up with your old regimen")
				H.change_stat(STATKEY_WIL, 1)
				H.change_stat(STATKEY_CON, 1) //Unlike normal Veterans you get +1 CON instead of +2 WIL (You also don't get to swim good)
				H.adjust_skillrank_up_to(/datum/skill/misc/athletics, SKILL_LEVEL_EXPERT, TRUE)
		var/discharged = list("ONE-EYED", "BRITTLE-BONAGE", "HAUNTED", "STIFF-JOINTED")
		var/discharged_choice = input(H, "What forced you into retirement?", "PICK A DEBILITATION.") as anything in discharged
		switch(discharged_choice)
			if("ONE-EYED")
				ADD_TRAIT(H, TRAIT_CYCLOPS_RIGHT, TRAIT_GENERIC)
				H.change_stat(STATKEY_PER, -1)
			if("BRITTLE-BONAGE")
				ADD_TRAIT(H, TRAIT_BRITTLE, TRAIT_GENERIC)
				H.change_stat(STATKEY_CON, -1)
			if("HAUNTED")
				ADD_TRAIT(H, TRAIT_PSYCHOSIS, TRAIT_GENERIC)
				H.change_stat(STATKEY_INT, -1)
			if("STIFF-JOINTED")
				ADD_TRAIT(H, TRAIT_NORUN, TRAIT_GENERIC)
				H.change_stat(STATKEY_SPD, -1)

/datum/class_age_mod/veteran/martyr
	skill_mods = list(
		/datum/skill/combat/swords = SKILL_LEVEL_LEGENDARY,
		/datum/skill/combat/axes = SKILL_LEVEL_MASTER,
		/datum/skill/combat/polearms = SKILL_LEVEL_LEGENDARY,
		/datum/skill/combat/maces = SKILL_LEVEL_MASTER,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/shields = SKILL_LEVEL_EXPERT,
	)

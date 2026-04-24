GLOBAL_LIST_INIT(generic_vnpc_aggro, world.file2list("strings/rt/vnpcaggrolines.txt"))

/mob/living/carbon/human/species/tiberianevil
	name = "tiefling"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	var/tiberianevil_outfit = /datum/outfit/job/roguetown/tiberianevil/npc
	var/is_silent = FALSE

	race = /datum/species/tieberian
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	ambushable = FALSE

	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	d_intent = INTENT_PARRY
	possible_mmb_intents = list(INTENT_SPECIAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	possible_rmb_intents = list(/datum/rmb_intent/feint, /datum/rmb_intent/aimed, /datum/rmb_intent/strong, /datum/rmb_intent/weak, /datum/rmb_intent/swift, /datum/rmb_intent/riposte)

/mob/living/carbon/human/species/tiberianevil/npc
	faction = list("tiberianbandit", "station")
	aggressive = 1
	rude = TRUE
	mode = NPC_AI_IDLE
	wander = FALSE
	cmode_music = FALSE
	is_voracious_npc = TRUE
	voremode = TRUE



/mob/living/carbon/human/species/tiberianevil/npc/Initialize()
	. = ..()
	set_species(/datum/species/tieberian)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)
	load_generic_bellies()

/mob/living/carbon/human/species/tiberianevil/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(!is_silent && target != newtarg)
			say(pick(GLOB.generic_vnpc_aggro))
			pointed(target)

/mob/living/carbon/human/species/tiberianevil/npc/load_mob_bellies()
	..()


/mob/living/carbon/human/species/tiberianevil/npc/after_creation()
	..()
	job = "Bandit"
	equipOutfit(new tiberianevil_outfit)
	gender = pick(MALE, FEMALE)
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	var/hairf = pick(list(/datum/sprite_accessory/hair/head/himecut,
						/datum/sprite_accessory/hair/head/countryponytailalt,
						/datum/sprite_accessory/hair/head/stacy,
						/datum/sprite_accessory/hair/head/kusanagi_alt))
	var/hairm = pick(list(/datum/sprite_accessory/hair/head/ponytailwitcher,
						/datum/sprite_accessory/hair/head/dave,
						/datum/sprite_accessory/hair/head/emo,
						/datum/sprite_accessory/hair/head/sabitsuki,
						/datum/sprite_accessory/hair/head/sabitsuki_ponytail))
	head.sellprice = 30

	src.set_patron(/datum/patron/divine/dendor)
	ADD_TRAIT(src, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_LIGHT_STEP, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)
	var/datum/bodypart_feature/hair/head/new_hair = new()
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	var/obj/item/organ/ears/organ_ears = getorgan(/obj/item/organ/ears)

	if(organ_eyes)
		organ_eyes.eye_color = "#FF0000"
		organ_eyes.accessory_colors = "#FF0000#FF0000"
	var/skinchoose = rand(1,5)
	var/skincolor = "#549ab6"
	var/skincolor2 = "549ab6"
	switch(skinchoose) //choosing the skincolor of the tiefling
		if(1)
			skincolor = "#C62D4C"
			skincolor2 = "C62D4C"
		if(2)
			skincolor = "#B289C6"
			skincolor2 = "B289C6"
		if(3)
			skincolor = "#a191cc"
			skincolor2 = "a191cc"
		if(4)
			skincolor = "#549ab6"
			skincolor2 = "549ab6"
		if(5)
			skincolor = "#2c2421"
			skincolor2 = "2c2421"
	skin_tone = skincolor2
	var/obj/item/organ/tail/tail = src.getorganslot(ORGAN_SLOT_TAIL)
	if(!tail)
		tail = new()
		tail.Insert(src, TRUE, FALSE)
		var/tailchoose = rand(1,8)
		switch(tailchoose) //choosing the TAIL for the tiefling
			if(1)
				tail.accessory_type = /datum/sprite_accessory/tail/tiefling
			if(2)
				tail.accessory_type = /datum/sprite_accessory/tail/tiefling/heart
			if(3)
				tail.accessory_type = /datum/sprite_accessory/tail/large_snake
			if(4)
				tail.accessory_type = /datum/sprite_accessory/tail/large_snake_plain
			if(5)
				tail.accessory_type = /datum/sprite_accessory/tail/batl
			if(6)
				tail.accessory_type = /datum/sprite_accessory/tail/bats
			if(7)
				tail.accessory_type = /datum/sprite_accessory/tail/murid
			if(8)
				tail.accessory_type = /datum/sprite_accessory/tail/guilmon
		tail.accessory_colors = skincolor
	if(organ_ears)
		organ_ears.accessory_colors = skincolor

	if(gender == FEMALE)
		new_hair.set_accessory_type(hairf, null, src)
		var/obj/item/organ/breasts/breasts = src.getorganslot(ORGAN_SLOT_BREASTS)
		if(!breasts)
			breasts = new()
			breasts.Insert(src, TRUE, FALSE)
		breasts.accessory_type = /datum/sprite_accessory/breasts/pair
		breasts.breast_size = rand(1,16)
		breasts.accessory_colors = skincolor

	else
		new_hair.set_accessory_type(hairm, null, src)
		
	var/obj/item/organ/butt/butt = src.getorganslot(ORGAN_SLOT_BUTT)
	if(!butt)
		butt = new()
		butt.Insert(src, TRUE, FALSE)
	butt.accessory_type = /datum/sprite_accessory/butt/pair
	butt.organ_size = rand(0,5)
	butt.accessory_colors = skincolor

	var/obj/item/organ/belly/belly = src.getorganslot(ORGAN_SLOT_BELLY)
	if(!belly)
		belly = new()
		belly.Insert(src, TRUE, FALSE)
	belly.accessory_type = /datum/sprite_accessory/belly
	belly.belly_size = 0
	belly.accessory_colors = skincolor

	head.add_bodypart_feature(new_hair)

	new_hair.accessory_colors = "#31302E"
	new_hair.hair_color = "#31302E"
	hair_color = "#31302E"

	dna.update_ui_block(DNA_HAIR_COLOR_BLOCK)
	dna.species.handle_body(src)
	if(gender == FEMALE)
		real_name = pick(world.file2list("strings/rt/names/other/tieff.txt"))
	else
		real_name = pick(world.file2list("strings/rt/names/other/tiefm.txt"))
	update_hair()
	update_body()

/datum/outfit/job/roguetown/tiberianevil/npc/pre_equip(mob/living/carbon/human/H) //gives some default skills and equipment for player controlled elves
	H.STASTR = 12
	var/chance_zjumper = 5
	var/chance_treeclimber = 30
	H.STASPD = 15
	if(prob(chance_zjumper))
		ADD_TRAIT(H, TRAIT_ZJUMP, TRAIT_GENERIC)
		H.find_targets_above = TRUE
	if(prob(chance_treeclimber))
		H.tree_climber = TRUE
		H.find_targets_above = TRUE // so they can taunt
	H.STACON = 12
	H.STAWIL = 12
	H.STAINT = 12
	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	var/loadout = rand(1,4)
	switch(loadout)
		if(1) //duelist tief
			armor = /obj/item/clothing/suit/roguetown/armor/leather
			head = /obj/item/clothing/head/roguetown/duelhat
			mask = /obj/item/clothing/mask/rogue/duelmask
			cloak = /obj/item/clothing/cloak/half
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
			pants = /obj/item/clothing/under/roguetown/trou/leather
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			shoes = /obj/item/clothing/shoes/roguetown/boots
			neck = /obj/item/clothing/neck/roguetown/gorget
			gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/shield/buckler
			belt = /obj/item/storage/belt/rogue/leather
			H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
			r_hand = /obj/item/rogueweapon/sword/rapier
		if(2) //desert tief
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/raneshen
			pants = /obj/item/clothing/under/roguetown/trou/leather/pontifex/raneshen
			head = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab
			gloves = /obj/item/clothing/gloves/roguetown/angle
			belt = /obj/item/storage/belt/rogue/leather
			backl = /obj/item/storage/backpack/rogue/satchel
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			r_hand = /obj/item/rogueweapon/sword/saber/iron
		if(3) //thief elf
			armor = /obj/item/clothing/suit/roguetown/armor/leather
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			backl = /obj/item/storage/backpack/rogue/backpack
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			gloves = /obj/item/clothing/gloves/roguetown/fingerless
			belt = /obj/item/storage/belt/rogue/leather/knifebelt/iron
			cloak = /obj/item/clothing/cloak/raincloak/mortus
			beltl = /obj/item/quiver/Warrows
			beltr = /obj/item/rogueweapon/mace/cudgel
			r_hand = /obj/item/rogueweapon/huntingknife/idagger/steel
		if(4) //zinzoid wrestler nudist
			H.STASTR = 18
			H.STACON = 15
			H.STASPD = 10 //slower, beefy motherfucker
			H.STAINT = 4 //dumbass
			H.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)

/mob/living/carbon/human/species/tiberianevil/npc/death(gibbed, nocutscene)
	if(vore_organs.len > 0)
		for(var/obj/belly/B in vore_organs)
			B.release_all_contents(TRUE)
	. = ..()

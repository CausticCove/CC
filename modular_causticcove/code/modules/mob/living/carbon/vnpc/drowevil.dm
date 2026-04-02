/mob/living/carbon/human/species/delfevil
	name = "dark elf"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	var/delfevil_outfit = /datum/outfit/job/roguetown/delfevil/npc
	var/is_silent = FALSE

	race = /datum/species/elf/dark
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	ambushable = FALSE

	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	d_intent = INTENT_PARRY
	possible_mmb_intents = list(INTENT_SPECIAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	possible_rmb_intents = list(/datum/rmb_intent/feint, /datum/rmb_intent/aimed, /datum/rmb_intent/strong, /datum/rmb_intent/weak, /datum/rmb_intent/swift, /datum/rmb_intent/riposte)

/mob/living/carbon/human/species/delfevil/npc
	faction = list("vbandit", "station")
	aggressive = 1
	rude = TRUE
	mode = NPC_AI_IDLE
	wander = FALSE
	cmode_music = FALSE
	is_voracious_npc = TRUE
	voremode = TRUE

/mob/living/carbon/human/species/delfevil/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(!is_silent && target != newtarg)
			say(pick(GLOB.generic_vnpc_aggro))
			pointed(target)


/mob/living/carbon/human/species/delfevil/npc/Initialize()
	. = ..()
	set_species(/datum/species/elf/dark)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)
	load_generic_bellies()

/mob/living/carbon/human/species/delfevil/npc/load_mob_bellies()
	..()


/mob/living/carbon/human/species/delfevil/npc/after_creation()
	..()
	job = "Bandit"
	equipOutfit(new delfevil_outfit)
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
	var/skincolor = "#5f5f70"
	var/skincolor2 = "5f5f70"

	skin_tone = skincolor2

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
		real_name = pick(world.file2list("strings/rt/names/elf/elfwf.txt"))
	else
		real_name = pick(world.file2list("strings/rt/names/elf/elfwm.txt"))
	update_hair()
	update_body()

/datum/outfit/job/roguetown/delfevil/npc/pre_equip(mob/living/carbon/human/H) //gives some default skills and equipment for player controlled elves
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/shadowpants/drowraider
	if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/shadowvest/drowraider
		shirt = /obj/item/clothing/suit/roguetown/shirt/shadowshirt/elflock/drowraider
	gloves = /obj/item/clothing/gloves/roguetown/fingerless/shadowgloves/elflock
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	mask = /obj/item/clothing/mask/rogue/facemask
	neck = /obj/item/clothing/neck/roguetown/coif/heavypadding
	r_hand = /obj/item/rogueweapon/whip
	if(prob(45))
		r_hand = /obj/item/rogueweapon/sword/falx/stalker
		l_hand = /obj/item/rogueweapon/sword/falx/stalker
	else if(prob(15))
		r_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/corroded/dirk
		l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/corroded/dirk

	H.STASTR = 14
	H.STASPD = 15
	H.STACON = 14 
	H.STAWIL = 12 
	H.STAPER = 10
	H.STAINT = 10
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)

/mob/living/carbon/human/species/delfevil/npc/death(gibbed, nocutscene)
	if(vore_organs.len > 0)
		for(var/obj/belly/B in vore_organs)
			B.release_all_contents(TRUE)
	. = ..()

/mob/living/carbon/human/species/hobgoblin
	name = "hob goblin"
	icon = 'modular_causticcove/icons/mob/monster/hobgoblins/hobgoblins.dmi'
	icon_state = "hobgoblin"
	race = /datum/species/hobgoblin
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest/hobgoblin, /obj/item/bodypart/head/hobgoblin, /obj/item/bodypart/l_arm/hobgoblin,
					/obj/item/bodypart/r_arm/hobgoblin, /obj/item/bodypart/r_leg/hobgoblin, /obj/item/bodypart/l_leg/hobgoblin)
	rot_type = /datum/component/rot/corpse/goblin
	var/hobgob_outfit = /datum/outfit/job/roguetown/npc/hobgoblin
	ambushable = FALSE
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	possible_mmb_intents = list(INTENT_SPECIAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	possible_rmb_intents = list(/datum/rmb_intent/feint, /datum/rmb_intent/swift, /datum/rmb_intent/riposte, /datum/rmb_intent/strong) //Strong intent for strong mob...
	flee_in_pain = TRUE

//////////////////   BODYPARTS	//////////////////
	//I am going to experiment with pain with Hobgoblins, and eventually spread to other mobs if this feels right.
	//Hobgoblins will be dismemberable by default for now, may change in the future. Naturally high CON counters this.
/obj/item/bodypart/chest/hobgoblin
	max_pain_damage = 100

/obj/item/bodypart/head/hobgoblin
	max_pain_damage = 100

/obj/item/bodypart/l_arm/hobgoblin
	max_pain_damage = 75

/obj/item/bodypart/r_arm/hobgoblin
	max_pain_damage = 75

/obj/item/bodypart/l_leg/hobgoblin
	max_pain_damage = 75

/obj/item/bodypart/r_leg/hobgoblin
	max_pain_damage = 75


//////////////////   PROCS	//////////////////
/obj/item/bodypart/head/hobgoblin/update_icon_dropped()
	return

/obj/item/bodypart/head/hobgoblin/get_limb_icon(dropped, hideaux = FALSE)
	return

/mob/living/carbon/human/species/hobgoblin/update_inv_head(hide_nonstandard = FALSE)
	update_wearable()

/mob/living/carbon/human/species/hobgoblin/update_inv_armor()
	update_wearable()

/mob/living/carbon/human/species/hobgoblin/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/obj/item/bodypart/head/hobgoblin/skeletonize()
	. = ..()
	icon_state = "hobgoblin_skel_head"
	sellprice = 2

/mob/living/carbon/human/species/hobgoblin/handle_combat()
	if(mode == NPC_AI_HUNT)
		if(prob(5)) //WE ARE FEARSOME!!!
			if(prob(50))
				emote("laugh")
			else 
				emote("warcry")
	. = ..()

/mob/living/carbon/human/species/hobgoblin/update_body()
	remove_overlay(BODY_LAYER)
	if(!dna || !dna.species)
		return
	var/datum/species/hobgoblin/G = dna.species
	if(!istype(G))
		return
	icon_state = ""
	var/list/standing = list()
	var/mutable_appearance/body_overlay
	var/obj/item/bodypart/chesty = get_bodypart("chest")
	var/obj/item/bodypart/headdy = get_bodypart("head")
	if(!headdy)
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "hobgoblin_skel_decap", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]_decap", -BODY_LAYER)
	else
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "hobgoblin_skel", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]", -BODY_LAYER)

	if(body_overlay)
		standing += body_overlay
	if(standing.len)
		overlays_standing[BODY_LAYER] = standing

	apply_overlay(BODY_LAYER)
	dna.species.update_damage_overlays()

/mob/living/carbon/human/species/hobgoblin/proc/update_wearable()
	remove_overlay(ARMOR_LAYER)

	var/list/standing = list()
	var/mutable_appearance/body_overlay
	if(wear_armor)
		body_overlay = mutable_appearance(icon, "[wear_armor.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(head)
		body_overlay = mutable_appearance(icon, "[head.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(standing.len)
		overlays_standing[ARMOR_LAYER] = standing

	apply_overlay(ARMOR_LAYER)

/mob/living/carbon/human/species/hobgoblin/after_creation()
	..()
	gender = MALE
	if(src.dna && src.dna.species)
		src.dna.species.soundpack_m = new /datum/voicepack/other/goblin() //REMINDER TO UPDATE!!!
		src.dna.species.soundpack_f = new /datum/voicepack/other/goblin() //REMINDER TO UPDATE!!!
		var/obj/item/headdy = get_bodypart("head")
		if(headdy)
			headdy.icon = 'modular_causticcove/icons/mob/monster/hobgoblins/hobgoblins.dmi'
			headdy.icon_state = "[src.dna.species.id]_head"
			headdy.sellprice = 40 // Double the value, double the threat.
	src.grant_language(/datum/language/orcish)
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/nightmare
	eyes.Insert(src)
	src.underwear = "Nude"
	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	update_body()
	faction = list("orcs")
	name = "hobgoblin"
	real_name = "hobgoblin"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	if(hobgob_outfit)
		var/datum/outfit/O = new hobgob_outfit
		if(O)
			equipOutfit(O)


//////////////////   OUTFITS	//////////////////

/datum/outfit/job/roguetown/npc/hobgoblin/pre_equip(mob/living/carbon/human/H)
	..()
	var/chance_zjumper = 5
	var/chance_treeclimber = 30

	H.STASTR = 14
	H.STAINT = 7 //Somewhat smart buggers!
	H.STACON = 16
	H.STAWIL = 14
	H.STASPD = 12

	if(prob(chance_zjumper))
		ADD_TRAIT(H, TRAIT_ZJUMP, TRAIT_GENERIC)
		H.find_targets_above = TRUE
	if(prob(chance_treeclimber))
		H.tree_climber = TRUE
		H.find_targets_above = TRUE // so they can taunt

	var/loadout = rand(1,4)
	switch(loadout)
		if(1) //tribal spear
			r_hand = /obj/item/rogueweapon/spear/stone
		if(2) //tribal axe
			r_hand = /obj/item/rogueweapon/stoneaxe
		if(3) //tribal club
			r_hand = /obj/item/rogueweapon/mace/woodclub
			if(prob(10))
				head = /obj/item/clothing/head/roguetown/helmet/leather/goblin
		if(4) //lightly armored sword/flail/daggers
			if(prob(50))
				r_hand = /obj/item/rogueweapon/sword/iron
			else
				r_hand = /obj/item/rogueweapon/mace/spiked
			if(prob(30))
				l_hand = /obj/item/rogueweapon/shield/wood
			if(prob(23))
				r_hand = /obj/item/rogueweapon/huntingknife/stoneknife
				l_hand = /obj/item/rogueweapon/huntingknife/stoneknife

	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE) // Average Advent Dueler
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)

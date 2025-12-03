/datum/species/hobgoblin
	name = "hobgoblin"
	id = "hobgoblin"
	species_traits = list(NO_UNDERWEAR,NOEYESPRITES)
	inherent_traits = list(TRAIT_RESISTCOLD, 
		TRAIT_RESISTHIGHPRESSURE, 
		TRAIT_RESISTLOWPRESSURE, 
		TRAIT_RADIMMUNE, 
		TRAIT_CRITICAL_WEAKNESS, 
		TRAIT_NASTY_EATER, 
		TRAIT_LEECHIMMUNE) // For goblin armor
	no_equip = list(SLOT_SHIRT, SLOT_WEAR_MASK, SLOT_GLOVES, SLOT_SHOES, SLOT_PANTS, SLOT_S_STORE)
	nojumpsuit = 1
	sexes = 1
	offset_features = list(OFFSET_HANDS = list(0,-4), OFFSET_HANDS_F = list(0,-4))
	damage_overlay_type = ""
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	var/raceicon = "hobgoblin"

/datum/species/hobgoblin/regenerate_icons(mob/living/carbon/human/H)
//	H.cut_overlays()
	H.icon_state = ""
	if(H.notransform)
		return 1
	H.update_inv_hands()
	H.update_inv_handcuffed()
	H.update_inv_legcuffed()
	H.update_body()
	var/mob/living/carbon/human/species/hobgoblin/G = H
	G.update_wearable()
	H.update_transform()
	return TRUE

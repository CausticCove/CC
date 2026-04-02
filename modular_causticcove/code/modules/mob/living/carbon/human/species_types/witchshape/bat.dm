/mob/living/carbon/human/species/wildshape/witch/bat
	//Must be unique from any other wildshape or else skills and procs will conflict. Treat the name like an ID. Unsure why this happens.
	//Use real_name for the displayed name on examine.
	name = "witch_bat"
	race = /datum/species/witch/bat
	footstep_type = FOOTSTEP_MOB_CLAW
	ambushable = FALSE
	wildshape_icon = 'icons/mob/animal.dmi'
	wildshape_icon_state = "bat"
	movement_type = FLYING
	var/fly_time = 0.5 SECONDS
	hand_examine = "claws"


/mob/living/carbon/human/species/wildshape/witch/bat/gain_inherent_skills()
	. = ..()
	if(mind)
		adjust_skillrank(/datum/skill/combat/wrestling, SKILL_LEVEL_NOVICE, TRUE)
		adjust_skillrank(/datum/skill/combat/unarmed, SKILL_LEVEL_NOVICE, TRUE)
		adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_EXPERT, TRUE)
		adjust_skillrank(/datum/skill/misc/sneaking, SKILL_LEVEL_EXPERT, TRUE)

		STASTR = 2
		STACON = 4
		STAWIL = 5
		STAPER = 12
		STASPD = 20
		STALUC = 9

		real_name = "Bat"
		faction += "bats"


/datum/species/witch/bat
	name = "bat"
	id = "witchshapebat"
	species_traits = list(NO_UNDERWEAR, NO_ORGAN_FEATURES, NO_BODYPART_FEATURES)
	inherent_traits = list(
		TRAIT_WILD_EATER,
		TRAIT_HARDDISMEMBER,
		TRAIT_DODGEEXPERT,
		TRAIT_BRITTLE,
		TRAIT_LEAPER
	)
	inherent_biotypes = MOB_HUMANOID
	no_equip = list(SLOT_SHIRT, SLOT_HEAD, SLOT_WEAR_MASK, SLOT_ARMOR, SLOT_GLOVES, SLOT_SHOES, SLOT_PANTS, SLOT_CLOAK, SLOT_BELT, SLOT_BACK_R, SLOT_BACK_L, SLOT_S_STORE)
	nojumpsuit = 1
	sexes = 1
	offset_features = list(OFFSET_HANDS = list(0,2), OFFSET_HANDS_F = list(0,2))
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/night_vision,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue/wild_tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		)

	languages = list(
		/datum/language/beast,
		/datum/language/common,
	)

/datum/species/witch/bat/regenerate_icons(mob/living/carbon/human/human)
	human.icon = 'icons/mob/animal.dmi'
	human.base_intents = list(INTENT_HELP)
	human.icon_state = "bat"
	human.update_damage_overlays()
	return TRUE

/datum/species/witch/bat/on_species_gain(mob/living/carbon/carbon, datum/species/old_species)
	. = ..()
	RegisterSignal(carbon, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/species/witch/bat/update_damage_overlays(mob/living/carbon/human/human)
	human.remove_overlay(DAMAGE_LAYER)
	return TRUE

//Handle Flight
/mob/living/carbon/human/species/wildshape/witch/bat/Initialize()
	. = ..()
	verbs += list(/mob/living/carbon/human/species/wildshape/witch/bat/proc/fly_up,
	/mob/living/carbon/human/species/wildshape/witch/bat/proc/fly_down)

/mob/living/carbon/human/species/wildshape/witch/bat/proc/fly_up()
	set category = "Winged Form"
	set name = "Fly Up"

	if(src.pulledby != null)
		to_chat(src, span_notice("I can't fly away while being grabbed!"))
		return
	src.visible_message(span_notice("[src] begins to ascend!"), span_notice("You take flight..."))

	if(do_after(src, fly_time, target))
		if(src.pulledby == null)
			src.zMove(UP, TRUE)
			to_chat(src, span_notice("I fly up."))
		else
			to_chat(src, span_notice("I can't fly away while being grabbed!"))

/mob/living/carbon/human/species/wildshape/witch/bat/proc/fly_down()
	set category = "Winged Form"
	set name = "Fly Down"

	if(src.pulledby != null)
		to_chat(src, span_notice("I can't fly away while being grabbed!"))
		return
	src.visible_message(span_notice("[src] begins to descend!"), span_notice("You take flight..."))

	if(do_after(src, fly_time, target))
		if(src.pulledby == null)
			src.zMove(DOWN, TRUE)
			to_chat(src, span_notice("I fly down."))
		else
			to_chat(src, span_notice("I can't fly away while being grabbed!"))

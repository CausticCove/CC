/datum/virtue/utility/grazer
	name = "Grazer"
	desc = "You are able to eat grass by grazing."

/datum/virtue/utility/grazer/apply_to_human(mob/living/carbon/human/recipient)
	var/obj/item/organ/stomach/grazer/gut = new()
	gut.Insert(recipient)
	recipient.dna.organ_dna[ORGAN_SLOT_STOMACH]:organ_type = /obj/item/organ/stomach/grazer

/datum/virtue/combat/natarmor
	name = "Natural Armor"
	desc = "My hide is thick and resilient. It will regenerate so long as I keep it fed..."
	added_traits = list()
	custom_text = "My hide is thick and resilient. It will regenerate so long as I keep it fed..."

/datum/virtue/combat/natarmor/apply_to_human(mob/living/carbon/human/recipient)
	recipient.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/natural_armor(recipient)

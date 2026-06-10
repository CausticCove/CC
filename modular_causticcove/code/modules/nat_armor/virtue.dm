/datum/virtue/combat/natarmor
	name = "Natural Armor"
	desc = "My hide is thick and resilient, enhancing my natural defense whilst making armor meerly vanity on my body. \
	\n It will regenerate so long as I keep it fed... "
	added_traits = list()
	custom_text = "Provides you with a special, regenerative armor piece that is capable of regenerating at the cost of your hunger that covers your entire body. \
	\n NOTE: OVRRIDES ANY WORN ARMOR ON THE BODY, WORN ARMOR WEIGHT CLASS STILL APPLIES DEBUFFS. "

/datum/virtue/combat/natarmor/apply_to_human(mob/living/carbon/human/recipient)
	recipient.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/natural_armor(recipient)

//CC Edit - Cannot abuse natural armor if you do not hunger in the first place.
/datum/virtue/combat/natarmor/handle_traits(mob/living/carbon/human/recipient)
	..()
	if(HAS_TRAIT(recipient, TRAIT_NOHUNGER))
		to_chat(recipient, span_danger("YOU ARE INCAPABLE OF STARVING, YOUR NATURAL PROTECTION IS GONE!"))
		to_chat(recipient, span_notice("You do not possess the correct biological setup to reform natural armor!"))
		recipient.skin_armor = null //Delete the armor, rely on proper gear/loadout equipment.
//CC Edit End

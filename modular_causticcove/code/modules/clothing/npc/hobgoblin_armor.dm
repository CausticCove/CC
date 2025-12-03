//Experimental Armor
/obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/hobgoblin
	name = "hob goblin mail"
	icon_state = "plate_armor_item"
	item_state = "plate_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	smeltresult = /obj/item/ingot/iron
	allowed_race = list(/datum/species/hobgoblin)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	sellprice = 0

/obj/item/clothing/suit/roguetown/armor/leather/hide/hobgoblin
	name = "goblin loincloth"
	icon_state = "cloth_armor"
	item_state = "cloth_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = list(/datum/species/hobgoblin)
	body_parts_covered = GROIN
	armor = null
	sellprice = 0

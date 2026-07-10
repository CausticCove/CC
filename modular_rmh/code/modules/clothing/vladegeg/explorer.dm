/obj/item/clothing/suit/roguetown/armor/gambeson/explorer
	name = "Explorer's Vest"
	desc = "A dashing outfit for an experienced tomb raider."
	armor = ARMOR_LEATHER
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon_state = "vest"
	item_state = "vest"
	icon = 'modular_rmh/icons/clothing/vladegeg/explorer.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/explorer.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/explorer_sleeves.dmi'
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/armor/gambeson/explorer/update_icon()
	. = ..()

/obj/item/clothing/under/roguetown/trou/leather/explorer
	name = "Explorer's Trousers"
	desc = "Hardy yet comfortable leather pants, suited even for hardest field work."
	icon = 'modular_rmh/icons/clothing/vladegeg/explorer.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/explorer.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/explorer_sleeves.dmi'
	icon_state = "pants"
	item_state = "pants"

/obj/item/clothing/head/roguetown/explorer
	name = "Explorer's Hat"
	desc = "The perfect protection both from heat and things falling on your head."
	icon = 'modular_rmh/icons/clothing/vladegeg/explorer.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/explorer.dmi'
	icon_state = "hat"
	item_state = "hat"
	armor = ARMOR_LEATHER
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured

//CRAFTING

/datum/crafting_recipe/roguetown/leather/armor/explorer_vest
	name = "Explorer's Vest"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/explorer)
	reqs = list(/obj/item/natural/hide/cured = 2)
	sellprice = 35
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/armor/explorer_pants
	name = "Explorer's Trousers"
	result = list(/obj/item/clothing/under/roguetown/trou/leather/explorer)
	reqs = list(/obj/item/natural/hide/cured = 2)
	sellprice = 35
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/armor/explorer_helmet
	name = "Explorer's Hat"
	result = list(/obj/item/clothing/head/roguetown/explorer)
	reqs = list(/obj/item/natural/hide/cured = 2)
	sellprice = 35
	craftdiff = 2

//LOADOUT

/datum/loadout_item/explorer_vest
	name = "Explorer's Vest"
	path = /obj/item/clothing/suit/roguetown/armor/gambeson/explorer
	sort_category = "Shirts"
	triumph_cost = 3

/datum/loadout_item/explorer_pants
	name = "Explorer's Trousers"
	path = /obj/item/clothing/under/roguetown/trou/leather/explorer
	sort_category = "Pants"
	triumph_cost = 2

/datum/loadout_item/explorer_helmet
	name = "Explorer's Hat"
	path = /obj/item/clothing/head/roguetown/explorer
	sort_category = "Hats"
	triumph_cost = 3

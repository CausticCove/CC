/obj/item/clothing/suit/roguetown/armor/gambeson/upperclass_jacket
	name = "Upperclass Jacket"
	desc = "A finely tailored jacket of sophisticated design, favored by those who value refinement, status, and impeccable presentation."
	icon_state = "jacket"
	item_state = "jacket"
	icon = 'modular_rmh/icons/clothing/vladegeg/sophisticated.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/sophisticated.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/sophisticated_sleeves.dmi'
	slot_flags = ITEM_SLOT_SHIRT | ITEM_SLOT_ARMOR
	salvage_amount = 2

/obj/item/clothing/suit/roguetown/armor/gambeson/upperclass_coat
	name = "Upperclass Coat"
	desc = "A sophisticated coat of fine tailoring and subtle elegance, worn to project refinement, confidence, and social standing."
	icon_state = "coat"
	item_state = "coat"
	icon = 'modular_rmh/icons/clothing/vladegeg/sophisticated.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/sophisticated.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/sophisticated_sleeves.dmi'
	slot_flags = ITEM_SLOT_ARMOR | ITEM_SLOT_CLOAK
	salvage_result = /obj/item/natural/fur

//CRAFTING

/datum/crafting_recipe/roguetown/sewing/upperclass_jacket
	name = "Upperclass Jacket"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/upperclass_jacket)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/upperclass_coat
	name = "Upperclass Coat"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson/upperclass_coat
	reqs = list(/obj/item/natural/hide/cured = 1,/obj/item/natural/fur = 2)
	craftdiff = 2

//LOADOUT

/datum/loadout_item/upperclass_jacket
	name = "Upperclass Jacket"
	path = /obj/item/clothing/suit/roguetown/armor/gambeson/upperclass_jacket
	sort_category = "Shirts"
	triumph_cost = 3

/datum/loadout_item/upperclass_coat
	name = "Upperclass Coat"
	path = /obj/item/clothing/suit/roguetown/armor/gambeson/upperclass_coat
	sort_category = "Shirts"
	triumph_cost = 3

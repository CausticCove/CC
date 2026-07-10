/obj/item/clothing/suit/roguetown/armor/plate/scale/inqcoat/armored/heavy
	name = "plated inquisitorial duster"
	desc = "A heavy longcoat that's fitted atop a set of blessed plate armor, donned by the Holy Psydonic Inquisition's finest. As expected from \
	such a doursome country, this style is quite popular in Otava - where the skies are always overcast, and where sanctioned Ordinators often have \
	to roam in the downpour. </br>At least, that's what the Holy See would probably say. What would <i>they</i> know about fashion, however?"
	icon_state = "ordinatorplatecoat"
	item_state = "ordinatorplatecoat"
	icon = 'icons/clothing/donor_clothes.dmi'
	mob_overlay_icon = 'icons/clothing/onmob/donor_clothes.dmi'
	sleeved = 'icons/clothing/onmob/donor_sleeves_armor.dmi'
	equip_delay_self = 8 SECONDS
	armor_class = ARMOR_CLASS_HEAVY
	armor = ARMOR_PLATE
	max_integrity = ARMOR_INT_CHEST_PLATE_PSYDON
	is_silver = TRUE
	is_lesser_silver = TRUE

/obj/item/clothing/suit/roguetown/armor/plate/cuirass/fencer/decorated
	name = "decorated chestplate"
	icon_state = "gildedchestplate"
	smeltresult = /obj/item/ingot/gold
	desc = "An ornate steel chestplate, decorated with golden fluting. For when you need to bring a little bit of regal style to that upcoming duel with your lyfe's greatest adversary."
	smelt_bar_num = 1
	color = null
	detail_color = CLOTHING_WHITE
	detail_tag = "_detail"

/obj/item/clothing/suit/roguetown/armor/plate/cuirass/fencer/decorated/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/clothing/suit/roguetown/armor/plate/cuirass/fencer/decorated/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/armor/plate/cuirass/fluted/decorated
	name = "decorated cuirass"
	icon_state = "gildedcuirass"
	smeltresult = /obj/item/ingot/gold
	desc = "An ornate steel cuirass, decorated with golden fluting. For when you need to ensure that you look dapper, during your mustering for the latest crusade into some gods-forsaken land."
	smelt_bar_num = 1
	color = null
	detail_color = CLOTHING_WHITE
	detail_tag = "_detail"

/obj/item/clothing/suit/roguetown/armor/plate/cuirass/fluted/decorated/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/clothing/suit/roguetown/armor/plate/cuirass/fluted/decorated/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/armor/plate/fluted/decorated
	name = "decorated half-plate"
	icon_state = "gildedhalfplate"
	smeltresult = /obj/item/ingot/gold
	desc = "An ornate set of steel armor, decorated with golden fluting. For when you need to remind those of lesser stations about whose authority reigns supreme, in lieu of a King's command."
	smelt_bar_num = 1
	color = null
	detail_color = CLOTHING_WHITE
	detail_tag = "_detail"

/obj/item/clothing/suit/roguetown/armor/plate/fluted/decorated/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/clothing/suit/roguetown/armor/plate/fluted/decorated/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/armor/plate/full/fluted/decorated
	name = "decorated plate armor"
	icon_state = "gildedplate"
	smeltresult = /obj/item/ingot/gold
	desc = "An ornate set of steel plate armor, decorated with golden fluting. For when you need to do something with all of that precious, precious wealth gathering dust in a fief's ducal treasury."
	smelt_bar_num = 1
	color = null
	detail_color = CLOTHING_WHITE
	detail_tag = "_detail"

/obj/item/clothing/suit/roguetown/armor/plate/full/fluted/decorated/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/clothing/suit/roguetown/armor/plate/full/fluted/decorated/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/armor/brigandine/heavy/decorated
	name = "decorated coat of plates"
	desc = "An ornate coat-of-plates, adorned with a pair of steel vambraces and decorated with golden fluting. For when 'commanding by saigaback' is both a tactically unsound yet tempting option."
	icon_state = "gildedcoatofplates"
	item_state = "gildedcoatofplates"
	color = null
	detail_color = CLOTHING_WHITE
	detail_tag = "_detail"

/obj/item/clothing/suit/roguetown/armor/brigandine/heavy/decorated/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/clothing/suit/roguetown/armor/brigandine/heavy/decorated/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)
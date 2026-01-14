/obj/item/storage/belt/rogue/surgery_bag
	name = "surgeon's bag"
	desc = "Made to hold everything a people-butcher will need. Contains a list of implements... what even IS a Sisrat?"
	icon = 'icons/roguetown/clothing/storage.dmi'
	mob_overlay_icon = null
	icon_state = "surgery_bag"
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	content_overlays = FALSE
	bloody_icon_state = "bodyblood"
	sewrepair = TRUE
	component_type = /datum/component/storage/concrete/roguetown/surgery_bag
	populate_contents = list(
		/obj/item/rogueweapon/surgery/scalpel,
		/obj/item/rogueweapon/surgery/saw,
		/obj/item/rogueweapon/surgery/hemostat/first,
		/obj/item/rogueweapon/surgery/hemostat/second, //Different types for multiple surgery sites.
		/obj/item/rogueweapon/surgery/hemostat/third,
		/obj/item/rogueweapon/surgery/retractor,
		/obj/item/rogueweapon/surgery/retractor,
		/obj/item/rogueweapon/surgery/bonesetter,
		/obj/item/rogueweapon/surgery/cautery,
		/obj/item/rogueweapon/surgery/hammer,
		/obj/item/natural/bundle/cloth/bandage/full,
		/obj/item/needle
	)

/obj/item/storage/belt/rogue/surgery_bag/full/physician
	populate_contents = list(
	/obj/item/rogueweapon/surgery/scalpel,
	/obj/item/rogueweapon/surgery/saw,
	/obj/item/rogueweapon/surgery/hemostat/first,  //Different types for multiple surgery sites.
	/obj/item/rogueweapon/surgery/hemostat/second,
	/obj/item/rogueweapon/surgery/hemostat/third,
	/obj/item/rogueweapon/surgery/retractor,
	/obj/item/rogueweapon/surgery/retractor,
	/obj/item/rogueweapon/surgery/bonesetter,
	/obj/item/rogueweapon/surgery/cautery,
	/obj/item/natural/bundle/cloth/bandage/full,
	/obj/item/rogueweapon/surgery/hammer,
	/obj/item/needle/pestra //Gets the special needle!
	)

/obj/item/storage/belt/rogue/surgery_bag/empty
	populate_contents = list(
	)
// Caustic Edit Start
/obj/item/storage/belt/rogue/surgery_bag/improv
	component_type = /datum/component/storage/concrete/roguetown/improv_surgery_bag
	name = "improvised surgeon's bag"

	populate_contents = list(
	/obj/item/rogueweapon/huntingknife/stoneknife,
	/obj/item/rogueweapon/surgery/saw/improv,
	/obj/item/rogueweapon/tongs/stone,
	/obj/item/rogueweapon/tongs/stone,
	/obj/item/grown/log/tree/stake,
	/obj/item/grown/log/tree/stake,
	/obj/item/natural/bundle/cloth,
	/obj/item/needle/thorn,
	/obj/item/needle/thorn,
	)

/datum/component/storage/concrete/roguetown/improv_surgery_bag
	screen_max_rows = 5
	screen_max_columns = 5
	max_w_class = WEIGHT_CLASS_NORMAL

/datum/component/storage/concrete/roguetown/improv_surgery_bag/New(datum/P, ...)
	. = ..()
	can_hold = typecacheof(list(
	/obj/item/rogueweapon/surgery,
	/obj/item/needle,
	/obj/item/natural/worms/leech,
	/obj/item/reagent_containers/lux,
	/obj/item/natural/bundle/cloth,
	/obj/item/natural/cloth,
	/obj/item/rogueweapon/huntingknife/stoneknife,
	/obj/item/rogueweapon/tongs/stone,
	/obj/item/grown/log/tree/stake
))

// Caustic Edit End
/obj/item/storage/belt/rogue/pouch/medicine
	populate_contents = list(
	/obj/item/needle,
	/obj/item/natural/bundle/cloth/bandage/full,
	/obj/item/reagent_containers/glass/bottle/alchemical/healthpot
	)

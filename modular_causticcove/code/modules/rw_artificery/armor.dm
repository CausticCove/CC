/obj/item/clothing/suit/roguetown/armor/plate/paalloy/artificer
	name = "artificed half-plate"
	desc = "Polished gilbronze layers, magewelded into lightweight plate armor. It holds a slot for an arcyne meld to power it."
	smeltresult = /obj/item/ingot/aaslag
	icon = 'modular_causticcove/icons/RW_artificery/armor.dmi'
	mob_overlay_icon = 'modular_causticcove/icons/RW_artificery/onmob_armor.dmi'
	icon_state = "artificerplate"
	item_state = "artificerplate"
	armor_class = ARMOR_CLASS_LIGHT // Artificer made gilbronze.
	var/powered = FALSE
	var/mode = 1
	var/active_item = FALSE //Prevents issues like dragon ring giving negative str instead
	var/legendaryarcane = FALSE
	var/legendaryathletics = FALSE
/obj/item/clothing/suit/roguetown/armor/plate/paalloy/artificer/Initialize()
	.=..()
	update_description()

/obj/item/clothing/suit/roguetown/armor/plate/paalloy/artificer/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		if(user.get_skill_level(/datum/skill/craft/engineering) >= 3)
			toggle_mode(user)
			return
	if(istype(I, /obj/item/magic/melded/t1) && !powered)
		user.visible_message(span_notice("[user] starts carefully setting [I] into place as a power source."))
		if(do_after(user, 5 SECONDS, target = src))
			qdel(I)
			powered = TRUE
			icon_state ="artificerplate_powered"
			item_state = "artificerplate_powered"
	.=..()

/obj/item/clothing/suit/roguetown/armor/plate/paalloy/artificer/proc/toggle_mode(mob/user)
	mode = (mode == 1) ? 2 : 1
	user.visible_message(span_notice("[user] tinkers with [src], adjusting its enhancements."))
	update_description()

/obj/item/clothing/suit/roguetown/armor/plate/paalloy/artificer/equipped(mob/living/user, slot)
	. = ..()
	if(!powered || active_item || slot != SLOT_ARMOR)
		return
	if(mode == 1) // Arcane mode
		var/current_arcane = user.get_skill_level(/datum/skill/magic/arcane)
		if(current_arcane)
			if(current_arcane < 6) // Only add if not already capped
				active_item = TRUE
				legendaryarcane = FALSE
				user.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
				user.change_stat("intelligence", 3)
				to_chat(user, span_notice("Magicks flow throughout your body."))
			else
				user.change_stat("intelligence", 3)
				legendaryarcane = TRUE
				active_item = TRUE
				to_chat(user, span_warning("[src] hums, but you are already a master of the arcane."))
		else
			to_chat(user, span_warning("[src] feels cold and dead to the non-arcane."))
	if(mode == 2)
		if(slot != SLOT_ARMOR)
			return
		var/current_athletics = user.get_skill_level(/datum/skill/misc/athletics)
		if(current_athletics)
			if(current_athletics < 6)// Only add if not already capped
				user.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
				legendaryathletics = FALSE
			else
				legendaryathletics = TRUE
			active_item = TRUE
			to_chat(user, span_notice("Strength flow throughout your body."))
			user.change_stat("strength", 2)
			user.change_stat("endurance", 2)
			return
		else
			to_chat(user, span_warning("The curiass feels cold and dead."))

/obj/item/clothing/suit/roguetown/armor/plate/paalloy/artificer/dropped(mob/living/user)
	.=..()
	if(active_item)
		if(mode == 1)
			if(user.get_skill_level(/datum/skill/magic/arcane))
				var/mob/living/carbon/human/H = user
				if(!legendaryarcane)
					H.adjust_skillrank(/datum/skill/magic/arcane, -1, TRUE)
				if(H.get_item_by_slot(SLOT_ARMOR) == src)
					to_chat(H, span_notice("Gone is the arcane magicks enhancing thine abilities..."))
					H.change_stat("intelligence", -3)
					active_item = FALSE
					return
			else
				return
		if(mode == 2)
			if(user.get_skill_level(/datum/skill/misc/athletics))
				var/mob/living/carbon/human/H = user
				if(!legendaryathletics)
					H.adjust_skillrank(/datum/skill/misc/athletics, -1, TRUE)
				if(H.get_item_by_slot(SLOT_ARMOR) == src)
					to_chat(H, span_notice("Gone is the strength enhancing thine abilities..."))
					user.change_stat("strength", -2)
					user.change_stat("endurance", -2)
					active_item = FALSE
					return
			else
				return

/obj/item/clothing/suit/roguetown/armor/plate/paalloy/artificer/proc/update_description()
	if(mode == 1)
		desc = "Polished gilbronze layers, magewelded into lightweight plate armor. It hums with arcyne power, enhancing magical prowess."
	else
		desc = "Polished gilbronze layers, magewelded into lightweight plate armor. It radiates raw strength, reinforcing the wearer's physical might."

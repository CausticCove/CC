//T3 Enchantment
/datum/magic_item/greater/energysiphon
	name = "energy siphon"
	description = "It feels rather cold."
	glow_color = "#87ebc0"
	var/last_used

/datum/magic_item/greater/energysiphon/on_hit(obj/item/source, atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return
	if(world.time < src.last_used + 20 SECONDS)
		return
	if(isliving(target))
		var/mob/living/targeted = target
		targeted.stamina_add(-5)
		user.stamina_add(5)
		targeted.visible_message(span_danger("[source] drains strength from [targeted]!"))
		src.last_used = world.time

/datum/magic_item/greater/energysiphon/on_hit_response(var/obj/item/I, var/mob/living/carbon/human/owner, var/mob/living/carbon/human/attacker)
	if(world.time < src.last_used + 20 SECONDS)
		return
	if(isliving(attacker) && attacker != owner)
		attacker.stamina_add(-5)
		owner.stamina_add(5)
		attacker.visible_message(span_danger("[I] drains strength from [attacker]!"))
		src.last_used = world.time
//T 2 Enchantment
/datum/magic_item/superior/barotrauma
	name = "deep sea mind"
	description = "Deeper knowledge at the cost of your sanity."
	glow_color = "#365792"
	var/active_item = FALSE

/datum/magic_item/superior/barotrauma/on_equip(var/obj/item/i, var/mob/living/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_HANDS)
		return
	if(active_item)
		return
	else
		user.STAINT += 2
		user.STAWIL -= 1
		to_chat(user, span_notice("I see them"))
		active_item = TRUE

/datum/magic_item/superior/barotrauma/on_drop(var/obj/item/i, var/mob/living/user)
	if(active_item)
		active_item = FALSE
		user.STAINT -= 2
		user.STAWIL += 1
		to_chat(user, span_notice("They fade from my mind"))
///T1 Enchantments
/datum/magic_item/mundane/waterbreath
	name = "water breathing"
	description = "It has a sigil of Noc's eye."
	glow_color = "#B0C4DE"
	var/active_item = FALSE

/datum/magic_item/mundane/waterbreath/on_equip(var/obj/item/i, var/mob/living/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_HANDS)
		return
	if(active_item)
		return
	else
		ADD_TRAIT(user, TRAIT_WATERBREATHING, "[type]")
		active_item = TRUE
		to_chat(user, span_notice("Your lungs feel full of air!"))


/datum/magic_item/mundane/waterbreath/on_drop(var/obj/item/i, var/mob/living/user)
	if(active_item)
		REMOVE_TRAIT(user, TRAIT_WATERBREATHING, "[type]")
		active_item = FALSE
		to_chat(user, span_notice("I feel mundane once more"))

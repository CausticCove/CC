//tier two, pure water summons
/datum/magic_item/superior/waterbreath
	name = "water breathing"
	description = "It has a sigil of Noc's eye."
	glow_color = "#B0C4DE"
	var/active_item = FALSE

/datum/magic_item/superior/waterbreath/on_equip(var/obj/item/i, var/mob/living/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_HANDS)
		return
	if(active_item)
		return
	else
		ADD_TRAIT(user, TRAIT_WATERBREATHING, "[type]")
		active_item = TRUE
		to_chat(user, span_notice("Your lungs feel full of air!"))


/datum/magic_item/superior/waterbreath/on_drop(var/obj/item/i, var/mob/living/user)
	if(active_item)
		REMOVE_TRAIT(user, TRAIT_WATERBREATHING, "[type]")
		active_item = FALSE
		to_chat(user, span_notice("I feel mundane once more"))

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
		user.change_stat(STATKEY_INT, 2)
		user.change_stat(STATKEY_WIL, -1)
		to_chat(user, span_notice("I see them"))
		active_item = TRUE

/datum/magic_item/superior/barotrauma/on_drop(var/obj/item/i, var/mob/living/user)
	if(active_item)
		active_item = FALSE
		user.change_stat(STATKEY_INT, -2)
		user.change_stat(STATKEY_WIL, 1)
		to_chat(user, span_notice("They fade from my mind"))

/datum/magic_item/superior/chargedthorns
	name = "charged thorns"
	description = "Thorns of lighting form on it's surface."
	glow_color = "#d2f10a"
	var/last_used

/datum/magic_item/superior/chargedthorns/on_hit_response(var/obj/item/I, var/mob/living/carbon/human/owner, var/mob/living/carbon/human/attacker)
	if(world.time < src.last_used + 25 SECONDS)
		return
	if(isliving(attacker) && attacker != owner)
		attacker.electrocute_act(15, src, 1, SHOCK_NOSTUN)
		attacker.visible_message(span_danger("[I] electrocutes [attacker]!"))
		src.last_used = world.time

//tier 3, 1 water summon, 3 tier 3 normal material
/datum/magic_item/greater/energysiphon
	name = "energy siphon"
	description = "It feels rather cold."
	glow_color = "#87ebc0"
	var/last_used

/datum/magic_item/greater/energysiphon/on_hit(obj/item/source, atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return
	if(world.time < src.last_used + 30 SECONDS)
		return
	if(isliving(target))
		var/mob/living/targeted = target
		targeted.stamina_add(-20)
		user.stamina_add(20)
		targeted.visible_message(span_danger("[source] drains strength from [targeted]!"))
		src.last_used = world.time

/datum/magic_item/greater/energysiphon/on_hit_response(var/obj/item/I, var/mob/living/carbon/human/owner, var/mob/living/carbon/human/attacker)
	if(isliving(attacker) && attacker != owner)
		attacker.stamina_add(-2)
		owner.stamina_add(2)

/datum/magic_item/greater/steamburst
	name = "energy siphon"
	description = "It's emitting steam."
	glow_color = "#6c6b67"
	var/last_used
	var/smoke_path = /obj/effect/particle_effect/smoke

/datum/magic_item/greater/steamburst/on_hit_response(var/obj/item/I, var/mob/living/carbon/human/owner, var/mob/living/carbon/human/attacker)
	if(world.time < src.last_used + 40 SECONDS)
		return
	var/list/thrownatoms = list()
	var/atom/throwtarget
	var/distfromcaster
	if(isliving(attacker) && attacker != owner)
		src.last_used = world.time
		for(var/atom/movable/AM in view(1, owner))
			thrownatoms += AM
		for(var/turf/T in oview(2, owner))
			new smoke_path(T) //smoke everywhere!

		for(var/atom/movable/AM as anything in thrownatoms)
			if(AM == owner || AM.anchored)
				continue
			throwtarget = get_edge_target_turf(owner, get_dir(owner, get_step_away(AM, owner)))
			distfromcaster = get_dist(owner, AM)

			if(distfromcaster == 0)
				if(isliving(AM))
					var/mob/living/M = AM
					M.Paralyze(10)
					to_chat(M, span_danger("You're slammed into the floor by [owner]!"))
			else
				if(isliving(AM))
					var/mob/living/M = AM
					to_chat(M, span_danger( "You're thrown back by [owner]!"))
				AM.safe_throw_at(throwtarget, 4, 2, owner, TRUE, force = MOVE_FORCE_OVERPOWERING)

/datum/magic_item/greater/strengthcrash
	name = "crashing strength"
	description = "Increase your strength at the cost of your health."
	glow_color = "#365792"
	var/active_item = FALSE

/datum/magic_item/greater/strengthcrash/on_equip(var/obj/item/i, var/mob/living/user, slot)
	. = ..()
	if(active_item)
		return
	else
		user.change_stat(STATKEY_STR, 2)
		user.change_stat(STATKEY_CON, -2)
		to_chat(user, span_notice("Your health turns into strength!"))
		active_item = TRUE

/datum/magic_item/greater/strengthcrash/on_drop(var/obj/item/i, var/mob/living/user)
	if(active_item)
		active_item = FALSE
		user.change_stat(STATKEY_STR, -2)
		user.change_stat(STATKEY_CON, 2)
		to_chat(user, span_notice("Your health returns"))

//tier 4, 1 water summon, 3 tier 3 normal path material and 2 tier 4
/datum/magic_item/mythic/lightweight //Fae + Earth
	name = "lightweight"
	description = "It feels lighter than before!"
	glow_color = "#85f88b"

/datum/magic_item/mythic/lightweight/on_apply(var/obj/item/clothing/i)
	.=..()
	if(i.armor_class == ARMOR_CLASS_MEDIUM)
		i.armor_class = ARMOR_CLASS_LIGHT
	if(i.armor_class == ARMOR_CLASS_HEAVY)
		i.armor_class = ARMOR_CLASS_MEDIUM


//Earth + Infernal
//Blank for now

/datum/magic_item/mythic/murkyveil //anti scry. Infernal + Fae
	name = "murky veil"
	description = "It offers protection from high above!"
	glow_color = "#0a0a0a"
	var/active_item = FALSE

/datum/magic_item/mythic/murkyveil/on_equip(var/obj/item/i, var/mob/living/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_HANDS)
		return
	if(active_item)
		return
	else
		active_item = TRUE
		ADD_TRAIT(user, TRAIT_ANTISCRYING, "[type]")
		to_chat(user, span_notice("I feel protected from watching eyes!"))

/datum/magic_item/mythic/murkyveil/on_drop(var/obj/item/i, var/mob/living/user)
	if(active_item)
		active_item = FALSE
		REMOVE_TRAIT(user, TRAIT_ANTISCRYING, "[type]")
		to_chat(user, span_notice("I feel mundane once more"))

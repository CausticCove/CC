/obj/effect/proc_holder/spell/targeted/touch/sizespell
	name = "Reduce/Grow Person"
	desc = "A basic trick many apprentices would use to prank their master. (( Abuse of this spell for combat purposes will lead to consequences from staff. ))" // Scene tool, shouldnt have combat applications. Maybe have it disable automatically when entering combat mode?
	clothes_req = FALSE
	spell_tier = 1
	recharge_time = 2 MINUTES
	drawmessage = "I prepare to perform a arcyne incantation."
	dropmessage = "I release my arcyne focus."
	overlay_state = "size-change"
	castdrain = 50
	chargetime = 10
	cost = 1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	hand_path = /obj/item/melee/touch_attack/sizespell

/obj/item/melee/touch_attack/sizespell
	name = "\improper magic touch"
	desc = "You recall the following incantations you've learned:\n \
	<b>Reduce</b>: Will Shrink whoever you touch.\n \
	<b>Grow</b>: Will grow whoever you touch, you may also touch yourself. (huehue, get it?)"
	catchphrase = null
	possible_item_intents = list(INTENT_HELP, INTENT_DISARM)
	icon = 'icons/mob/roguehudgrabs.dmi'
	icon_state = "pulling"
	icon_state = "grabbing_greyscale"
	color = "#ff0000" // this produces green because the icon base is yellow but someone else can fix that if they want


/obj/item/melee/touch_attack/sizespell/attack_self()
	qdel(src)

/obj/item/melee/touch_attack/sizespell/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(!proximity)
		return

	switch (user.used_intent.type)
		if(INTENT_HELP) //Reduce
			shrink_target(target, user)
		if(INTENT_DISARM) //Grow
			grow_target(target, user)

/obj/item/melee/touch_attack/sizespell/proc/shrink_target(mob/living/target, mob/living/carbon/human/user)
	if(!isliving(target))
		return
	if(HAS_TRAIT(target,TRAIT_MICRO))
		to_chat(user, "<span class='warning'>They are already small!</span>")
		return
	if(user == target)
		user.visible_message(span_notice("[user] rapidly changes in size!"), span_notice("I rapidly shrink down!"))
	else	
		user.visible_message(span_notice("[user] touch [target], and they changes in size!"), span_notice("I touch [target] and they shrink in size!"))
	target.apply_status_effect(/datum/status_effect/buff/shrinked)
	qdel(src)


/obj/item/melee/touch_attack/sizespell/proc/grow_target(mob/living/target, mob/living/carbon/human/user)
	if(!isliving(target))
		return
	if(HAS_TRAIT(target,TRAIT_MACRO))
		to_chat(user, "<span class='warning'>They are already large!</span>")
		return

	if(user == target)
		user.visible_message(span_notice("[user] rapidly changes in size!"), span_notice("I rapidly grow up!"))
	else	
		user.visible_message(span_notice("[user] touch [target], and they changes in size!"), span_notice("I touch [target] and they grow in size!"))
	target.apply_status_effect(/datum/status_effect/buff/growth)
	qdel(src)

/datum/status_effect/buff/shrinked
	id = "shrink"
	alert_type = /atom/movable/screen/alert/status_effect/buff/shrinked
	effectedstats = list(STATKEY_SPD = -5, STATKEY_STR = -5, STATKEY_CON = -5, STATKEY_WIL = -5) // Probably better to not have this spell give stats, since its a scene tool, eventually.
	var/removable = FALSE

/datum/status_effect/buff/shrinked/on_apply()
	. = ..()
	var/mob/living/target = owner
	target.transform = target.transform.Scale(0.2, 0.2)
	target.transform = target.transform.Translate(0, (0.25 * 8))
	target.update_transform()
	ADD_TRAIT(target, TRAIT_MICRO, MAGIC_TRAIT)
	spawn(300) //is that how it work? i remember there being a better wait timer but i forgor
		if(owner && istype(owner, /mob/living))
			to_chat(owner, span_userdanger("<span class='big'>You feel like you might be able to return to your size by pressing on the status effect!</span>"))
			removable = TRUE

/datum/status_effect/buff/shrinked/on_remove()
	var/mob/living/target = owner
	target.transform = target.transform.Translate(0, -(0.25 * 8))
	target.transform = target.transform.Scale(5, 5)
	target.update_transform()
	target.pass_flags = 0
	REMOVE_TRAIT(target, TRAIT_MICRO, MAGIC_TRAIT)
	. = ..()

/atom/movable/screen/alert/status_effect/buff/shrinked
	name = "Shrinked"
	desc = "I've been shrunk! (After 30 seconds, you can press this button to return to your original size.)"
	icon_state = "debuff"

/atom/movable/screen/alert/status_effect/buff/shrinked/Click()
	. = ..()
	var/mob/living/L = usr
	if(!istype(L)) // how though
		return
	var/datum/status_effect/buff/shrinked/effect = L.has_status_effect(/datum/status_effect/buff/shrinked)
	if(!effect.removable)
		to_chat(L, span_userdanger("<span class='warning'>I can't turn back yet!</span>"))
		return
	L.remove_status_effect(/datum/status_effect/buff/shrinked)


/datum/status_effect/buff/growth
	id = "growth"
	alert_type = /atom/movable/screen/alert/status_effect/buff/growth
	effectedstats = list(STATKEY_SPD = -4, STATKEY_STR = 1, STATKEY_CON = 1) // Slightly lower than being actually macro, like before. Probably better to not have this spell give stats, since its a scene tool, eventually.
	var/removable = FALSE

/datum/status_effect/buff/growth/on_apply()
	. = ..()
	var/mob/living/target = owner
	target.transform = target.transform.Scale(2, 2)
	target.transform = target.transform.Translate(0, (0.25 * 35))
	target.update_transform()
	ADD_TRAIT(target, TRAIT_MACRO, MAGIC_TRAIT)
	spawn(300) //is that how it work? i remember there being a better wait timer but i forgor, so i'm using this one
		if(owner && istype(owner, /mob/living))
			to_chat(owner, span_userdanger("<span class='big'>You feel like you might be able to return to your size now by pressing on the status effect!</span>"))
			removable = TRUE

/datum/status_effect/buff/growth/on_remove()
	var/mob/living/target = owner
	target.transform = target.transform.Translate(0, -(0.25 * 35))
	target.transform = target.transform.Scale(0.5, 0.5)
	target.update_transform()
	REMOVE_TRAIT(target, TRAIT_MACRO, MAGIC_TRAIT)
	. = ..()

/atom/movable/screen/alert/status_effect/buff/growth
	name = "Growth"
	desc = "I've became bigger! (After 30 seconds, you can press this button to return to your original size.)"
	icon_state = "debuff"

/atom/movable/screen/alert/status_effect/buff/growth/Click()
	. = ..()
	var/mob/living/L = usr
	if(!istype(L)) // how though
		return
	var/datum/status_effect/buff/growth/effect = L.has_status_effect(/datum/status_effect/buff/growth)
	if(!effect.removable)
		to_chat(L, span_userdanger("<span class='warning'>I can't turn back yet!</span>"))
		return
	L.remove_status_effect(/datum/status_effect/buff/growth)

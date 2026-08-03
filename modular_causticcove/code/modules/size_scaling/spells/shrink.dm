/datum/action/cooldown/spell/touch/sizespell
	name = "Reduce/Grow Person"
	desc = "A basic trick many apprentices would use to prank their master. (( Abuse of this spell for combat purposes will lead to consequences from staff. ))" // Scene tool, shouldnt have combat applications. Maybe have it disable automatically when entering combat mode?

	draw_message = span_notice("I prepare to perform a minor arcyne incantation.")
	drop_message = span_notice("I release my minor arcyne focus.")

	primary_resource_type = SPELL_COST_STAMINA
	primary_resource_cost = SPELLCOST_CANTRIP

	associated_skill = /datum/skill/magic/arcane
	spell_tier = 1
	spell_impact_intensity = SPELL_IMPACT_NONE

	point_cost = 1

	hand_path = /obj/item/melee/new_touch_attack/sizespell
	can_cast_on_self = TRUE

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN | SPELL_REQUIRES_SAME_Z

	cooldown_time = 2 MINUTES

/datum/action/cooldown/spell/touch/sizespell/cast_on_hand_hit(obj/item/melee/new_touch_attack/hand, atom/victim, mob/living/carbon/caster, list/modifiers)
	var/obj/item/melee/new_touch_attack/sizespell/sizehand = hand
	if(!istype(sizehand) || !isliving(victim))
		return FALSE

	var/mob/living/victim_live = victim
	if(sizehand.target_scale == victim_live.size_multiplier)
		return FALSE
	if(sizehand.target_scale < victim_live.size_multiplier) //Reduce
		shrink_target(victim, caster)
	else //Grow
		grow_target(victim, caster)

	var/datum/status_effect/buff/sizechanged/size_status = victim_live.apply_status_effect(/datum/status_effect/buff/sizechanged)
	if(istype(size_status))
		size_status.original_scale = victim_live.size_multiplier

	victim_live.resize(sizehand.target_scale)

	return TRUE

/datum/action/cooldown/spell/touch/sizespell/proc/shrink_target(mob/living/target, mob/living/carbon/human/user)
	if(user == target)
		user.visible_message(span_notice("[user] rapidly changes in size!"), span_notice("I rapidly shrink down!"))
	else
		user.visible_message(span_notice("[user] touch [target], and they changes in size!"), span_notice("I touch [target] and they shrink in size!"))

/datum/action/cooldown/spell/touch/sizespell/proc/grow_target(mob/living/target, mob/living/carbon/human/user)
	if(user == target)
		user.visible_message(span_notice("[user] rapidly changes in size!"), span_notice("I rapidly grow bigger!"))
	else
		user.visible_message(span_notice("[user] touch [target], and they changes in size!"), span_notice("I touch [target] and they grow in size!"))


/obj/item/melee/new_touch_attack/sizespell
	name = "\improper magic touch"
	desc = "Size altering magics remain ready to unleash in your palm.\n \
	Focus (click) on it to adjust the desired target scale!"
	possible_item_intents = list(INTENT_HELP)
	icon = 'icons/mob/roguehudgrabs.dmi'
	icon_state = "grabbing_greyscale"
	color = "#33ff00" // this produces green because the icon base is yellow but someone else can fix that if they want
	var/target_scale = 1
	var/cast_range = 1

/obj/item/melee/new_touch_attack/sizespell/attack_self(mob/user)
	var/new_target_scale = tgui_input_number(user, "What desired size scale? (Between [RESIZE_MINIMUM * 100] and [RESIZE_MAXIMUM * 100], 100 is normal)", "Target Size", (RESIZE_STANDARD * 100), (RESIZE_MAXIMUM * 100), (RESIZE_MINIMUM * 100), round_value = FALSE)
	if(new_target_scale)
		if(new_target_scale < (RESIZE_MINIMUM * 100) || new_target_scale > (RESIZE_MAXIMUM * 100))
			to_chat(user, "<font color='red'>Value must be between [RESIZE_MINIMUM * 100] and [RESIZE_MAXIMUM * 100].</font>")
			return
		target_scale = (new_target_scale / 100)

/obj/item/melee/new_touch_attack/sizespell/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(!proximity && get_dist(user, target) > cast_range)
		return
	var/datum/action/cooldown/spell/touch/sizespell/spell = spell_which_made_us?.resolve()
	if(spell)
		spell.do_hand_hit(src, target, user)

/datum/status_effect/buff/sizechanged
	var/removable = FALSE
	id = "sizechanged"
	alert_type = /atom/movable/screen/alert/status_effect/buff/sizechanged
	var/original_scale = 1

/datum/status_effect/buff/sizechanged/on_apply()
	. = ..()
	//var/mob/living/target = owner
	spawn(300) //is that how it work? i remember there being a better wait timer but i forgor
		if(owner && istype(owner, /mob/living))
			to_chat(owner, span_userdanger("<span class='big'>You feel like you might be able to return to your size by pressing on the status effect!</span>"))
			removable = TRUE

/datum/status_effect/buff/sizechanged/on_remove()
	var/mob/living/target = owner
	target.resize(original_scale)
	. = ..()

/atom/movable/screen/alert/status_effect/buff/sizechanged
	name = "Size Altered"
	desc = "I'm not my normal size! (After 30 seconds, you can press this button to return to your original size.)"
	icon_state = "debuff"

/atom/movable/screen/alert/status_effect/buff/sizechanged/Click()
	. = ..()
	var/mob/living/L = usr
	if(!istype(L)) // how though
		return
	var/datum/status_effect/buff/sizechanged/effect = L.has_status_effect(/datum/status_effect/buff/sizechanged)
	if(!effect.removable)
		to_chat(L, span_userdanger("<span class='warning'>I can't turn back yet!</span>"))
		return
	L.remove_status_effect(/datum/status_effect/buff/sizechanged)

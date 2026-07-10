/datum/action/cooldown/spell/augment_buff
	button_icon = 'icons/mob/actions/mage_augmentation.dmi'
	sound = 'sound/magic/haste.ogg'
	spell_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW
	attunement_school = ASPECT_NAME_AUGMENTATION

	click_to_activate = TRUE
	cast_range = SPELL_RANGE_GROUND
	self_cast_possible = TRUE

	primary_resource_type = SPELL_COST_STAMINA
	primary_resource_cost = SPELLCOST_STAT_BUFF

	invocation_type = INVOCATION_WHISPER

	charge_required = TRUE
	charge_time = CHARGETIME_MINOR
	hold_drain = 0
	charge_slowdown = CHARGING_SLOWDOWN_SMALL
	charge_sound = 'sound/magic/charging.ogg'
	cooldown_time = 90 SECONDS

	associated_skill = /datum/skill/magic/arcane
	spell_tier = 2
	spell_impact_intensity = SPELL_IMPACT_NONE

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN | SPELL_REQUIRES_SAME_Z

	var/fellowship_snap = FALSE

	/// Cooldown multiplier applied when the buff is cast on the caster instead of a fellow. 1 = no penalty.
	/// Augmentations are meant to be shared - set this above 1 to make hoarding a buff for yourself cost extra downtime.
	var/self_cast_cooldown_multiplier = 1
	var/other_cast_cooldown_reduction = 0.25
	/// TRUE only while resolving a self-targeted cast, so the cooldown hook knows to apply the penalty.
	var/tmp/empowering_self = FALSE

/datum/action/cooldown/spell/augment_buff/before_cast(atom/cast_on)
	empowering_self = (cast_on == owner)
	return ..()

/datum/action/cooldown/spell/augment_buff/after_cast(atom/cast_on)
	. = ..()
	empowering_self = FALSE

/datum/action/cooldown/spell/augment_buff/get_adjusted_cooldown()
	var/original_cooldown = cooldown_time
	if(!empowering_self && other_cast_cooldown_reduction)
		cooldown_time = original_cooldown * (1 - other_cast_cooldown_reduction)
	. = ..()
	cooldown_time = original_cooldown
	if(empowering_self && self_cast_cooldown_multiplier != 1)
		. *= self_cast_cooldown_multiplier

/datum/action/cooldown/spell/augment_buff/toggle_alt_mode(mob/user)
	fellowship_snap = !fellowship_snap
	if(fellowship_snap)
		to_chat(user, span_notice("[name]: Fellowship Mode enabled - an off-target cast snaps to your nearest fellowship member in range."))
	else
		to_chat(user, span_notice("[name]: Fellowship Mode disabled."))
	update_snap_maptext()
	return TRUE

/datum/action/cooldown/spell/augment_buff/InterceptClickOn(mob/living/clicker, list/modifiers, atom/click_target)
	if(!fellowship_snap)
		return ..()
	if(istext(modifiers))
		modifiers = params2list(modifiers)
	if(click_target == clicker)
		return ..(clicker, modifiers, click_target)
	if(isliving(click_target) && shares_fellowship(clicker, click_target))
		return ..(clicker, modifiers, click_target)
	var/mob/living/snapped = get_snap_target(clicker)
	if(snapped)
		return ..(clicker, modifiers, snapped)
	clicker.balloon_alert(clicker, "no fellow in range!")
	return ..(clicker, modifiers, click_target)

/datum/action/cooldown/spell/augment_buff/proc/get_snap_target(mob/living/clicker)
	if(!clicker.current_fellowship)
		return null
	var/mob/living/nearest
	var/nearest_dist = INFINITY
	for(var/mob/living/candidate in view(cast_range, clicker))
		if(candidate == clicker)
			continue
		if(candidate.stat == DEAD)
			continue
		if(!candidate.mind)
			continue
		if(!shares_fellowship(clicker, candidate))
			continue
		var/dist = get_dist(clicker, candidate)
		if(dist < nearest_dist)
			nearest_dist = dist
			nearest = candidate
	return nearest

/datum/action/cooldown/spell/augment_buff/proc/update_snap_maptext()
	for(var/datum/hud/hud as anything in viewers)
		var/atom/movable/screen/movable/action_button/B = viewers[hud]
		var/atom/movable/screen/arc_maptext_holder/holder
		for(var/atom/movable/screen/arc_maptext_holder/existing in B.vis_contents)
			holder = existing
			break
		if(!holder)
			holder = new(B)
			B.vis_contents.Add(holder)
		if(fellowship_snap)
			holder.color = "#66ff66"
		else
			holder.maptext = null

/datum/action/cooldown/spell/augment_buff/get_spell_statistics(mob/living/user)
	var/list/stats = ..()
	stats += span_info("Fellowship Mode (toggle with Shift+G): an off-target cast snaps the buff to your nearest fellowship member in range.")
	if(other_cast_cooldown_reduction)
		stats += span_info("Casting this on someone other than yourself cuts [round(other_cast_cooldown_reduction * 100)]% off the cooldown (before stat scaling).")
	if(self_cast_cooldown_multiplier != 1)
		stats += span_info("Casting this on yourself instead of a fellow costs [self_cast_cooldown_multiplier]x the cooldown.")
	return stats

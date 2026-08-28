/datum/action/cooldown/spell/bonemend
	name = "Bone Mend"
	desc = "Mend the chosen target's bones with a burst of necrotic magick. Requires a moment to channel and only works at short-range. Only heals undead, but provides a small regen for 10 seconds." //Caustic Edit - Slight tweak to account for the changes.
	background_icon = 'icons/mob/actions/zizomiracles.dmi'
	button_icon = 'icons/mob/actions/zizomiracles.dmi'
	button_icon_state = "bonemend"
	spell_color = GLOW_COLOR_ZIZO

	cast_range = 2
	sound = 'sound/magic/whiteflame.ogg'
	charge_required = TRUE
	charge_time = 5 SECONDS
	primary_resource_cost = SPELLCOST_MAJOR_PROJECTILE //Caustic Edit - Change the cost to use the constants instead. Was previously hardcoded at 50.
	primary_resource_type = SPELL_COST_STAMINA
	cooldown_time = 30 SECONDS
	associated_skill = /datum/skill/magic/arcane
	zizo_spell = TRUE
	spell_requirements = SPELL_REQUIRES_SAME_Z

/datum/action/cooldown/spell/bonemend/is_valid_target(atom/cast_on)
	return isliving(cast_on)

/datum/action/cooldown/spell/bonemend/cast(atom/cast_on)
	. = ..()
	var/mob/living/target = cast_on
	if(target.mob_biotypes & MOB_UNDEAD)
		//Caustic Edit - Lets make Bone Mend a regen, and Bone Chill remains the same as it was targetted!
		target.apply_status_effect(/datum/status_effect/buff/healing, 2.5)
		target.update_damage_overlays()
		//Caustic Edit End
		target.visible_message(span_danger("[target] reforms under the vile energy!"), span_notice("I'm remade by dark magic!"))
	return TRUE

//Caustic Edit - Reworking this entirely with Dhael's Changes, and making it use the Summon Framework. This is likely going to be fully different from upstream.
/datum/action/cooldown/spell/conjure_summon/raise_undead_guard
	name = "Conjure Undead"
	desc = "Invoke forbidden magicka to summon a mindless, shambling skeleton.\nMindless skeletons can be given orders to guard, patrol, and attack by their summoner.\nThese skeletons are weaker than their more complex-jointed counterparts." //Caustic Edit

	button_icon = 'icons/mob/actions/zizomiracles.dmi'
	button_icon_state = "skeleton"
	spell_color = GLOW_COLOR_ZIZO

	primary_resource_type = SPELL_COST_STAMINA
	primary_resource_cost = SPELLCOST_CONJURE //Caustic Edit - Lets actually use the defines?

	charge_required = TRUE
	weapon_cast_penalized = FALSE
	charge_time = 2 SECONDS //Caustic Edit - From 6 to 3
	charge_slowdown = CHARGING_SLOWDOWN_SMALL
	sound = 'sound/magic/magnet.ogg'
	cooldown_time = 20 SECONDS //Caustic Edit - From 1 MINUTES to 20 SECONDS
	cast_range = SPELL_RANGE_GROUND

	associated_skill = /datum/skill/magic/arcane
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN

	summon_noun = "skeleton"
	max_summons = 25
	summons_per_cast = 1
	summon_replace_mode = CONJURE_SUMMON_SINGLES

	recoil_energy_floor = 500
	recoil_severity = CONJURE_RECOIL_LIGHT //Caustic Edit - Lets not do this.
	reclaim_recoil = FALSE //Caustic Edit - Lets not do this.
	leash_dist = 36 //Caustic Edit - Add in the adjusting of the leash distance!
	is_phantasmal = FALSE //Caustic Edit - Disable the Phantasmal Glow!

	zizo_spell = TRUE
	invocations = list("Convoca spectres custodes!")
	invocation_type = INVOCATION_SHOUT

/datum/action/cooldown/spell/conjure_summon/raise_undead_guard/spawn_summon(turf/T, mob/living/user)
	. = ..()

	if(istype(get_area(owner), /area/rogue/indoors/ravoxarena))
		to_chat(owner, span_userdanger("I reach for outer help, but something rebukes me! This challenge is only for me to overcome!"))
		reset_spell_cooldown()
		return FALSE

	if(!isopenturf(T))
		to_chat(owner, span_warning("The targeted location is blocked. My summon fails to come forth."))
		return FALSE

	//new /obj/effect/temp_visual/gib_animation(T, "gibbed-h")
	new /obj/effect/temp_visual/bluespace_fissure(T)
	var/mob/living/carbon/human/species/skeleton/necro_summon/skeleton = new /mob/living/carbon/human/species/skeleton/necro_summon(T, owner)
	skeleton.summoner_ref = WEAKREF(user)
	skeleton.arcane_scale = clamp(user.get_skill_level(associated_skill), 1, 6)
	skeleton.gear_tier = get_summon_tier(user)

	return skeleton

/datum/action/cooldown/spell/conjure_summon/raise_undead_guard/cast(atom/cast_on)
	. = ..()
	if(!.)
		return FALSE
	return TRUE

/datum/action/cooldown/spell/conjure_summon/raise_undead_guard/dismiss_summons(list/mobs)
	for(var/mob/living/M in mobs)
		dismiss_zizo_skeleton(M)

/datum/action/cooldown/spell/conjure_summon/raise_undead_guard/proc/add_skeleton_faction(mob/living/skeleton, caster_name)
	if(!QDELETED(skeleton))
		skeleton.faction = list("cabal", "[caster_name]_faction")

/datum/action/cooldown/spell/conjure_summon/raise_undead_guard/necromancer
	//Caustic Edit - Adjust the Necromancer Version to be lesser then the base, the base is now given to Lich!
	charge_time = 4 SECONDS
	cooldown_time = 30 SECONDS
	max_summons = 10
	leash_dist = 24
	//Caustic Edit End
	//spawn_lifespan = 45 MINUTES //Longer cooldown, therefore, technically less total than before -> more player skeles will fill in for this. //Caustic Edit - What is this talking about? Is this using the wrong var?

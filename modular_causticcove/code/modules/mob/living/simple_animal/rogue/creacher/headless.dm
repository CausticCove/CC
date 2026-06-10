//CC Modified Headless mob, with a rework of its "Vore" properties and instead taking a huge focus on its "Headless" name.
// Instead of outright voring people and RRing them instantly, it will instead primarily and only attack the heads of its targets.
// If the target's head becomes exposed, it will have a chance to knock people out with a higher likelihood, and if they happen to go prone
// they will instead resort to a full execution attack, curbstomping the target's head and instantly critting their head and killing them.
// They are not RR'd and the head remains intact, and it is easily understood what a Headless is after the first encounter.

//It will have multiple abilities, "Knockout", which attempts to knock a target out, and "Head Stomp", which attempts to stomp someones head with incredible damage.
//It will also sport another ability, "Rend", which gives it a quick 2-slash attack as long as the target stays next to them.
/mob/living/simple_animal/hostile/retaliate/rogue/headless
	icon = 'icons/roguetown/mob/monster/lamia.dmi'
	name = "headless"
	desc = "A horrible beast of brutal strength. Its two pronged arms twitch eagarly to slash at anything around it, with large hooves ready to crush your head."
	icon_state = "headless"
	icon_living = "headless"
	icon_dead = "headless_dead"
	gender = NEUTER
	emote_hear = null
	emote_see = null
	speak_chance = 1
	see_in_dark = 9
	move_to_delay = 3
	base_intents = list(/datum/intent/simple/bite/headless, /datum/intent/simple/claw/headless)
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 1,
						/obj/item/reagent_containers/food/snacks/fat = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 1,
						/obj/item/reagent_containers/food/snacks/fat = 2,
						/obj/item/alch/sinew = 2,
						/obj/item/alch/bone = 1)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 2,
						/obj/item/reagent_containers/food/snacks/fat = 2,
						/obj/item/alch/sinew = 2,
						/obj/item/alch/bone = 1)
	faction = list(FACTION_ORCS)
	mob_biotypes = MOB_ORGANIC|MOB_BEAST|MOB_REPTILE
	health = 500
	maxHealth = 500
	melee_damage_lower = 25
	melee_damage_upper = 35
	vision_range = 9
	aggro_vision_range = 9
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 0
	minimum_distance = 0
	food_type = list()
	footstep_type = null
	pooptype = null
	STAPER = 14
	STACON = 16
	STAWIL = 18
	STASTR = 20 //Strong as fuck boi. Used to contest stomps.
	STASPD = 6
	deaggroprob = 0
	defprob = 30
	del_on_deaggro = 999 SECONDS
	retreat_health = 0.1
	food = 0
	dodgetime = 15
	aggressive = 1
	remains_type = null

	ai_controller = /datum/ai_controller/headless
	AIStatus = AI_OFF
	can_have_ai = FALSE

//Temp Visual for the Headless' knockout ability
/obj/effect/temp_visual/knockout_warning
	randomdir = FALSE
	icon = 'icons/effects/effects.dmi'
	icon_state = "mobwarning"
	layer = HUD_LAYER
	plane = ABOVE_LIGHTING_PLANE
	duration = 1 SECONDS // Lasts only a second.

//Temp Visual for the Headless' rend ability
/obj/effect/temp_visual/rend_warning
	randomdir = FALSE
	icon = 'icons/effects/effects.dmi'
	icon_state = "claw" //Funny claw
	layer = HUD_LAYER
	plane = ABOVE_LIGHTING_PLANE
	duration = 0.6 SECONDS // Lasts for the entire duration of the ability including each smaller strike afterwards.

/datum/intent/simple/bite/headless
	penfactor = PEN_MEDIUM

/datum/intent/simple/claw/headless
	penfactor = PEN_HEAVY

/mob/living/simple_animal/hostile/retaliate/rogue/headless/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_aggro_system)
	AddElement(/datum/element/ai_flee_while_injured, 0.75, retreat_health)


/mob/living/simple_animal/hostile/retaliate/rogue/headless/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "torso"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "torso"
		if(BODY_ZONE_PRECISE_NOSE)
			return "torso"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "belly"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "claw"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "claw"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "foot"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "foot"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "torso"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "arm"
		if(BODY_ZONE_L_ARM)
			return "arm"
	return ..()

/obj/item/rogueweapon/woodstaff/implement/special
	desc = "A mage's scepter woven with the arcane esscenses of magical beasts."
	icon = 'modular_causticcove/icons/obj/staffs.dmi'
	icon_state = "opalstaff"
	implement_tier = IMPLEMENT_TIER_LESSER
	implement_refund = IMPLEMENT_REFUND_LESSER
	force_wielded = 22
	max_integrity = 250

/obj/item/rogueweapon/woodstaff/implement/special/fae
	base_implement_name = "staff of exchange"
	name = "staff of exchange"
	icon_state = "faestaff"
	specialcaster_effect = 1
	special = /datum/special_intent/polearm_backstep/fae

/obj/item/rogueweapon/woodstaff/implement/special/infernal
	base_implement_name = "inferno staff"
	name = "inferno staff"
	icon_state = "infernalstaff"
	specialcaster_effect = 2
	special = /datum/special_intent/infernal_staff_erruption

/obj/item/rogueweapon/woodstaff/implement/special/earth
	base_implement_name = "mountain staff"
	name = "mountain staff"
	icon_state = "earthstaff"
	specialcaster_effect = 3
	special = /datum/special_intent/mountain_staff_slam

//related buffs
//fae
/datum/status_effect/buff/faebargain_mage
	id = "faebargain_good"
	alert_type = /atom/movable/screen/alert/status_effect/buff/faebargain_mage
	effectedstats = list(STATKEY_SPD = 1, STATKEY_LCK = 3)
	duration = 7 SECONDS

/atom/movable/screen/alert/status_effect/buff/faebargain_mage
	name = "Fae Bargain"
	desc = "The fae gift me speed and luck."
	icon_state = "buff"

/datum/status_effect/debuff/faebargain_mage
	id = "faebargain_ill"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/faebargain_mage
	effectedstats = list(STATKEY_STR = -2, STATKEY_CON = -2)
	duration = 7 SECONDS

/atom/movable/screen/alert/status_effect/debuff/faebargain_mage
	name = "Fae Bargin"
	desc = "My strength and health have been traded to the fae"
	icon_state = "debuff"

//infernal
/atom/movable/screen/alert/status_effect/buff/infernal_ward
	name = "Infernal Flames"
	desc = "Infernal flames circle me, lashing out at those who strike me."
	icon_state = "buff"

/datum/status_effect/buff/infernal_ward
	id = "infernal_ward"
	duration = 5 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/buff/infernal_ward
	var/orbs = 6
	var/list/orb_visuals
	var/last_struck_time = 0

/datum/status_effect/buff/infernal_ward/on_creation(mob/living/new_owner, count = 6)
	orbs = count
	return ..()

/datum/status_effect/buff/infernal_ward/on_apply()
	. = ..()
	if(!.)
		return FALSE
	orb_visuals = list()
	RegisterSignals(owner, list(COMSIG_MOB_ITEM_BEING_ATTACKED, COMSIG_MOB_ATTACKED_BY_HAND, COMSIG_ATOM_BULLET_ACT, COMSIG_ATOM_HITBY, COMSIG_ATOM_WAS_ATTACKED), PROC_REF(on_struck))
	for(var/i in 1 to orbs)
		var/obj/effect/gilded_ward_orb/orb = new()
		orb_visuals += orb
		owner.vis_contents += orb
		spin_orb(orb, (i - 1) * (360 / orbs))
	owner.balloon_alert_to_viewers("wreathed in infernal flame!")
	return TRUE

/datum/status_effect/buff/infernal_ward/proc/spin_orb(obj/effect/gilded_ward_orb/orb, phase)
	var/radius = 16
	var/segments = 12
	var/seg_time = 2.2
	orb.pixel_x = round(radius * cos(phase))
	orb.pixel_y = round(radius * sin(phase))
	for(var/s in 1 to segments)
		var/a = phase + (s * (360 / segments))
		if(s == 1)
			animate(orb, pixel_x = round(radius * cos(a)), pixel_y = round(radius * sin(a)), time = seg_time, loop = -1, flags = ANIMATION_PARALLEL)
		else
			animate(pixel_x = round(radius * cos(a)), pixel_y = round(radius * sin(a)), time = seg_time)

/datum/status_effect/buff/infernal_ward/proc/on_struck(datum/source, mob/living/struck, mob/living/attacker, obj/item/weapon)
	SIGNAL_HANDLER
	if(world.time == last_struck_time)
		return
	if(!attacker || attacker == owner)
		return
	if(attacker.has_status_effect(/datum/status_effect/buff/gilded_ward) || attacker.has_status_effect(/datum/status_effect/buff/dragonhide/astrata || attacker.has_status_effect(/datum/status_effect/buff/infernal_ward)))
		return
	last_struck_time = world.time
	retaliate(attacker)

/datum/status_effect/buff/infernal_ward/proc/retaliate(mob/living/attacker)
	if(orbs <= 0)
		return
	attacker.adjust_fire_stacks(2)
	attacker.ignite_mob()
	attacker.visible_message(span_danger("[attacker] is scorched by the infernal flames surrounding [owner]!"))
	owner.remove_status_effect(/datum/status_effect/buff/infernal_ward)

/datum/status_effect/buff/infernal_ward/on_remove()
	UnregisterSignal(owner, list(COMSIG_MOB_ITEM_BEING_ATTACKED, COMSIG_MOB_ATTACKED_BY_HAND, COMSIG_ATOM_BULLET_ACT, COMSIG_ATOM_HITBY, COMSIG_ATOM_WAS_ATTACKED))
	for(var/obj/effect/orb in orb_visuals)
		if(owner)
			owner.vis_contents -= orb
		if(!QDELETED(orb))
			qdel(orb)
	orb_visuals = null
	return ..()

//special attacks
#define INFERNALSTAFF1 0.8 SECONDS
#define INFERNALSTAFF2 1.4 SECONDS
#define INFERNALSTAFF3 2 SECONDS
/datum/special_intent/infernal_staff_erruption
	name = "Infernal Erruption"
	desc = "Fire errupts in a spot you chose several times over."
	tile_coordinates = list(
		list(0,0), list(0,-2), list(-2,-3), list(0,1), list(2,-3),
		list(1,0, INFERNALSTAFF1), list(-1,-2, INFERNALSTAFF1), list(1,1, INFERNALSTAFF1), list(-1,1, INFERNALSTAFF1), list(2,-2, INFERNALSTAFF1), list(-1,-2, INFERNALSTAFF1),
		list(1,-1, INFERNALSTAFF2), list(-1,-1, INFERNALSTAFF2), list(1,-2, INFERNALSTAFF2), list(-1,-2, INFERNALSTAFF2), list(2,1, INFERNALSTAFF2), list(-1,1, INFERNALSTAFF2),
		list(1,-2, INFERNALSTAFF3), list(-1,0, INFERNALSTAFF3), list(-2, -1, INFERNALSTAFF3), list(2, -1, INFERNALSTAFF3)

	)
	use_clickloc = TRUE
	range = 7
	respect_adjacency = TRUE
	respect_dir = TRUE
	delay = 0.7 SECONDS
	fade_delay = 0.5 SECONDS
	_icon = 'icons/effects/fire.dmi'
	pre_icon = 'icons/effects/telegraph.dmi'
	pre_icon_state = "warning"
	post_icon_state = "3"
	sfx_pre_delay = 'sound/combat/wooshes/bladed/wooshlarge (1).ogg'
	sfx_post_delay = 'sound/combat/sidesweep_hit.ogg'
	cooldown = 120 SECONDS
	stamcost = 35

/datum/special_intent/infernal_staff_erruption/apply_hit(turf/T)
	for(var/mob/living/L in get_hearers_in_view(0, T))
		if(L != howner)

			if(L.mobility_flags & MOBILITY_STAND)
				L.adjust_fire_stacks(3)
				L.ignite_mob()
	..()

#undef INFERNALSTAFF1
#undef INFERNALSTAFF2
#undef INFERNALSTAFF3

#define MTSTAFF1 1 SECONDS
#define MTSTAFF2 1.4 SECONDS
#define MTSTAFF3 1.8 SECONDS
#define MTSTAFF4 2.2 SECONDS

/datum/special_intent/mountain_staff_slam
	name = "Landslide"
	desc = "Creates waves of earth."
	tile_coordinates = list(
		list(0,0), list(1,0), list(2,0), list(-1,0), list(-2,0),
		list(0,1, MTSTAFF1), list(1,1, MTSTAFF1), list(2,1, MTSTAFF1), list(-1,1, MTSTAFF1), list(-2,1, MTSTAFF1),
		list(0,2, MTSTAFF2), list(1,2, MTSTAFF2), list(2,2, MTSTAFF2), list(-1,2, MTSTAFF2), list(-2,2, MTSTAFF2),
		list(0,3, MTSTAFF3), list(1,3, MTSTAFF3), list(2,3, MTSTAFF3), list(-1,3, MTSTAFF3), list(-2,3, MTSTAFF3),
		list(0,4, MTSTAFF4), list(1,4, MTSTAFF4), list(2,4, MTSTAFF4), list(-1,4, MTSTAFF4), list(-2,4, MTSTAFF4),

	)
	use_clickloc = FALSE
	respect_adjacency = TRUE
	respect_dir = TRUE
	delay = 0.7 SECONDS
	fade_delay = 0.5 SECONDS
	pre_icon = 'icons/effects/telegraph.dmi'
	pre_icon_state = "warning"
	post_icon_state = "kick_fx"
	sfx_pre_delay = 'sound/combat/wooshes/bladed/wooshlarge (1).ogg'
	sfx_post_delay = 'sound/combat/sidesweep_hit.ogg'
	cooldown = 120 SECONDS
	stamcost = 35

#undef MTSTAFF1
#undef MTSTAFF2
#undef MTSTAFF3
#undef MTSTAFF4

/datum/special_intent/polearm_backstep/fae
	name = "Fae Backstep"
	desc = "Leap back a great deal and strike any foes that linger nearby"
	cooldown = 120 SECONDS
	stamcost = 35
	backstep_dist = 4

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
	special = /datum/special_intent/polearm_backstep

/obj/item/rogueweapon/woodstaff/implement/special/infernal
	base_implement_name = "inferno staff"
	name = "inferno staff"
	icon_state = "infernalstaff"
	specialcaster_effect = 2
	special = /datum/special_intent/whip_coil

/obj/item/rogueweapon/woodstaff/implement/special/earth
	base_implement_name = "mountain staff"
	name = "mountain staff"
	icon_state = "earthstaff"
	specialcaster_effect = 3
	special = /datum/special_intent/ground_smash

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

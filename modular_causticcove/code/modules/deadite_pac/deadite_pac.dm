/atom/movable/screen/alert/status_effect/buff/deaditepacified
	name = "Necra's Abatement"
	desc = "Necra's gaze weighs down upon me within these hallowed grounds. I am pacified."
	icon_state = "debuff"

/datum/status_effect/buff/deadite_pacified
	id = "deaditepacified"
	alert_type = /atom/movable/screen/alert/status_effect/buff/deaditepacified

/datum/status_effect/buff/deadite_pacified/process()

	.=..()
	var/area/rogue/our_area = get_area(owner)
	if(!(our_area.town_area))
		owner.remove_status_effect(/datum/status_effect/buff/deadite_pacified)

/datum/status_effect/buff/deadite_pacified/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_PACIFISM, TRAIT_GENERIC)

/datum/status_effect/buff/deadite_pacified/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_PACIFISM, TRAIT_GENERIC)
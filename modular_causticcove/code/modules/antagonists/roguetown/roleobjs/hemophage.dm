/datum/antagonist/hemophage
	name = "Hemophage"
	roundend_category = "hemophage"
	antagpanel_category = "Hemophages"
	show_name_in_check_antagonists = FALSE

/datum/antagonist/wretch/get_antag_cap_weight()
	return 0

/datum/antagonist/wretch/on_gain()
	. = ..()
	if(owner)
		owner.special_role = "Hemophage"

/datum/antagonist/wretch/on_removal()
	. = ..()
	if(owner)
		owner.special_role = null

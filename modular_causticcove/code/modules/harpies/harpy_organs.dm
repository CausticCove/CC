/obj/item/organ/vocal_cords/harpy
	name = "harpy's song"
	icon_state = "harpysong"		//Pulsating heart energy thing.
	desc = "The blessed essence of harpysong. How did you get this... you monster!"
	actions_types = list(/datum/action/item_action/organ_action/use/harpy_sing)

/obj/item/organ/vocal_cords/harpy/Initialize()
	. = ..()

/obj/item/organ/vocal_cords/harpy/Insert(mob/living/carbon/M, special = FALSE, drop_if_replaced = TRUE)
	. = ..()
	M.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)

/obj/item/organ/vocal_cords/harpy/Remove(mob/living/carbon/M, special = FALSE, drop_if_replaced = TRUE)
	. = ..()
	M.adjust_skillrank(/datum/skill/misc/music, -1, TRUE)

/datum/action/item_action/organ_action/use/harpy_sing
	name = "Harpy's song"
	desc = "Project your voice through song."
	button_icon = 'icons/obj/surgery.dmi'
	button_icon_state = "harpysong"



/datum/customizer/organ/wings/harpy
	customizer_choices = list(/datum/customizer_choice/organ/wings/harpy)
	allows_disabling = FALSE

/datum/customizer_choice/organ/wings/harpy
	name = "Wings"
	organ_type = /obj/item/organ/wings/flight/harpy
	sprite_accessories = list(
		/datum/sprite_accessory/wings/large/harpyswept,
	)

/datum/customizer/organ/tail/harpy
	customizer_choices = list(/datum/customizer_choice/organ/tail/harpy)
	allows_disabling = TRUE

/datum/customizer_choice/organ/tail/harpy
	name = "Harpy Plumage"
	organ_type = /obj/item/organ/tail
	generic_random_pick = TRUE
	allows_accessory_color_customization = TRUE
	sprite_accessories = list(
		/datum/sprite_accessory/tail/hawk,
	)

/obj/item/alch/refined_viscera
	name = "refined viscera"
	desc = "Viscera that has been grinded and processed down into its richer components."
	icon_state = "redpowder" //Im lazy heres some programmer substitute art that already existed.
	dropshrink = 0.9
	//color = "#960000" //Maaaybe no color.
	major_pot = /datum/alch_cauldron_recipe/wound_potion
	med_pot = /datum/alch_cauldron_recipe/health_potion
	minor_pot = /datum/alch_cauldron_recipe/big_health_potion

/obj/item/alch/heartblood_coagulate
	name = "heartblood coagulate"
	desc = "Heartblood hemoglobin that has been ground up into a spongey coagulate. Useful in alchemy."
	icon_state = "darkredpowder" //Im lazy heres some programmer substitute art that already existed.
	dropshrink = 0.9
	color = "#ff0000" //Brighter for Heartblood.
	major_pot = /datum/alch_cauldron_recipe/wound_potion
	med_pot = /datum/alch_cauldron_recipe/big_health_potion
	minor_pot = /datum/alch_cauldron_recipe/health_potion

/datum/alch_grind_recipe/refined_viscera
	name = "Refined Viscera"
	valid_input = /obj/item/alch/viscera
	valid_outputs = list( /obj/item/alch/refined_viscera = 1)
	bonus_chance_outputs = list(/obj/item/alch/refined_viscera = 50)

/datum/alch_grind_recipe/heartblood_coagulate
	name = "Heartblood Coagulate"
	valid_input = /obj/item/heart_blood_vial/filled
	valid_outputs = list( /obj/item/alch/heartblood_coagulate = 1, /obj/item/heart_blood_vial = 1)
	bonus_chance_outputs = list(/obj/item/alch/heartblood_coagulate = 25) //Woah! We got more blood with our blood!

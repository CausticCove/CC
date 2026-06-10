/obj/structure/fluff/statue/noc
	name = "noc statue"
	desc = "Wisdom and calm."
	icon_state = "noc"
	icon = 'modular_ratwood/icons/roguetown/misc/staues/statue_noc.dmi'

/obj/structure/fluff/statue/noc/guard
	name = "active noc statue"
	icon_state = "noc_guard"

/obj/structure/fluff/statue/eora
	name = "eora statue"
	desc = "Beauty and Charm"
	icon_state = "eora"
	icon = 'modular_ratwood/icons/roguetown/misc/staues/statue_eora.dmi'

/obj/structure/fluff/statue/zizo
	name = "dubious statue"
	desc = "Blasphemy... unless...?"
	icon_state = "zaelorian_crynsaris"
	icon = 'modular_ratwood/icons/roguetown/misc/staues/statue_zizo.dmi'
	pixel_x = -16

/obj/structure/bars/grille/rusty
	name = "rusty grille"
	desc = "A few good hits ought to smash it open."
	max_integrity = 70
	color = "#d9c8c1"

/obj/structure/bars/passage/shutter/hidden/redstone_triggered()
	if(obj_broken)
		return
	if(density)
		icon_state = "shutter1"
		density = FALSE
		opacity = FALSE
		alpha = 60
	else
		icon_state = "shutter0"
		density = TRUE
		opacity = TRUE
		alpha = 255

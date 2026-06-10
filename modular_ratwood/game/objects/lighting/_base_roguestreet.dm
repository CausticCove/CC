/obj/machinery/light/roguestreet/orange
	icon = 'modular_ratwood/icons/roguetown/misc/tallstructure.dmi'
	icon_state = "o_slamp1"
	base_state = "o_slamp"
	brightness = 10.9
	bulb_colour = "#da8c45"
	bulb_power = 1
	resistance_flags = null // This one is craftable.

/obj/machinery/light/roguestreet/orange/midlamp
	icon = 'modular_ratwood/icons/roguetown/misc/64x64.dmi'
	icon_state = "o_midlamp1"
	base_state = "o_midlamp"
	pixel_x = -16
	density = TRUE
	resistance_flags = INDESTRUCTIBLE // This item is not craftable yet, setting for anti-grief

/obj/machinery/light/roguestreet/orange/walllamp
	name = "wall lamp"
	desc = "An eerily glowing lamp attached to the wall via a caste iron frame. A promise of new technology at the dawn of a new age."
	icon_state = "o_wlamp1"
	base_state = "o_wlamp"
	brightness = 7.8
	max_integrity = 125
	density = FALSE
	resistance_flags = null // This one is craftable.

/obj/machinery/light/roguestreet/walllamp
	name = "wall lamp" // Crafted through metalizing sconce.
	desc = "An eerily glowing lamp attached to the wall via a caste iron frame. A promise of new technology at the dawn of a new age."
	icon = 'modular_ratwood/icons/roguetown/misc/tallstructure.dmi'
	icon_state = "wlamp1"
	base_state = "wlamp"
	brightness = 7.8
	max_integrity = 125
	density = FALSE

//Staircase but it's just a helper
/obj/structure/stairs/helper
	name = "Stairs Helper"
	desc = "A staircase meant to help with making a staircase on a lower, or higher, Z-level, connect to this Z-level. You shouldn't actually be seeing this however."
	icon = 'modular_causticcove/icons/obj/stairs.dmi'
	icon_state = "stairs_helper"

	//Should never be seen in-game. Ever. It just helps connects places.
	invisibility = INVISIBILITY_ABSTRACT

/obj/structure/stairs/helper/r
	dir = WEST

/obj/structure/stairs/helper/l
	dir = EAST

/obj/structure/stairs/helper/d
	dir = SOUTH

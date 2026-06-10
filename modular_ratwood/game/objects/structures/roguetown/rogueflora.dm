//A smattering of jungle-themed assets
//trees

/obj/structure/flora/roguetree/jungle//version with mechanics this time
	name = "jungle tree"
	color = "#a7b5a9"
	// desc = "Scant, precious shade."
	stump_type = /obj/structure/flora/roguetree/stump/palm
	icon = 'icons/obj/flora/jungletrees.dmi'
	icon_state = "tree"
	pixel_x = -48
	pixel_y = -20
	max_integrity = 300
	debris = list(/obj/item/grown/log/tree/stick = 2)
	static_debris = list(/obj/item/grown/log/tree = 3)

/obj/structure/flora/roguetree/jungle/Initialize(mapload)
	. = ..()
	icon_state = "tree[rand(1, 6)]"

/obj/structure/flora/roguetree/jungle/small
	pixel_y = 0
	pixel_x = -32
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	max_integrity = 200
	debris = list(/obj/item/grown/log/tree/stick = 2)
	static_debris = list(/obj/item/grown/log/tree = 2)

/obj/structure/flora/roguetree/jungle/small/Initialize(mapload)
	. = ..()
	icon_state = "tree[rand(1, 6)]"

//bushes

/obj/structure/flora/roguegrass/bush/jungle
	name = "jungle bush"
	desc = ""
	color = "#b9c4bd"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb"

/obj/structure/flora/roguegrass/bush/jungle/Initialize(mapload)
	. = ..()
	if(prob(30))
		icon_state = "busha[rand(1, 3)]"
	else if(prob(50))
		icon_state = "bushb[rand(1, 3)]"
	else
		icon_state = "bushc[rand(1, 3)]"

/obj/structure/flora/roguegrass/bush/jungle/large
	color = "#a7b5a9"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush"
	pixel_x = -16
	pixel_y = -12
	layer = ABOVE_ALL_MOB_LAYER
	opacity = TRUE
	attacked_sound = 'sound/misc/woodhit.ogg'
	max_integrity = 100
	debris = list(/obj/item/natural/fibers = 2, /obj/item/grown/log/tree/stick = 1, /obj/item/grown/log/tree/small = 1)
	static_debris = list(/obj/item/grown/log/tree = 1)

/obj/structure/flora/roguegrass/bush/jungle/large/Initialize(mapload)
	. = ..()
	icon_state = "bush[pick(1,2,3)]"

//Jungle grass

/obj/structure/flora/roguegrass/jungle
	name = "jungle grass"
	desc = ""
	color = "#a7b5a9"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa"

/obj/structure/flora/roguegrass/jungle/Initialize(mapload)
	. = ..()
	icon_state = "grassa[rand(1, 5)]"

/obj/structure/flora/roguegrass/jungle/sparse
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb"

/obj/structure/flora/roguegrass/jungle/sparse/Initialize(mapload)
	. = ..()
	icon_state = "grassb[rand(1, 5)]"

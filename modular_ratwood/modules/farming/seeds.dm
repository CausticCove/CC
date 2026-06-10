/obj/item/seeds/random
	name = "random seed"
	desc = "Haha, im in danger."

/obj/item/seeds/random/Initialize(mapload)
	var/type = pick(list(
	/obj/item/seeds/wheat,
	/obj/item/seeds/wheat/oat,
	/obj/item/seeds/rice,
	/obj/item/seeds/apple,
	/obj/item/seeds/pear,
	/obj/item/seeds/lemon,
	/obj/item/seeds/lime,
	/obj/item/seeds/tangerine,
	/obj/item/seeds/plum,
	/obj/item/seeds/strawberry,
	/obj/item/seeds/blackberry,
	/obj/item/seeds/raspberry,
	/obj/item/seeds/tomato,
	/obj/item/seeds/nut,
	/obj/item/seeds/sugarcane,
	/obj/item/seeds/pipeweed,
	/obj/item/seeds/swampweed,
	/obj/item/seeds/berryrogue,
	/obj/item/seeds/turnip,
	/obj/item/seeds/sunflower,
	/obj/item/seeds/onion,
	/obj/item/seeds/cabbage,
	/obj/item/seeds/potato,
	/obj/item/seeds/fyritius,
	/obj/item/seeds/poppy,
	/obj/item/seeds/garlick,
	/obj/item/seeds/coffee,
	/obj/item/seeds/tea,
	/obj/item/seeds/pumpkin,
	/obj/item/seeds/carrot,
	/obj/item/seeds/eggplant,))

	var/obj/item/seeds/boi = new type
	boi.forceMove(get_turf(src))
	boi.pixel_x += rand(-3,3)
	. = ..()

	return INITIALIZE_HINT_QDEL

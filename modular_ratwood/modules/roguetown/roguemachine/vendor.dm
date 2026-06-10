/obj/structure/roguemachine/vendor/innrockhill
	keycontrol = "tavern"

/obj/structure/roguemachine/vendor/innrockhill/Initialize(mapload)
	. = ..()

	// Add room keys with a price of 20
	for (var/X in list(/obj/item/roguekey/roomi, /obj/item/roguekey/roomii, /obj/item/roguekey/roomiii, /obj/item/roguekey/roomiv, /obj/item/roguekey/roomv, /obj/item/roguekey/roomvi, /obj/item/roguekey/roomvii, /obj/item/roguekey/roomviii, /obj/item/roguekey/roomix, /obj/item/roguekey/roomx))
		var/obj/P = new X(src)
		held_items[P] = list()
		held_items[P]["NAME"] = P.name
		held_items[P]["PRICE"] = 20

	// Add fancy keys with a price of 100
	for (var/Y in list(/obj/item/storage/keyring/innfancyi, /obj/item/storage/keyring/innfancyii, /obj/item/storage/keyring/innfancyiii))
		var/obj/Q = new Y(src)
		held_items[Q] = list()
		held_items[Q]["NAME"] = Q.name
		held_items[Q]["PRICE"] = 100

	update_icon()

/obj/item/roguekey/roomvii
	name = "room VII key"
	desc = "The key to the seventh room."
	icon_state = "brownkey"
	lockid = "roomvii"

/obj/item/roguekey/roomviii
	name = "room VIII key"
	desc = "The key to the eigth room."
	icon_state = "brownkey"
	lockid = "roomviii"

/obj/item/roguekey/roomix
	name = "room IX key"
	desc = "The key to the ninth room."
	icon_state = "brownkey"
	lockid = "roomix"

/obj/item/roguekey/roomx
	name = "room X key"
	desc = "The key to the tenth room."
	icon_state = "brownkey"
	lockid = "roomx"

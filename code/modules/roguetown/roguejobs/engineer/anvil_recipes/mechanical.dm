/datum/anvil_recipe/engineering
	i_type = "Engineering"
	appro_skill = /datum/skill/craft/engineering
	craftdiff = 1

// --------- IRON RECIPES -----------

/datum/anvil_recipe/engineering/jingle_bells
	name = "Jingling Bells"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/jingle_bells
	createditem_num = 5
	craftdiff = 1

/datum/anvil_recipe/engineering/flint
	name = "Flint (x3) (+1 stone)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/stone)
	created_item = /obj/item/flint
	createditem_num = 4
	craftdiff = 0


/datum/anvil_recipe/engineering/chains
	name = "Chains"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rope/chain
	createditem_num = 1
	craftdiff = 0
	
// ------------ GUNS (Ported from Ratwood) ----------------
/datum/anvil_recipe/engineering/arquebus
	name = "Arquebus (+1 bronze, +1 cog, +1 wood)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/grown/log/tree/small) //Expensive!
	created_item = /obj/item/gun/ballistic/arquebus
	craftdiff = 5

/datum/anvil_recipe/engineering/pistol
	name = "Arquebus Pistol (+1 cog, +1 wood)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/roguegear, /obj/item/grown/log/tree/small) //A little cheaper!
	created_item = /obj/item/gun/ballistic/arquebus_pistol
	craftdiff = 5

/datum/anvil_recipe/engineering/powderbag
	name = "Powder Flask (+1 Cured Hide, +1 Internal ash, +1 Coal)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/natural/hide/cured, /obj/item/magic/infernal/ash, /obj/item/rogueore/coal) //Expensive bag to not blow up
	created_item = /obj/item/powderflask
	craftdiff = 5

/datum/anvil_recipe/engineering/bulletpouch
	name = "Bullet Pouch (+1 Cured Leather)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/hide/cured) //Bag of bullets
	created_item = /obj/item/quiver/bulletpouch
	craftdiff = 5

/datum/anvil_recipe/engineering/leadbullets
	name = "Firearm Bullets (x10)"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/ammo_casing/caseless/rogue/bullet
	createditem_num = 10
	craftdiff = 5
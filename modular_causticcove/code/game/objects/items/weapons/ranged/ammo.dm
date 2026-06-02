// Caustic Cove overrides of code/game/objects/items/rogueweapons/ranged/ammo.dm
// so we can override or balance it how we want to.

/obj/item/ammo_casing/caseless/rogue/bullet
	name = "arquebus shot"
	desc = "A small metal sphere to be fired from a gun."
	projectile_type = /obj/projectile/bullet/reusable/leadball

/obj/projectile/bullet/reusable/leadball
	name = "lead sphere"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	accuracy = 75
	damage = 110
	armor_penetration = PEN_BSTEEL
	embedchance = 100 // Yeah this shit isn't bouncing off
	npc_simple_damage_mult = 5
	range = 30

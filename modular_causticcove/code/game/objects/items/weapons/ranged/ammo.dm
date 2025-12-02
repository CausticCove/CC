// Caustic Cove overrides of code/game/objects/items/rogueweapons/ranged/ammo.dm
// so we can override or balance it how we want to.

/obj/item/ammo_casing/caseless/rogue/bullet // The ammo
	name = "arquebus shot"
	desc = "A small metal sphere to be fired from a gun."

/obj/projectile/bullet/reusable/bullet // The projectile
	name = "arquebus bullet"
	damage = 100
	npc_simple_damage_mult = 3.5

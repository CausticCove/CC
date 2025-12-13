// Caustic Cove overrides of code/game/objects/items/rogueweapons/ranged/ammo.dm
// so we can override or balance it how we want to.

/obj/item/ammo_casing/caseless/rogue/bullet
	name = "arquebus shot"
	desc = "A small metal sphere to be fired from a gun."

/obj/projectile/bullet/reusable/bullet // The projectile itself
	name = "arquebus bullet"
	npc_simple_damage_mult = 2

// Base items

/obj/item/ammo_casing/caseless/rogue/arrow/obsidian
	name = "obsidian arrow"
	desc = "A serrated edge of black volcanic glass on a wooden dowel. Many hunters swear by these arrows as they cut through hide and flesh like parchment, though they are prone to shatter on impact with armor."
	icon = 'modular_causticcove/icons/weapons/ranged/arrow_mob.dmi'
	icon_state = "arrowobsidian"
	max_integrity = 5
	projectile_type = /obj/projectile/bullet/reusable/arrow/obsidian

// Flint arrow. Stone but better™.
/obj/item/ammo_casing/caseless/rogue/arrow/flint
	name = "flint arrow"
	desc = "A finely knapped and polished piece of flint, tied onto a wooden dowel. Colorful fletching adorns the shaft. Olden wisdom says that they cut cleaner than metal arrows."
	icon = 'modular_causticcove/icons/weapons/ranged/arrow_mob.dmi'
	icon_state = "arrowflint"
	max_integrity = 7
	projectile_type = /obj/projectile/bullet/reusable/arrow/flint

// Projectiles

/obj/projectile/bullet/reusable/arrow/obsidian
	name = "obsidian arrow"
	icon = 'modular_causticcove/icons/weapons/ranged/arrow_proj.dmi'
	icon_state = "arrowobs_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/obsidian
	armor_penetration = -20
	damage = 40

/obj/projectile/bullet/reusable/arrow/flint
	name = "flint arrow"
	icon = 'modular_causticcove/icons/weapons/ranged/arrow_proj.dmi'
	icon_state = "arrowflnt_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/flint
	damage = 30

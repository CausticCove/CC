#define BLUNDERBUS_NUM_PELLETS 8
#define BOOMSTICK_NUM_PELLETS 6

//Internal Mag Defines for the guns
/obj/item/ammo_box/magazine/internal/blackpowder
	name = "blackpowder weapon barrel"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet/blackpowder
	caliber = "musketball"
	max_ammo = 1
	start_empty = TRUE

/obj/item/ammo_box/magazine/internal/blackpowder/blunderbus
	name = "blunderbus weapon barrel"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/grapeshot
	caliber = "grapeshot"

/obj/item/ammo_box/magazine/internal/blackpowder/boomstick
	name = "boomstick barrels"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round
	caliber = "boomstick_round"
	max_ammo = 2

//Bullet Ammo and Projectile Defines
// -- Base Blackpowder Bullet --
/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder
	name = "iron musketball"
	desc = "A small metal sphere to be fired from a gun."
	projectile_type = /obj/projectile/bullet/reusable/bullet/blackpowder
	caliber = "musketball"
	icon = 'icons/roguetown/weapons/ranged/sling_mob.dmi' //Caustic Edit - Re-add the icon file
	icon_state = "musketball"
	dropshrink = 0.5
	possible_item_intents = list(/datum/intent/use)
	max_integrity = 0.1

/obj/projectile/bullet/reusable/bullet/blackpowder //Adjust the stats of the bullet's damage and range through the weapon's individual modifier stats instead of here!
	name = "iron ball"
	damage = 100 //Setting this to 100 for easier math on the weapon's end. THIS variable should probably remain 100, since the individual multipliers on the weapons have been keyed into this number. Adjusting this will change all weapons similarly.
	icon = 'icons/roguetown/weapons/ranged/sling_proj.dmi'
	icon_state = "scatter_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet/blackpowder
	range = 30 //This can be overridden with the stats on the guns themselves.
	hitsound = 'sound/combat/hits/hi_bolt (1).ogg'
	embedchance = 95 //It honestly might be funny the small chance it doesn't embed to have rediculous situations. Did it go through? Did it not at all (somehow)?
	woundclass = BCLASS_PIERCE
	flag = "piercing"
	armor_penetration = PEN_BSTEEL
	speed = 0.1
	npc_simple_damage_mult = 2

/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/grapeshot
	name = "iron grapeshot"
	desc = "A collection of tiny metal beads. These are fired from a blunderbus."
	projectile_type = /obj/projectile/bullet/reusable/bullet/blackpowder/grapeshot
	caliber = "grapeshot"
	icon = 'modular_causticcove/icons/weapons/blackpowder_ammo.dmi'
	icon_state = "grapeshot"
	pellets = BLUNDERBUS_NUM_PELLETS
	variance = 35

/obj/projectile/bullet/reusable/bullet/blackpowder/grapeshot
	name = "iron grapeshot pellet"
	range = 15
	embedchance = 100
	armor_penetration = PEN_MEDIUM
	npc_simple_damage_mult = 2.5
	ammo_type = /obj/item/pellet/grapeshot/iron //This is what is dropped when it is attempted to be re-used. So, lets instead make it drop an individual Grapeshot Pellet that can stack back to one full cluster?

/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round
	name = "boomstick cartridge"
	desc = "A few blessed silver rounds encased in a single cartridge with blackpowder, ready to be fired. It bears the inquisitorial mark on it's surface."
	projectile_type = /obj/projectile/bullet/reusable/bullet/blackpowder/boomstick_pellet
	caliber = "boomstick_round"
	icon = 'modular_causticcove/icons/weapons/blackpowder_ammo.dmi'
	icon_state = "boomstickshot"
	pellets = BOOMSTICK_NUM_PELLETS
	variance = 15
	var/num_rounds = 1
	var/max_rounds = 2

/obj/projectile/bullet/reusable/bullet/blackpowder/boomstick_pellet
	name = "blessed silver round"
	icon = 'icons/roguetown/weapons/ranged/sling_proj.dmi'
	icon_state = "steelslingbullet_proj"
	range = 12
	embedchance = 100
	armor_penetration = PEN_HEAVY
	npc_simple_damage_mult = 2.5
	is_silver_proj = TRUE
	ammo_type = /obj/item/pellet/boomstick

/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round/Initialize()
	. = ..()
	update_count()

/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	update_count()

/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round/attackby(obj/item/I, mob/living/user, params) //Basically reusing the pellet code below but, much more restrictive since it's only ever going to stack to 2, so the ammo is rare, and cannot stack after firing. (Only cause we don't have sprites for 2 fired ones)
	if(BB && num_rounds == 1 && istype(I, /obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round))
		var/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round/hit_by = I
		if(hit_by.BB && hit_by.num_rounds == 1)
			hit_by.num_rounds += 1
			to_chat(user, span_notice("You pair the [src.name] with it's partner."))
			hit_by.update_count()
			qdel(src)
			return

	. = ..()

/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round/proc/update_count()
	if(!BB) //If it has no bullet, it's been fired already.
		icon_state = "[initial(src.icon_state)]_0"
	else
		icon_state = "[initial(src.icon_state)]_[num_rounds]"

/obj/item/pellet
	var/num_rounds = 1
	var/max_rounds
	var/caliber
	var/full_item

/obj/item/pellet/Initialize()
	. = ..()
	update_count()

/obj/item/pellet/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/pellet))
		var/obj/item/pellet/hit_by = I
		if(max_rounds > 0 && hit_by.num_rounds < hit_by.max_rounds && hit_by.caliber == src.caliber)
			var/remainder = (hit_by.num_rounds + src.num_rounds) - hit_by.max_rounds
			if(remainder <= 0) //If the remainder is less then 0, there was not enough for a full stack. If it is 0, there is exactly enough for a full stack! We can qdel src in these situations
				hit_by.num_rounds += src.num_rounds
				to_chat(user, span_notice("You scoop up the [src.name] and add it to the others."))
				hit_by.update_count()
				qdel(src)
				return
			else //If we hit this, we do have a positive remainder, do not delete src, but also update src's count.
				hit_by.num_rounds = hit_by.max_rounds
				src.num_rounds = remainder
				hit_by.update_count()
				src.update_count()
				return

	. = ..()

/obj/item/pellet/proc/update_count()
	if(num_rounds == max_rounds)
		var/new_shot = new full_item(loc)
		if(ismob(loc))
			var/mob/holding = loc
			holding.dropItemToGround(src)
			holding.put_in_active_hand(new_shot)
		qdel(src)
	else
		icon_state = "[initial(src.icon_state)]_[num_rounds]"
		src.update_icon()

/obj/item/pellet/grapeshot/iron
	name = "iron grapeshot pellet"
	desc = "A collection of iron pellets from some blunderbus shot. Grab enough of them to be able to fire again."
	icon = 'modular_causticcove/icons/weapons/blackpowder_ammo.dmi'
	icon_state = "pellet"
	w_class = WEIGHT_CLASS_TINY
	force = 0
	throwforce = 0
	dropshrink = 0.5
	possible_item_intents = list(/datum/intent/use)
	max_integrity = 0.1
	grid_width = 32
	grid_height = 32
	max_rounds = BLUNDERBUS_NUM_PELLETS
	caliber = "grapeshot-iron"
	full_item = /obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/grapeshot

/obj/item/pellet/boomstick
	name = "blessed silver pellet"
	desc = "Blessed Silver fired from an Inquisitorial Boomstick! Creechers of the nite beware!"
	icon = 'modular_causticcove/icons/weapons/blackpowder_ammo.dmi'
	icon_state = "pellet_silver"
	w_class = WEIGHT_CLASS_TINY
	force = 0
	throwforce = 0
	dropshrink = 0.5
	possible_item_intents = list(/datum/intent/use)
	max_integrity = 0.1
	grid_width = 32
	grid_height = 32
	max_rounds = BOOMSTICK_NUM_PELLETS
	caliber = "boomstick-silver"
	full_item = /obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/grapeshot

#undef BLUNDERBUS_NUM_PELLETS
#undef BOOMSTICK_NUM_PELLETS

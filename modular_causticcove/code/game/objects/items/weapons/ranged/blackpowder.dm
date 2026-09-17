/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder //A new base for all blackpowder weaponry. Lets just use the Arq's stats as the baseline for now?
	name = "blackpowder weaponry"
	desc = "A gunpowder weapon that shoots an armor piercing metal ball."
	icon = 'modular_causticcove/icons/weapons/blackpowder64.dmi'
	icon_state = "arquebus"
	item_state = "arquebus"
	force = 10
	force_wielded = 15
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/shoot/blackpowder, /datum/intent/arc/blackpowder, INTENT_GENERIC)
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/blackpowder
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	//gripsprite = TRUE
	wlength = WLENGTH_LONG
	slot_flags = null
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 1
	spread = 0
	equip_delay_self = 1.5 SECONDS
	unequip_delay_self = 1.5 SECONDS
	inv_storage_delay = 1.5 SECONDS
	can_parry = TRUE
	minstr = 6
	experimental_onback = TRUE
	cartridge_wording = "musketball"
	obj_flags = UNIQUE_RENAME
	load_sound = 'modular_causticcove/sound/arquebus/musketload.ogg'
	fire_sound = 'modular_causticcove/sound/arquebus/arquefire.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/bronze
	bolt_type = BOLT_TYPE_NO_BOLT
	casing_ejector = FALSE
	pickup_sound = 'modular_causticcove/sound/sheath_sounds/draw_from_holster.ogg'

	//These Vars are used for internal state/sound handling and storing the ramrod.
	var/multiple_shot = FALSE //Generally intended to be used with need_handload = FALSE as well
	var/needs_handload = TRUE
	var/has_rod = TRUE

	var/reloaded = FALSE
	var/gunpowder = FALSE
	var/obj/item/ramrod/myrod = null
	var/gun_sound_channel

	//These Vars should be changed as needed for the subweapons!
	var/spread_num = 10 //This spread value is eventually translated into the random angle it will spread from the intended firing path - if not fully charged
	damfactor = 1 //Default 1 here translates to 100 damage when fired
	var/range = 30 //The shot will have it's range set to this when fired
	var/load_time = 50 //Ticks it takes to load the weapon

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/Initialize()
	. = ..()
	if(has_rod)
		myrod = new /obj/item/ramrod(src)

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/get_mechanics_examine(mob/user)
	. = ..()
	if(needs_handload)
		. += span_info("To actually fire your blackpowder weaponry, you will need a Powder Flask, Ammo for the weapon, and a Ramrod. All weapons that require a rod have one stored in them.")
		. += span_info("First, you must fill your barrel with powder from your flask. Then grab your shot and insert it into the barrel.")
		. += span_info("Remove the Ramrod from your weapon by right clicking it with an empty hand, then use the Ramrod on the weapon to chamber it. Use it on the weapon again to store it.")
		. += span_info("Some weapons need to be aimed with both hands to be able to fire them properly! But ensure you are in Shoot or Arc mode, hold to aim and when it is charged, release to fire.")

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6, "sx" = -6, "sy" = 2, "nx" = 6, "ny" = 2, "wx" = 1, "wy" = 2, "ex" = 1, "ey" = 2,
							"northabove" = 0, "southabove" = 1, "eastabove" = 1, "westabove" = 0,
							"nturn" = -70, "sturn" = 70, "wturn" = -70, "eturn" = -110, "nflip" = 0, "sflip" = 8, "wflip" = 0, "eflip" = 1)
			if("wielded")
				return list("shrink" = 0.6, "sx" = 2, "sy" = 0, "nx" = -2, "ny" = 0, "wx" = -5, "wy" = 0, "ex" = 7, "ey" = 0,
							"northabove" = 0, "southabove" = 1, "eastabove" = 1, "westabove" = 1,
							"nturn" = 0, "sturn" = 0, "wturn" = 35, "eturn" = -35, "nflip" = 8, "sflip" = 0, "wflip" = 8, "eflip" = 0)
			if("onback")
				return list("shrink" = 0.6, "sx" = -6, "sy" = 2, "nx" = 6, "ny" = 2, "wx" = 1, "wy" = 2, "ex" = 1, "ey" = 2,
							"northabove" = 0, "southabove" = 1, "eastabove" = 1, "westabove" = 0,
							"nturn" = -70, "sturn" = 70, "wturn" = -70, "eturn" = -110, "nflip" = 0, "sflip" = 8, "wflip" = 0, "eflip" = 1)

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)
	fire_sound = pick('modular_causticcove/sound/arquebus/arquefire.ogg', 'modular_causticcove/sound/arquebus/arquefire2.ogg', 'modular_causticcove/sound/arquebus/arquefire3.ogg',
				'modular_causticcove/sound/arquebus/arquefire4.ogg', 'modular_causticcove/sound/arquebus/arquefire5.ogg')
	. = ..()

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/attack_right(mob/user)
	if(!has_rod)
		return

	if(user.get_active_held_item())
		return
	else
		if(myrod)
			playsound(src, 'sound/items/sharpen_short1.ogg',  100)
			to_chat(user, "<span class='warning'>I draw the ramrod from [src]!</span>")
			var/obj/item/ramrod/AM
			for(AM in src)
				user.put_in_hands(AM)
				myrod = null
		else
			to_chat(user, "<span class='warning'>There is no rod stowed in [src]!</span>")

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/shoot_with_empty_chamber()
	playsound(src.loc, 'modular_causticcove/sound/arquebus/musketcock.ogg', 100, FALSE)
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/attack_self(mob/living/user)
	if(twohands_required)
		return
	if(altgripped || wielded) //Trying to unwield it
		ungrip(user)
		return
	if(has_altgrip_modes())
		altgrip(user)
	if(gripped_intents)
		wield(user)
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/attackby(obj/item/A, mob/living/carbon/user, params) // Reloading code for rifle
	if(!needs_handload)
		..()
		return

	user.stop_sound_channel(gun_sound_channel)
	var/firearm_skill = (user?.mind ? user.get_skill_level(/datum/skill/combat/firearms) : 1)
	var/load_time_skill = load_time - (firearm_skill*2)
	gun_sound_channel = SSsounds.random_available_channel()

	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(chambered)
			to_chat(user, "<span class='warning'>There is already [chambered] in [src]!</span>")
			return
		if(!gunpowder)
			to_chat(user, "<span class='warning'>You must fill [src] with gunpowder first!</span>")
			return
		if(!istype(A, /obj/item/ammo_casing/caseless/rogue/bullet/blackpowder))
			to_chat(user, "<span class='warning'>[A.name] cannot be used as ammo for [src].</span>")
			return
		if((loc == user) && (user.get_inactive_held_item() != src))
			return
		playsound(src, 'modular_causticcove/sound/arquebus/insert.ogg',  100)
		user.visible_message("<span class='notice'>[user] forces [A] down the barrel of [src].</span>")
		..()

	if(istype(A, /obj/item/powderflask))
		if(gunpowder)
			user.visible_message("<span class='warning'>[src] is already filled with gunpowder!</span>")
			return
		else
			playsound(src, 'modular_causticcove/sound/arquebus/pour_powder.ogg',  100)
			if(do_after(user, load_time_skill, src))
				user.visible_message("<span class='notice'>[user] fills [src] with gunpowder.</span>")
				gunpowder = TRUE
			return
	if(istype(A, /obj/item/ramrod))
		var/obj/item/ramrod/R=A
		if(!reloaded)
			if(chambered)
				user.visible_message("<span class='notice'>[user] begins ramming the [R.name] down the barrel of [src].</span>")
				playsound(src, 'modular_causticcove/sound/arquebus/ramrod.ogg',  100)
				if(do_after(user, load_time_skill, src))
					user.visible_message("<span class='notice'>[user] has finished reloading [src].</span>")
					reloaded = TRUE
				return
		if(reloaded && !myrod)
			user.transferItemToLoc(R, src)
			myrod = R
			playsound(src, 'modular_causticcove/sound/arquebus/musketload.ogg',  100)
			user.visible_message("<span class='notice'>[user] stows [R.name] under the barrel of [src].</span>")
		if(!chambered && !myrod)
			user.transferItemToLoc(R, src)
			myrod = R
			playsound(src, 'modular_causticcove/sound/arquebus/musketload.ogg',  100)
			user.visible_message("<span class='notice'>[user] stows [R.name] under the barrel of [src] without chambering it.</span>")
		if(!myrod == null)
			to_chat(user, span_warning("There's already a [R.name] inside of [src]."))
			return
		user.stop_sound_channel(gun_sound_channel)

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	var/firearm_skill = (user?.mind ? user.get_skill_level(/datum/skill/combat/firearms) : 1)
	spread = (spread_num - firearm_skill)
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
			adjust_experience(user, /datum/skill/combat/firearms, user.STAINT * 4)
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 0
	//for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
	var/obj/projectile/BB = chambered.BB
	BB.damage = BB.damage * damfactor
	BB.range = range

	if(!multiple_shot)
		magazine.stored_ammo.Cut() //This is needed apparently since it got commented out above. It'll just wipe the stored ammo from the magazine, but frankly this is hacky as hell. There's likely a better way using the various gun calls, but eh.
		gunpowder = FALSE
		reloaded = FALSE
	user.adjust_experience(/datum/skill/combat/firearms, (user.STAINT*5))
	..()
	if(multiple_shot)
		if(!magazine.ammo_count(FALSE))
			gunpowder = FALSE
			reloaded = FALSE

	new /obj/effect/particle_effect/sparks/muzzle(get_ranged_target_turf(user, user.dir, 1))
	spawn (5)
		new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 1))
	spawn (10)
		new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 2))
	spawn (16)
		new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 1))
	for(var/mob/M in range(5, user))
		if(!M.stat)
			shake_camera(M, 3, 1)

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/can_shoot()
	if (!reloaded)
		return FALSE
	var/is_chambered = ..()
	if(is_chambered && chambered.BB)
		return TRUE
	else
		return FALSE

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small
	name = "one-handed blackpowder weaponry"
	desc = "A gunpowder weapon that shoots an armor piercing metal ball."
	icon = 'modular_causticcove/icons/weapons/blackpowder32.dmi'
	icon_state = "pistol"
	item_state = "pistol"
	force = 10
	force_wielded = 0
	possible_item_intents = list(/datum/intent/shoot/blackpowder/small, /datum/intent/arc/blackpowder/small, /datum/intent/mace/strike/wood)
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/blackpowder
	pixel_y = 0
	pixel_x = 0
	bigboy = FALSE
	gripsprite = FALSE
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	equip_delay_self = 1.5
	unequip_delay_self = 1.5
	inv_storage_delay = 1 SECONDS
	can_parry = TRUE
	minstr = 6
	cartridge_wording = "musketball"
	load_sound = 'modular_causticcove/sound/arquebus/musketload.ogg'
	fire_sound = 'modular_causticcove/sound/arquebus/arquefire.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/bronze
	pickup_sound = 'modular_causticcove/sound/sheath_sounds/draw_from_holster.ogg'

	//These Variables are likely ones you'd want to override for sub-classes
	slot_flags = ITEM_SLOT_HIP
	spread_num = 10
	damfactor = 1
	range = 10 //Only the Range and Load_time has been lowered from the base 'large' weapon type
	load_time = 35 // ^^^

	//Assuming that the 'smaller' guns are going to be like pistols and the like, lets allow for spin-tricks to all subtypes
	var/can_spin = TRUE
	var/last_spun
	var/spin_cooldown = 3 SECONDS

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/attack_self(mob/living/user)
	var/string = "smoothly"
	var/list/strings_noob = list("unsurely", "nervously", "anxiously", "timidly", "shakily", "clumsily", "fumblingly", "awkwardly")
	var/list/strings_moderate = list("smoothly", "confidently", "determinately", "calmly", "skillfully", "decisively")
	var/list/strings_pro = list("masterfully", "expertly", "flawlessly", "elegantly", "artfully", "impeccably")
	var/firearm_skill = (user?.mind ? user.get_skill_level(/datum/skill/combat/firearms) : 1)
	var/noob_spin_sound = 'sound/combat/weaponr1.ogg'
	var/pro_spin_sound = 'modular_causticcove/sound/arquebus/gunspin.ogg'
	var/spin_sound
	if(firearm_skill <= 2)
		string = pick(strings_noob)
		spin_sound = noob_spin_sound
	if((firearm_skill > 2) && (firearm_skill <= 4))
		string = pick(strings_moderate)
		spin_sound = pro_spin_sound
	if((firearm_skill > 4) && (firearm_skill <= 6))
		string = pick(strings_pro)
		spin_sound = pro_spin_sound
	if(world.time > last_spun + spin_cooldown)
		can_spin = TRUE
	if(can_spin)
		user.play_overhead_indicator('icons/effects/effects.dmi', "emote", 10, OBJ_LAYER)
		user.visible_message("<span class='emote'>[user] spins [src] around their fingers [string]!</span>")
		playsound(src, spin_sound, 100, FALSE, ignore_walls = FALSE)
		last_spun = world.time
		if(firearm_skill <= 3)
			if(prob(50))
				user.visible_message("<span class='danger'>[user] accidentally drops [src]!</span>")
				user.dropItemToGround(src)
		can_spin = FALSE

// Base Intents

/datum/intent/shoot/blackpowder //Intended for two-handed weapons
	chargetime = 1
	chargedrain = 0
	var/basetime = 30

/datum/intent/shoot/blackpowder/can_charge()
	if(mastermob && masteritem.wielded)
		return TRUE

	return FALSE

/datum/intent/shoot/blackpowder/get_chargetime() //Changing this up to blend a bit of how Bows and Crossbows are handled, but (large) guns should have an aiming time even on regular shoot intent
	if(mastermob && chargetime)
		var/newtime = 0

		newtime += basetime
		newtime = newtime - (mastermob.get_skill_level(/datum/skill/combat/firearms) * 5)
		newtime = ((newtime + 20) - ((mastermob.STAPER))) //Min 5 seconds? Microseconds? Units of whatever-time will be added from this step.
		//With a Basetime of 30, this should come out to at-minimum 5-time-units to charge and fire for the regular intent and baseline ammo

		var/obj/item/gun/ballistic/rifle = masteritem
		if(istype(rifle) && rifle.chambered)
			newtime *= rifle.chambered.charge_time_mult
		if(newtime > 1)
			return newtime
		else
			return 1
	return chargetime

/datum/intent/arc/blackpowder
	chargetime = 1
	chargedrain = 0
	var/basetime = 50 //Aiming it to avoid hitting allies should take a bit longer.

/datum/intent/arc/blackpowder/can_charge()
	if(mastermob && masteritem.wielded)
		return TRUE

	return FALSE

/datum/intent/arc/blackpowder/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 0

		newtime += basetime
		newtime = newtime - (mastermob.get_skill_level(/datum/skill/combat/firearms) * 5)
		newtime = ((newtime + 20) - ((mastermob.STAPER)))

		var/obj/item/gun/ballistic/rifle = masteritem
		if(istype(rifle) && rifle.chambered)
			newtime *= rifle.chambered.charge_time_mult
		if(newtime > 1)
			return newtime
		else
			return 1
	return chargetime

/datum/intent/shoot/blackpowder/small
	chargetime = 0.1 //No real need to aim a pistol, we good here probably.
	chargedrain = 0
	basetime = 15 //Still, lets reduce the charging basetime anyway.

/datum/intent/shoot/blackpowder/small/can_charge()
	if(mastermob)
		return TRUE

/datum/intent/arc/blackpowder/small
	chargetime = 1
	chargedrain = 0
	basetime = 25 //The aiming time for a small weapon should be a lot faster potentially, even when in Arc

/datum/intent/arc/blackpowder/small/can_charge()
	if(mastermob)
		return TRUE

// -- Rifles --
/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/arquebus
	name = "arquebus rifle"
	desc = "A gunpowder weapon that shoots an armor piercing metal ball."
	icon = 'modular_causticcove/icons/weapons/blackpowder64.dmi'
	icon_state = "longgun_0"
	item_state = "longgun_0"
	force = 10
	force_wielded = 15
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/shoot/blackpowder, /datum/intent/arc/blackpowder, INTENT_GENERIC)
	minstr = 6
	cartridge_wording = "musketball"
	load_sound = 'modular_causticcove/sound/arquebus/musketload.ogg'
	fire_sound = 'modular_causticcove/sound/arquebus/arquefire.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/bronze
	pickup_sound = 'modular_causticcove/sound/sheath_sounds/draw_from_holster.ogg'

	spread_num = 20
	damfactor = 0.95 //Comes out to 95 damage
	range = 30
	load_time = 50

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/arquebus/grenzelhoft
	name = "grenzelhoftian arquebus rifle"
	desc = "A gunpowder weapon that shoots an armor piercing metal ball. This one is of a Grenzelhoftian design."
	icon_state = "arquebus"
	item_state = "arquebus"

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/arquebus/grenzelhoft/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6, "sx" = -7, "sy" = 6, "nx" = 7, "ny" = 6, "wx" = -2, "wy" = 3, "ex" = 1, "ey" = 3,
							"northabove" = 0, "southabove" = 1, "eastabove" = 1, "westabove" = 0,
							"nturn" = -43, "sturn" = 43, "wturn" = 30, "eturn" = -30, "nflip" = 0, "sflip" = 8, "wflip" = 8, "eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6, "sx" = 5, "sy" = -2, "nx" = -5, "ny" = -1, "wx" = -8, "wy" = 2, "ex" = 8, "ey" = 2,
							"northabove" = 0, "southabove" = 1, "eastabove" = 1, "westabove" = 1,
							"nturn" = -45, "sturn" = 45, "wturn" = 0, "eturn" = 0, "nflip" = 8, "sflip" = 0, "wflip" = 8, "eflip" = 0)
			if("onback")
				return list("shrink" = 0.5, "sx" = -1, "sy" = 2, "nx" = 0, "ny" = 2, "wx" = 2, "wy" = 1, "ex" = 0, "ey" = 1,
							"northabove" = 1, "southabove" = 0, "eastabove" = 0, "westabove" = 0,
							"nturn" = 0, "sturn" = 0, "wturn" = 70, "eturn" = 15, "nflip" = 1, "sflip" = 1, "wflip" = 1, "eflip" = 1)

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/handgonne
	name = "hand-bombard"
	desc = "An older gunpowder weapon that shoots a single massive projectile."
	icon = 'modular_causticcove/icons/weapons/blackpowder64.dmi'
	icon_state = "handgonne"
	item_state = "handgonne"
	force = 10
	force_wielded = 15
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/shoot/blackpowder, /datum/intent/arc/blackpowder, INTENT_GENERIC)
	minstr = 6
	cartridge_wording = "musketball"
	load_sound = 'modular_causticcove/sound/arquebus/musketload.ogg'
	fire_sound = 'modular_causticcove/sound/arquebus/arquefire.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/bronze
	pickup_sound = 'modular_causticcove/sound/sheath_sounds/draw_from_holster.ogg'

	spread_num = 30
	damfactor = 1.35
	range = 50
	load_time = 80

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/handgonne/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6, "sx" = -7, "sy" = 6, "nx" = 7, "ny" = 6, "wx" = -2, "wy" = 3, "ex" = 1, "ey" = 3,
							"northabove" = 0, "southabove" = 1, "eastabove" = 1, "westabove" = 0,
							"nturn" = -43, "sturn" = 43, "wturn" = 30, "eturn" = -30, "nflip" = 0, "sflip" = 8, "wflip" = 8, "eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6, "sx" = 5, "sy" = -2, "nx" = -5, "ny" = -1, "wx" = -8, "wy" = 2, "ex" = 8, "ey" = 2,
							"northabove" = 0, "southabove" = 1, "eastabove" = 1, "westabove" = 1,
							"nturn" = -45, "sturn" = 45, "wturn" = 0, "eturn" = 0, "nflip" = 8, "sflip" = 0, "wflip" = 8, "eflip" = 0)
			if("onback")
				return list("shrink" = 0.5, "sx" = -1, "sy" = 2, "nx" = 0, "ny" = 2, "wx" = 2, "wy" = 1, "ex" = 0, "ey" = 1,
							"northabove" = 1, "southabove" = 0, "eastabove" = 0, "westabove" = 0,
							"nturn" = 0, "sturn" = 0, "wturn" = 70, "eturn" = 15, "nflip" = 1, "sflip" = 1, "wflip" = 1, "eflip" = 1)

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/handgonne/culverin
	name = "culverin"
	desc = "An older gunpowder weapon that shoots a single massive projectile. This one is of more recent make, with a better fitting stock and longer barrel."
	icon_state = "handgonne_alt"
	item_state = "handgonne_alt"

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/blunderbus
	name = "blunderbus"
	desc = "A gunpowder weapon that shoots a cluster of metal grapeshot pellets."
	icon = 'modular_causticcove/icons/weapons/blackpowder64.dmi'
	icon_state = "blunder"
	item_state = "blunder"
	force = 10
	force_wielded = 15
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/shoot/blackpowder, /datum/intent/arc/blackpowder, INTENT_GENERIC)
	minstr = 9
	mag_type = /obj/item/ammo_box/magazine/internal/blackpowder/blunderbus
	cartridge_wording = "grapeshot"
	load_sound = 'modular_causticcove/sound/arquebus/musketload.ogg'
	fire_sound = 'modular_causticcove/sound/arquebus/arquefire3.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/bronze
	pickup_sound = 'modular_causticcove/sound/sheath_sounds/draw_from_holster.ogg'

	spread_num = 30
	damfactor = 0.21
	range = 15
	load_time = 50

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/blunderbus/ornate
	name = "blunderbus"
	desc = "A gunpowder weapon that shoots a cluster of metal grapeshot pellets. This one has had it's stock replaced by one made of stained and polished wood, that has also been adorned with gold trimming."
	icon_state = "blunder_ornate"
	item_state = "blunder_ornate"
	force = 15
	force_wielded = 21

// -- Pistols --
/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/arquebus_pistol
	name = "arquebus pistol"
	desc = "A gunpowder weapon that shoots an armor piercing metal ball."
	icon = 'modular_causticcove/icons/weapons/blackpowder32.dmi'
	icon_state = "pistol"
	item_state = "pistol"
	force = 10
	possible_item_intents = list(/datum/intent/shoot/blackpowder/small, /datum/intent/arc/blackpowder/small, /datum/intent/mace/strike/wood)
	minstr = 6
	cartridge_wording = "musketball"
	load_sound = 'modular_causticcove/sound/arquebus/musketload.ogg'
	fire_sound = 'modular_causticcove/sound/arquebus/arquefire.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/bronze
	pickup_sound = 'modular_causticcove/sound/sheath_sounds/draw_from_holster.ogg'

	slot_flags = ITEM_SLOT_HIP
	spread_num = 10
	damfactor = 0.65 //Should be 65 damage for being shot by the pistol
	range = 10
	load_time = 30 //Lesser load time cause it's a smaller weapon

	spin_cooldown = 3 SECONDS

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/arquebus_pistol/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -10,"sy" = -8,"nx" = 13,"ny" = -8,"wx" = -8,"wy" = -7,"ex" = 7,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 30,"sturn" = -30,"wturn" = -30,"eturn" = 30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

// - Boomstick - And related handling override code
/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/boomstick
	name = "The Boomstick"
	desc = "A unique deviation on blackpowder weaponry, constructed and sanctified by the Inquisition. Able to fire silver projectiles, the ammo is heavily regulated by the Otavan Inquisition as it's shot comes pre-blessed. Groovy."
	icon = 'modular_causticcove/icons/weapons/blackpowder32.dmi'
	icon_state = "boomstick"
	item_state = "boomstick"
	force = 16
	possible_item_intents = list(/datum/intent/shoot/blackpowder/small, /datum/intent/arc/blackpowder/small, /datum/intent/mace/strike/wood)
	minstr = 7
	mag_type = /obj/item/ammo_box/magazine/internal/blackpowder/boomstick
	cartridge_wording = "boomstick_round"
	load_sound = 'modular_causticcove/sound/sheath_sounds/put_back_dagger.ogg'
	var/unload_sound = 'modular_causticcove/sound/arquebus/insert.ogg'
	var/open_sound = 'modular_causticcove/sound/arquebus/musketcock.ogg'
	fire_sound = 'modular_causticcove/sound/arquebus/arquefire3.ogg'
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ash
	pickup_sound = 'modular_causticcove/sound/sheath_sounds/draw_from_holster.ogg'

	slot_flags = ITEM_SLOT_HIP | ITEM_SLOT_BACK
	spread_num = 7
	damfactor = 0.35
	range = 12
	load_time = 30 //Might not even use this
	multiple_shot = TRUE
	needs_handload = FALSE
	has_rod = FALSE

	spin_cooldown = 5 SECONDS
	var/barrel_open = FALSE

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/boomstick/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Middle-Mouse click the Boomstick to open or close it's barrels. It can only fire when loaded and closed!")
	. += span_info("When open, right click the Boomstick with an empty hand to take out a round, and left click with a round in hand to insert it.")
	. += span_info("Each round can only be fired once and must be manually taken out afterwards and replaced.")

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/boomstick/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -8,"sy" = -5,"nx" = 11,"ny" = -5,"wx" = -4,"wy" = -6,"ex" = 3,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 75,"sturn" = -75,"wturn" = -75,"eturn" = 75,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
			if("onback")
				return list("shrink" = 0.6, "sx" = -2, "sy" = 2, "nx" = 2, "ny" = 2, "wx" = 6, "wy" = 2, "ex" = -4, "ey" = 2, "northabove" = 1, "southabove" = 0, "eastabove" = 0, "westabove" = 0, "nturn" = 5, "sturn" = 5, "wturn" = 50, "eturn" = -50, "nflip" = 0, "sflip" = 8, "wflip" = 4, "eflip" = 0)

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/boomstick/update_icon_state()
	if(barrel_open)
		var/num_rounds = magazine.ammo_count()
		icon_state = "[initial(src.icon_state)]_[num_rounds]"
	else
		icon_state = initial(src.icon_state)

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/boomstick/process_chamber(empty_chamber = TRUE, from_firing = TRUE, chamber_next_round = TRUE)
	if(!semi_auto && from_firing)
		return
	var/obj/item/ammo_casing/AC = chambered //Find chambered round
	if(istype(AC)) //there's a chambered round
		if(empty_chamber)
			chambered = null
	if (chamber_next_round && (magazine?.max_ammo > 1))
		chamber_round(TRUE)

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/boomstick/chamber_round(spin_cylinder)
	if(!magazine.stored_ammo.len) //Make sure there even is something in there first, too.
		return

	for(var/obj/item/ammo_casing/AC in magazine.stored_ammo)
		if(AC.BB)
			chambered = AC
			break

	if(!chambered)
		chambered = magazine.stored_ammo[1] //If all are already fired, lets just 'chamber' an empty one. It won't fire since I added the chambered check to can_fire above.

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/boomstick/attack_right(mob/user)
	if(barrel_open)
		if(!user.get_active_held_item())
			if(magazine.ammo_count())
				var/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round/round = magazine.get_round()
				round.update_count()
				user.put_in_active_hand(round)
				user.visible_message(span_notice("[user] pulls a round out of [src.name]."), span_notice("You pull out a round from [src.name]."))
				playsound(user, unload_sound, 100, FALSE, ignore_walls = FALSE)
				update_icon_state()
			else
				to_chat(user, span_notice("[src.name] is already empty."))
		else
			if(magazine.ammo_count())
				to_chat(user, span_notice("You need an empty hand to unload [src.name]."))
			else
				to_chat(user, span_notice("[src.name] is already empty."))

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/boomstick/MiddleClick(mob/user, params)
	if(barrel_open)
		barrel_open = FALSE
		user.visible_message(span_notice("[user] clicks [src.name]'s barrels shut."), span_notice("You snap the barrels closed!"))
		playsound(user, open_sound, 100, FALSE, ignore_walls = FALSE)
		update_icon_state()
		process_chamber(FALSE, FALSE, TRUE)
	else
		barrel_open = TRUE
		user.visible_message(span_notice("[user] snaps [src.name]'s barrels open."), span_notice("You crack the barrels open!"))
		playsound(user, open_sound, 100, FALSE, ignore_walls = FALSE)
		update_icon_state()
		process_chamber(TRUE, FALSE, FALSE)

/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/small/boomstick/attackby(obj/item/A, mob/living/carbon/user, params)
	if(barrel_open)
		if(istype(A, magazine.ammo_type))
			var/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round/round_stack = A
			var/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round/round
			if(round_stack.num_rounds == 2)
				round_stack.num_rounds -= 1
				round = new /obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/boomstick_round()
				round.update_count()
			else
				round = round_stack

			if(magazine.attackby(round, user, params, silent = TRUE))
				reloaded = TRUE
				round_stack.update_count()
				user.visible_message(span_notice("[user] loads a round into [src.name]!"), span_notice("You slide the round into a barrel."))
				playsound(user, load_sound, 100, FALSE, ignore_walls = FALSE)
				update_icon_state()
	else
		if(!istype(A, magazine.ammo_type))
			. = ..()

// -- Related Items --
/obj/item/ramrod
	name = "ramrod"
	icon = 'modular_causticcove/icons/items/blackpowder.dmi'
	desc = "A ramrod used for reloading a firearm."
	icon_state = "ramrod"
	item_state = "ramrod"
	slot_flags = SLOT_BELT_L | SLOT_BELT_R | ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 64
	grid_width = 32

/obj/item/powderflask
	name = "powderflask"
	icon = 'modular_causticcove/icons/items/blackpowder.dmi'
	desc = "A flask of gunpowder used for reloading a firearm."
	icon_state = "powderflask"
	item_state = "powderflask"
	slot_flags = SLOT_BELT_L | SLOT_BELT_R | ITEM_SLOT_NECK | ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 64
	grid_width = 32

/obj/item/quiver/bulletpouch
	name = "blackpowder bullet pouch"
	desc = "A pouch carrying bullets for firearms."
	icon = 'modular_causticcove/icons/items/blackpowder.dmi'
	icon_state = "ammopouch1"
	item_state = "ammopouch1"
	slot_flags = ITEM_SLOT_HIP | ITEM_SLOT_NECK
	max_storage = 20
	w_class = WEIGHT_CLASS_NORMAL
	grid_height = 64
	grid_width = 32
	allowed_ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet/blackpowder

/obj/item/quiver/bulletpouch/attack_turf(turf/T, mob/living/user)
	if(get_current_weight() >= max_storage)
		to_chat(user, span_warning("My [src.name] is full!"))
		return
	to_chat(user, span_notice("I begin to gather the ammunition..."))
	for(var/obj/item/ammo_casing/caseless/rogue/bullet in T.contents)
		if(do_after(user, 5))
			if(!eatarrow(bullet))
				break

/obj/item/quiver/bulletpouch/attackby(obj/A, loc, params)
	if(istype(A, /obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder))
		var/obj/item/gun/ballistic/revolver/grenadelauncher/blackpowder/B = A
		if(arrows.len && !B.chambered)
			var/obj/item/ammo_casing/caseless/rogue/AR = pick_ammo(allowed_ammo_type)
			if(AR)
				arrows -= AR
				B.attackby(AR, loc, params)
				if(ismob(loc))
					var/mob/M = loc
					if(HAS_TRAIT(M, TRAIT_COMBAT_AWARE))
						M.balloon_alert(M, "[length(arrows)] left...")
				update_icon()
		return
	..()

/obj/item/quiver/bulletpouch/attack_right(mob/user)
	if(arrows.len)
		var/obj/O = arrows[arrows.len]
		arrows -= O
		O.forceMove(user.loc)
		user.put_in_hands(O)
		update_icon()
		return TRUE

/obj/item/quiver/bulletpouch/update_icon()
	return

/obj/item/quiver/bulletpouch/iron/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/A = new()
		arrows += A
	update_icon()

/obj/item/quiver/bulletpouch/grapeshot/iron/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/bullet/blackpowder/grapeshot/A = new()
		arrows += A
	update_icon()

/// MUZZLE

/obj/effect/particle_effect/sparks/muzzle
	name = "sparks"
	icon = 'icons/effects/64x64.dmi'
	icon_state = "sparks"
	anchored = TRUE
	light_system = MOVABLE_LIGHT
	light_power = 1.5
	light_color = LIGHT_COLOR_FIRE
	pixel_x = -16
	pixel_y = -16
	layer = ABOVE_LIGHTING_LAYER
	plane = ABOVE_LIGHTING_PLANE

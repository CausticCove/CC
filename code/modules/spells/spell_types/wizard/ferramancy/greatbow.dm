/datum/intent/shoot/bow/ferramancy
	name = "shoot"
	charging_slowdown = 6 // Caustic Edit. Meant to be a sniping weapon, you shouldn't be able to run around with it while drawn

// Caustic Edit Start, slower charge speed
/datum/intent/shoot/bow/ferramancy/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 50 // Much slower charge time. For any changes, this is the baseline speed. Slower is a bigger number
		newtime = ((newtime + 10) - (mastermob.get_skill_level(/datum/skill/combat/arcyne) * (2)))
		newtime = ((newtime + 20) - (mastermob.STAPER))
		// At 10 PER and apprentice skill, it should equate to around 66 deciseconds, or just over 6.5 seconds. With the increased damage, I think this is a good enough tradeoff
		// For comparison, a longbow at 10 PER, 10 STR, and apprentice skill takes 21 deciseconds, or just over 2 seconds to fully charge.
		if(newtime > 1)
			return newtime //this value is how fast we can accurately shoot a bow. most builds will turn up with about 6 - 12 on non heavy bows.
		else
			return 1 //our floor for how quickly you can fire an accurate shot if you somehow break the calcs above. you need about 18 PER and master bows to reach this
	else
		return chargetime //if a bow somehow gets drawn by something that doesn't fulfill the above we can use the intent value
// Caustic Edit end

/datum/intent/shoot/bow/ferramancy/arc
	name = "arc shot"
	desc = "Fires the shot in an arc that allows it to passes through mob in the way. Will also tracks the target IF you have your cursor over them. This also allows you to aims at a target above or below."
	icon_state = "inarc"
	// charging_slowdown = 6 // Inherits from shoot/bow/ferramancy

/datum/intent/shoot/bow/ferramancy/arc/arc_check()
	return TRUE

/datum/intent/shoot/bow/ferramancy/lance
	name = "lance"
	icon_state = "inlance"
	desc = "Fires a powerful, piercing arcyne lance that passes through mobs in the way indiscriminately, up to 5 of them without damage reduction."
	chargetime = 3 SECONDS
	no_early_release = TRUE
	// charging_slowdown = 6 // Inherits from shoot/bow/ferramancy

/obj/item/ammo_casing/caseless/rogue/arrow/iron/ferramancy
	name = "arcyne broadhead"
	color = GLOW_COLOR_ARCANE
	icon_state = "paint_arrow" // Caustic Edit. Fits the bow sprite better, and since the bow sprite isn't colored, the arrow's color doesn't apply
	projectile_type = /obj/projectile/bullet/reusable/arrow/iron/ferramancy

/obj/projectile/bullet/reusable/arrow/iron/ferramancy
	color = GLOW_COLOR_ARCANE
	icon_state = "paint_arrow" // Caustic Edit. Fits the bow sprite better, and since the bow sprite isn't colored, the arrow's color doesn't apply
	trains_ranged_skill = FALSE

/obj/projectile/bullet/reusable/arrow/iron/ferramancy/on_hit()
	. = ..()
	QDEL_NULL(dropped)

/obj/projectile/bullet/reusable/arrow/iron/ferramancy/handle_drop()
	QDEL_NULL(dropped)
	return

/obj/item/ammo_box/magazine/internal/shot/bow/ferramancy
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/iron/ferramancy
	start_empty = FALSE

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/greatbow
	name = "arcyne greatbow"
	desc = "A longbow of condensed arcyne light. It draws on the wielder's own energy in place of arrows, looses with a heavy and deliberate pull, and is far too unwieldy to fire on the move."
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/spellsword_weapons.dmi' // Caustic Edit
	icon_state = "magi_bow"
	fire_sound = 'sound/magic/soulshot.ogg'
	minstr = 0
	accfactor = 1
	damfactor = 2 // Caustic Edit. 48% higher damage than a longbow. May be changed.
	mag_type = /obj/item/ammo_box/magazine/internal/shot/bow/ferramancy
	spill_ammo_on_drop = FALSE
	possible_item_intents = list(
		/datum/intent/shoot/bow/ferramancy,
		/datum/intent/shoot/bow/ferramancy/arc,
		/datum/intent/shoot/bow/ferramancy/lance,
		INTENT_GENERIC,
		)
	var/reload_cost = 45 // Assuming a full blue bar (10 WIL, no athletics), it's 22 shots
	var/lance_energy = 65 // 15 shots at base 1000 energy
	var/reload_time = 4 SECONDS
	var/reloading = FALSE
	var/lance_cooldown = 10 SECONDS
	COOLDOWN_DECLARE(lance_cd)

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/greatbow/Initialize()
	. = ..()
	chamber_round()

// Caustic Edit. Prevents unloading the bow and making the arrow drop on the floor
/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/greatbow/attack_hand(mob/user)
	if(loc == user && user.is_holding(src))
		to_chat(user, span_warning("\The [src]'s arrow is tightly bound to the string by arcyne forces!"))
		return FALSE
	return ..()

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/greatbow/attack_self(mob/living/user)
	to_chat(user, span_warning("\The [src]'s arrow is permanently fused to the frame!"))
	return FALSE

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/greatbow/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box/magazine) || istype(A, /obj/item/ammo_casing) || istype(A, /obj/item/ammo_box))
		to_chat(user, span_warning("\The [src] cannot be loaded with any other ammunition!"))
		return FALSE
	return ..()
// Caustic Edit end

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/greatbow/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(istype(user.used_intent, /datum/intent/shoot/bow/ferramancy/lance))
		if(!COOLDOWN_FINISHED(src, lance_cd))
			balloon_alert(user, "Lance CD:[CEILING(COOLDOWN_TIMELEFT(src, lance_cd) * 0.1, 1)]s remaining")
			return FALSE
		if(user.energy < lance_energy)
			to_chat(user, span_warning("I haven't the arcyne energy to loose the lance!"))
			return FALSE
		user.energy_add(-lance_energy)
		COOLDOWN_START(src, lance_cd, lance_cooldown)
		fire_lance(target, user)
		return TRUE
	if(!chambered)
		if(!reloading)
			start_reload()
		to_chat(user, span_warning("My greatbow has not yet conjured its next arrow!"))
		return FALSE
	. = ..()
	if(!chambered && !reloading)
		start_reload()
	return .

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/greatbow/proc/fire_lance(atom/target, mob/living/user)
	user.Immobilize(1 SECONDS)
	playsound(get_turf(user), 'sound/magic/scrapeblade.ogg', 80, TRUE)
	var/obj/projectile/magic/arcyne_lance/greatbow/P = new(get_turf(user))
	P.firer = user
	P.preparePixelProjectile(target, user)
	P.fire()

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/greatbow/proc/start_reload()
	if(reloading)
		return
	reloading = TRUE
	addtimer(CALLBACK(src, PROC_REF(finish_reload)), reload_time)

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/greatbow/proc/finish_reload()
	if(QDELETED(src) || !magazine)
		reloading = FALSE
		return
	var/mob/living/holder = isliving(loc) ? loc : null
	if(holder && holder.energy < reload_cost)
		addtimer(CALLBACK(src, PROC_REF(finish_reload)), reload_time)
		return
	reloading = FALSE
	if(holder)
		holder.energy_add(-reload_cost)
	if(!chambered && !magazine.ammo_count())
		magazine.give_round(new /obj/item/ammo_casing/caseless/rogue/arrow/iron/ferramancy(magazine))
	chamber_round()
	update_icon()
	if(holder)
		playsound(loc, 'sound/foley/nockarrow.ogg', 50, TRUE)


/obj/item/ammo_casing/caseless/rogue/bolt/ferramancy
	name = "arcyne bolt"
	desc = "A bolt of condensed arcyne light, drawn from raw mana. It will unravel the instant it strikes home."
	color = GLOW_COLOR_ARCANE
	projectile_type = /obj/projectile/bullet/reusable/bolt/ferramancy

/obj/projectile/bullet/reusable/bolt/ferramancy
	color = GLOW_COLOR_ARCANE
	trains_ranged_skill = FALSE

/obj/projectile/bullet/reusable/bolt/ferramancy/on_hit()
	. = ..()
	QDEL_NULL(dropped)

/obj/projectile/bullet/reusable/bolt/ferramancy/handle_drop()
	QDEL_NULL(dropped)
	return

/* // Caustic Edit, crossbow has been removed, semi-merged into greatbow
/obj/item/ammo_box/magazine/internal/shot/xbow/ferramancy
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt/ferramancy
	start_empty = TRUE

 /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/ferramancy
	name = "arcyne crossbow"
	desc = "A crossbow of condensed arcyne light, conjured from raw mana by a Ferramancer's will. It bears no quiver - drawing the \
	string taut coaxes a bolt of pure energy into being, ready to loose. It draws upon the wielder's own reserves in place of ammunition."
	color = GLOW_COLOR_ARCANE
	minstr = 0
	mag_type = /obj/item/ammo_box/magazine/internal/shot/xbow/ferramancy
	unenchantable = TRUE
	anvilrepair = null
	smeltresult = null
	associated_skill = /datum/skill/combat/arcyne
	/// Arcyne energy drawn from the wielder each time the string is cocked and a bolt is conjured.
	var/conjure_cost = 25

/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/ferramancy/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Drawing the string conjures a bolt of arcyne energy, spending <b>[conjure_cost]</b> of your own energy. It accepts no other ammunition.")

/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/ferramancy/attack_self(mob/living/user)
	if(chambered)
		to_chat(user, span_warning("The conjured bolt unravels as I ease [src] down."))
		dispel_bolt()
		cocked = FALSE
		update_icon()
		return
	if(user.energy < conjure_cost)
		to_chat(user, span_warning("I haven't the arcyne energy to charge [src]!"))
		return
	to_chat(user, span_info("I step on the stirrup and draw [src] taut..."))
	if(!do_after(user, max(1, reloadtime - user.STASTR - user.get_skill_level(/datum/skill/combat/crossbows)), target = user))
		return
	playsound(user, cock_sound, 100, FALSE)
	if(!conjure_bolt(user))
		return
	cocked = TRUE
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/ferramancy/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		to_chat(user, span_warning("[src] draws only upon my own arcyne energy - it will not accept a common bolt."))
		return
	return ..()

/// Spend the wielder's energy to conjure a fresh arcyne bolt and chamber it.
/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/ferramancy/proc/conjure_bolt(mob/living/user)
	if(!magazine)
		return FALSE
	if(user.energy < conjure_cost)
		to_chat(user, span_warning("My arcyne energy fails me at the last moment!"))
		return FALSE
	user.energy_add(-conjure_cost)
	if(!chambered && !magazine.ammo_count())
		magazine.give_round(new /obj/item/ammo_casing/caseless/rogue/bolt/ferramancy(magazine))
	chamber_round()
	playsound(src, 'sound/foley/nockarrow.ogg', 50, TRUE)
	user.visible_message(span_warning("A bolt of arcyne light coalesces upon [src]!"))
	return TRUE

/// Unravel the conjured bolt, emptying the crossbow without dropping anything real.
/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/ferramancy/proc/dispel_bolt()
	if(chambered)
		QDEL_NULL(chambered)
	if(magazine)
		for(var/obj/item/ammo_casing/AC in magazine.stored_ammo)
			magazine.stored_ammo -= AC
			qdel(AC)
	playsound(src, 'sound/magic/magic_nulled.ogg', 40, TRUE)
*/

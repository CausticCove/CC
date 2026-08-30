/obj/item/broom
	name = "broom"
	desc = "A robust-looking broom, made from a bundle of twigs. Sweep away debris, glass, blood, dirt, and time without a care in the world."
	icon = 'icons/roguetown/weapons/tools.dmi'
	icon_state = "broom"
	possible_item_intents = list(/datum/intent/use)
	gripped_intents = list(/datum/intent/use, /datum/intent/mace/strike/wood)
	force = 2
	force_wielded = 4
	throwforce = 1
	firefuel = 10 MINUTES
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_BACK
	walking_stick = TRUE
	smeltresult = /obj/item/ash

/obj/item/broom/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = -1,"nx" = 8,"ny" = 0,"wx" = -4,"wy" = 0,"ex" = 2,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -23,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 4,"sy" = -2,"nx" = -3,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)

/obj/item/broom/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Sweeping time decreases with higher Cooking skill.")
	. += span_info("STRONG intent will make you do a power-sweeping, targeting a 3x3 area!")
	. += span_info("Right-click to twirl it one-handed.")

/obj/item/broom/twirl_fumble(mob/living/user)
	return twirl_fumble_bonk(user)

/obj/item/broom/proc/sweep_time(mob/living/user)
	return max(40 - (user.get_wskill(src) * 15), 5)
/obj/item/broom/proc/sweep_move_time(mob/living/user)
	return max(40 - (user.get_wskill(src) * 15), 5)

/obj/item/broom/proc/sweep_alive(mob/living/user)
	return !QDELETED(user) && user.stat != DEAD

/obj/item/broom/proc/sweep_message(atom/A, mob/living/user)
	user.visible_message(span_notice("[user] dutifully sweeps \the [A]."), span_notice("I dutifully sweep \the [A]."))

/obj/item/broom/proc/is_sweep_trash(obj/O)
	return istype(O, /obj/effect/decal/cleanable/dirt) \
		|| istype(O, /obj/item/paper/crumpled) \
		|| istype(O, /obj/item/ash) \
		|| istype(O, /obj/item/natural/glass_shard) \
		|| istype(O, /obj/effect/decal/cleanable/debris) \
		|| istype(O, /obj/effect/decal/remains/human)

/obj/item/broom/proc/is_clutter(atom/movable/A)
	return istype(A, /obj/item/natural/stone) \
		|| istype(A, /obj/item/scrap) \
		|| istype(A, /obj/item/paper/crumpled) \
		|| istype(A, /obj/item/grown/log/tree/stick) \
		|| istype(A, /obj/item/ash) \
		|| istype(A, /obj/item/organ) \
		|| istype(A, /obj/item/bodypart) \
		|| istype(A, /obj/item/natural/glass_shard) \
		|| istype(A, /obj/item/natural/cloth) \
		|| istype(A, /obj/item/natural/fibers) \
		|| istype(A, /obj/item/natural/silk) \
		|| istype(A, /obj/item/natural/bone) \
		|| istype(A, /obj/item/natural/bundle) \
		|| istype(A, /obj/item/ammo_casing) \
		|| istype(A, /obj/item/rogueweapon/huntingknife/throwingknife)

/obj/item/broom/attack_obj(obj/O, mob/living/user)
	if(istype(O, /obj/structure/spider/stickyweb)) // perish, spiders
		O.take_damage(50, BRUTE, "blunt", FALSE)

	if(do_after(user, 15, target = O))
		user.visible_message("<span class='notice'>[user] dutifully sweeps \the [O.name].</span>", "<span class='notice'>I dutifully sweep \the [O.name].</span>")
		playsound(user, "clothwipe", 100, TRUE)		
		broom_fu(O, user)

// Even if there's nothing mechanically dirty about the floor, you can still sweep it! Anything to look busy. // added a few more to it cause why not
/obj/item/broom/attack_turf(turf/T, mob/living/user)
	if(istype(T, /turf/open/lava)) // lol
		return
	if(istype(T, /turf/open/water))
		return
	if(do_after(user, 20, target = T))
		user.visible_message("<span class='notice'>[user] dutifully sweeps \the [T.name].</span>", "<span class='notice'>I dutifully sweep \the [T.name].</span>")
		playsound(user, 'sound/items/broom_sweep.ogg', 150, TRUE)
		broom_fu(T, user)
		gather_clutter(T, user)

// i should make this delete squires who try to steal your butter too it'll probably be funny
/obj/item/broom/proc/broom_fu(atom/A, mob/living/user)
	if(!A)
		return
	for(var/obj/effect/decal/cleanable/dirt/C in A)
		qdel(C)
	for(var/obj/item/paper/crumpled/C in A)
		qdel(C)
	for(var/obj/item/ash/C in A)
		qdel(C)
	for(var/obj/item/natural/glass_shard/C in A)
		qdel(C)
	for(var/obj/effect/decal/cleanable/debris/woody/C in A)
		qdel(C)
	for(var/obj/effect/decal/cleanable/debris/stony/C in A)
		qdel(C)
	for(var/obj/effect/decal/cleanable/debris/glassy/C in A)
		qdel(C)

/obj/item/broom/proc/gather_clutter(turf/T, mob/living/user)
	if(!T)
		return

	var/count = 0
	var/flufftext = FALSE

	for(var/atom/movable/A in range(1, T))
		if(count >= 10)
			break
		if(A.loc == T) 
			continue
		if(istype(A, /obj/item/natural/stone) || istype(A, /obj/item/scrap) || istype(A, /obj/item/paper/crumpled) || istype(A, /obj/item/grown/log/tree/stick) || istype(A, /obj/item/ash) || istype(A, /obj/item/natural/glass_shard) || istype(A, /obj/item/natural/cloth) || istype(A, /obj/item/natural/fibers) || istype(A, /obj/item/natural/silk) || istype(A, /obj/item/ammo_casing) || istype(A, /obj/item/rogueweapon/huntingknife/throwingknife))
			if(A.loc != T && !QDELETED(A))
				A.forceMove(T)
				count++
				flufftext = TRUE

	if(flufftext)
		user.visible_message("<span class='notice'>[user] gathers the clutter into \the [T.name].</span>", "<span class='notice'>I gather the clutter into \the [T.name].</span>")

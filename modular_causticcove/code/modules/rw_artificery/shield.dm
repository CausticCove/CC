/obj/item/rogueweapon/shield/artificer
	name = "steam shield"
	desc = "A sturdy wood shield thats been highly modified by an artificer. It seems to have several pipes and gears built into it."
	icon = 'modular_causticcove/icons/RW_artificery/32.dmi'
	icon_state = "artificershield"
	force = 15
	throwforce = 10
	dropshrink = 0.8
	coverage = 60
	attacked_sound = list('sound/combat/parry/shield/towershield (1).ogg','sound/combat/parry/shield/towershield (2).ogg','sound/combat/parry/shield/towershield (3).ogg')
	parrysound = list('sound/combat/parry/shield/towershield (1).ogg','sound/combat/parry/shield/towershield (2).ogg','sound/combat/parry/shield/towershield (3).ogg')
	max_integrity = 200
	var/smoke_path = /obj/effect/particle_effect/smoke
	var/cooldowny
	var/cdtime = 30 SECONDS

/obj/item/rogueweapon/shield/artificer/attack_self(mob/user)
	if(cooldowny)
		if(world.time < cooldowny + cdtime)
			to_chat(user, span_warning("[src] hisses weakly, It's still building up steam!"))
			return
	if(prob(25))
		smoke_path = /obj/effect/particle_effect/smoke/bad
	else
		smoke_path = /obj/effect/particle_effect/smoke
	var/list/thrownatoms = list()
	var/atom/throwtarget
	var/distfromcaster
	user.visible_message(span_notice("Loud whizzing clockwork and the hiss of steam comes from within [src]."))
	to_chat(user, span_warning("[user] activates a mechanism on [src]!"))
	sleep(15)
	playsound(user, 'sound/items/steamrelease.ogg', 100, FALSE, -1)
	cooldowny = world.time
	addtimer(CALLBACK(src,PROC_REF(steamready), user), cdtime)
	for(var/atom/movable/AM in view(1, user))
		thrownatoms += AM
	for(var/turf/T in oview(2, user))
		new smoke_path(T) //smoke everywhere!

	for(var/atom/movable/AM as anything in thrownatoms)
		if(AM == user || AM.anchored)
			continue
		throwtarget = get_edge_target_turf(user, get_dir(user, get_step_away(AM, user)))
		distfromcaster = get_dist(user, AM)

		if(distfromcaster == 0)
			if(isliving(AM))
				var/mob/living/M = AM
				M.Paralyze(10)
				M.adjustFireLoss(25)
				to_chat(M, span_danger("You're slammed into the floor by [user]!"))
		else
			if(isliving(AM))
				var/mob/living/M = AM
				M.adjustFireLoss(25)
				to_chat(M, span_danger( "You're thrown back by [user]!"))
			AM.safe_throw_at(throwtarget, 4, 2, user, TRUE, force = MOVE_FORCE_OVERPOWERING)

/obj/item/rogueweapon/shield/artificer/proc/steamready(mob/user)
	playsound(user, 'sound/items/steamcreation.ogg', 100, FALSE, -1)
	to_chat(user, span_warning("[src] is ready to be used again!"))
/obj/item/rogueweapon/shield/artificer/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -5,"sy" = -1,"nx" = 6,"ny" = -1,"wx" = 0,"wy" = -2,"ex" = 0,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.6,"sx" = 1,"sy" = 4,"nx" = 1,"ny" = 2,"wx" = 3,"wy" = 3,"ex" = 0,"ey" = 2,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)

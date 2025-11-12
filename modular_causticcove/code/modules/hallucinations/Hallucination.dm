//Imagine seeing a bunch of wolves and/or goblins or/skeletons charging at you all of a sudden and you start swinging wildly
//People would be hella scared and startled by that and ask you MANY questions...
/obj/effect/hallucination/danger/fake_ambush
	name = "something!?.."
	desc = "OH SHIT OH SHIT OH SHIT OH SHIT OH SHIT OH SHIT OH FUCK OH FUCK OH FUCK OH FUCK OH FUCK"
	obj_integrity = 1
	max_integrity = 1

/obj/effect/hallucination/danger/fake_ambush/Initialize()
	. = ..()
	show_icon()
	START_PROCESSING(SSobj, src)

/obj/effect/hallucination/danger/fake_ambush/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/effect/hallucination/danger/fake_ambush/process()
	show_icon() //Update dir.
	step(src,get_dir(target, src))

/obj/effect/hallucination/danger/fake_ambush/attack_hand()
	to_chat(target, span_bold("It turned to thin air..."))
	qdel(src)

/obj/effect/hallucination/danger/fake_ambush/attackby(obj/item/I, mob/living/user, params)
	to_chat(target, span_bold("It phased through it..."))
	qdel(src)

/obj/effect/hallucination/danger/fake_ambush/bullet_act(obj/projectile/P)
	. = ..()
	to_chat(target, span_bold("It flies right through it..."))
	qdel(src)

/obj/effect/hallucination/danger/fake_ambush/show_icon()
	var/dir
	dir = get_dir(src, target)
	image = image('icons/roguetown/mob/monster/goblins.dmi',src,"goblin",OBJ_LAYER+0.01, dir)
	if(target.client)
		target.client.images += image

/datum/hallucination/fake_ambush/New(mob/living/carbon/carbon, forced = TRUE)
	set waitfor = FALSE
	..()
	var/list/loc_list = list()
	if(!target.halimage)
		for(var/obj/structure/flora/newtree/T in view(7, target))
			loc_list += T.loc
		if(!loc_list.len) //Failsafe.
			for(var/turf/open/floor/O in view(7, target))
				loc_list += O.loc

		if(prob(15))//If you get real unlucky you'd get 5...
			for(var/i in 1 to 5)
				new /obj/effect/hallucination/danger/fake_ambush(pick(loc_list), target)
			return
		for(var/i in 1 to rand(1,3))
			new /obj/effect/hallucination/danger/fake_ambush(pick(loc_list), target)

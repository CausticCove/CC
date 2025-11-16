//Imagine seeing a bunch of wolves and/or goblins or/skeletons charging at you all of a sudden and you start swinging wildly
//People would be hella scared and startled by that and ask you MANY questions...
/obj/effect/hallucination/danger/fake_ambush
	name = "unknown!?.."
	desc = "OH SHIT OH SHIT OH SHIT OH SHIT OH SHIT OH SHIT OH FUCK OH FUCK OH FUCK OH FUCK OH FUCK"
	obj_integrity = 1
	max_integrity = 1
	var/list/chosen_mob = list()

/obj/effect/hallucination/danger/fake_ambush/Initialize(mapload, targ, chosen)
	. = ..()
	target = targ
	chosen_mob = chosen
	show_icon()
	START_PROCESSING(SSobj, src)

/obj/effect/hallucination/danger/fake_ambush/show_icon()
	//Delete our previous image...
	target.client.images -= image
	var/dir
	dir = get_dir(src, target)
	switch(chosen_mob)
		if("volf")
			image = image('icons/roguetown/mob/monster/vol.dmi',src,"vv",OBJ_LAYER+0.01, dir)
		if("skele")
			image = image('modular_hearthstone/icons/mob/skeletons.dmi',src,"skeleton",OBJ_LAYER+0.01, dir)
		if("goblin")
			image = image('icons/roguetown/mob/monster/goblins.dmi',src,"goblin",OBJ_LAYER+0.01, dir)
		if("coon")
			image = image('icons/roguetown/mob/monster/raccoon.dmi',src,"raccoon",OBJ_LAYER+0.01, dir)
		if("fox")
			image = image('icons/roguetown/mob/monster/fox.dmi',src,"fox",OBJ_LAYER+0.01, dir)
		if("dire")
			image = image('icons/roguetown/mob/monster/direbear.dmi',src,"direbear",OBJ_LAYER+0.01, dir)
		if("badger")
			image = image('icons/roguetown/mob/monster/badger.dmi',src,"badger",OBJ_LAYER+0.01, dir)
		if("???")
			image = image('icons/roguetown/mob/monster/horrors.dmi',src,"horror[rand(1,5)]",OBJ_LAYER+0.01, dir)
		if(null) //In case we didn't get one somehow when initializing...
			image = image('modular_hearthstone/icons/mob/abyssal_medium.dmi',src,"dreamfiend",OBJ_LAYER+0.01, dir)
	if(!image) //We hadn't loaded our image yet...
		return
	if(target.client) //Load our new image and dir.
		target.client.images += image

/obj/effect/hallucination/danger/fake_ambush/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/effect/hallucination/danger/fake_ambush/proc/helper_proc()
	sleep(rand(10,30))
	to_chat(target, span_bold("Wait... What!?"))
	target.clear_fullscreen("brute") //Was it real..?
	target.clear_fullscreen("painflash") //Was it real..?

//VERY simple pathfinding.
/obj/effect/hallucination/danger/fake_ambush/process()
	show_icon() //Update dir / icons after Init.

	if(Adjacent(target) && prob(50)) //Some chance to not stun them; To not only scare people but actually allow people to believe in false combat...
		target.jitteriness += 500
		target.do_jitter_animation(target.jitteriness)
		target.Stun(20)
		target.Paralyze(30)
		target.emote("painscream")
		to_chat(target, span_boldred("THEY GOT ME!!!"))
		target.playsound_local(target, 'sound/misc/stolen.ogg', 66)
		target.overlay_fullscreen("painflash", /atom/movable/screen/fullscreen/painflash) //Fake pain...
		target.overlay_fullscreen("brute", /atom/movable/screen/fullscreen/brute, 5) //Fake pain... boogaloo...
		for(var/obj/effect/hallucination/danger/fake_ambush/A in range(10, target))
			if(A.target == target)//Make sure we're actually qdel'ing our hallucinations and not others...
				qdel(A)
		helper_proc()
		qdel(src)
	
	if(prob(15))
		switch(chosen_mob)
			if("skele")
				target.playsound_local(get_turf(src), pick('sound/vo/mobs/skel/skeleton_rage (1).ogg','sound/vo/mobs/skel/skeleton_rage (2).ogg','sound/vo/mobs/skel/skeleton_rage (3).ogg'), 100, 0)
			if("goblin")
				target.playsound_local(get_turf(src), pick('sound/vo/mobs/gob/aggro (1).ogg','sound/vo/mobs/gob/aggro (2).ogg','sound/vo/mobs/gob/aggro (3).ogg','sound/vo/mobs/gob/aggro (4).ogg'), 100, 0)
			if("dire")
				target.playsound_local(get_turf(src), pick('sound/vo/mobs/direbear/direbear_attack1.ogg','sound/vo/mobs/direbear/direbear_attack2.ogg','sound/vo/mobs/direbear/direbear_attack3.ogg'), 100, 0)
			if("volf")
				target.playsound_local(get_turf(src), pick('sound/vo/mobs/vw/aggro (1).ogg','sound/vo/mobs/vw/aggro (2).ogg'), 100, 0)
			if("fox")
				target.playsound_local(get_turf(src), pick('sound/vo/mobs/vw/aggro (1).ogg','sound/vo/mobs/vw/aggro (2).ogg'), 100, 0)
			if("coon")
				target.playsound_local(get_turf(src), pick('sound/vo/mobs/vw/aggro (1).ogg','sound/vo/mobs/vw/aggro (2).ogg'), 100, 0)
			if("badger")
				target.playsound_local(get_turf(src), pick('sound/vo/mobs/vw/aggro (1).ogg','sound/vo/mobs/vw/aggro (2).ogg'), 100, 0)
			if("???")
				target.playsound_local(get_turf(src), 'sound/misc/astratascream.ogg', 100, 1)
			if(null)
				target.playsound_local(get_turf(src), pick('modular_azurepeak/sound/mobs/abyssal/abyssal_attack.ogg','modular_azurepeak/sound/mobs/abyssal/abyssal_attack2.ogg'), 100, 1)
	var/next_turf = get_step(src, get_dir(src, target))
	for(var/obj/effect/hallucination/danger/fake_ambush/O in next_turf)
		//You can't walk here partner... Try another way!
		dir = pick(ALL_CARDINALS)
		step(src, dir)
		return
		
	face_atom(target) //Face the hallucinatee.
	show_icon() //Update dir post-facing...
	step(src, src.dir) //Step...
	target.playsound_local(get_turf(src), pick('sound/foley/footsteps/FTGRA_A1.ogg','sound/foley/footsteps/FTGRA_A2.ogg','sound/foley/footsteps/FTGRA_A3.ogg','sound/foley/footsteps/FTGRA_A4.ogg'), 100, 1)
	sleep(rand(2,7)) //False lag/delay to simulate SSmob ticker delay...

	if(prob(33)) //RNG! Repeat!!
		face_atom(target)
		show_icon()
		step(src, src.dir)
		target.playsound_local(get_turf(src), pick('sound/foley/footsteps/FTGRA_A1.ogg','sound/foley/footsteps/FTGRA_A2.ogg','sound/foley/footsteps/FTGRA_A3.ogg','sound/foley/footsteps/FTGRA_A4.ogg'), 100, 1)
		sleep(rand(1,5))

		if(prob(22)) //AND AGAIN! We got lucky!
			face_atom(target)
			show_icon()
			step(src, src.dir)
			target.playsound_local(get_turf(src), pick('sound/foley/footsteps/FTGRA_A1.ogg','sound/foley/footsteps/FTGRA_A2.ogg','sound/foley/footsteps/FTGRA_A3.ogg','sound/foley/footsteps/FTGRA_A4.ogg'), 100, 1)

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

/datum/hallucination/fake_ambush/New(mob/living/carbon/carbon, forced = TRUE)
	set waitfor = FALSE
	..()
	var/list/loc_list = list()
	var/given_loc
	var/list/chosen_mob = list()
	var/list/possible_references = list("volf","skele","goblin","coon","fox","dire","badger","???")
	chosen_mob = pick(possible_references)
	if(!target.halimage)
		for(var/obj/structure/flora/newtree/T in view(6, target))
			loc_list += T.loc
		if(!loc_list.len) //Failsafe.
			for(var/turf/open/floor/O in view(6, target))
				loc_list += get_turf(O)

		if(prob(15))//If you get real unlucky you'd get 5...
			for(var/i in 1 to 5)
				given_loc = pick(loc_list)
				new /obj/effect/hallucination/danger/fake_ambush(given_loc, target, chosen_mob)
			target.playsound_local(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg','sound/misc/jumphumans (1).ogg','sound/misc/jumphumans (2).ogg','sound/misc/jumphumans (3).ogg'), 100)
			return
		for(var/i in 1 to rand(1,3))
			given_loc = pick(loc_list)
			new /obj/effect/hallucination/danger/fake_ambush(given_loc, target, chosen_mob)
		target.playsound_local(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg','sound/misc/jumphumans (1).ogg','sound/misc/jumphumans (2).ogg','sound/misc/jumphumans (3).ogg'), 100)
	QDEL_IN(src, 50) //Garuntee jumpscare sound plays...

/datum/hallucination/door_knock/New(mob/living/carbon/carbon, forced = TRUE)
	set waitfor = FALSE
	..()
	var/list/possible_doors = list()
	var/list/chosen_door = list()
	for(var/obj/structure/mineral_door/D in oview(7, target))
		if(D.door_opened)
			continue
		possible_doors += D
	if(possible_doors.len)
		chosen_door = pick(possible_doors)
	if(isobj(chosen_door)) //Only do this if we actually have a door k thx bye
		target.playsound_local(get_turf(chosen_door), 'sound/foley/doors/knocking.ogg', 100, 1)
	else if(!isobj(chosen_door))
		var/turf/t = random_far_turf()
		if(prob(50)) //Scare the player if we can't find an in-game door. May need to be tuned louder...
			target.playsound_local(t, pick('modular_causticcove/sound/hallucinations/door_knock_variant1.ogg','modular_causticcove/sound/hallucinations/door_knock_variant2.ogg','modular_causticcove/sound/hallucinations/door_knock_variant3.ogg'), 100, 0)

	QDEL_IN(src, 30) //Garuntee knocking sound plays...

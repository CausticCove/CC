/obj/structure/roguewindow/openclose/attackby(obj/item/W, mob/user, params)
	if(!user.cmode)
		if(istype(W,/obj/item/rogueweapon/huntingknife))
			tryforceopen(W,user)
	. = ..()

/obj/structure/roguewindow/openclose/proc/tryforceopen(obj/item/I, mob/user)
	if(climbable)
		to_chat(user, span_info("It's... it's open... what are you doing..."))
		return
	if(brokenstate)
		to_chat(user,span_warning("Oh no... our window... it's broken!"))
	else
		var/mob/living/L = user

		var/pickskill = user.get_skill_level(/datum/skill/misc/lockpicking)
		var/perbonus = L.STAPER/5
		var/picktime = 70
		var/pickchance = 35

		picktime -= (pickskill * 10)
		picktime = clamp(picktime, 10, 70)

		pickchance += pickskill * 10
		pickchance += perbonus
		pickchance = clamp(pickchance, 1, 95)

		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			message_admins("[H.real_name]([key_name(user)]) is attempting to force the knife inbetween the gaps of [src.name]. [ADMIN_JMP(src)]")
			log_admin("[H.real_name]([key_name(user)]) is attempting to force the knife inbetween the gaps of [src.name].")

		while(!QDELETED(I))
			if(!do_after(user, picktime, target = src))
				break
			if(prob(pickchance))
				playsound(src.loc, pick('sound/items/pickgood1.ogg','sound/items/pickgood2.ogg'), 5, TRUE)
				to_chat(user, span_warning("The knife slips between the windows, allowing you to force them open!"))
				if(L.mind)
					add_sleep_experience(L, /datum/skill/misc/lockpicking, L.STAINT/2)
				open_up(user)
				break
			else
				playsound(loc, 'sound/items/pickbad.ogg', 40, TRUE)
				I.take_damage(10, BRUTE, "blunt")
				to_chat(user, span_warning("You didn't quite manage to get the knife into the gap... but you did manage to damage the blade!"))
				add_sleep_experience(L, /datum/skill/misc/lockpicking, L.STAINT/4)
				continue
		return

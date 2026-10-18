/obj/item/natural/bundle/cloth/proc/bandage_bundle(mob/living/M, mob/user)
	var/used_time = bandage_speed
	var/medskill = 0

	if(ishuman(user))
		var/mob/living/carbon/human/human_user = user
		medskill = human_user.get_skill_level(/datum/skill/misc/medicine)
		used_time -= ((medskill * 10) + (human_user.STASPD / 2)) //With 20 SPD you can insta bandage at max medicine.

	if(istype(M, /mob/living/simple_animal))
		var/mob/living/simple_animal/animal_patient = M
		if(!animal_patient.bruteloss)
			to_chat(user, span_warning("[animal_patient] doesn't need bandaging right now."))
			return
		playsound(loc, 'sound/foley/bandage.ogg', 100, FALSE)
		if(!move_after(user, used_time, target = animal_patient))
			return
		playsound(loc, 'sound/foley/bandage.ogg', 100, FALSE)
		animal_patient.adjustHealth(-((animal_patient.maxHealth / 5) * (medskill + 1)), TRUE)
		user.visible_message(span_notice("[user] bandages [M]'s wounds."), span_notice("I bandage [M]'s wounds."))
		// clear all the wounds
		for(var/datum/wound/wound as anything in animal_patient.get_wounds())
			qdel(wound)
		qdel(src)
		return

	if(!M.can_inject(user, TRUE))
		return

	if(!ishuman(M))
		return

	var/mob/living/carbon/human/H = M
	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if(!affecting)
		return
	if(affecting.bandage)
		to_chat(user, span_warning("There is already a bandage."))
		return

	playsound(loc, 'sound/foley/bandage.ogg', 100, FALSE)
	if(!move_after(user, used_time, target = M))
		return
	playsound(loc, 'sound/foley/bandage.ogg', 100, FALSE)

	switch(amount)
		if(2)
			var/obj/F = new stacktype(src.loc)
			var/obj/I = new stacktype(src.loc)
			H.put_in_hands(F)
			user.visible_message("[user] applies [F] onto [M] from [src].", "I apply [F] onto [M] from [src].")
			update_bundle()
			user.dropItemToGround(I)
			affecting.try_bandage(I)
			H.update_damage_overlays()
			qdel(src)
			return
		else
			amount -= 1
			var/bandage = new src.stacktype(src.loc)
			user.visible_message("[user] applies [bandage] onto [M] from [src].", "I apply [bandage] onto [M] from [src].")
			update_bundle()
			user.dropItemToGround(bandage)
			affecting.try_bandage(bandage)
			H.update_damage_overlays()

	if(M == user)
		user.visible_message(span_notice("[user] bandages [user.p_their()] [affecting]."), span_notice("I bandage my [affecting.name]."))
	else
		user.visible_message(span_notice("[user] bandages [M]'s [affecting]."), span_notice("I bandage [M]'s [affecting.name]."))

/obj/item/natural/bundle/cloth/attack(mob/living/M, mob/living/user)
	bandage_bundle(M, user)

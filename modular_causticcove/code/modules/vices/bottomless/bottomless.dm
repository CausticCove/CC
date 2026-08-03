/datum/charflaw/bottomless
	name = "Bottomless"
	desc = "I can eat a lot more then others, be it from desire or simply need, but if I let my hunger get bad... It's awful."
	var/last_check = 0

/datum/charflaw/bottomless/apply_post_equipment(mob/user)
	. = ..()
	user.maxnutrition = NUTRITION_LEVEL_FULL * 1.5

/datum/charflaw/bottomless/flaw_on_life(mob/user)
	. = ..()
	if(world.time < last_check + 30 SECONDS)
		return
	if(!user)
		return
	if(user.stat == DEAD)
		return
	last_check = world.time

	//Then lets have a scaling stressor that just increases the negative stress for each hunger state! It'll be a lot worse then before, but not uncapped and unmanageable after a while.
	if(user.nutrition < NUTRITION_LEVEL_STARVING)
		user.remove_stress(/datum/stressevent/glutton_peckish)
		user.remove_stress(/datum/stressevent/glutton_hungry)
		user.add_stress(/datum/stressevent/glutton_ravenous)
	else if(user.nutrition < NUTRITION_LEVEL_HUNGRY)
		user.remove_stress(/datum/stressevent/glutton_peckish)
		user.remove_stress(/datum/stressevent/glutton_ravenous)
		user.add_stress(/datum/stressevent/glutton_hungry)
	else if(user.nutrition < NUTRITION_LEVEL_FED)
		user.remove_stress(/datum/stressevent/glutton_hungry)
		user.remove_stress(/datum/stressevent/glutton_ravenous)
		user.add_stress(/datum/stressevent/glutton_peckish)
	else
		user.remove_stress(/datum/stressevent/glutton_peckish)
		user.remove_stress(/datum/stressevent/glutton_hungry)
		user.remove_stress(/datum/stressevent/glutton_ravenous)




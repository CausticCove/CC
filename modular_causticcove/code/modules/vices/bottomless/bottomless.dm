/datum/charflaw/bottomless
	name = "Bottomless"
	desc = "More food! MORE!"
	var/last_check = 0

/datum/charflaw/bottomless/flaw_on_life(mob/user)
	. = ..()
	if(world.time < last_check + 10 SECONDS)
		return
	if(!user)
		return
	if(user.stat == DEAD)
		return
	last_check = world.time
	user.maxnutrition += user.maxnutrition * 0.002
	if(user.maxnutrition * 0.8 > user.nutrition)
		user.add_stress(/datum/stressevent/glutton)
	else
		user.remove_stress(/datum/stressevent/glutton)




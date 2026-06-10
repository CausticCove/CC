//Defines for nutritional amounts can be located in mobs.dm
//This handles the rewards via goals met.
/datum/species/proc/handle_diet(mob/living/carbon/human/H)
	var/all_diets = find_diet_value(H, return_all = TRUE)
	var/goals_met = 0

	//Check for every diet first.
	for(var/i in 1 to length(all_diets))
		var/cur_val = all_diets[i]
		if(cur_val > NUTRITIONAL_GOAL)
			goals_met++
	
	//The actual handling of the rewards and diet decay.
	if(goals_met >= NUTRITIONAL_REWARD_MAX) //Decays slower and has a better wound bonus.
		adjust_diet_value(H, NUTRITIONAL_DIET_TYPES, FULL_REWARD_NUTRITIONAL_DECAY)

		//Moderate wounds only. Tweak when necessary.
		for(var/datum/wound/wound as anything in H.get_wounds())
			if(wound.severity <= WOUND_SEVERITY_MODERATE)
				wound.heal_wound(0.6)

		dietary_goals_met = TRUE
		return

	if(goals_met >= NUTRITIONAL_REWARD_MIN) //Heal from wounds, and gives us a bonus triumph if we sustain a good diet at night. Lowers decay rates as well.
		adjust_diet_value(H, NUTRITIONAL_DIET_TYPES, MIN_REWARD_NUTRITIONAL_DECAY)

		//Moderate wounds only. Tweak when necessary.
		for(var/datum/wound/wound as anything in H.get_wounds())
			if(wound.severity <= WOUND_SEVERITY_MODERATE)
				wound.heal_wound(0.3)

		dietary_goals_met = TRUE
		return

	if(goals_met < NUTRITIONAL_REWARD_MIN) //We've not yet reached a reward goal. Slow down our decay. Has no benefits or downsides.
		adjust_diet_value(H, NUTRITIONAL_DIET_TYPES, DEFAULT_NUTRITIONAL_DECAY)
		dietary_goals_met = FALSE


/datum/species/proc/adjust_diet_value(mob/living/carbon/human/H, diet_types, change)
	var/cur_diets = diet_types
	for(var/i in 1 to length(diet_types))
		var/cur_diet = cur_diets[i]
		if(HAS_TRAIT(src, TRAIT_NOHUNGER))
			change = NUTRITIONAL_MIN_AMT // No Hunger? No benefits.
		switch(cur_diet)
			if("Dairy")
				H.nutri_dairy = max(NUTRITIONAL_MIN_AMT, (min(NUTRITIONAL_MAX_AMT, H.nutri_dairy) + change))
			if("Meats")
				H.nutri_meat = max(NUTRITIONAL_MIN_AMT, (min(NUTRITIONAL_MAX_AMT, H.nutri_meat) + change))
			if("Fruits")
				H.nutri_fruit = max(NUTRITIONAL_MIN_AMT, (min(NUTRITIONAL_MAX_AMT, H.nutri_fruit) + change))
			if("Vegetables")
				H.nutri_vegetable = max(NUTRITIONAL_MIN_AMT, (min(NUTRITIONAL_MAX_AMT, H.nutri_vegetable) + change))
			if("Grains")
				H.nutri_grain = max(NUTRITIONAL_MIN_AMT, (min(NUTRITIONAL_MAX_AMT, H.nutri_grain) + change))

/datum/species/proc/set_diet_value(mob/living/carbon/human/H, diet_types, change)
	var/cur_diets = diet_types
	for(var/i in 1 to length(diet_types))
		var/cur_diet = cur_diets[i]
		if(HAS_TRAIT(src, TRAIT_NOHUNGER))
			change = NUTRITIONAL_MIN_AMT // No Hunger? No benefits.
		switch(cur_diet)
			if("Dairy")
				H.nutri_dairy = max(NUTRITIONAL_MIN_AMT, change)
			if("Meats")
				H.nutri_meat = max(NUTRITIONAL_MIN_AMT, change)
			if("Fruits")
				H.nutri_fruit = max(NUTRITIONAL_MIN_AMT, change)
			if("Vegetables")
				H.nutri_vegetable = max(NUTRITIONAL_MIN_AMT, change)
			if("Grains")
				H.nutri_grain = max(NUTRITIONAL_MIN_AMT, change)


/datum/species/proc/find_diet_value(mob/living/carbon/human/H, diet_types, return_all)
	//Internal Variable that lists all of the current diets.
	. = list()
	if(return_all)
		diet_types = NUTRITIONAL_DIET_TYPES
	for(var/i in 1 to length(diet_types))
		switch(diet_types[i])
			if("Dairy")
				. += H.nutri_dairy
			if("Meats")
				. += H.nutri_meat
			if("Fruits")
				. += H.nutri_fruit
			if("Vegetables")
				. += H.nutri_vegetable
			if("Grains")
				. += H.nutri_grain


/mob/living/carbon/human/proc/examine_weight()
	if(!show_pudge() || !weight_message_visible) //Some clothing or equipment can hide this.
		return ""
	var/message = ""
	var/weight_examine = round(weight)
	switch(weight_examine)
		if(0 to 74)
			message = weight_messages[1]
		if(75 to 99)
			message = weight_messages[2]
		if(100 to 124)
			message = weight_messages[3]
		if(125 to 174)
			message = weight_messages[4]
		if(175 to 224)
			message = weight_messages[5]
		if(225 to 274)
			message = weight_messages[6]
		if(275 to 325)
			message = weight_messages[7]
		if(325 to 374)
			message = weight_messages[8]
		if(375 to 474)
			message = weight_messages[9]
		else
			message = weight_messages[10]
	if(message)
		message = span_notice("[message]")
	return message //Credit to Aronai for helping me actually get this working!

/mob/living/carbon/human/proc/examine_nutrition()
	if(!show_pudge() || !nutrition_message_visible) //Some clothing or equipment can hide this.
		return ""
	//if(nutrition_hidden) // Chomp Edit
	//	return ""
	var/message = ""
	var/nutrition_examine = round(nutrition)
	switch(nutrition_examine)
		if(0 to 49)
			message = nutrition_messages[1]
		if(50 to 99)
			message = nutrition_messages[2]
		if(100 to 499)
			message = nutrition_messages[3]
		if(500 to 999) // Fat.
			message = nutrition_messages[4]
		if(1000 to 1399)
			message = nutrition_messages[5]
		if(1400 to 1934) // One person fully digested.
			message = nutrition_messages[6]
		if(1935 to 3004) // Two people.
			message = nutrition_messages[7]
		if(3005 to 4074) // Three people.
			message = nutrition_messages[8]
		if(4075 to 5124) // Four people.
			message = nutrition_messages[9]
		if(5125 to INFINITY) // More.
			message = nutrition_messages[10]
	if(message)
		message = span_notice("[message]")
	return message

/mob/living/carbon/human/proc/examine_pickup_size(mob/living/H)
	var/message = ""
	if(istype(H) && (H.get_effective_size(FALSE) - src.get_effective_size(TRUE)) >= 0.50)
		message = span_blue("They are small enough that you could easily pick them up!")
	return message

/mob/living/carbon/human/proc/examine_step_size(mob/living/H)
	var/message = ""
	if(istype(H) && (H.get_effective_size(FALSE) - src.get_effective_size(TRUE)) >= 0.75)
		message = span_red("They are small enough that you could easily trample them!")
	return message

/mob/living/carbon/human/proc/examine_body_writing()
	. = list()

	for(var/obj/item/bodypart/bodypart in bodyparts)
		var/writing = LAZYACCESS(body_writing, bodypart)
		if(writing)
			var/visible = FALSE
			switch(bodypart.body_zone)
				if(BODY_ZONE_CHEST)
					if(!wear_shirt && !wear_armor && !cloak)
						visible = TRUE
				if(BODY_ZONE_HEAD)
					if(!wear_mask && !head)
						visible = TRUE
				if(BODY_ZONE_L_ARM)
					if(!wear_shirt && !wear_armor && !wear_wrists)
						visible = TRUE
				if(BODY_ZONE_R_ARM)
					if(!wear_shirt && !wear_armor && !wear_wrists)
						visible = TRUE
				if(BODY_ZONE_L_LEG)
					if(!wear_pants)
						visible = TRUE
				if(BODY_ZONE_R_LEG)
					if(!wear_pants)
						visible = TRUE
				if(BODY_ZONE_TAUR)
					if(!wear_pants)
						visible = TRUE
		
			if(!visible)
				continue

			. += span_notice("[p_they(TRUE)] [p_have()] \"[writing]\" written on [p_their()] [parse_zone(bodypart)].")

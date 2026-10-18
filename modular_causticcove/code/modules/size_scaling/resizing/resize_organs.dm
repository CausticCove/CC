/proc/resize_breasts(var/size, var/mob/living/carbon/human/target)
	if(!target || size < MIN_BREASTS_SIZE || size > MAX_BREASTS_SIZE)
		return

	var/obj/item/organ/breasts/booba = target.internal_organs_slot[ORGAN_SLOT_BREASTS]
	if(!booba)
		return

	booba.breast_size = size
	target.update_body_parts(TRUE)

/proc/resize_belly(var/size, var/mob/living/carbon/human/target)
	if(!target || size < MIN_BELLY_SIZE || size > MAX_BELLY_SIZE)
		return

	var/obj/item/organ/belly/tum = target.internal_organs_slot[ORGAN_SLOT_BELLY]
	if(!tum)
		return

	tum.belly_size = size
	target.update_body_parts(TRUE)

/proc/resize_penis(var/size, var/mob/living/carbon/human/target)
	if(!target || size < MIN_PENIS_SIZE || size > MAX_PENIS_SIZE)
		return

	var/obj/item/organ/penis/dong = target.internal_organs_slot[ORGAN_SLOT_PENIS]
	if(!dong)
		return

	dong.penis_size = size
	target.update_body_parts(TRUE)

/proc/resize_testicles(var/size, var/mob/living/carbon/human/target)
	if(!target || size < MIN_TESTICLES_SIZE || size > MAX_TESTICLES_SIZE)
		return

	var/obj/item/organ/testicles/balls = target.internal_organs_slot[ORGAN_SLOT_TESTICLES]
	if(!balls)
		return

	balls.ball_size = size
	target.update_body_parts(TRUE)

/proc/resize_butt(var/size, var/mob/living/carbon/human/target)
	if(!target || size < MIN_BUTT_SIZE || size > MAX_BUTT_SIZE)
		return

	var/obj/item/organ/butt/ass = target.internal_organs_slot[ORGAN_SLOT_BUTT]
	if(!ass)
		return

	ass.butt_size = size
	target.update_body_parts(TRUE)

/mob/living/carbon/human/verb/adjust_assets()
	set name = "Adjust Assets"
	set desc = "An OOC way to adjust the size of your parts, intended for use in scenes and the like! Expects that you do have the selected part."
	set category = "OOC.Chat"

	var/list/assets = list("Belly", "Breasts", "Penis", "Testicles", "Butt")
	var/asset_choice = tgui_input_list(src, "What asset do you want to adjust?", "Adjust Assets", assets)
	if(!asset_choice)
		return

	switch(asset_choice)
		if("Belly")
			var/size = tgui_input_number(src, "What size do you desire?", "Belly Size", DEFAULT_BELLY_SIZE, MAX_BELLY_SIZE, MIN_BELLY_SIZE)
			if(!size)
				size = MIN_BELLY_SIZE //For some reason the input number returns nothing if it's given 0? Lets just default to the minimum as a fallback.

			to_chat(src, span_notice("Attempting to resize your belly to [size]..."))
			resize_belly(size, src)
			src.update_body_parts(TRUE)
			return
		if("Breasts")
			var/size = tgui_input_number(src, "What size do you desire?", "Breast Size", DEFAULT_BREASTS_SIZE, MAX_BREASTS_SIZE, MIN_BREASTS_SIZE)
			if(!size)
				size = MIN_BREASTS_SIZE

			to_chat(src, span_notice("Attempting to resize your breasts to [size]..."))
			resize_breasts(size, src)
			src.update_body_parts(TRUE)
			return
		if("Penis")
			var/size = tgui_input_number(src, "What size do you desire?", "Penis Size", DEFAULT_PENIS_SIZE, MAX_PENIS_SIZE, MIN_PENIS_SIZE)
			if(!size)
				size = MIN_PENIS_SIZE

			to_chat(src, span_notice("Attempting to resize your penis to [size]..."))
			resize_penis(size, src)
			src.update_body_parts(TRUE)
			return
		if("Testicles")
			var/size = tgui_input_number(src, "What size do you desire?", "Testicles Size", DEFAULT_TESTICLES_SIZE, MAX_TESTICLES_SIZE, MIN_TESTICLES_SIZE)
			if(!size)
				size = MIN_TESTICLES_SIZE

			to_chat(src, span_notice("Attempting to resize your testicles to [size]..."))
			resize_testicles(size, src)
			src.update_body_parts(TRUE)
			return
		if("Butt")
			var/size = tgui_input_number(src, "What size do you desire?", "Butt Size", DEFAULT_BUTT_SIZE, MAX_BUTT_SIZE, MIN_BUTT_SIZE)
			if(!size)
				size = MIN_BUTT_SIZE

			to_chat(src, span_notice("Attempting to resize your butt to [size]..."))
			resize_butt(size, src)
			src.update_body_parts(TRUE)
			return

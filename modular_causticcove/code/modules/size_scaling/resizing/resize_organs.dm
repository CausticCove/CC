/proc/resize_breasts(var/size, var/mob/living/carbon/human/target)
	if(!target || !size)
		return
	
	var/obj/item/organ/breasts/booba = target.internal_organs_slot[ORGAN_SLOT_BREASTS]
	if(!booba)
		return

	booba.breast_size = size

/proc/resize_belly(var/size, var/mob/living/carbon/human/target)
	if(!target || !size)
		return
	
	var/obj/item/organ/belly/tum = target.internal_organs_slot[ORGAN_SLOT_BELLY]
	if(!tum)
		return

	tum.belly_size = size

/proc/resize_penis(var/size, var/mob/living/carbon/human/target)
	if(!target || !size)
		return
	
	var/obj/item/organ/penis/dong = target.internal_organs_slot[ORGAN_SLOT_PENIS]
	if(!dong)
		return
	
	dong.penis_size = size

/proc/resize_testicles(var/size, var/mob/living/carbon/human/target)
	if(!target || !size)
		return
	
	var/obj/item/organ/testicles/balls = target.internal_organs_slot[ORGAN_SLOT_TESTICLES]
	if(!balls)
		return
	
	balls.ball_size = size

/proc/resize_butt(var/size, var/mob/living/carbon/human/target)
	if(!target || !size)
		return
	
	var/obj/item/organ/butt/ass = target.internal_organs_slot[ORGAN_SLOT_BUTT]
	if(!ass)
		return
	
	ass.organ_size = size

/mob/living/carbon/human/proc/handle_micro_bump_helping(mob/living/carbon/human/tmob)
	//Riding and being moved to us or something similar
	if(tmob in buckled_mobs)
		return TRUE
	if(!ishuman(src)|| !ishuman(tmob))
		return FALSE
	if(HAS_TRAIT(src, TRAIT_MICRO) && HAS_TRAIT(tmob, TRAIT_MICRO))		// So a grand total of 1 and a half pixels won't bodyblock eachother on 2x2 meters
		return TRUE

	if(small_enough(tmob))
		to_chat(src, "<span class='filter_notice'>You move below [tmob]</span>")
		to_chat(tmob, "<span class='filter_notice'>[src] moves between below you.</span>")
		return TRUE
	else if(tmob.small_enough(src))	
		to_chat(src, "<span class='filter_notice'>You carefully move over [tmob].</span>")
		to_chat(tmob, "<span class='filter_notice'>[src] moves over you carefully!.</span>")
		return TRUE
	else
		return FALSE

/mob/living/carbon/human/proc/attempt_scoop(mob/living/carbon/human/grabby)
	if(!small_enough(grabby))
		return FALSE
	if(!can_be_picked_up(grabby))
		return FALSE
	set_resting(FALSE,FALSE)
	var/obj/item/micro/friend = new /obj/item/micro(get_turf(grabby), src)
	grabby.put_in_hands(friend)
	to_chat(grabby, span_notice("You scoop up \the [src]!"))
	to_chat(src, span_notice("\The [grabby] scoops you up!"))
	return friend


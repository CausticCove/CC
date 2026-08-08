/obj/item/clothing/shoes/roguetown
	var/obj/item/holder/trapped_mob_holder

/obj/item/clothing/shoes/roguetown/proc/trap_mob_in_shoes(var/obj/item/holder/trapped_mob)
	trapped_mob_holder = trapped_mob
	trapped_mob.forceMove(src)

/obj/item/clothing/shoes/roguetown/examine(mob/user)
	. = ..()
	if(trapped_mob_holder)
		. += span_notice("There is someone stuck against the bottom of your [src.name]! <a href='?src=[REF(src)];task=take_mob;'>Pull them off?</a>")

/obj/item/clothing/shoes/roguetown/Topic(href, href_list)
	. = ..()

	if(href_list["task"] == "take_mob")
		if(iscarbon(usr))
			var/mob/living/carbon/C = usr

			if(C.get_active_held_item())
				to_chat(C, span_notice("You take a look at the bottom of your [src.name] and see [trapped_mob_holder.name] stuck there, but your hand is full currently!"))
			else
				to_chat(C, span_notice("You take a look at the bottom of your [src.name] and see [trapped_mob_holder.name] stuck there! In one motion, you now have them in your hand instead."))
				C.put_in_active_hand(trapped_mob_holder)
				trapped_mob_holder = null

/obj/structure/fluff/grindwheel
	name = "grinding wheel"
	desc = "Steadily hums when operated, a massive wheel of grinding stone. It can be used to sharpen blades, and to cut logs into planks."
	icon = 'icons/roguetown/misc/forge.dmi'
	icon_state = "grindwheel"
	density = TRUE
	anchored = FALSE
	blade_dulling = DULLING_BASH
	max_integrity = 300
	var/grind_speed = 40 // 4 seconds // Caustic edit

/obj/structure/fluff/grindwheel/attackby(obj/item/I, mob/living/user, params)
	if(I.max_blade_int)
		playsound(loc,'sound/foley/grindblade.ogg', 100, FALSE)
		if(do_after(user, grind_speed, target = src)) // Caustic edit
			I.restore_bintegrity()
		return
	if(istype(I, /obj/item/grown/log/tree/small))
		var/skill_level = user.get_skill_level(/datum/skill/craft/carpentry)
		var/wood_time = (grind_speed - (skill_level * 5)) // Caustic edit
		playsound(src, pick('sound/misc/slide_wood (2).ogg', 'sound/misc/slide_wood (1).ogg'), 100, FALSE)
		if(do_after(user, wood_time, target = src))
			if(prob(max(40 - (skill_level * 10), 0)) || !skill_level) //Chance maxes at level 4
				to_chat(user, span_info("Curses! I ruined this piece of wood..."))
				playsound(src,'sound/combat/hits/onwood/destroyfurniture.ogg', 100, FALSE)
			else
				new /obj/item/natural/wood/plank(get_turf(src))
			user.mind.add_sleep_experience(/datum/skill/craft/carpentry, (user.STAINT*0.5))
			qdel(I)
			return
	. = ..()

// Caustic Edit start vv
/obj/structure/fluff/grindwheel/polishstone
	name = "polishing stone"
	desc = "A large stone with a flat surface used to slowly sharpen blades or smooth wood."
	icon_state = "polishstone"
	density = FALSE
	anchored = FALSE
	grind_speed = 600 // Very slow, 1 minute.

/obj/structure/fluff/grindwheel/polishstone/Initialize()
	icon_state = "polishstone[rand(1,2)]"
	..()
// Caustic Edit end ^^

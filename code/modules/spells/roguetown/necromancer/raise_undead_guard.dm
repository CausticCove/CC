
/obj/effect/proc_holder/spell/invoked/raise_undead_guard
	name = "Conjure Undead"
	//Caustic Edit
	desc = "Invoke forbidden magicka to summon a mindless, shambling skeleton. </br>These Mindless skeletons can not be given orders to guard, patrol, and attack by their \
	summoner. </br>These skeletons are stronger than their less complex-jointed counterparts."
	//Caustic Edit end
	clothes_req = FALSE
	overlay_state = "animate"
	range = 7
	sound = list('sound/magic/magnet.ogg')
	//Caustic Edit
	releasedrain = 20
	chargetime = 2 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	charging_slowdown = 1
	chargedloop = /datum/looping_sound/invokegen
	gesture_required = TRUE // Summon spell
	associated_skill = /datum/skill/magic/arcane
	recharge_time = 20 SECONDS
	//Caustic Edit end
	hide_charge_effect = TRUE

/obj/effect/proc_holder/spell/invoked/raise_undead_guard/cast(list/targets, mob/living/user)
	..()

	if(istype(get_area(user), /area/rogue/indoors/ravoxarena))
		to_chat(user, span_userdanger("I reach for outer help, but something rebukes me! This challenge is only for me to overcome!"))
		revert_cast()
		return FALSE
		
	var/turf/T = get_turf(targets[1])
	if(!isopenturf(T))
		to_chat(user, span_warning("The targeted location is blocked. My summon fails to come forth."))
		return FALSE

	new /obj/effect/temp_visual/gib_animation(T, "gibbed-h")
	//Caustic Edit
	var/mob/living/skeleton_new = new /mob/living/carbon/human/species/skeleton/npc/summon/random(T, user)
	//Caustic Edit end
	spawn(11) //Ashamed of this but I hate how after_creation() uses spawn too and I'm not making a timer for this. Proc needs a look-over. - Ryan
		skeleton_new.faction |= list("cabal", "[user.mind.current.real_name]_faction")
	return TRUE

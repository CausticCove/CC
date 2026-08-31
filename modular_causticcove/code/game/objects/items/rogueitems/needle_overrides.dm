//Complete Proc and Variable Overwrite for Caustic Cove. Cleans up the code performance and reworks sewing.
#define SEW_HP_EXP_NORMALIZER 100

// How much EXP per sewing action per intelligence
// 1 EXP at 10 INT
#define SEW_EXP_PER_STEP 0.1 //Modified from 0.06
// How much EXP per 100 sew threshold fixed per intelligence
// 12.5 EXP at 10 INT for 100 sew treshold
#define SEW_EXP_FINISH 1.25 //Modified from 0.75

//How much we heal per sew.
#define SEW_WHP_HEALING 4.5

//How much blood we stop per sew.
#define SEW_BLEED_REDUCTION 0.2

#define SEW_START_DELAY 3 SECONDS

//Can be used in a pinch to sew minor injuries/wounds.
/obj/item/needle/thorn
	stringamt = 35
	maxstring = 35

//Similar to thorn, a better, but more primitive advancement in needle usage.
/obj/item/needle/bone
	stringamt = 45
	maxstring = 45

//Ancient needle. Nothing amazing. Just 40 threads to use.
/obj/item/needle/aalloy
	stringamt = 65
	maxstring = 65

//Normal Needles have 100 string and max string. A doctors best friend.
/obj/item/needle
	stringamt = 100
	maxstring = 100

//A proper needle that utilizes a much more costly material than iron. Has significantly more string and
//acts as a direct upgrade from the default needle.
/obj/item/needle/bronze
	stringamt = 150
	maxstring = 150

//Has infinite already.
//obj/item/needle/pestra

/obj/item/needle/proc/sew(mob/living/target, mob/living/user)

	//Handle returns.
	if(!istype(user))
		return FALSE

	if(stringamt < 1)
		to_chat(user, span_warning("The needle has no thread left!"))
		return

	var/list/sewable
	var/obj/item/bodypart/affecting
	var/is_simple_animal = !iscarbon(target)

	if(iscarbon(target))
		affecting = target.get_bodypart(check_zone(user.zone_selected))

		if(!affecting)
			to_chat(user, span_warning("That limb is missing."))
			return FALSE

		if(isooze(target))
			to_chat(user, span_warning("You can't sew an Ooze, their wounds must be burned closed."))
			return FALSE

		sewable = affecting.get_sewable_wounds()
	else
		sewable = target.get_sewable_wounds()

	if(!length(sewable))
		to_chat(user, span_warning("There aren't any wounds to be sewn."))
		return FALSE

	var/datum/wound/target_wound = sewable.len > 1 ? input(user, "Which wound?", "[src]") as null|anything in sewable : sewable[1]
	if(!target_wound)
		return FALSE

	//Heal SEW_WHP_HEALING (6) + value of user's skill, up to 12whp per use.
	var/medskill = med_skill_check(user)
	var/whp_healing_per_use = SEW_WHP_HEALING + medskill
	var/informed = FALSE

	switch(medskill)
		if(0 to 2) //Just to notify the player that this will be really slow if they're trying to fix their injuries by themselves.
			to_chat(user, span_warning("This is going to take me a while... I should find a bed to sleep, or heal my injuries through other means if I want to speed this up."))

	while(!QDELETED(target_wound) && !QDELETED(src) && !QDELETED(user) && (target_wound.sew_progress < target_wound.sew_threshold) && stringamt >= 1)
		//Handle the sewing delay, this is by default 3 seconds divided by your skill, up to 0.5 seconds at max medical.
		var/sewing_start_delay = SEW_START_DELAY

		if(medskill == SKILL_LEVEL_APPRENTICE)
			sewing_start_delay = 2.5 SECONDS //Yes this is intentionally not meant to be 1.5 seconds, keep it at 2.5 seconds.
		else
			sewing_start_delay /= medskill

		if(!do_after(user, sewing_start_delay, target = target))
			break

		//Handle dynamic wounds first and foremost so they are no longer gushing blood.
		if(istype(target_wound, /datum/wound/dynamic))
			var/datum/wound/dynamic/dynwound = target_wound
			if(dynwound.is_maxed)
				dynwound.is_maxed = FALSE
			if(dynwound.is_armor_maxed)
				dynwound.is_armor_maxed = FALSE

		//Handle bleeding rates.
		//Bleeding reduction is significantly worse for users below journeyman skills in medical.
		//Use bandages to help stop the bleeding outright.
		var/bleedreduction = SEW_BLEED_REDUCTION
		switch(medskill)
			if(SKILL_LEVEL_JOURNEYMAN) //Journeyman and above get significantly better bleed reductions.
				bleedreduction += 0.25
			if(SKILL_LEVEL_EXPERT)
				bleedreduction += 0.5
			if(SKILL_LEVEL_MASTER)
				bleedreduction += 1
			if(SKILL_LEVEL_LEGENDARY)
				bleedreduction += 2.5

		target_wound.set_bleed_rate(max( (target_wound.bleed_rate - bleedreduction), 0))

		if(target_wound.bleed_rate == 0 && !informed)
			if(is_simple_animal)
				target.visible_message(span_smallgreen("One last drop of blood trickles from the [(target_wound?.name)] on [target] before it closes."), span_smallgreen("The throbbing warmth coming out of the [target_wound] soothes and stops. It no longer bleeds."))
				record_round_statistic(STATS_WOUNDS_SEWED) // CC Edit
			else
				target.visible_message(span_smallgreen("One last drop of blood trickles from the [(target_wound?.name)] on [target]'s [affecting.name] before it closes."), span_smallgreen("The throbbing warmth coming out of the [target_wound] soothes and stops. It no longer bleeds."))
				record_round_statistic(STATS_WOUNDS_SEWED) // CC Edit
			informed = TRUE

		//Handle sewing progress.
		//Consume the thread in the needle. Always consumes 1 per cycle of thread being used and applies EXP per use.

		//At Journeyman and Above you heal more effectively.
		switch(medskill)
			if(SKILL_LEVEL_JOURNEYMAN)
				whp_healing_per_use += 1
			if(SKILL_LEVEL_EXPERT)
				whp_healing_per_use += 3
			if(SKILL_LEVEL_MASTER)
				whp_healing_per_use += 5
			if(SKILL_LEVEL_LEGENDARY)
				whp_healing_per_use += 10

		target_wound.sew_progress = min(target_wound.sew_progress + whp_healing_per_use, target_wound.sew_threshold)

		if(target_wound.sew_progress < target_wound.sew_threshold)
			use(1)
			playsound(loc, 'sound/foley/sewflesh.ogg', 100, TRUE, -2)
			if(user.mind)
				user.mind.add_sleep_experience(/datum/skill/misc/medicine, user.STAINT * SEW_EXP_PER_STEP)
			continue

		if(user.mind)
			var/exp_scale = target_wound.sew_threshold / SEW_HP_EXP_NORMALIZER
			var/base_exp = user.STAINT * SEW_EXP_FINISH
			user.mind.add_sleep_experience(/datum/skill/misc/medicine, base_exp * exp_scale)

		//Handle the wound closing if we reached our sewing threshold.
		target_wound.sew_wound()

		//Handle user and target feedback.
		if(target == user)
			if(is_simple_animal)
				user.visible_message(span_notice("[user] sews \a [target_wound.name] on [user.p_them()]self."), span_notice("I stitch \a [target_wound.name] on myself."))
			else
				user.visible_message(span_notice("[user] sews \a [target_wound.name] on [user.p_them()]self."), span_notice("I stitch \a [target_wound.name] on my [affecting]."))
		else
			if(is_simple_animal)
				user.visible_message(span_notice("[user] sews \a [target_wound.name] on [target]."), span_notice("I stitch \a [target_wound.name] on [target]."))
			else if(affecting)
				user.visible_message(span_notice("[user] sews \a [target_wound.name] on [target]'s [affecting]."), span_notice("I stitch \a [target_wound.name] on [target]'s [affecting]."))
			else
				user.visible_message(span_notice("[user] sews \a [target_wound.name] on [target]."), span_notice("I stitch \a [target_wound.name] on [target]."))

		//Handle simple mob healing.
		if(is_simple_animal)
			var/mob/living/simple_animal/animal_target = target
			animal_target.adjustHealth(-((animal_target.maxHealth / 20) * (medskill + 1)), TRUE)

		log_combat(user, target, "sew", "needle")
		return TRUE
	return FALSE

//Checks the medical skill and returns a value correlating to that skill level.
/obj/item/needle/proc/med_skill_check(mob/living/user)
	var/medskill = user.get_skill_level(/datum/skill/misc/medicine)
	if(medskill == SKILL_LEVEL_NOVICE)
		medskill = 0.5 //Unskilled users will perform very poorly but can still attempt.
	return medskill

#undef SEW_START_DELAY
#undef SEW_BLEED_REDUCTION
#undef SEW_WHP_HEALING
#undef SEW_HP_EXP_NORMALIZER
#undef SEW_EXP_PER_STEP
#undef SEW_EXP_FINISH

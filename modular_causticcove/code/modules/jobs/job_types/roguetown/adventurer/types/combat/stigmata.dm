	// Weaker absolve for the Stigmata adventurer
/obj/effect/proc_holder/spell/invoked/psydonamend
	name = "AMEND"
	action_icon = 'icons/mob/actions/psydonmiracles.dmi'
	overlay_icon = 'icons/mob/actions/psydonmiracles.dmi'
	overlay_state = "ABSOLVE"
	desc = "A lesser form of the mighty art of ABSOLUTION, bereft of its means to revive. Transfers the wounds from your target to you. Use carefully."
	releasedrain = 20
	chargedrain = 0
	chargetime = 0
	range = 5
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/psyabsolution.ogg'
	invocations = list("BE AMENDED!")
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 30 SECONDS // 60 seconds cooldown
	miracle = TRUE
	devotion_cost = 80

/obj/effect/proc_holder/spell/invoked/psydonamend/cast(list/targets, mob/living/user)

	if(!ishuman(targets[1]))
		to_chat(user, span_warning("AMENDMENT is for those who walk in HIS image!"))
		revert_cast()
		return FALSE

	if(!ishuman(user))
		revert_cast()
		return FALSE

	var/mob/living/carbon/human/H = targets[1]
	var/mob/living/carbon/human/C = user

	//Caustic Edit - Lets just... not Absolve Constructs?
	if(HAS_TRAIT(H, TRAIT_IRONMAN))
		to_chat(user, span_warning("Those of metal cannot accept the amendment of the flesh."))
		revert_cast()
		return FALSE
	//Caustic Edit End

	// CONSEQUENCE WARNING CHECKS

	var/will_lose_limbs = FALSE

	// Limb restoration costs your limbs.
	var/list/warning_zones = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

	for(var/zone in warning_zones)
		if(!H.get_bodypart(zone))
			if(C.get_bodypart(zone))
				will_lose_limbs = TRUE
				break

	if(will_lose_limbs)

		var/list/messages = list()

		if(will_lose_limbs)
			messages += span_userdanger("THIS TARGET IS MISSING LIMBS, STIGMATA. YOU WILL SACRIFICE YOUR OWN LIMBS. PROCEED?")

		messages += ""
		messages += "Continue?"

		if(alert(C, messages.Join("\n"), "AMENDMENT WARNING", "YES", "NO") != "YES")
			revert_cast()
			return FALSE

	if(H == C)
		to_chat(C, span_warning("You cannot AMEND yourself!"))
		revert_cast()
		return FALSE

	H.visible_message(span_red("[user] <i>dangerously</i> connects their Lux with [H]'s own."))

	if(HAS_TRAIT(H, TRAIT_NOHEAL))
		H.visible_message(span_artery("--But their Lux is forcefully repelled for some reason!"))
		H.playsound_local(H, 'sound/magic/PSY.ogg', 100, FALSE, -1)
		return FALSE

	if(user.cmode)
		user.say(pick("BE AMENDED!","I'LL BLEED IN YOUR STEAD!","YOUR TIME IS NOT NOW!","I SHALL WEEP IN YOUR STEAD!","ENDURE, AS HE DOES!","PERSIST, AS HE DOES!"))
		if(HAS_TRAIT(user, TRAIT_IRONMAN))
			user.electrocute_act(10, user)
	else
		user.say(pick("Live, as he does!","Be healed in His name!","May your injuries be mine to bear!","I amend you of your wounds!","Be amended!"))
		if(HAS_TRAIT(user, TRAIT_IRONMAN))
			user.adjustFireLoss(25)

	// LIMB TRANSFER
	var/list/zones = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

	for(var/zone in zones)
		var/obj/item/bodypart/tBP = H.get_bodypart(zone)

		if(!tBP)
			H.regenerate_limb(zone)
			var/obj/item/bodypart/cBP = C.get_bodypart(zone)
			if(cBP)
				cBP.dismember()
				if(HAS_TRAIT(H, TRAIT_IRONMAN)) // im just assuming constructs can't use any other limbs than their own, so instead of delimbing, eat an integrity
					var/obj/item/bodypart/daChest = H.get_bodypart(BODY_ZONE_CHEST)
					daChest.add_wound(/datum/wound/integrity/chest)
				else
					qdel(cBP)

	// WOUND TRANSFER
	var/list/wounds = H.get_wounds()

	for(var/datum/wound/W in wounds)
		if(!W.bodypart_owner)
			continue

		var/obj/item/bodypart/cBP = C.get_bodypart(W.bodypart_owner.body_zone)
		if(!cBP)
			continue

		var/new_type = translate_wound_for_target(W, C)

		if(!new_type)
			continue

		var/datum/wound/newW = new new_type()

		W.copy_to(newW)

		if(W.is_clotted() || W.is_sewn())
			newW.set_bleed_rate(0)

		newW = cBP.add_wound(newW)

		if(!newW)
			cBP.receive_damage(W.whp)

		var/obj/item/bodypart/tBP = H.get_bodypart(W.bodypart_owner.body_zone)

		if(tBP)
			tBP.remove_wound(W.type)

	// DAMAGE TRANSFER
	var/brute_transfer = H.getBruteLoss()
	var/burn_transfer = H.getFireLoss()
	var/tox_transfer = H.getToxLoss()
	var/oxy_transfer = H.getOxyLoss()
	var/clone_transfer = H.getCloneLoss()

	H.adjustBruteLoss(-brute_transfer)
	H.adjustFireLoss(-burn_transfer)
	H.adjustToxLoss(-tox_transfer)
	H.adjustOxyLoss(-oxy_transfer)
	H.adjustCloneLoss(-clone_transfer)

	C.adjustBruteLoss(brute_transfer)
	C.adjustFireLoss(burn_transfer)
	C.adjustToxLoss(tox_transfer)
	C.adjustOxyLoss(oxy_transfer)
	C.adjustCloneLoss(clone_transfer)

	// BLOOD TRANSFER
	var/blood_needed = max(0, BLOOD_VOLUME_NORMAL - H.blood_volume)

	if(blood_needed)
		if(NOBLOOD in C.dna?.species?.species_traits)
			H.blood_volume = BLOOD_VOLUME_NORMAL
			C.adjustFireLoss(round(blood_needed / 4))
		else
			var/transferred = min(blood_needed, C.blood_volume)

			if(transferred > 0)
				H.blood_volume += transferred
				C.blood_volume -= transferred

			if(H.blood_volume < BLOOD_VOLUME_NORMAL)
				var/remaining = BLOOD_VOLUME_NORMAL - H.blood_volume

				H.blood_volume += remaining
				C.blood_volume -= remaining

			if(C.blood_volume <= 0)
				C.blood_volume = BLOOD_VOLUME_SURVIVE

	// VISUALS
	C.visible_message(span_danger("[C] absolves [H]'s suffering!"))

	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#aa1717")
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#aa1717")
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(H), "#aa1717")

	new /obj/effect/temp_visual/psyheal_rogue(get_turf(C), "#aa1717")
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(C), "#aa1717")
	new /obj/effect/temp_visual/psyheal_rogue(get_turf(C), "#aa1717")

	to_chat(C, span_warning("You take [H]'s suffering upon yourself!"))
	to_chat(H, span_notice("[C] absolves you of your injuries!"))

	return TRUE

/datum/advclass/cleric/stigmata
	name = "Stigmata"
	tutorial = "PSYDON weeps. You are a devout cleric of the Allfather whom takes the suffering of others upon themselves. You have eschewn violence. You will suffer. You will endure."
	outfit = /datum/outfit/job/roguetown/adventurer/stigmata

	traits_applied = list(
		TRAIT_PACIFISM,
		TRAIT_EMPATH,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_STEELHEARTED,
		TRAIT_RITUALIST
	)
	subclass_stats = list(
		STATKEY_CON = 5,
		STATKEY_WIL = 3,
		STATKEY_SPD = 1,
		STATKEY_STR = -2,
	)
	subclass_skills = list(
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/cooking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/fishing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/magic/holy = SKILL_LEVEL_JOURNEYMAN,
	)
	subclass_stashed_items = list(
		"Tome of Psydon" = /obj/item/book/rogue/bibble/psy
	)
	extra_context = "This is a psydonite only subclass, it will force you to be one if it is not set. You will be a pacifist and are able to draw upon a weaker version of the abilities known by a Psydonic Absolver."

/datum/outfit/job/roguetown/adventurer/stigmata
	allowed_patrons = list(/datum/patron/old_god)

/datum/outfit/job/roguetown/adventurer/stigmata/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	H.adjust_blindness(-3)
	r_hand = /obj/item/cooking/pan
	head = /obj/item/clothing/head/roguetown/roguehood/psydon
	pants = /obj/item/clothing/under/roguetown/tights/black
	shirt = /obj/item/clothing/suit/roguetown/armor/vestments_padded
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	wrists = /obj/item/clothing/wrists/roguetown/wrappings
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backl = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	backpack_contents = list(
		/obj/item/recipe_book/survival = 1,
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 2,
		/obj/item/storage/belt/rogue/pouch/medicine = 1,
		/obj/item/ritechalk = 1
		)

	if (H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/psydonlux_tamper) // absolver's bleed transfer
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/psydonamend) // nerfed no-rez version of absolver's absolve

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T4, passive_gain = (CLERIC_REGEN_ABSOLVER / 2), start_maxed = TRUE)

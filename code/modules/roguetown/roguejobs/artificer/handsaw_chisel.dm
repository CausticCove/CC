#define BCLASS_CHISEL			"chisel"
//................	Handsaw	............... //
/obj/item/rogueweapon/handsaw
	force = 5
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/chop/cleaver)
	gripped_intents = null
	name = "handsaw"
	desc = "Iron tool for woodworking."
	icon_state = "handsaw"
	icon = 'icons/roguetown/items/crafting.dmi'
	grid_width = 32
	grid_height = 96
	sharpness = IS_SHARP
	wdefense = 0
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_HIP
	tool_behaviour = TOOL_SAW
	swingsound = list('sound/combat/wooshes/blunt/shovel_swing.ogg','sound/combat/wooshes/blunt/shovel_swing2.ogg')
	drop_sound = 'sound/foley/dropsound/shovel_drop.ogg'
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/axes		//Not an axe but fuck it - you're logging anyway.
	max_blade_int = 300
	is_tool = TRUE

/obj/item/rogueweapon/handsaw/bronze
	name = "bronze handsaw"
	icon_state = "bronzehandsaw"
	desc = "The serrated half of a bronzen pair, keen to saw away at its problems."
	max_blade_int = 400
	smeltresult = /obj/item/ingot/bronze

/obj/item/rogueweapon/handsaw/blacksteel
	name = "blacksteel handsaw"
	icon_state = "bshandsaw"
	desc = "Embrace the joy of creation, one motion at a time."
	max_blade_int = 400
	max_integrity = 300
	smeltresult = /obj/item/ingot/blacksteel

//................	Chisel	............... //
/obj/item/rogueweapon/chisel
	name = "chisel"
	desc = "Add something to strike it with before doing stonework. Like a mallet or a stone."
	icon_state = "chisel"
	icon = 'icons/roguetown/items/crafting.dmi'
	grid_width = 32
	grid_height = 64
	force = 10
	throwforce = 2
	possible_item_intents = list(/datum/intent/stab)
	sharpness = IS_SHARP
	wlength = WLENGTH_SHORT
	dropshrink = 0.9
	w_class = WEIGHT_CLASS_SMALL
	wdefense = 0
	blade_dulling = 0
	max_integrity = 140
	slot_flags = ITEM_SLOT_HIP
	swingsound = list('sound/combat/wooshes/blunt/shovel_swing.ogg','sound/combat/wooshes/blunt/shovel_swing2.ogg')
	drop_sound = 'sound/foley/dropsound/shovel_drop.ogg'
	associated_skill = /datum/skill/combat/knives	//Not a knife but kinda similar to etching so..
	max_blade_int = 300
	dropshrink = 0.9
	var/already_assembled

/obj/item/rogueweapon/chisel/attackby(obj/item/W, mob/living/user, params)
	. = ..()
	if(already_assembled)
		return

	// Caustic Edit / Prevents hammer duping by adding them to chisels
	if(istype(W, /obj/item/rogueweapon/hammer/iron/arcyne))
		user.visible_message("<span class='info'>[user] tries to set the [W] against the chisel, but a mystical force pries them apart.</span>")
		return
	// Caustic Edit end

	else if(istype(W,/obj/item/natural/stoneblock))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/stoneblock/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W,/obj/item/natural/stone))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/stone/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/steel))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammerclaw/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/iron))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammer/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/wood))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/mallet/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/blacksteel))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammerblacksteel/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/bronze))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammerbronze/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

//

/obj/item/rogueweapon/chisel/bronze
	name = "bronze chisel"
	desc = "The blunted half of a bronzen pair, for issues requiring a steady trepanning. Add something to strike it with before doing stonework, like a mallet or a stone."
	max_blade_int = 400
	icon_state = "bronzechisel"
	smeltresult = /obj/item/ingot/bronze

/obj/item/rogueweapon/chisel/bronze/attackby(obj/item/W, mob/living/user, params)
	if(already_assembled)
		return

	// Caustic Edit / Prevents hammer duping by adding them to chisels
	if(istype(W, /obj/item/rogueweapon/hammer/iron/arcyne))
		user.visible_message("<span class='info'>[user] tries to set the [W] against the chisel, but a mystical force pries them apart.</span>")
		return
	// Caustic Edit end

	if(istype(W,/obj/item/natural/stoneblock))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/stoneblock/bronze/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W,/obj/item/natural/stone))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/stone/bronze/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/steel))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammerclaw/bronze/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/iron))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammer/bronze/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/wood))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/mallet/bronze/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/bronze))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammerbronze/bronze/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/blacksteel))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammerblacksteel/bronze/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return
	. = ..()

//

/obj/item/rogueweapon/chisel/blacksteel
	name = "blacksteel chisel"
	desc = "The pen that'll scrawl a masterwork through this parchment-of-stone. Add something to strike it with before doing stonework, like a mallet or a stone."
	max_blade_int = 500
	max_integrity = 300
	icon_state = "bschisel"
	smeltresult = /obj/item/ingot/blacksteel

/obj/item/rogueweapon/chisel/blacksteel/attackby(obj/item/W, mob/living/user, params)
	. = ..()
	if(already_assembled)
		return

	if(istype(W,/obj/item/natural/stoneblock))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/stoneblock/bs/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W,/obj/item/natural/stone))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/stone/bs/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/steel))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammerclaw/bs/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/iron))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammer/bs/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/wood))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/mallet/bs/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/bronze))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammerbronze/bs/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

	else if(istype(W, /obj/item/rogueweapon/hammer/blacksteel))
		playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
		user.visible_message("<span class='info'>[user] adds a striking tool to the chisel set.</span>")
		var/obj/item/rogueweapon/chisel/assembly/hammerblacksteel/bs/F = new(src.loc)
		qdel(W)
		user.put_in_hands(F)
		qdel(src)
		return

//................	Chisel toolset	............... //
/obj/item/rogueweapon/chisel/assembly	// template
	name = "chisel set"
	desc = "Ready to shape stones when held in a steady grip. Can be separated easily."
	grid_width = 64
	grid_height = 64
	possible_item_intents = list(/datum/intent/hit)
	gripped_intents =  list(/datum/intent/chisel)
	already_assembled = TRUE

//cc edit start
/obj/item/rogueweapon/chisel/assembly/attack(mob/living/M, mob/user)

	if(!user.cmode)
		var/wCount = M.get_wounds()
		if(HAS_TRAIT(M, TRAIT_STONEMAN) && (M.getBruteLoss() + M.getFireLoss()) <= 0 && !length(wCount))
			M.visible_message(
				span_notice("[M] is good as new!"),
				span_notice("I am good as new!")
			)
			playsound(user.loc, 'sound/items/bsmith4.ogg', 100, FALSE)
			return
		else
			chiselheal(M, user)
	else
		. = ..() //normal hit

/obj/item/rogueweapon/chisel/assembly/proc/chiselheal(mob/living/M, mob/living/user)
	var/selfheal = FALSE
	var/qualified = FALSE
	var/stoneman = TRUE

	if(!user || !M)
		return

	if(!M.can_inject(user, TRUE))
		return

	if(user == M)
		qualified = TRUE
		selfheal = TRUE

	else
		if(user.get_skill_level(/datum/skill/craft/masonry))
			qualified = TRUE

	if(!ishuman(M))
		return

	if(!HAS_TRAIT(M, TRAIT_STONEMAN))
		stoneman = FALSE
		if(selfheal)
			to_chat(user, span_warning("Only constructs can properly tinker with themselves."))
			return

	var/mob/living/carbon/human/H = M

	// BUILD PRIORITY LIST ONCE
	var/list/priority_limbs = list()

	for(var/obj/item/bodypart/BP in H.bodyparts)
		if(!BP || QDELETED(BP))
			continue
		if(!stoneman && BP.status != BODYPART_ROBOTIC)
			continue

		var/priority = BP.brute_dam + BP.burn_dam

		for(var/datum/wound/W in BP.wounds)
			if(W.severity >= WOUND_SEVERITY_MODERATE)
				priority += 20
			else
				priority += 10

		if(priority > 0)
			priority_limbs[BP] = priority

	//if we can't heal anything, return
	if(!priority_limbs.len)
		to_chat(user, span_warning("They're not made of stone. I can't do that!"))
		return

	// sort descending (highest priority first)
	priority_limbs = sortTim(priority_limbs, GLOBAL_PROC_REF(cmp_numeric_dsc), TRUE)

	do
		if(!user || !M || QDELETED(user) || QDELETED(M))
			break

		if(user.stat != CONSCIOUS)
			break

		if(get_dist(user, M) > 1)
			break

		if(!priority_limbs.len)
			break

		var/obj/item/bodypart/affecting = priority_limbs[1]

		if(!affecting || QDELETED(affecting))
			priority_limbs.Cut(1,2)
			continue

		var/has_complex_wounds = FALSE
		var/list/wCount = H.get_wounds()

		for(var/datum/wound/W in wCount)
			if(W.severity >= WOUND_SEVERITY_MODERATE)
				has_complex_wounds = TRUE
				break

		var/used_time = 90

		if(user.mind)
			used_time -= (user.get_skill_level(/datum/skill/craft/masonry) * 4)
			used_time -= (user.get_skill_level(/datum/skill/magic/arcane) * 6)

		used_time = round(max(used_time, 5))

		if(has_complex_wounds)
			playsound(user.loc, 'sound/items/bsmith1.ogg', 100, FALSE)
		else
			playsound(user.loc, 'sound/items/bsmith1.ogg', 100, FALSE)

		if(!do_after(user, used_time, TRUE, M))
			return

		if(!user || !M || QDELETED(user) || QDELETED(M))
			break

		if(user.stat || get_dist(user, M) > 1)
			break

		playsound(user.loc, 'sound/items/bsmith4.ogg', 100, FALSE)

		var/brute_heal = (M == user) ? 10 : 25
		var/fire_heal = (M == user) ? 10 : 25

		if(!qualified)
			var/current_total = M.getBruteLoss() + M.getFireLoss()
			var/minimum_allowed = 300

			if(current_total <= minimum_allowed)
				user.visible_message(span_warning("[user] hesitates while working on [M], no longer knowing how to proceed."), span_warning("I don't know how to proceed from here..."))
				break

			if(prob(50))
				user.visible_message(span_notice("[user] manages to hammer [M]'s [affecting.name] into better shape."),span_notice("I think that worked."))
			else
				user.visible_message(span_warning("[user] awkwardly tinkers with [M]'s [affecting.name], uncertain what to do."), span_warning("I'm not sure what I'm doing..."))
				playsound(user.loc, 'sound/items/bsmith4.ogg', 100, FALSE)
				shake_camera(M, 2, 1)
				shake_camera(user, 2, 1)
				continue

			var/allowed_healing = current_total - minimum_allowed

			brute_heal = min(brute_heal, allowed_healing)
			fire_heal = min(fire_heal, allowed_healing)

		affecting.heal_damage(brute_heal, fire_heal)

		if(has_complex_wounds)
			H.heal_wounds(5)

		H.update_damage_overlays()
		user.mind.add_sleep_experience(/datum/skill/craft/engineering, (user.STAINT*2.5))

		if(M == user)
			user.visible_message(span_notice("[user] repairs [user.p_their()] [affecting.name]."), span_notice("I repair my [affecting.name]."))
		else
			user.visible_message(span_notice("[user] repairs [M]'s [affecting.name]."),	span_notice("I repair [M]'s [affecting.name]."))

		// CHECK IF THIS LIMB IS DONE → MOVE TO NEXT
		if((affecting.brute_dam + affecting.burn_dam) <= 0 && !length(affecting.wounds))
			priority_limbs.Cut(1,2)

		if((M.getBruteLoss() + M.getFireLoss()) <= 0 && !length(H.get_wounds()))
			M.visible_message(span_notice("[M] is good as new!"), span_notice("I am good as new!"))
			break

		if(!priority_limbs.len)//wounded, but no more injured mechanical limbs
			M.visible_message(span_notice("[M]'s mechanical components are as good as new"), span_notice("My mechanical limbs are whole once more."))
			break

	while(do_after(user, CLICK_CD_MELEE, TRUE, M))

//cc edit end

/obj/item/rogueweapon/chisel/assembly/mallet
	icon_state = "chiselm"
	item_state = "hammer_w"

/obj/item/rogueweapon/chisel/assembly/mallet/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/wood/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammer
	icon_state = "chiselh"
	item_state = "hammer_i"

/obj/item/rogueweapon/chisel/assembly/hammer/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/iron/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammerbronze
	icon_state = "chiselbronzeh"
	item_state = "hammer_bronze"

/obj/item/rogueweapon/chisel/assembly/hammerbronze/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/bronze/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammerclaw
	icon_state = "chiselc"
	item_state = "hammer_s"

/obj/item/rogueweapon/chisel/assembly/hammerclaw/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/steel/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammerblacksteel
	icon_state = "chiselbh"
	item_state = "bs_masterhammer"

/obj/item/rogueweapon/chisel/assembly/hammerblacksteel/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/blacksteel/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/stone
	icon_state = "chisels"
	item_state = "stone"

/obj/item/rogueweapon/chisel/assembly/stone/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/F = new(user.loc)
	var/obj/item/natural/stone/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/stoneblock
	icon_state = "chiselb"
	item_state = "block"

/obj/item/rogueweapon/chisel/assembly/stoneblock/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/F = new(user.loc)
	var/obj/item/natural/stoneblock/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

//

/obj/item/rogueweapon/chisel/assembly/mallet/bronze
	icon_state = "bronzechiselm"
	item_state = "hammer_w"

/obj/item/rogueweapon/chisel/assembly/mallet/bronze/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/bronze/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/wood/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammer/bronze
	icon_state = "bronzechiselh"
	item_state = "hammer_i"

/obj/item/rogueweapon/chisel/assembly/hammer/bronze/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/bronze/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/iron/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammerclaw/bronze
	icon_state = "bronzechiselc"
	item_state = "hammer_s"

/obj/item/rogueweapon/chisel/assembly/hammerclaw/bronze/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/bronze/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/steel/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammerblacksteel/bronze
	icon_state = "bronzechiselbh"
	item_state = "bs_masterhammer"

/obj/item/rogueweapon/chisel/assembly/hammerblacksteel/bronze/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/bronze/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/blacksteel/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammerbronze/bronze
	icon_state = "bronzechiselbronzeh"
	item_state = "hammer_bronze"

/obj/item/rogueweapon/chisel/assembly/hammerbronze/hammer/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/bronze/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/bronze/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/stone/bronze
	icon_state = "bronzechisels"
	item_state = "stone"

/obj/item/rogueweapon/chisel/assembly/stone/bronze/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/bronze/F = new(user.loc)
	var/obj/item/natural/stone/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/stoneblock/bronze
	icon_state = "bronzechiselb"
	item_state = "block"

/obj/item/rogueweapon/chisel/assembly/stoneblock/bronze/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/bronze/F = new(user.loc)
	var/obj/item/natural/stoneblock/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

//

/obj/item/rogueweapon/chisel/assembly/mallet/bs
	icon_state = "bschiselm"
	item_state = "hammer_w"

/obj/item/rogueweapon/chisel/assembly/mallet/bs/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/blacksteel/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/wood/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammer/bs
	icon_state = "bschiselh"
	item_state = "hammer_i"

/obj/item/rogueweapon/chisel/assembly/hammer/bs/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/blacksteel/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/iron/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammerbronze/bs
	icon_state = "bschiselbronzeh"
	item_state = "hammer_bronze"

/obj/item/rogueweapon/chisel/assembly/hammerbronze/bs/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/blacksteel/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/bronze/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammerclaw/bs
	icon_state = "bschiselc"
	item_state = "hammer_s"

/obj/item/rogueweapon/chisel/assembly/hammerclaw/bs/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/blacksteel/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/steel/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/hammerblacksteel/bs
	icon_state = "bschiselbh"
	item_state = "bs_masterhammer"

/obj/item/rogueweapon/chisel/assembly/hammerblacksteel/bs/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/blacksteel/F = new(user.loc)
	var/obj/item/rogueweapon/hammer/blacksteel/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/stone/bs
	icon_state = "bschisels"
	item_state = "stone"

/obj/item/rogueweapon/chisel/assembly/stone/bs/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/blacksteel/F = new(user.loc)
	var/obj/item/natural/stone/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

/obj/item/rogueweapon/chisel/assembly/stoneblock/bs
	icon_state = "bschiselb"
	item_state = "block"

/obj/item/rogueweapon/chisel/assembly/stoneblock/bs/attack_right(mob/user)
	var/obj/item/rogueweapon/chisel/blacksteel/F = new(user.loc)
	var/obj/item/natural/stoneblock/E = new(user.loc)
	user.put_in_hands(E)
	playsound(get_turf(user.loc), 'sound/foley/brickdrop.ogg', 100)
	qdel(src)
	user.put_in_hands(F)

//

/datum/intent/chisel
	name = "chisel"
	icon_state = "inchisel"
	attack_verb = list("chisels")
	hitsound = list('sound/combat/hits/pick/genpick (1).ogg', 'sound/combat/hits/pick/genpick (2).ogg')
	animname = "strike"
	item_d_type = "stab"
	blade_class = BCLASS_CHISEL
	chargetime = 0
	swingdelay = 3

#undef BCLASS_CHISEL

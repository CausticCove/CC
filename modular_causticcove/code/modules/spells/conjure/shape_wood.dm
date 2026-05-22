// Shape wood - Grow bits of trees, either logs, or sticks

// Logs

/datum/action/cooldown/spell/shape_wood
	button_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Shape Wood"
	desc = "Magically grow a log from a living tree, and place it at your feet."
	button_icon_state = "aerosolize"
	sound = 'sound/items/wood_sharpen.ogg'
	spell_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW

	click_to_activate = FALSE
	self_cast_possible = TRUE

	primary_resource_type = SPELL_COST_STAMINA
	primary_resource_cost = SPELLCOST_CANTRIP

	invocations = list("Cresce, frustum arboris!")
	invocation_type = INVOCATION_SHOUT

	charge_required = FALSE
	cooldown_time = 2 MINUTES

	associated_skill = /datum/skill/magic/arcane
	spell_tier = 1
	spell_impact_intensity = SPELL_IMPACT_NONE

	point_cost = 2

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN | SPELL_REQUIRES_SAME_Z

/datum/action/cooldown/spell/shape_wood/miracle
	name = "Miracle: Shape Wood"
	primary_resource_type = SPELL_COST_DEVOTION
	primary_resource_cost = SPELLCOST_MIRACLE
	invocations = list("Treefather! Grant unto me your flesh!")

/datum/action/cooldown/spell/shape_wood/cast(atom/cast_on)
	. = ..()
	var/mob/living/user = owner
	if(!istype(user))
		return FALSE

	var/turf/check_turf = get_step(user, user.dir)
	var/obj/structure/flora/newtree/treecheck // Leaving it as a var in case someone wants to add other tree types in here. 'flora/roguetree' is the one that covers stumps, fallen tree logs, burnt trees, bedraggled, and the sacred trees.
	for(treecheck in check_turf.contents)
		if(do_after(user, 20))
			var/obj/item/grown/log/tree/L = new /obj/item/grown/log/tree(user.loc)
			user.put_in_hands(L)
			playsound(user, 'sound/foley/wood_cutting.ogg', 50, TRUE)
			owner.visible_message(span_notice("[owner] spreads [owner.p_their()] arms, and a stout log grows from the tree."), span_notice("I force the tree to grow a log."))
			return TRUE
		else
			to_chat(owner, span_warning("You need to stand still to shape wood."))
			return FALSE
	to_chat(owner, span_warning("You need to stand before a living tree, neither twisted by evil magicks, nor blessed and sacred, to shape logs from it."))
	return FALSE


// Sticks

/datum/action/cooldown/spell/shape_branch
	button_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Shape Branch"
	desc = "Magically grow a bundle of branches from a living tree, and place it at your feet."
	button_icon_state = "acid_splash"
	sound = 'sound/items/wood_sharpen.ogg'
	spell_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW

	click_to_activate = FALSE
	self_cast_possible = TRUE

	primary_resource_type = SPELL_COST_STAMINA
	primary_resource_cost = SPELLCOST_CANTRIP

	invocations = list("Cresce, ramus arboris!")
	invocation_type = INVOCATION_SHOUT

	charge_required = FALSE
	cooldown_time = 2 MINUTES

	associated_skill = /datum/skill/magic/arcane
	spell_tier = 1
	spell_impact_intensity = SPELL_IMPACT_NONE

	point_cost = 1

	var/branch_count_min = 5
	var/branch_count_max = 10

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN | SPELL_REQUIRES_SAME_Z

/datum/action/cooldown/spell/shape_branch/miracle
	name = "Miracle: Shape Branch"
	primary_resource_type = SPELL_COST_DEVOTION
	primary_resource_cost = SPELLCOST_MIRACLE
	invocations = list("Treefather! Grant unto me a shard of your being!")

/datum/action/cooldown/spell/shape_branch/cast(atom/cast_on)
	. = ..()
	var/mob/living/user = owner
	if(!istype(user))
		return FALSE

	var/turf/check_turf = get_step(user, user.dir)
	var/obj/structure/flora/newtree/treecheck // Leaving it as a var in case someone wants to add other tree types in here. 'flora/roguetree' is the one that covers stumps, fallen tree logs, burnt trees, bedraggled, and the sacred trees.
	for(treecheck in check_turf.contents)
		if(do_after(user, 20))
			var/obj/item/natural/bundle/stick/B = new /obj/item/natural/bundle/stick(user.loc)
			B.amount = rand(branch_count_min, branch_count_max)
			user.put_in_hands(B)
			playsound(user, 'sound/foley/wood_cutting.ogg', 50, TRUE)
			owner.visible_message(span_notice("[owner] spreads [owner.p_their()] arms, and a handful of branches grows from the tree."), span_notice("I force the tree to grow bundle of branches."))
			return TRUE
		else
			to_chat(owner, span_warning("You need to stand still to shape wood."))
			return FALSE
	to_chat(owner, span_warning("You need to stand before a living tree, neither twisted by evil magicks, nor blessed and sacred, to shape branches from it."))
	return FALSE

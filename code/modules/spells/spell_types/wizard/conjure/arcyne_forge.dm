// Arcyne Forge — merged Conjure Weapon + Conjure Tool.
// Conjured items have halved durability and a glow to indicate they are conjured.

/datum/action/cooldown/spell/arcyne_forge
	button_icon = 'icons/mob/actions/mage_conjure.dmi'
	name = "Arcyne Forge"
	desc = "Conjure a weapon or tool of your choice. Conjured items have halved durability.\n\
	Only one conjured item can exist at a time - conjuring a new one destroys the old."
	button_icon_state = "arcyne_forge"
	sound = 'sound/magic/whiteflame.ogg'
	spell_color = GLOW_COLOR_METAL
	glow_intensity = GLOW_INTENSITY_LOW
	attunement_school = ASPECT_NAME_FERRAMANCY

	click_to_activate = TRUE
	self_cast_possible = TRUE

	primary_resource_type = SPELL_COST_STAMINA
	primary_resource_cost = SPELLCOST_CONJURE

	invocations = list("Conjura Telum!")
	invocation_type = INVOCATION_SHOUT

	charge_required = TRUE
	charge_time = 2 SECONDS
	hold_drain = 1
	charge_slowdown = CHARGING_SLOWDOWN_MEDIUM
	charge_sound = 'sound/magic/charging.ogg'
	cooldown_time = 1 MINUTES

	associated_skill = /datum/skill/magic/arcane
	spell_tier = 2

	point_cost = 2
	spell_impact_intensity = SPELL_IMPACT_NONE

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN | SPELL_REQUIRES_SAME_Z

	var/obj/item/conjured_item

	var/list/conjure_options = list(
		// Weapons
		"Short Sword" = /obj/item/rogueweapon/sword/short/iron/arcyne,
		"Hunting Sword" = /obj/item/rogueweapon/sword/short/messer/iron/arcyne,
		"Arming Sword" = /obj/item/rogueweapon/sword/iron/arcyne,
		"Cudgel" = /obj/item/rogueweapon/mace/cudgel/arcyne,
		"Warhammer" = /obj/item/rogueweapon/mace/warhammer/arcyne,
		"Dagger" = /obj/item/rogueweapon/huntingknife/idagger/arcyne,
		"Axe" = /obj/item/rogueweapon/stoneaxe/woodcut/arcyne,
		"Flail" = /obj/item/rogueweapon/flail/arcyne,
		"Whip" = /obj/item/rogueweapon/whip/arcyne,
		"Wooden Shield" = /obj/item/rogueweapon/shield/wood/arcyne,
		// Tools
		"Pickaxe" = /obj/item/rogueweapon/pick/arcyne,
		"Hoe" = /obj/item/rogueweapon/hoe/arcyne,
		"Thresher" = /obj/item/rogueweapon/thresher/arcyne,
		"Sickle" = /obj/item/rogueweapon/sickle/arcyne,
		"Pitchfork" = /obj/item/rogueweapon/pitchfork/arcyne,
		"Tongs" = /obj/item/rogueweapon/tongs/arcyne,
		"Hammer" = /obj/item/rogueweapon/hammer/iron/arcyne,
		"Shovel" = /obj/item/rogueweapon/shovel/arcyne,
		"Handsaw" = /obj/item/rogueweapon/handsaw/arcyne,
		"Scissors" = /obj/item/rogueweapon/huntingknife/scissors/arcyne,
		"Fishing Rod" = /obj/item/fishingrod/arcyne,
		"Frying Pan" = /obj/item/cooking/pan/arcyne,
		"Pot" = /obj/item/reagent_containers/glass/bucket/pot/arcyne,
		"Bowl" = /obj/item/reagent_containers/glass/bowl/arcyne,
		"Fork" = /obj/item/kitchen/fork/iron/arcyne,
		"Spoon" = /obj/item/kitchen/spoon/iron/arcyne,
	)

/datum/action/cooldown/spell/arcyne_forge/cast(atom/cast_on)
	. = ..()
	var/mob/living/carbon/human/H = owner
	if(!istype(H))
		return FALSE

	var/choice = tgui_input_list(H, "Choose what to conjure", "Arcyne Forge", conjure_options)
	if(!choice)
		return FALSE

	// Destroy previous conjured item
	if(conjured_item && !QDELETED(conjured_item))
		conjured_item.visible_message(span_warning("[conjured_item] shimmers and fades away!"))
		qdel(conjured_item)

	var/item_path = conjure_options[choice]
	var/obj/item/R = new item_path(H.drop_location())

	// Halve durability
	R.max_integrity = round(R.max_integrity * 0.5)
	R.obj_integrity = R.max_integrity

	// Mark as conjured — no salvage, no smelting, and use Arcyne Armament
	R.associated_skill = /datum/skill/combat/arcyne
	R.smeltresult = null
	R.salvage_result = null
	R.fiber_salvage = FALSE

	// Conjured glow
	R.AddComponent(/datum/component/conjured_item, GLOW_COLOR_ARCANE, FALSE, H, src)

	H.put_in_hands(R)
	conjured_item = R
	return TRUE

/datum/action/cooldown/spell/arcyne_forge/Destroy()
	if(conjured_item && !QDELETED(conjured_item))
		conjured_item.visible_message(span_warning("[conjured_item] shimmers and fades away!"))
		qdel(conjured_item)
	conjured_item = null
	return ..()

/datum/action/cooldown/spell/arcyne_forge/miracle
	point_cost = 0
	spell_tier = 0
	associated_skill = /datum/skill/magic/holy

//Caustic Edit - Lesser Arcyne Forge! Mostly for tools, but not all of them
/datum/action/cooldown/spell/arcyne_forge/lesser
	name = "Lesser Arcyne Forge"
	desc = "A simpler form of Arcyne Forge with less variety then the original.\n\
	Conjure a weapon or tool of your choice. Conjured items have halved durability.\n\
	Only one conjured item can exist at a time - conjuring a new one destroys the old."

	charge_required = TRUE
	charge_time = 4 SECONDS
	hold_drain = 1
	charge_slowdown = CHARGING_SLOWDOWN_MEDIUM
	charge_sound = 'sound/magic/charging.ogg'
	cooldown_time = 2 MINUTES

	spell_tier = 1
	point_cost = 1

	conjure_options = list(
		// Weapons
		"Cudgel" = /obj/item/rogueweapon/mace/cudgel/arcyne,
		"Dagger" = /obj/item/rogueweapon/huntingknife/idagger/arcyne,
		"Axe" = /obj/item/rogueweapon/stoneaxe/woodcut/arcyne,
		// Tools
		"Pickaxe" = /obj/item/rogueweapon/pick/arcyne,
		"Hoe" = /obj/item/rogueweapon/hoe/arcyne,
		"Thresher" = /obj/item/rogueweapon/thresher/arcyne,
		"Sickle" = /obj/item/rogueweapon/sickle/arcyne,
		"Hammer" = /obj/item/rogueweapon/hammer/iron/arcyne,
		"Shovel" = /obj/item/rogueweapon/shovel/arcyne,
		"Scissors" = /obj/item/rogueweapon/huntingknife/scissors/arcyne,
		"Fishing Rod" = /obj/item/fishingrod/arcyne,
	)

// Magic weapon variants

		// Weapons
/obj/item/rogueweapon/sword/short/iron/arcyne
	name = "magickal shortsword"
	desc = "'The oldest and most primal of concepts - violence'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_swordshort"

/obj/item/rogueweapon/sword/short/messer/iron/arcyne
	name = "magickal messer"
	desc = "'It's rotten work, but it's more cruel to let it suffer. The world has cruelty enough.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_swordhunt"

/obj/item/rogueweapon/sword/iron/arcyne
	name = "magickal arming sword"
	desc = "'The oldest and most primal of concepts - violence'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_sword"

/obj/item/rogueweapon/mace/cudgel/arcyne
	name = "magickal cudgel"
	desc = "'Oftentimes, a strike to the head brings nothing but ignorance. Perhaps you will be lucky to grant enlightment.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_cudgel"

/obj/item/rogueweapon/mace/warhammer/arcyne
	name = "magickal warhammer"
	desc = "'The antithesis of a smith. Reduce their masterworks back into slag.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_warhammer"

/obj/item/rogueweapon/huntingknife/idagger/arcyne
	name = "magickal knife"
	desc = "'Remember the old witch's scrimshaws? Never ask where the bones come from.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_knife"

/obj/item/rogueweapon/stoneaxe/woodcut/arcyne
	name = "magickal axe"
	desc = "'Branches from trees, arms from bodies. Think of it as alternative carpentry.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_axe"

/obj/item/rogueweapon/flail/arcyne
	name = "magickal flail"
	desc = "'There were always lessons to be learned from base tools. What once separated grain from chaff, now separates jaws from skulls.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_flail"

/obj/item/rogueweapon/whip/arcyne
	name = "magickal whip"
	desc = "'Beloved tool of both saigaherds and the pious.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_whip"

/obj/item/rogueweapon/shield/wood/arcyne
	name = "magickal shield"
	desc = "'I am the rocks of the eternal shore. Crash against me, and be broken.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_shield"

		// Tools
/obj/item/rogueweapon/pick/arcyne
	name = "magickal pick"
	desc = "'Strike the earth, and grant buried treasures the sight of the day's light.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_pick"

/obj/item/rogueweapon/hoe/arcyne
	name = "magickal hoe"
	desc = "'The earth is bountiful yet stubborn. Rip the grasses and weeds that choke it, and it may yet yield its fruits to you.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_hoe"

/obj/item/rogueweapon/thresher/arcyne
	name = "magickal thresher"
	desc = "'All things can be separated. Grain from the chaff, seeds from the fruit. Mind from the body, should it come to it.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_thresher"

/obj/item/rogueweapon/sickle/arcyne
	name = "magickal sickle"
	desc = "'To take away the old, and make space for the new.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_sickle"

/obj/item/rogueweapon/pitchfork/arcyne
	name = "magickal pitchfork"
	desc = "'Stalks of grain, or piles of compost. That is the intention, though these tools have an odd tendency of finding themselves paired with torches.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_pitchfork"

/obj/item/rogueweapon/tongs/arcyne
	name = "magickal tongs"
	desc = "'Grasp the slag, and make it beautiful.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_tongs"

/obj/item/rogueweapon/hammer/iron/arcyne
	name = "magickal hammer"
	desc = "'The iron will be as clay in your hands. Mold it, shape it, and if you so choose, break it.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_hammer"

/obj/item/rogueweapon/shovel/arcyne
	name = "magickal shovel"
	desc = "'Cut through the clay and roots. Perhaps you will find treasure. Or perhaps you will find worms.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_shovel"

/obj/item/rogueweapon/handsaw/arcyne
	name = "magickal handsaw"
	desc = "'There is such potential locked in the wood. There is potential locked in the bones as well.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_handsaw"

/obj/item/rogueweapon/huntingknife/scissors/arcyne
	name = "magickal scissors"
	desc = "'Waste not, want not.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_scissors"

/obj/item/fishingrod/arcyne
	name = "magickal fishing rod"
	desc = "'There are a great many things in the deep. Careful not to disturb something you would rather not.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_fishrod"

/obj/item/cooking/pan/arcyne
	name = "magickal frypan"
	desc = "'There is no glory to be gained on an empty stomach.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_pan"

/obj/item/reagent_containers/glass/bucket/pot/arcyne
	name = "magickal pot"
	desc = "'Is it teatime already?'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_pote"

/obj/item/reagent_containers/glass/bowl/arcyne
	name = "magickal bowl"
	desc = "'Stews and poultices - the lifeblood of any worker.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_bowl"

/obj/item/kitchen/fork/iron/arcyne
	name = "magickal fork"	
	desc = "'With your bare hands? We're not savages.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_fork"

/obj/item/kitchen/spoon/iron/arcyne
	name = "magickal spoon"
	desc = "'The traditional tool for eating soup, or disciplining unruly children.'"
	icon = 'modular_causticcove/icons/weapons/arcyne_forge/arcyne_forge_tools.dmi'
	icon_state = "mag_spoon"

//Caustic Edit End

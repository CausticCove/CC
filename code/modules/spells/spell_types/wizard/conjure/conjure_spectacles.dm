/datum/action/cooldown/spell/conjure_spectacles
	button_icon = 'icons/mob/actions/mage_conjure.dmi'
	name = "Conjure Spectacles"
	desc = "Conjure an illusionary set of Spectacles of your choice in your hand.\n\
	The Spectacles will be unsummoned should you conjure a new one or unbind the spell.\n\
	Unlike actual Spectacle varients, these won't grant special abilities/sight."
	button_icon_state = "conjspect"
	sound = 'sound/magic/whiteflame.ogg'
	spell_color = GLOW_COLOR_METAL
	glow_intensity = GLOW_INTENSITY_LOW

	click_to_activate = FALSE
	self_cast_possible = TRUE

	primary_resource_type = SPELL_COST_STAMINA
	primary_resource_cost = SPELLCOST_CANTRIP

	invocations = list("Caeca sum!") // I'm blind!
	invocation_type = INVOCATION_SHOUT

	charge_required = TRUE
	charge_time = 1 SECONDS
	hold_drain = 1
	charge_slowdown = CHARGING_SLOWDOWN_MEDIUM
	charge_sound = 'sound/magic/charging.ogg'
	cooldown_time = 30 SECONDS

	associated_skill = /datum/skill/magic/arcane
	spell_tier = 1

	point_cost = 0
	spell_impact_intensity = SPELL_IMPACT_NONE

	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN | SPELL_REQUIRES_SAME_Z

	var/obj/item/clothing/mask/rogue/spectacles/conjured_spectacles = null

	var/list/spectacles = list(
		"Spectacles" = /obj/item/clothing/mask/rogue/spectacles,
		"Nocshades" = /obj/item/clothing/mask/rogue/spectacles/inq_lesser_summoned,
		"Golden Spectacles" = /obj/item/clothing/mask/rogue/spectacles/golden_lesser_summoned,
		"Sandstorm Goggles" = /obj/item/clothing/mask/rogue/spectacles/goggles,
	)

/datum/action/cooldown/spell/conjure_spectacles/cast(list/targets, mob/living/user = usr)
	. = ..()
	var/spectacles_choice = input(user, "Choose a spectacles", "Conjure Spectacles") as anything in spectacles
	if(!spectacles_choice)
		return
	if(src.conjured_spectacles)
		qdel(src.conjured_spectacles)
	spectacles_choice = spectacles[spectacles_choice]

	var/obj/item/clothing/mask/rogue/spectacles/R = new spectacles_choice(user.drop_location())
	if(!QDELETED(R))
		R.AddComponent(/datum/component/conjured_item, GLOW_COLOR_ARCANE, FALSE, user, src)
	user.put_in_hands(R)
	src.conjured_spectacles = R
	R.sellprice = 0
	return TRUE

/datum/action/cooldown/spell/conjure_spectacles/miracle
	associated_skill = /datum/skill/magic/holy

/obj/item/clothing/mask/rogue/spectacles/inq/summoned
// Nocshades summonable alternative

/obj/item/clothing/mask/rogue/spectacles/inq_lesser_summoned
	name = "summoned nocshade lens-pair"
	icon_state = "bglasses"
	desc = "An argument between the chosen of Noc and the Otavian Orthodoxy has raged on for years,\n\
	no one truely knows who the original creator of these glasses truely was.\n\
	But one thing is absolutely for certain, they are quite fashionable."

// Golden spectacles summonable lesser varient - with no mechanical effects

/obj/item/clothing/mask/rogue/spectacles/golden_lesser_summoned
		name = "summoned golden spectacles"
		icon_state = "goggles"

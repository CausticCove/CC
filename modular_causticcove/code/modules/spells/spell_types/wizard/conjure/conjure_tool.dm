/obj/effect/proc_holder/spell/invoked/conjure_tool/mage
	name = "Conjure Tool"
	desc = "Conjure a tool of your choice in your hand or on the ground"
	overlay_state = "null"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 60
	chargedrain = 1
	chargetime = 2 SECONDS
	no_early_release = TRUE
	recharge_time = 1 MINUTES

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	antimagic_allowed = FALSE
	charging_slowdown = 3
	cost = 1
	spell_tier = 1 // Spellblade tier.

	invocations = list("Instrumentum Exoriantur!")
	invocation_type = "shout"
	glow_color = GLOW_COLOR_METAL
	glow_intensity = GLOW_INTENSITY_LOW

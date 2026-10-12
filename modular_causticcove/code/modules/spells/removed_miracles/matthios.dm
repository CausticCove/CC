///////////////////
//T1 - Mammonite //
///////////////////
//Uses up to 200 Mammon to deal damage with equivalent armor penetration on your next strike. Can't get simpler than that.
//if you toast more than 80 mammon (I.E, Strong stance), you have a chance to gib NPCs. Let's go gambling.

/datum/action/cooldown/spell/matthios/mammonite
	name = "Mammonite"
	desc = "Invoke Matthios's name and invest 10 to 200 mammon from your possessions and treasury into your next strike (based on your intent, min. 'Weak', max. 'Strong'). The attack penetrates armor equal to 75% of the mammon spent and grows stronger with the value of the offering. Offering over 80 mammon in one strike has a chance to obliterate the mindless."
	fluff_desc = "The faithful tell of a merchant cornered by death, bereft of allies, steel, and hope. With nothing left but his fortune and his faith in Matthios, he offered both in desperate prayer. The coins vanished, and in their place came strength enough to fell those who would have slain him. Thus Mammonite serves as a reminder that wealth is never truly powerless in the hands of the devoted. Through greed, you proliferate His ambition, His name."

	button_icon_state = "mammonite"
	glow_intensity = GLOW_INTENSITY_MEDIUM
	click_to_activate = FALSE
	self_cast_possible = TRUE

	primary_resource_cost = SPELLCOST_MIRACLE

	secondary_resource_cost = SPELLCOST_MIRACLE

	invocation_type = "shout"
	charge_required = FALSE
	cooldown_time = 25 SECONDS

	associated_skill = /datum/skill/magic/holy
	spell_tier = 0
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC | SPELL_REQUIRES_HUMAN

	var/min_mammon = 10
	var/max_mammon = 200

/datum/action/cooldown/spell/matthios/mammonite/cast(atom/cast_on)
	. = ..()

	var/mob/living/carbon/human/H = owner
	if(!istype(H))
		return FALSE

	if(!H.cmode)
		to_chat(H, span_warning("I need some adrenaline pumping for this, my good sire!"))
		return FALSE

	if(H.has_status_effect(/datum/status_effect/buff/mammonite))
		to_chat(H, span_warning("Matthios' truth already lays claim to my next strike."))
		return FALSE

	var/bank = 0
	if(SStreasury.has_account(H))
		bank = SStreasury.get_balance(H)

	var/onhand = get_mammons_in_atom(H)
	var/total = bank + onhand

	var/list/range = get_investment_range(H)
	var/min_invest = range[1]
	var/max_invest = range[2]

	if(total < min_invest)
		to_chat(H, span_warning("I lack the wealth to invoke Matthios' favor... ([min_invest] mammon needed for [H.rmb_intent.name] stance.)"))
		return FALSE

	var/mammon_used = rand(min_invest, max_invest)
	mammon_used = min(mammon_used, total)

	var/list/invocations = list(
		"Gold to glory! Wealth, guide my hand!",
		"Wealth be spent, and power be gained!",
		"My hoard bleeds for strength, in His name!",
		"A king's ransom for a single blow!",
		"Roar! The weight of mine greed!",
	)

	H.say(pick(invocations), forced = invocation_type)

	var/remaining = mammon_used

	var/from_inventory = 0
	var/from_bank = 0

	var/drained_onhand = min(onhand, remaining)
	if(drained_onhand > 0)
		from_inventory = remove_mammons_from_atom(H, drained_onhand)
		remaining -= from_inventory

	if(remaining > 0 && SStreasury.has_account(H))
		from_bank = min(remaining, SStreasury.get_balance(H))

		if(from_bank > 0)
			SStreasury.burn(SStreasury.get_account(H), from_bank, "Meister reports the Mammon is missing. Is this true?")

		remaining -= from_bank

	var/datum/status_effect/buff/mammonite/E = H.apply_status_effect(/datum/status_effect/buff/mammonite)
	if(E)
		E.bonus_damage = round(mammon_used * 3)
		E.cap = max_mammon

	var/source_text = ""

	if(from_inventory > 0 && from_bank > 0)
		source_text = "MATTHIOS claims [from_inventory] from my possessions and [from_bank] from my treasury!"
	else if(from_inventory > 0)
		source_text = "MATTHIOS claims [from_inventory] from my possessions!"
	else if(from_bank > 0)
		source_text = "MATTHIOS claims [from_bank] from my treasury!"

	H.visible_message(span_danger("[H]'s weapon gleams with a greedy golden light!"), span_notice("I invest [mammon_used] mammon into my next strike. [source_text]"))

	playsound(get_turf(H), 'sound/magic/antimagic.ogg', 60, TRUE)

	return TRUE

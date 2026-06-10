// Stat poisons for caustic

/datum/reagent/debuff/strengthpoison
	name = "Strength Poison"
	description = "Makes you feel like an out of shape towner."
	reagent_state = LIQUID
	color = "#006FFF"
	taste_description = "salty"
	scent_description = "something briney"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/strengthpoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/strengthpoison)
	return ..()

/datum/reagent/debuff/strongstrengthpoison
	name = "Strong Strength Poison"
	description = "Makes you feel like an effeminate male attempting to pick up a jug of milk."
	reagent_state = LIQUID
	color = "#002554"
	taste_description = "salty and sticky"
	scent_description = "something musky"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/strongstrengthpoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/strong/strengthpoison)
	return ..()

/datum/reagent/debuff/perceptionpoison
	name = "Perception Poison"
	description = "Makes you feel like you just dropped your glasses."
	reagent_state = LIQUID
	color = "#0000FF"
	taste_description = "odd stew"
	scent_description = "something alkaline"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/perceptionpoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/perceptionpoison)
	return ..()

/datum/reagent/debuff/strongperceptionpoison
	name = "Strong Perception Poison"
	description = "Makes you feel like you're getting punished for biting your mother's hair."
	reagent_state = LIQUID
	color = "#00D5FF"
	taste_description = "blinding stew"
	scent_description = "something alkaline"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/strongperceptionpoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/strong/perceptionpoison)
	return ..()

/datum/reagent/debuff/intelligencepoison
	name = "Intelligence Poison"
	description = "Makes you feel like you're dumber than a box of rocks."
	reagent_state = LIQUID
	color = "#BC7ED8"
	taste_description = "delicious ale"
	scent_description = "something alcoholic"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/intelligencepoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/intelligencepoison)
	return ..()

/datum/reagent/debuff/strongintelligencepoison
	name = "Strong Intelligence Poison"
	description = "Makes you feel lobotomized and happy."
	reagent_state = LIQUID
	color = "#5D3F6B"
	taste_description = "sweet champagne"
	scent_description = "something alcoholic"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/strongintelligencepoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/strong/intelligencepoison)
	return ..()

/datum/reagent/debuff/constitutionpoison
	name = "Constitution Poison"
	description = "Makes you feel like a soft pillow."
	reagent_state = LIQUID
	color = "#ECF9FB"
	taste_description = "minotaur fluid" //placeholder because it looks like cum might not change it
	scent_description = "something salty"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/constitutionpoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/constitutionpoison)
	return ..()

/datum/reagent/debuff/strongconstitutionpoison
	name = "Strong Constitution Poison"
	description = "Makes you feel like a target."
	reagent_state = LIQUID
	color = "#ECF9FB"
	taste_description = "minotaur fluid"
	scent_description = "something salty"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/strongconstitutionpoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/strong/constitutionpoison)
	return ..()

/datum/reagent/debuff/endurancepoison
	name = "Endurance Poison"
	description = "Makes you feel like you're high on swampweed but better."
	reagent_state = LIQUID
	color = "#4381A7"
	taste_description = "swampweed"
	scent_description = "something skunky"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/endurancepoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/endurancepoison)
	return ..()

/datum/reagent/debuff/strongendurancepoison
	name = "Strong Endurance Poison"
	description = "Makes you feel like a weak duke being spoken to by their evil eunuch."
	reagent_state = LIQUID
	color = "#234356"
	taste_description = "nitrate"
	scent_description = "something citrusy"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/strongendurancepoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/strong/endurancepoison)
	return ..()

/datum/reagent/debuff/speedpoison
	name = "Speed Poison"
	description = "Makes you feel like you're moving in slow-motion."
	reagent_state = LIQUID
	color = "#0b442c"
	taste_description = "ice cold oil"
	scent_description = "something oily"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/speedpoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/speedpoison)
	return ..()

/datum/reagent/debuff/strongspeedpoison
	name = "Strong Speed Poison"
	description = "Makes you feel like your legs just gave up."
	reagent_state = LIQUID
	color = "#010702"
	taste_description = "ice cold sludge"
	scent_description = "something sweet, like molasses"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/strongspeedpoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/strong/speedpoison)
	return ..()

/datum/reagent/debuff/fortunepoison
	name = "Luck Poison"
	description = "Makes you feel like Xylix is giggling at you."
	reagent_state = LIQUID
	color = "#AE3A46"
	taste_description = "well water sweet with lead"
	scent_description = "something ominous"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/fortunepoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/fortunepoison)
	return ..()

/datum/reagent/debuff/strongfortunepoison
	name = "Strong Luck Poison"
	description = "Makes you feel like Xylix is guffawing at you."
	reagent_state = LIQUID
	color = "#300f12"
	taste_description = "stale sugar water"
	scent_description = "something truly ominous"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/strongfortunepoison/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/strong/fortunepoison)
	return ..()

//Kink-related ones

/datum/reagent/buff/bimboliquer
	name = "Bimbo Liquer"
	description = "This hot pink liquid smells deliciously like schnapps. Make sure you know what you're doing when you drink this!"
	reagent_state = LIQUID
	color = "#d13cc5"
	taste_description = "liquer and yummy bubblegum!"
	scent_description = "something fruity and vaporous"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/buff/bimboliquer/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/buff/alch/bimboliquer)
	return ..()

/datum/reagent/debuff/baothasantidote
	name = "Baotha's Antidote"
	description = "Even getting a whiff of this makes you feel dizzy enough to pass out. Make sure you know what you're doing."
	reagent_state = LIQUID
	color = "#240621"
	taste_description = "liquid lobotomy"
	scent_description = "something akin to a brain-frying vapor"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM

/datum/reagent/debuff/baothasantidote/on_mob_life(mob/living/carbon/M)
	M.apply_status_effect(/datum/status_effect/debuff/alch/baothasantidote)
	return ..()

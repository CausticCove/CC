/datum/virtue/size/giant
	name = "Giant"
	desc = "I've always been larger, stronger and hardier than the average person. I tend to lumber around a lot, and my immense size can break down frail, wooden doors."
	added_traits = list(TRAIT_BIGGUY)
	custom_text = "Increases your sprite size."

//Caustic Edit - Instead have this hook into our size system!
/datum/virtue/size/giant/apply_to_human(mob/living/carbon/human/recipient)
	recipient.resize(1.25)
//Caustic Edit End

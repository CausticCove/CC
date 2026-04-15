/obj/item/reagent_containers/glass/bottle/rogue/woundpot
	list_reagents = list(/datum/reagent/medicine/woundpot = 50)

/datum/reagent/medicine/woundpot
	name = "Wound Potion"
	description = "Gradually regenerates all types of wounds. Also repairs vulnerabilities."
	reagent_state = LIQUID
	color = "#b3548f"
	taste_description = "heartblood"
	scent_description = "iron"
	overdose_threshold = 0
	metabolization_rate = REAGENTS_METABOLISM
	alpha = 190

/datum/reagent/medicine/woundpot/on_mob_life(mob/living/carbon/M)
	if(volume >= 60)
		M.reagents.remove_reagent(/datum/reagent/medicine/woundpot, 2) //No overhealing.
	var/list/wCount = M.get_wounds()
	if(wCount.len > 0)
		M.heal_wounds(5) //Fast wound healing.
		for(var/datum/wound/critical_vulnerability/W in wCount)
			W.heal_wound(16) //Heals vulnerabilities very quickly. Only need ~20u to fully heal a crit vulnerable limb.
	..()

/datum/alch_cauldron_recipe/wound_potion
	name = "Elixir of Wound Healing"
	smells_like = "iron"
	output_reagents = list(/datum/reagent/medicine/woundpot = 90)

//Overrides the hell goblin faction so that it doesn't spawn the watcher anymore, instead spawning a hobgoblin boss variant.
/datum/quest_faction/hell_goblin

	boss_mob_types = list(
		/mob/living/carbon/human/species/hobgoblin/boss = 40,
	)

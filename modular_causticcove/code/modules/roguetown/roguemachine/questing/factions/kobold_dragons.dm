/datum/quest_faction/livras_bandits
	id = QUEST_FACTION_LIVRASBANDIT
	name_singular = "Livras bandit"
	name_plural = "Livras bandits"
	group_word = "gang"
	faction_tag = FACTION_BANDITS
	can_blockade = TRUE
	category = FACTION_CAT_HUMANOID
	mob_types = list(
		/mob/living/carbon/human/species/kobold/npc = 50,
		/mob/living/carbon/human/species/drakian/npc = 50,
	)
	boss_mob_types = list(
		/mob/living/carbon/human/species/drakian/npc/knight = 100,
	)
	boss_title_templates = list(
		"%N Goldscale",
		"%N the Rich",
		"%N the Gilded",
		"%N Goldblood",
	)
/datum/quest_faction/manhunters
	id = QUEST_FACTION_MANHUNTERS
	name_singular = "manhunter"
	name_plural = "manhunters"
	group_word = "pack"
	faction_tag = FACTION_BANDITS
	can_blockade = TRUE
	category = FACTION_CAT_HUMANOID
	mob_types = list(
		/mob/living/carbon/human/species/venardin/npc = 50,
		/mob/living/carbon/human/species/lupian/npc = 50,
	)
	boss_mob_types = list(
		/mob/living/carbon/human/species/lupian/npc/pack_leader = 100,
	)
	boss_title_templates = list(
		"%N Keeneye",
		"%N the Bottomless",
		"%N the Moon Guided",
		"%N the Beast",
	)
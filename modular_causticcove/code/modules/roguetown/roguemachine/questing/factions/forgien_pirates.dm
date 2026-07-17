/datum/quest_faction/estuscanpirate
	id = QUEST_FACTION_ETRUSCANPIRATE 
	name_singular = "pirate"
	name_plural = "pirates"
	group_word = "crew"
	faction_tag = FACTION_BANDITS
	can_blockade = TRUE
	category = FACTION_CAT_HUMANOID
	mob_types = list(
		/mob/living/carbon/human/species/akula/npc/etruscan_pirate = 75,
		/mob/living/carbon/human/species/akula/npc = 10,
		/mob/living/carbon/human/species/akula/npc/titan = 10,
		/mob/living/carbon/human/species/orc/npc/berserker = 5,
	)
	boss_mob_types = list(
		/mob/living/carbon/human/species/lupian/npc/pack_leader = 100,
	)
	boss_title_templates = list(
		"%N the Abyss Seeker",
		"%N Dreadbeard",
		"%N the Wretched",
		"%N Bloodied",
	)
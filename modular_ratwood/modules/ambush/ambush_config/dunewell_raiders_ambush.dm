/datum/npc_warband/dunewell_raider
	name = "Dunewell Raider Squad"
	category = FACTION_DUNWELL
	faction_tag = "bandits"
	members = list(
		/mob/living/carbon/human/species/human/northern/dunewell_raider/ambush = 3
	)

/datum/npc_warband/dunewell_raider/hard
	name = "Well-Equipped Dunewell Raider Squad"
	category = FACTION_DUNWELL
	faction_tag = "bandits"
	members = list(
		/mob/living/carbon/human/species/human/northern/dunewell_raider/better_gear/ambush = 2,
		/mob/living/carbon/human/species/human/northern/dunewell_raider/ambush = 1,
	)

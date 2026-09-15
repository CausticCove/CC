/datum/ambush_config/dunewell_raider
	mob_types = list(
		/mob/living/carbon/human/species/human/northern/dunewell_raider/ambush = 2,
		/mob/living/carbon/human/species/human/northern/dunewell_raider/better_gear/ambush = 1
	)
	threat_point = THREAT_MODERATE * 2 + THREAT_HIGH
	faction_tag = "bandits"

/datum/ambush_config/dunewell_raider/hard
	mob_types = list(
		/mob/living/carbon/human/species/human/northern/dunewell_raider/better_gear/ambush = 2,
		/mob/living/carbon/human/species/human/northern/dunewell_raider/ambush = 1,
	)
	threat_point = THREAT_HIGH * 2 + THREAT_MODERATE
	faction_tag = "bandits"

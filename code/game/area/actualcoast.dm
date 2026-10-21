// Actual coastal coastal area - this is for the harbour, which has no ambushes.
/area/rogue/outdoors/beach
	name = "City Harbor"
	loot_budget = LOOT_BUDGET_AZURE_COAST
	icon_state = "beach"
	warden_area = TRUE
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/under/lake
	first_time_text = "CITY HARBOR"
	deathsight_message = "a windswept shore"
	area_sniff_message = "You smell the town, faintly, buried underneath the scent of the sea."
	detail_text = DETAIL_TEXT_ACTUAL_COAST

// No sea raiders here! The Central Coast is relatively safe.
/area/rogue/outdoors/beach/central
	name = "Central Coast"
	allow_extreme_weather = TRUE //Caustic Edit - Add in the possibility for tornado spawns!
	ambush_factions = list()
	ambush_mobs = list(
		/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 40,
		/mob/living/simple_animal/hostile/rogue/deepone = 60,
		/datum/npc_warband/triple_deepone = 120,
		/datum/npc_warband/deepone_party = 80,
	)
	first_time_text = "CENTRAL COAST"
	threat_region = THREAT_REGION_AZURE_GROVE
	area_sniff_message = "You smell the seas and the sands."

/area/rogue/outdoors/beach/north
	name = "Northern Coast"
	allow_extreme_weather = TRUE //Caustic Edit - Add in the possibility for tornado spawns!
	ambush_factions = list()
	ambush_mobs = list(
		/mob/living/carbon/human/species/orc/npc/berserker = 24,
		/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 98,
		/datum/npc_warband/huscarl_raiding_party = 7,
	)
	first_time_text = "NORTHERN COAST"
	threat_region = THREAT_REGION_AZUREAN_COAST
	area_sniff_message = "You smell the seas and the sands."

/area/rogue/outdoors/beach/south
	name = "Southern Coast"
	allow_extreme_weather = TRUE //Caustic Edit - Add in the possibility for tornado spawns!
	ambush_factions = list()
	ambush_mobs = list(
		/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 31,
		/mob/living/simple_animal/hostile/rogue/deepone = 47,
		/datum/npc_warband/triple_deepone = 94,
		/datum/npc_warband/deepone_party = 63,
	)
	first_time_text = "SOUTHERN COAST"
	detail_text = DETAIL_TEXT_CITY_COAST
	threat_region = THREAT_REGION_AZURE_BASIN
	area_sniff_message = "You smell the seas and the sands."

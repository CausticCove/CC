// Azure Grove - the areas to the south of the map

/area/rogue/outdoors/woods
	name = "The Azure Grove"
	icon_state = "woods"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	soundenv = 15
	warden_area = TRUE
	allow_extreme_weather = TRUE //Caustic Edit - Allow tornado spawns!
	ambush_factions = list()
	first_time_text = "THE AZURE GROVE"
	converted_type = /area/rogue/indoors/shelter/woods
	deathsight_message = "somewhere in the wilds"
	threat_region = THREAT_REGION_AZURE_GROVE
	detail_text = DETAIL_TEXT_AZURE_GROVE
	area_sniff_message = "You smell old, mighty trees."

/area/rogue/indoors/shelter/woods
	name = "Azure Grove"
	icon_state = "woods"
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	threat_region = THREAT_REGION_AZURE_GROVE
	deathsight_message = "somewhere in the wilds"
	area_sniff_message = "You smell old, mighty trees... But someone cut them into planks."

/area/rogue/outdoors/woods/north
	name = "Azure Grove - North"
	ambush_factions = list()
	threat_region = THREAT_REGION_AZURE_GROVE

/area/rogue/outdoors/woods/northeast
	name = "Azure Grove - Northeast"
	ambush_factions = list()
	ambush_mobs = list(
		/mob/living/carbon/human/species/skeleton/npc/pirate = 6,
		/mob/living/carbon/human/species/goblin/npc/sea = 6,
	)
	threat_region = THREAT_REGION_AZURE_GROVE

/area/rogue/outdoors/woods/southeast
	name = "Azure Grove - Southeast"
	ambush_factions = list()
	ambush_mobs = list(
		/mob/living/carbon/human/species/skeleton/npc/pirate = 6,
		/mob/living/carbon/human/species/goblin/npc/sea = 6,
	)

/area/rogue/outdoors/woods/south
	name = "Azure Grove - South"
	ambush_factions = list()

/area/rogue/outdoors/woods/southwest
	name = "Azure Grove - Southwest"
	ambush_factions = list()

/area/rogue/outdoors/woods/northwest
	name = "Azure Grove - Northwest"
	ambush_factions = list()

/area/rogue/outdoors/woods/vampire_lair
	warden_area = FALSE
	ambush_mobs = null
	threat_region = ""
	allow_extreme_weather = FALSE //Caustic Edit - No tornado spawns!

/area/rogue/outdoors/woods/wretch_lair
	warden_area = FALSE
	ambush_mobs = null
	threat_region = ""
	allow_extreme_weather = FALSE //Caustic Edit - No tornado spawns!

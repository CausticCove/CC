/area/rogue/indoors/town/grove
	name = "grove"
	icon_state = "druidgrove"
	droning_sound = 'sound/music/area/druid.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	droning_sound_dawn = 'sound/music/area/forest.ogg'
	converted_type = /area/rogue/indoors/shelter/woods
	deathsight_message = "A sacred place of dendor, beneath the tree of Aeons.."
	warden_area = TRUE
	town_area = FALSE

/area/rogue/outdoors/town/grove
	icon_state = "druidgrove"
	color = "#b8b5c9"
	droning_sound = 'sound/music/area/druid.ogg'
	droning_sound_dawn = 'sound/music/area/forest.ogg'
	converted_type = /area/rogue/indoors/town/grove
	deathsight_message = "A sacred place of dendor, near the tree of Aeons.."
	first_time_text = null
	droning_sound_dusk = null
	droning_sound_night = null
	warden_area = TRUE
	town_area = FALSE

/area/rogue/under/cave/rhgoblinencampment
	name = "goblin encampment"
	icon_state = "under"
	first_time_text = "Lost Encampment"
	ambientsounds = AMB_BASEMENT
	ambientnight = AMB_BASEMENT
	droning_sound = 'sound/music/area/gobcamp.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ceiling_protected = TRUE
	deathsight_message = "A hidden goblin-stained fortress"

/area/rogue/under/underdarker
	name = "Deep Central Underdark" // Northern is Sunken City
	icon_state = "cavewet"
	warden_area = FALSE
	first_time_text = "The Underdark" // This is where most people will enter Underdark
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/underdark.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 20,
				/mob/living/carbon/human/species/elf/dark/drowraider/ambush = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 25,
				/mob/living/carbon/human/species/goblin/npc/ambush/moon = 30,
				/mob/living/simple_animal/hostile/retaliate/rogue/troll = 15,
				/mob/living/simple_animal/hostile/retaliate/rogue/drider = 10,
	)
	converted_type = /area/rogue/outdoors/caves
	deathsight_message = "an acid-scarred depths"
	detail_text = DETAIL_TEXT_UNDERDARK
	threat_region = THREAT_REGION_DESERT_UNDERDARK

/area/rogue/indoors/banditcamp/hoardmaster
	name = "The Hoard"
	icon_state = "rogue"
	first_time_text = "A MISTAKE"
	deathsight_message = "a place of greed and excess"
	//hoardmaster_protected = TRUE //CC Edit - This var is designed to ASH people who enter this area. Currently unused/unimplemented. Will need feedback before considering.

/area/rogue/underworld/adventurespawn
	name = "wayfarer's dream"
	icon_state = "dream"
	first_time_text = "A Wayfarer's Dream"

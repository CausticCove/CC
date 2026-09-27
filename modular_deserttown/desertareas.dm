
//Desert Areas

//Inner Dunes Area
/area/rogue/outdoors/desert
	name = "Inner Dunes"
	icon_state = "desert"
	soundenv = 19
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	ambush_times = list("night")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/sandworm/stalker = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/badger = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/sandworm/wormling = 25,
				/mob/living/simple_animal/hostile/retaliate/rogue/bobcat = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/fox = 30,
				/mob/living/carbon/human/species/skeleton/npc/supereasy = 30)
	first_time_text = "Al-Ashur Dunes"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	deathsight_message = "somewhere in the dunes, next to towering walls"
	warden_area = TRUE
	threat_region = THREAT_REGION_INNER_DUNES
	allow_extreme_weather = TRUE

/area/rogue/outdoors/desert/river
	name = "River"
	icon_state = "river"
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_FOREST
	threat_region = THREAT_REGION_FRESH_RIVER

/area/rogue/outdoors/desert/oasis
	name = "Oasis"
	first_time_text = "Forgotten Oasis"
	icon_state = "river"
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_FOREST

/area/rogue/outdoors/desert/mirage
	name = "Fleeting Repose"
	first_time_text = "Fleeting Repose"
	icon_state = ""
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/newmusic/lovecraft2.ogg'
	droning_sound_dusk = 'sound/newmusic/lovecraft2.ogg'
	droning_sound_night = 'sound/newmusic/lovecraft2.ogg'

//Deep Dunes Area
/area/rogue/outdoors/desertdeep
	name = "Deep Dunes"
	icon_state = "desertdeep"
	warden_area = TRUE
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	first_time_text = "Deep Dunes"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	ambush_times = list("night","dawn","dusk","day")
	ambush_mobs = list(
		new /datum/ambush_config/dunewell_raider = 60,
		new /datum/ambush_config/antlion_party = 30,
		new /datum/ambush_config/lamia_party = 30,
		new /datum/ambush_config/dunewell_raider/hard = 20,
		new /datum/ambush_config/worm_hatchling_party = 30,
		/mob/living/simple_animal/hostile/retaliate/rogue/sandworm/stalker = 40,
		/mob/living/simple_animal/hostile/retaliate/rogue/sandworm/elder = 20,
		/mob/living/simple_animal/hostile/retaliate/rogue/ifrit = 20,
		/mob/living/simple_animal/hostile/retaliate/rogue/wolf_undead = 10,)
	converted_type = /area/rogue/indoors/shelter/desertdeep
	deathsight_message = "an empty, parched desert"
	threat_region = THREAT_REGION_DEEP_DUNES
	allow_extreme_weather = TRUE

/area/rogue/indoors/shelter/desertdeep
	name = "Deep Desert (shelter)"
	icon_state = "desertdeep"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'

/area/rogue/outdoors/desertdeep/above
	name = "Deep Desert Above"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	soundenv = 17
	first_time_text = null
	ambush_times = null
	ambush_mobs = null
	allow_extreme_weather = FALSE

/area/rogue/outdoors/desert/above
	name = "Desert Above"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	soundenv = 17
	first_time_text = null
	ambush_times = null
	ambush_mobs = null
	allow_extreme_weather = FALSE

/area/rogue/outdoors/desertdeep/coastal
	name = "Coastal Inlet"
	first_time_text = null
	ambush_times = null
	ambush_mobs = null
	deathsight_message = "along a small coastal space"
	allow_extreme_weather = FALSE

/area/rogue/outdoors/desertdeep/arenavillage
	name = "Desert Claimed Village"
	first_time_text = "The Sand Claimed Village"
	deathsight_message = "a sand claimed village"

/area/rogue/outdoors/desertdeep/colosseum
	name = "Ruined Colosseum"
	first_time_text = "Decrepit Colosseum"
	deathsight_message = "a decrepit arena in the dunes"
	ambush_times = "null"
	ambush_mobs = "null"
	allow_extreme_weather = FALSE

/area/rogue/outdoors/desert/dunepassage
	name = "Dunelords Pass"
	first_time_text = "Dunelords Passage"
	deathsight_message = "a winding passage on the edge of the dunes"

/area/rogue/under/cave/desert
	name = "Inner Dune Cave"
	deathsight_message = "caves near safer sands"
	threat_region = THREAT_REGION_INNER_DUNES

/area/rogue/under/cave/desertdeep
	name = "Deep Dune Cave"
	deathsight_message = "caves near unwelcoming sands"
	threat_region = THREAT_REGION_DEEP_DUNES


//Town Area and Keep Area's start here
//Outdoor Town Areas here
/area/rogue/outdoors/town/desert
	name = "Desert Town Outdoors"
	icon_state = "town"
	soundenv = 16
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	first_time_text = "The City of Al-Ashur"
	town_area = TRUE

/area/rogue/outdoors/town/roofs/desert
	name = "Desert Roofs"
	icon_state = "roofs"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	soundenv = 17
	first_time_text = null

//Outdoor Town Villa - Made seperate since while its part of town, its also... "not". Prevents Random ambushes and Mapgen from happing in the space primarily, or from spilling in from the Dunes.
/area/rogue/outdoors/town/desertvilla
	name = "Desert Outdoors"
	icon_state = "town"
	soundenv = 16
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	first_time_text = null
	town_area = FALSE //Because its not actually the main town, Garrison has less power here
	warden_area = TRUE //Inversely Wardens get to have fun acting as proper watch here

//Indoor Town Areas here
/area/rogue/indoors/town/desert
	name = "Desert Town Indoors"
	icon_state = "town"
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	converted_type = /area/rogue/outdoors/exposed/town
	town_area = TRUE
	deathsight_message = "the city of Al-Ashur and all its bustling souls"

/area/rogue/indoors/town/shop/desert
	name = "Bazaar"
	droning_sound = 'sound/music/area/desert/Caravan.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/dwarfin/desert
	name = "Guild Smithy"
	droning_sound = 'sound/music/area/desert/Sandal.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/physician/desert
	name = "Physician"
	droning_sound = 'sound/music/area/academy.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/bath/desert
	name = "Baths"
	droning_sound = 'sound/music/area/desert/TenThousandDelights.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/tavern/desert
	name = "tavern"
	icon_state = "tavern"
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	droning_sound = 'sound/silence.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	tavern_area = TRUE

/area/rogue/indoors/shelter/town/desert
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'

/area/rogue/under/town/basement/desert
	name = "Basement"

/area/rogue/indoors/town/desert/arenaview
	name = "Grand Arena"

/area/rogue/under/town/basement/desert/arenapit
	name = "Grand Arena Pit"
	town_area = FALSE

//Keep Areas Here
/area/rogue/indoors/town/manor/desert
	name = "Al-Ashur Palace interior"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/desert/Iberia2.ogg'
	first_time_text = "Al-Ashur Palace"
	keep_area = TRUE

/area/rogue/under/town/basement/keep/desert
	name = "Palace Basement"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/desert/Iberia2.ogg'

/area/rogue/outdoors/town/manor/desert
	name = "Al-Ashur Palace exterior"
	icon_state = "manor"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/desert/Iberia2.ogg'
	first_time_text = "Al-Ashur Palace"
	keep_area = TRUE

/area/rogue/outdoors/town/roofs/keep/desert
	name = "Palace Roofs"
	icon_state = "roofs"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/desert/Iberia2.ogg'
	soundenv = 17
	first_time_text = null

//University Areas (Also considered Keep)
/area/rogue/indoors/town/magician/desert
	name = "University Wizard's Tower"

/area/rogue/indoors/town/magician/desertacademy
	name = "University Academy"
	droning_sound = 'sound/music/area/academy.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

//Garrison Spaces - Wardens fort gets special treatment and does not use the Garrison path
/area/rogue/indoors/town/garrison/desert
	name = "Al-Ashur Garrison"
	droning_sound = 'sound/music/area/desert/DarMeshq.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/garrison/desert/cell
	name = "Dungeon Cell"
	icon_state = "cell"
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/desert/warden
	name = "Warden Fort Azeb"
	warden_area = TRUE

//Church Areas Here
/area/rogue/indoors/town/church/cavebasement
	icon_state = "church"
	first_time_text = "THE CRYPT OF THE TEN"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/underdark2.ogg'

/area/rogue/indoors/town/church/psy
	name = "church"
	icon_state = "church"
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	holy_area = TRUE
	droning_sound_dawn = 'sound/music/area/churchdawn.ogg'
	converted_type = /area/rogue/outdoors/exposed/church
	deathsight_message = "a hallowed place, sworn to the One"
	first_time_text = "THE HOUSE OF THE ONE"

//Bandit Camp Areas
/area/rogue/outdoors/banditcamp/desert
	name = "Bandit Camp"
	droning_sound = 'sound/music/area/desert/stronghold.ogg'
	droning_sound_dusk = 'sound/music/area/desert/stronghold.ogg'
	droning_sound_night = 'sound/music/area/desert/stronghold.ogg'
	first_time_text = "A Gathering of Thieves"
	deathsight_message = "hidden among thieves, in the hoard of a dragon"

/area/rogue/indoors/banditcamp/desert
	name = "Bandit Camp"
	droning_sound = 'sound/music/area/desert/stronghold.ogg'
	droning_sound_dusk = 'sound/music/area/desert/stronghold.ogg'
	droning_sound_night = 'sound/music/area/desert/stronghold.ogg'
	deathsight_message = "hidden among thieves, in the hoard of a dragon"

/area/rogue/outdoors/desertdeep/safe
	name = "Desert Pass"
	ambush_times = null
	ambush_mobs = null
	allow_extreme_weather = FALSE

//Unique quest area for the Town Indoor quest locations.
/area/rogue/indoors/town/desert/quest
	name = "Desert Town Indoors"
	icon_state = "town"
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	converted_type = /area/rogue/outdoors/exposed/town
	town_area = TRUE
	deathsight_message = "the city of Al-Ashur and all its bustling souls"
	threat_region = THREAT_REGION_DESERT_TOWN
	first_time_text = "Something feels off..." //Just a warning for players to know that this place is dangerous.
	safe = FALSE //Using an unused var for Teleportation as a means to play a different area entry sound.

//Wayfarers Dream for the SINGLE area in the advdesertspawn that some classes use
/area/rogue/underworld/desert
	first_time_text = "wayfarer's dream"

// Undergound caves useable for under the town and closeby
/area/rogue/under/desertcavewet
	name = "The Lower Caverns"
	loot_budget = LOOT_BUDGET_UNDERGROVE
	loot_pool_key = "undergrove"
	icon_state = "cavewet"
	warden_area = TRUE
	first_time_text = "The Lower Caverns"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_mobs = list(
				/mob/living/carbon/human/species/skeleton/npc/easy = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/goblin/npc/sea = 20,
				/mob/living/carbon/human/species/human/northern/highwayman/ambush = 15,
				/mob/living/carbon/human/species/human/northern/bum/ambush = 30,
				/mob/living/simple_animal/hostile/retaliate/rogue/troll = 10)
	converted_type = /area/rogue/outdoors/caves
	deathsight_message = "caves beneath the sands"
	threat_region = THREAT_REGION_DESERT_TOWN_CAVES

// Desert Underdark Area, If its not part of the WasteMire, use this area
/area/rogue/under/desertunderdark
	name = "The Underdark"
	icon_state = "cavewet"
	warden_area = FALSE
	drow_area = TRUE
	first_time_text = "The Underdark"
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
				/mob/living/carbon/human/species/skeleton/npc/mediumspread = 30,
				/mob/living/carbon/human/species/skeleton/npc/hardspread = 5)
	converted_type = /area/rogue/outdoors/caves
	deathsight_message = "depths far below the sands"
	detail_text = DETAIL_TEXT_UNDERDARK
	threat_region = THREAT_REGION_DESERT_UNDERDARK

/area/rogue/under/desertunderdark/undercity
	name = "City Beneath The Sands"
	icon_state = "basement"
	first_time_text = "City Beneath The Sands"
	deathsight_message = "dark roads under the sands"

/area/rogue/under/desertunderdark/pyramid
	name = "The Condemned Pyramid"
	icon_state = "basement"
	ambush_times = null
	ambush_mobs = null
	first_time_text = "The Condemned Pyramid"
	deathsight_message = "a sunken pyramid"
	droning_sound = 'sound/music/area/tombs.ogg'
	ceiling_protected = TRUE

//Desert Towns Bog Biome, shares Threat Region with rest of Underdark. Hag gets notified of people in this area.
/area/rogue/under/desertbog
	name = "The Wastemire"
	icon_state = "bog"
	warden_area = TRUE
	drow_area = TRUE
	first_time_text = "The WasteMire"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/underdark.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_mobs = list(
// Singles — budget filler across all factions present in the bog
				/mob/living/simple_animal/hostile/retaliate/rogue/troll/bog = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/spider = 40,
				/mob/living/carbon/human/species/skeleton/npc/bogguard = 20,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 30,
				/mob/living/carbon/human/species/elf/dark/drowraider/ambush = 10,
				/mob/living/carbon/human/species/human/northern/bog_deserters/ambush = 15,
				/mob/living/carbon/human/species/human/northern/bog_deserters/better_gear/ambush = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/ooze_blob = 5,
				// Packs — big-ticket purchases for high budgets
				new /datum/ambush_config/bog_guard_deserters = 50,
				new /datum/ambush_config/bog_guard_deserters/hard = 25,
				new /datum/ambush_config/mirespiders_ambush = 110,
				new /datum/ambush_config/mirespiders_crawlers = 25,
				new /datum/ambush_config/mirespiders_aragn = 10,
				new /datum/ambush_config/mirespiders_unfair = 5)
	converted_type = /area/rogue/outdoors/caves
	deathsight_message = "a filthy swamp, far beneath the dunes"
	detail_text = DETAIL_TEXT_UNDERDARK
	threat_region = THREAT_REGION_DESERT_UNDERDARK
	var/list/recent_intruders = list()

// DO NOT PLACE ANY AREAS INBETWEEN THIS SPACE
/area/rogue/under/desertbog/Entered(atom/movable/AM)
	..()
	if(!GLOB.active_hags.len)
		return

	var/mob/living/L = AM
	if(!istype(L) || !L.client || L.stat == DEAD)
		return

	if(L in GLOB.active_hags)
		return

	GLOB.bogged_players += L.real_name

	if(recent_intruders[L] && recent_intruders[L] > world.time)
		return

	recent_intruders[L] = world.time + 1 MINUTES
	for(var/mob/living/H in GLOB.active_hags)
		to_chat(H, span_boldwarning("The roots of your sanctum shiver... a soul named [L.name] has stepped within [src.name]."))

/area/rogue/under/desertbog/Exited(atom/movable/AM)
	. = ..()
	if(!GLOB.active_hags.len)
		return

	var/mob/living/L = AM
	if(!istype(L) || !L.client || L.stat == DEAD)
		return

	if(L in GLOB.active_hags)
		return

	GLOB.bogged_players -= L.real_name

// Lava Biome and vicinity in top left of map, Shares threat region with rest of Underdark Zones for Simplicity
/area/rogue/under/desertcaldera
	name = "Caldera Pass"
	icon_state = "decap"
	warden_area = TRUE
	first_time_text = "Caldera Passage"
	ambush_mobs = list(
				// Singles — budget filler across all factions
				/mob/living/carbon/human/species/human/northern/highwayman/ambush = 15,
				/mob/living/carbon/human/species/human/northern/highwayman/mount_reaver = 15,
				/mob/living/carbon/human/species/skeleton/npc/medium = 15,
				/mob/living/carbon/human/species/skeleton/npc/hard = 10,
				// Packs
				new /datum/ambush_config/trio_of_highwaymen = 10,
				new /datum/ambush_config/singular_minotaur = 10,
				new /datum/ambush_config/duo_minotaur = 5,
				new /datum/ambush_config/solo_treasure_hunter = 15,
				new /datum/ambush_config/duo_treasure_hunter = 2,
				new /datum/ambush_config/medium_skeleton_party = 10,
				new /datum/ambush_config/heavy_skeleton_party = 5,
				)
	converted_type = /area/rogue/outdoors/caves
	ambush_times = list("night","dawn","dusk","day")
	droning_sound = 'sound/music/area/decap_deeper.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	threat_region = THREAT_REGION_DESERT_UNDERDARK
	deathsight_message = "an expanse of life, near volcanic flows"

/area/rogue/under/desertcaldera/upper
	name = "Upper Caldera Pass"

/area/rogue/under/desertcaldera/middle
	name = "Middle Caldera Pass"
	drow_area = TRUE

/area/rogue/under/desertcaldera/lower
	name = "Lower Caldera Pass"
	drow_area = TRUE

/area/rogue/under/desertcaldera/outlawsvillage
	name = "Outlaws Retreat"
	first_time_text = "Outlaws Retreat"
	drow_area = TRUE
	ceiling_protected = TRUE
	ambush_times = null
	ambush_mobs = null
	deathsight_message = "an outlaws paradise, along a caldera ridge"

// CC - Dungeon or special area Additions
/area/rogue/under/cave/desertminomaze
	name = "Labyrinth of Penance"
	loot_budget = LOOT_BUDGET_DESERTMINOMAZE
	droning_sound = 'sound/music/area/prospector.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "The Labyrinth of Penance"
	ambush_times = null
	ambush_mobs = null
	deathsight_message = "a maze of the unredeemed"
	ceiling_protected = TRUE

/area/rogue/under/cave/dunelord
	name = "Dunelords Hideout"
	first_time_text = "Dunelords Hideout"
	ambush_times = null
	ambush_mobs = null
	deathsight_message = "the dunelords retreat"

/area/rogue/under/cave/deserthotsprings
	name = "Abandoned Hotsprings"
	icon_state = "eora"
	first_time_text = "Abandoned Hotsprings"
	ambush_times = null
	ambush_mobs = null
	soundenv = 6
	droning_sound = 'sound/newmusic/lovecraft2.ogg'
	droning_sound_dusk = 'sound/newmusic/lovecraft2.ogg'
	droning_sound_night = 'sound/newmusic/lovecraft2.ogg'
	deathsight_message = "an abandoned hotspring under the sands"

/area/rogue/under/cave/ifritdigsite
	name = "The Digsite"
	icon_state = "under"
	first_time_text = "The Digsite"
	droning_sound = 'sound/music/area/tombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = null
	ambush_mobs = null
	deathsight_message = "a disturbed lair of spirits and flames, all dancing angrily"
	ceiling_protected = TRUE

/area/rogue/under/cave/ifritbossarena
	name = "The Matriarch Arena"
	icon_state = "under"
	first_time_text = "The Matriarch"
	droning_sound = 'sound/music/area/tombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = null
	ambush_mobs = null
	deathsight_message = "within the disturbed matriarchs chamber"
	ceiling_protected = TRUE

/area/rogue/under/cave/bizbaz
	name = "Bizzare Bazaar"
	icon_state = "under"
	first_time_text = "BIZZARE BAZAAR"
	droning_sound = 'sound/music/area/desert/freedive_2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = null
	ambush_mobs = null
	deathsight_message = "a bizzare enclave of violent faces, and violent deals"
	ceiling_protected = TRUE

// desert_wretch_oasis Special Areas. Bandit zone uses areas earlier in code
/area/rogue/indoors/vampire_manor/desert
	name = "Vampire Hideaway"
	first_time_text = "Vampire Hideaway"
	deathsight_message = "a sunless hideaway"

/area/rogue/indoors/vampire_manor/desert/passage
	name = "Depths of the Passage"
	deathsight_message = "at the entrance to a sunless escape"

/area/rogue/outdoors/desertdeep/wretch_lair
	name = "Wretched Oasis"
	ambush_times = null
	ambush_mobs = null
	deathsight_message = "a paradise under a wretched presence"

/area/rogue/under/dungeon/bizbaz
	name = "Bizzare Bazaar"
	icon_state = "under"
	first_time_text = "BIZZARE BAZAAR"
	droning_sound = 'sound/music/area/desert/freedive_2.ogg'

/area/rogue/under/dungeon/desert_pyramid
	name = "pyramid"
	icon_state = "under"
	first_time_text = "Tomb of the Ancient"
	droning_sound = 'sound/music/area/tombs.ogg'

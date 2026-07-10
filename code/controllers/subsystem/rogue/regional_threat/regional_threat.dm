SUBSYSTEM_DEF(regionthreat)
	name = "Regional Threat"
	wait = 30 MINUTES
	flags = SS_KEEP_TIMING | SS_BACKGROUND
	runlevels = RUNLEVEL_GAME
	// SS fires every 30 minutes = 6 ticks per 3-hour round.
	// Highpop tick = THREAT_HIGHPOP_TICK_RATE (20%) of max_ambush. Each tick is a maintenance fight's worth of threat.
	// Lowpop tick = THREAT_LOWPOP_TICK_RATE (10%) of max_ambush.
	// Basin & Grove & Terrorbog are fully tameable (min 0). Coast & Decap stay dangerous (min > 0).
	// Budget = player_factor * pool * 3%. Solo combat budgets shown at max pool.
	// Additive group drain: 5-man party drains at 3x/player_factor efficiency (0.5x per extra player).
	var/list/threat_regions 

	//CC Edit - Desert Mappification
/datum/controller/subsystem/regionthreat/Initialize(start_timeofday)
	. = ..()
	//CC Edit - Initialize the different regions; Cove World uses the default and Desert uses our variant.
	if(SSmapping.config.map_name == "Desert Town")
		threat_regions = list(
			new /datum/threat_region(
				_region_name = THREAT_REGION_DESERT_TOWN,
				_latent_ambush = 0, 
				_min_ambush = 0, //This is within the town.
				_max_ambush = 100, //Within the town, starter quests basically.
				_fixed_ambush = FALSE,
				_ambush_budget_pct = AMBUSH_BUDGET_PCT_SAFE_REGION,
				_lowpop_tick = 100 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 100 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_STRAY_DEADITE = 9, //Mainly just some random undead and maybe a militiaman.
					QUEST_FACTION_HIGHWAYMAN = 1, //Who the hell is this!?
				),
				_tp_budget_multiplier = 0.5, //The scale at which threat points generate. Much lower rates but it's also capped at 50 min points.
				_delivery_reward_multiplier = 1.0,
				_kill_target_floor = 1, //Rare town quests.
				_evergreen_target = 2, //Not so rare town courier quests.
				//Town should only ever have easy quests and courier quests.
				_allowed_quest_types = list(QUEST_KILL_EASY, QUEST_COURIER),
			),
			new /datum/threat_region(
				_region_name = THREAT_REGION_DESERT_TOWN_CAVES,
				_latent_ambush = 0, 
				_min_ambush = 0, //This is within the town.
				_max_ambush = 250, //Within the town, starter quests basically.
				_fixed_ambush = FALSE,
				_ambush_budget_pct = AMBUSH_BUDGET_PCT_SAFE_REGION,
				_lowpop_tick = 250 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 250 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_STRAY_DEADITE = 10, //Skeletons are commonplace here.
					QUEST_FACTION_FOREST_GOBLIN = 7.5,
					QUEST_FACTION_MOON_GOBLIN = 5,
					QUEST_FACTION_HIGHWAYMAN = 2.5, // basically for blockade only
					QUEST_FACTION_GRAGGARITE_SPAWN = 0.5, //Very very rare.
				),
				_tp_budget_multiplier = 0.5, //The scale at which threat points generate. Much lower rates but it's also capped at 50 min points.
				_delivery_reward_multiplier = 1.1, //A little better since it's a bit more dangerous.
				_kill_target_floor = 2, //A bit more danger here.
				_evergreen_target = 1, //Not so rare town courier quests.
				//Caves are a bit more dangerous.
				_allowed_quest_types = list(QUEST_KILL_EASY, QUEST_CLEAR_OUT, QUEST_COURIER),
			),
			new /datum/threat_region(
				_region_name = THREAT_REGION_INNER_DUNES,
				_latent_ambush = 50, //Don't overwhelm people.
				_min_ambush = 50, //Nothing about the desert is able to be tamed, you can lower it, but it will always be a harsh place.
				_max_ambush = 300, //But the closer to town, the safer it is.
				_fixed_ambush = FALSE,
				_ambush_budget_pct = AMBUSH_BUDGET_PCT_SAFE_REGION,
				_lowpop_tick = 300 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 300 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_STRAY_DEADITE = 60, //Skeletons are commonplace here.
					QUEST_FACTION_FOREST_GOBLIN = 40,
					QUEST_FACTION_MOON_GOBLIN = 25,
					QUEST_FACTION_HIGHWAYMAN = 5, // basically for blockade only
					QUEST_FACTION_GRAGGARITE_SPAWN = 1, //Very rare.
				),
				_tp_budget_multiplier = 0.5, //The scale at which threat points generate. Much lower rates but it's also capped at 50 min points.
				_delivery_reward_multiplier = 1.0,
				_kill_target_floor = 3, //Kill Target = Kill/Clear Out quests, min amount -> QUEST_KILL_TYPE_WEIGHTS
				_evergreen_target = 1, //Rare courier deliveries.
				_allowed_quest_types = list(QUEST_KILL_EASY, QUEST_CLEAR_OUT, QUEST_COURIER),
			),
			new /datum/threat_region(
				_region_name = THREAT_REGION_FRESH_RIVER,
				_latent_ambush = 25, //Don't overwhelm people.
				_min_ambush = 25, //Still not safe but it's a LOT safer compared to other places.
				_max_ambush = 150, //Closer to the soilsons, keep them safe don't let em die.
				_fixed_ambush = FALSE,
				_ambush_budget_pct = AMBUSH_BUDGET_PCT_SAFE_REGION,
				_lowpop_tick = 300 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 300 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_SEA_GOBLIN = 50, //Sea Goblins?! Yeah sure why not.
					QUEST_FACTION_STRAY_DEADITE = 10,
					QUEST_FACTION_MOON_GOBLIN = 5,
					QUEST_FACTION_GRAGGARITE_SPAWN = 5, //May rarely see them here. Fresh water.
					QUEST_FACTION_HIGHWAYMAN = 1, // Basically for blockade only
				),
				_tp_budget_multiplier = 0.25, //The scale at which threat points generate. Much lower rates but it's also capped at 25 min points.
				_delivery_reward_multiplier = 1.25, //Good area to farm deliveries and the area that sports the most deliveries anyways.
				_kill_target_floor = 1, //Deliveries primarily. Rare combat.
				_evergreen_target = 4, //Evergreen = Courier/Retrieval quests, min amount -> QUEST_EVERGREEN_TYPE_WEIGHTS
				_allowed_quest_types = list(QUEST_CLEAR_OUT, QUEST_COURIER, QUEST_RETRIEVAL, QUEST_RECOVERY),
			),
			new /datum/threat_region(
				_region_name = THREAT_REGION_DEEP_DUNES,
				_latent_ambush = 800,
				_min_ambush = 600, //Nothing about the desert is able to be tamed, you can lower it, but it will always be a harsh place.
				_max_ambush = 1600,
				_fixed_ambush = FALSE,
				_lowpop_tick = 1600 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 1600 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_FOREST_GOBLIN = 50,
					QUEST_FACTION_ORC = 30,
					QUEST_FACTION_STRAY_DEADITE = 30,
					QUEST_FACTION_HELL_GOBLIN = 20,
					QUEST_FACTION_GRAGGARITE_SPAWN = 20, //Graggarite spawn are dangerous and common.
					QUEST_FACTION_TARICHEA_DEADITE = 15,
					QUEST_FACTION_HIGHWAYMAN = 15,
					QUEST_FACTION_LICH_DEADITE = 10, //May occasionally send his army out and about.
					QUEST_FACTION_MADMAN = 5, //The desert holds many, many riches.
				),
				_tp_budget_multiplier = 1.25, //The scale at which threat points generate.
				_delivery_reward_multiplier = 1.75, //Huge delivery multiplier for anyone carrying it out. It's a long walk back and forth doing nothing between.
				//Grand amount of quests out here.
				_kill_target_floor = 4, //Kill Target = Kill/Clear Out quests, min amount -> QUEST_KILL_TYPE_WEIGHTS
				_evergreen_target = 1, //Evergreen = Courier/Retrieval quests, min amount -> QUEST_EVERGREEN_TYPE_WEIGHTS
				//Natural Blockade Quests, only recovery quests, 
				_allowed_quest_types = list(QUEST_CLEAR_OUT, QUEST_RAID, QUEST_BOUNTY, QUEST_RECOVERY, QUEST_BLOCKADE_DEFENSE),
			),
			new /datum/threat_region(
				_region_name = THREAT_REGION_DESERT_UNDERDARK,
				_latent_ambush = 150,
				_min_ambush = 600, //Nothing about the Underdark is ever safe. This is where real adventurers go, deep down down down where the riches lay.
				_max_ambush = 2400,
				_fixed_ambush = FALSE,
				_lowpop_tick = 2400 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 2400 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_SEA_GOBLIN = 60, //Should be cave goblins. Placeholder for now.
					QUEST_FACTION_STRAY_DEADITE = 40,
					QUEST_FACTION_TARICHEA_DEADITE = 30,
					QUEST_FACTION_LICH_DEADITE = 20, //Much more often spotted underground.
					QUEST_FACTION_DROW = 20, //Drow gotta be here! It's the underdark!
					QUEST_FACTION_MINOTAUR = 10, //Oh n o.
					QUEST_FACTION_GRAGGARITE_SPAWN = 3, //Not commonly found here but may wander here.
				),
				_tp_budget_multiplier = 2, //Plans to make the underdark deeper and more dangerous in the future. Only ever at most 1 delivery quest.
				_delivery_reward_multiplier = 1.0,
				_kill_target_floor = 3, //Kill Target = Kill/Clear Out quests, min amount -> QUEST_KILL_TYPE_WEIGHTS
				_evergreen_target = 0, //No courier quests here in the underdark.
				_allowed_quest_types = list(QUEST_CLEAR_OUT, QUEST_RAID, QUEST_BOUNTY, QUEST_BLOCKADE_DEFENSE),
			),
		)
	else
		threat_regions = list(
			new /datum/threat_region(
				_region_name = THREAT_REGION_AZURE_BASIN,
				_latent_ambush = 150,
				_min_ambush = 0,
				_max_ambush = 375,
				_fixed_ambush = FALSE,
				_ambush_budget_pct = AMBUSH_BUDGET_PCT_SAFE_REGION,
				_lowpop_tick = 375 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 375 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_FOREST_GOBLIN = 60,
					QUEST_FACTION_SEA_GOBLIN = 40,
					QUEST_FACTION_HIGHWAYMAN = 5, // basically for blockade only
				),
				_tp_budget_multiplier = 0.75,
				_delivery_reward_multiplier = 1.0,
				_kill_target_floor = 4,
				_evergreen_target = 3,
				_allowed_quest_types = list(QUEST_KILL_EASY, QUEST_CLEAR_OUT, QUEST_COURIER, QUEST_RETRIEVAL, QUEST_RECOVERY),
			),
			new /datum/threat_region(
				_region_name = THREAT_REGION_AZURE_GROVE,
				_latent_ambush = 375,
				_min_ambush = 0,
				_max_ambush = 750,
				_fixed_ambush = FALSE,
				_ambush_budget_pct = AMBUSH_BUDGET_PCT_SAFE_REGION,
				_lowpop_tick = 750 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 750 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_FOREST_GOBLIN = 40,
					QUEST_FACTION_HIGHWAYMAN = 30,
					QUEST_FACTION_STRAY_DEADITE = 20,
					QUEST_FACTION_WILD_BEAST = 10,
				),
				_tp_budget_multiplier = 1.0,
				_delivery_reward_multiplier = 1.5,
				_kill_target_floor = 5,
				_evergreen_target = 3
				// allowed_quest_types: default (all)
			),
			new /datum/threat_region(
				_region_name = THREAT_REGION_TERRORBOG,
				_latent_ambush = 1500,
				_min_ambush = 0, // Fully tameable — a warden can engage in a long war to tame the terrorbog.
				_max_ambush = 1500,
				_fixed_ambush = FALSE,
				_lowpop_tick = 1500 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 1500 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_BOGMAN = 40,
					QUEST_FACTION_MIRESPIDER = 25,
					QUEST_FACTION_BOG_DEADITE = 20,
					QUEST_FACTION_BOG_TROLL = 10,
					QUEST_FACTION_FOREST_GOBLIN = 5,
				),
				_tp_budget_multiplier = 1.5,
				_delivery_reward_multiplier = 2.0,
				_allowed_quest_types = list(QUEST_CLEAR_OUT, QUEST_RAID, QUEST_BOUNTY, QUEST_COURIER, QUEST_RETRIEVAL, QUEST_RECOVERY, QUEST_TOWNER_SMITH_CARAVAN, QUEST_TOWNER_MINER_OREVEIN),
				_kill_target_floor = 3,
				_evergreen_target = 2
			),
			// Coast & Decap stay somewhat dangerous no matter what
			new /datum/threat_region(
				_region_name = THREAT_REGION_AZUREAN_COAST,
				_latent_ambush = 500,
				_min_ambush = 225,
				_max_ambush = 800,
				_fixed_ambush = FALSE,
				_lowpop_tick = 800 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 800 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_ORC = 30,
					QUEST_FACTION_SEA_GOBLIN = 25,
					QUEST_FACTION_GRONNMAN = 20,
					QUEST_FACTION_BLEAKISLE_REAVER = 15,
					QUEST_FACTION_HIGHWAYMAN = 10,
				),
				_tp_budget_multiplier = 1.2,
				_delivery_reward_multiplier = 1.8,
				_allowed_quest_types = list(QUEST_CLEAR_OUT, QUEST_RAID, QUEST_BOUNTY, QUEST_RECOVERY, QUEST_TOWNER_SMITH_CARAVAN, QUEST_TOWNER_MINER_OREVEIN),
				_kill_target_floor = 3
			),
			new /datum/threat_region(
				_region_name = THREAT_REGION_MOUNT_DECAP,
				_latent_ambush = 600,
				_min_ambush = 300,
				_max_ambush = 1000,
				_fixed_ambush = FALSE,
				_lowpop_tick = 1000 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 1000 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_HELL_GOBLIN = 25,
					QUEST_FACTION_TARICHEA_DEADITE = 20,
					QUEST_FACTION_MOUNT_REAVER = 20,
					QUEST_FACTION_MOUNTAIN_TROLL = 15,
					QUEST_FACTION_MINOTAUR = 10,
					QUEST_FACTION_GREAT_BEAST = 5,
					QUEST_FACTION_MADMAN = 5,
				),
				_tp_budget_multiplier = 1.5,
				_delivery_reward_multiplier = 2.0,
				_allowed_quest_types = list(QUEST_CLEAR_OUT, QUEST_RAID, QUEST_BOUNTY, QUEST_RECOVERY, QUEST_TOWNER_SMITH_CARAVAN, QUEST_TOWNER_MINER_OREVEIN),
				_kill_target_floor = 3
			),
			// Underdark cannot be tamed — min_ambush is high, keeping the region permanently dangerous.
			new /datum/threat_region(
				_region_name = THREAT_REGION_UNDERDARK,
				_latent_ambush = 600,
				_min_ambush = 400, // Hard floor — drow and spider nests are eternal
				_max_ambush = 1200,
				_fixed_ambush = FALSE,
				_lowpop_tick = 1200 * THREAT_LOWPOP_TICK_RATE,
				_highpop_tick = 1200 * THREAT_HIGHPOP_TICK_RATE,
				_faction_weights = list(
					QUEST_FACTION_DROW = 30,
					QUEST_FACTION_MIRESPIDER = 25,
					QUEST_FACTION_MOON_GOBLIN = 25,
					QUEST_FACTION_LICH_DEADITE = 10,
					QUEST_FACTION_MINOTAUR = 10,
				),
				_tp_budget_multiplier = 1.5,
				_delivery_reward_multiplier = 2.0,
				_allowed_quest_types = list(QUEST_CLEAR_OUT, QUEST_RAID, QUEST_BOUNTY, QUEST_RECOVERY, QUEST_TOWNER_SMITH_CARAVAN, QUEST_TOWNER_MINER_OREVEIN),
				_kill_target_floor = 3
			)
		)

/datum/controller/subsystem/regionthreat/fire(resumed)
	var/player_count = GLOB.player_list.len
	var/ishighpop = player_count >= LOWPOP_THRESHOLD
	for(var/T in threat_regions)
		var/datum/threat_region/TR = T
		if(ishighpop)
			TR.increase_latent_ambush(TR.highpop_tick)
		else
			TR.increase_latent_ambush(TR.lowpop_tick)

/datum/controller/subsystem/regionthreat/proc/get_region(region_name)
	for(var/T in threat_regions)
		var/datum/threat_region/TR = T
		if(TR.region_name == region_name)
			return TR
	return null

/// Weighted pick of a region that allows the given quest type, weighted by fill ratio
/// (latent_ambush / max_ambush). Regions with more relative threat are picked more often, so
/// as adventurers clear a region its quest share naturally drops. Returns null if no region
/// allows the type.
/datum/controller/subsystem/regionthreat/proc/pick_region_for_quest(quest_type)
	var/list/weights = list()
	for(var/T in threat_regions)
		var/datum/threat_region/TR = T
		if(!TR.allows_quest_type(quest_type))
			continue
		var/weight = TR.get_threat_weight()
		if(weight <= 0)
			continue
		weights[TR] = weight
	if(!length(weights))
		// Fall back: any region that allows the type, ignoring fill ratio.
		for(var/T in threat_regions)
			var/datum/threat_region/TR = T
			if(TR.allows_quest_type(quest_type))
				weights[TR] = 1
		if(!length(weights))
			return null
	return pickweight(weights)

/datum/threat_region_display
	var/region_name
	var/danger_level
	var/danger_color
	var/list/ic_description = list()

/datum/controller/subsystem/regionthreat/proc/get_threat_regions_for_display()
	var/list/threat_region_displays = list()
	for(var/T in threat_regions)
		var/datum/threat_region/TR = T
		var/datum/threat_region_display/TRS = new /datum/threat_region_display
		TRS.region_name = TR.region_name
		TRS.danger_level = TR.get_danger_level()
		TRS.danger_color = TR.get_danger_color()
		TRS.ic_description = TR.get_ic_description()
		threat_region_displays += TRS
	return threat_region_displays

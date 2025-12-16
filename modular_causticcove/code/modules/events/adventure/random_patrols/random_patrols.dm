/datum/round_event_control/random_patrol
	name = "Random Patrol"
	track = EVENT_TRACK_MODERATE
	typepath = /datum/round_event/random_patrol
	weight = 5
	//max_occurrences = 5 //Not used currently. Not yet at least... Will be used if it becomes a problem or too often in a round.
	min_players = 0
	//earliest_start = 0 //Default to 12 Minutes.

	tags = list(
		TAG_COMBAT,
		TAG_BATTLE,
	)

/datum/round_event/random_patrol
	//INTENRAL VARS, DO NOT TOUCH UNLESS YOU KNOW WHAT YOU'RE DOING!
	var/chosen_patrol = 0


/datum/random_patrol
	//INTENRAL VARS, DO NOT TOUCH UNLESS YOU KNOW WHAT YOU'RE DOING!
	var/list/turfs = list()
	var/list/chosen_turf = list()

	//The types of mobs/atoms we are spawning in this patrol.
	//This also works with ambush configs as well if you wish to define preset spawns.
	var/list/atom_types = list()

	//The types of rarer mobs/atoms we are spawning in this patrol.
	var/list/rare_atom_types = list()

	//The kinds of loot we'll spawn here. Used with pickweight.
	var/list/loot_atom_types = list()

	//The turfs we are allowing the mobs to spawn on.
	var/list/allowed_turfs = list()

	//The turfs we are not allowed to spawn on. Defaults with openspace included.
	var/list/blocked_turfs = list(/turf/open/transparent/openspace)

	//How many mobs to spawn in upper amounts.
	var/amt_upper = 2
	
	//How many mobs to spawn in lower amounts.
	var/amt_lower = 1

	//How much loot to spawn in lower amounts.
	var/loot_amt_lower = 1

	//How much loot to spawn in upper amounts.
	var/loot_amt_upper = 1
	
	//How far we can spawn the mobs in a range around the chosen turf. Default = 5.
	var/spawn_range = 5

	//The chance at which we replace a regular mob type with a rare mob type. Uses prob() proc.
	var/rare_prob = 15

	//Global Announcement text.
	var/event_text

//Actually handles the spawning with the given arguments.
	//This can technically also spawn objects as well, such as /obj/structure/gob_portal, go wild with it!
/datum/random_patrol/proc/spawn_mobs(atom_types, rare_atom_types, rare_prob, spawn_range, amt_lower, amt_upper)
	var/amt2spawn = rand(amt_lower, amt_upper)
	var/rare_mob
	var/mob
	
	if(turfs)
		//Clear old turf.
		turfs = list()
		for(var/i in 1 to amt2spawn)
			for(var/turf/open/T in range(spawn_range, chosen_turf))
				for(var/obj/O in get_turf(T))
					if(O.density)
						continue //Find another turf, this one is too dense...
					turfs += T

			if(prob(rare_prob) && rare_atom_types)
				rare_mob = pick(rare_atom_types)
				new rare_mob(pick(turfs))
			else if(atom_types)
				mob = pick(atom_types)
				new mob(pick(turfs))

		message_admins("A patrol group has been created in [get_area_name(chosen_turf)].")

/datum/random_patrol/proc/spawn_loot(loot_atom_types, loot_amt_lower, loot_amt_upper)
	var/amt2spawn = rand(loot_amt_lower, loot_amt_upper)
	var/treasure
	
	if(turfs && loot_atom_types)
		//Clear old turf.
		turfs = list()
		for(var/i in 1 to amt2spawn)
			//Divide the spawn range by 2 for loot spawns to make it more centralized and loot-piley.
			for(var/turf/open/T in range(abs(spawn_range / 2), chosen_turf))
				for(var/obj/O in get_turf(T))
					if(O.density)
						continue //Find another turf, this one is too dense...
					turfs += T
			if(loot_atom_types)
				treasure = pickweight(loot_atom_types)
				new treasure(pick(turfs))

/datum/random_patrol/New(my_processing, datum/round_event_control/source)
	. = ..()
	//This should get overridden. Otherwise, if not? Well... Something fucked up.
	event_text = "A patrol has been spotted in [get_area_name(src)]..."
	message_admins("A patrol has been created in [get_area_name(src)], but no event_text was given!")

/datum/round_event/random_patrol/start()
	. = ..()

	//Choose our patrol at random.
	chosen_patrol = rand(1,3)

	switch(chosen_patrol)
		if(1) //Trolls in the underdark!
			var/D = /datum/random_patrol/troll_posse
			new D
		if(2) //Goblins up north along the coast!
			var/D = /datum/random_patrol/goblin_swarm
			new D
		if(3) //The grove's Wolf Pack!
			var/D = /datum/random_patrol/wolf_pack
			new D


///////////////////////////
// PATROL VARIANTS BEGIN \\

//Remember! Change the name after /base/ to make a new datum path and to not override anything.
//Copy and edit the variables within to your liking, this is the default patrol that will spawn in the underdark.
/datum/random_patrol/troll_posse/New(my_processing, datum/round_event_control/source)
	. = ..()

	atom_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/troll/axe,
		/mob/living/simple_animal/hostile/retaliate/rogue/troll/bog)

	rare_atom_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/troll/cave)

	allowed_turfs = list(/turf/open/floor/rogue/cobblerock)

	event_text = pick("The distant thuds of heavy footsteps can be heard deep underground... Trolls!",
					"Angery slobbering echoes from within the underdark... Trolls!")

	spawn_range = 7
	rare_prob = 25
	amt_upper = 5
	amt_lower = 3

	loot_atom_types = list(/obj/item/roguecoin/copper/pile = 3,
						/obj/item/roguecoin/silver/pile = 2,
						/obj/item/roguecoin/gold/pile = 1) //Money! We like money! Just as something to start...
	loot_amt_upper = 0
	loot_amt_lower = 0
	
	//Don't forget to change the areas! You can do more than one! See the goblin_swarm datum!
	for(var/area/rogue/under/underdark/A in world) //Grab the areas. We always assume this exists on the map.
		for(var/turf/open/T in A) //Check the turf.
			if(is_type_in_list(T, allowed_turfs))
				turfs += T

	chosen_turf = pick(turfs)
	priority_announce("[event_text]", "Patrol Notice: [get_area_name(get_area(chosen_turf))]", 'sound/misc/notice.ogg')
	spawn_mobs(atom_types, rare_atom_types, rare_prob, spawn_range, amt_lower, amt_upper, turfs)
	spawn_loot(loot_atom_types, loot_amt_lower, loot_amt_upper)
	qdel(src) //Clean ourselves up.


//Goblin Swarms. They attack the grove primarily, and rarely. Very weak since all goblins are just reskinned gobbos.
/datum/random_patrol/goblin_swarm/New(my_processing, datum/round_event_control/source)
	. = ..()

	atom_types = list(/mob/living/carbon/human/species/goblin/npc/hell)

	rare_atom_types = list(/obj/structure/gob_portal,
		/mob/living/carbon/human/species/goblin/npc/moon)

	allowed_turfs = list(/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass)

	event_text = pick("The angry chants of jabbering can be heard far north along the coast... Hell Goblins!",
					"Pires of smoke can be seen just beyond the grove, followed by ominous, swirling noise... Hell Goblins!")

	loot_atom_types = list(/obj/item/roguecoin/copper/pile = 3,
						/obj/item/roguecoin/silver/pile = 2,
						/obj/item/roguecoin/gold/pile = 1) //Money! We like money! Just as something to start...
	loot_amt_upper = 0
	loot_amt_lower = 0

	spawn_range = 8 //Spread these guys out a bit. There's a lot.
	rare_prob = 25 //Portals!? They have fuckin' PORTALS!? (DUH HOW ELSE DID THEY GET THERE!!!)
	amt_upper = 10 //Lots of these fuckers! Better bring a group to help... Or pick them off one by one.
	amt_lower = 6
	
	for(var/area/rogue/outdoors/beach/forest/south/A in world)
		for(var/turf/open/T in A) 
			if(is_type_in_list(T, allowed_turfs))
				turfs += T
	for(var/area/rogue/outdoors/beach/forest/north/A in world)
		for(var/turf/open/T in A) 
			if(is_type_in_list(T, allowed_turfs))
				turfs += T

	chosen_turf = pick(turfs)
	priority_announce("[event_text]", "Patrol Notice: [get_area_name(get_area(chosen_turf))]", 'sound/misc/notice.ogg')
	spawn_mobs(atom_types, rare_atom_types, rare_prob, spawn_range, amt_lower, amt_upper, turfs)
	spawn_loot(loot_atom_types, loot_amt_lower, loot_amt_upper)
	qdel(src) //Clean ourselves up.

//Wolf Packs. They will randomly appear in the grove in big packs...
/datum/random_patrol/wolf_pack/New(my_processing, datum/round_event_control/source)
	. = ..()

	atom_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/wolf)

	rare_atom_types = list()

	allowed_turfs = list(/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass)

	event_text = pick("Snarling, snapping jaws, light-footed patters amongst the dark of the grove... Volf Pack!",
					"Angry growls and distant howling can be heard... Volf Pack!")

	loot_atom_types = list(/obj/item/natural/bone) //Bones! We are ebil wolfies! We lubv bones!
	loot_amt_upper = 6
	loot_amt_lower = 4

	spawn_range = 6 //PACK STAY TOGETHER WE STRONG!
	rare_prob = 0
	amt_upper = 8
	amt_lower = 6
	
	for(var/area/rogue/outdoors/woods/southeast/A in world)
		for(var/turf/open/T in A) 
			if(is_type_in_list(T, allowed_turfs))
				turfs += T
	for(var/area/rogue/outdoors/woods/north/A in world)
		for(var/turf/open/T in A) 
			if(is_type_in_list(T, allowed_turfs))
				turfs += T

	chosen_turf = pick(turfs)
	priority_announce("[event_text]", "Patrol Notice: [get_area_name(get_area(chosen_turf))]", 'sound/misc/notice.ogg')
	spawn_mobs(atom_types, rare_atom_types, rare_prob, spawn_range, amt_lower, amt_upper, turfs)
	spawn_loot(loot_atom_types, loot_amt_lower, loot_amt_upper)
	qdel(src) //Clean ourselves up.
// PATROL VARIANTS END \\
/////////////////////////

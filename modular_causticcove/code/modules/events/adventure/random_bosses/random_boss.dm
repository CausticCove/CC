//Very similar code to random_patrol for parity sake, modified to support a single mob instead however.

/datum/round_event_control/random_boss
	name = "Random Boss"
	track = EVENT_TRACK_OMENS
	typepath = /datum/round_event/random_boss
	weight = 3
	max_occurrences = 1
	min_players = 0
	earliest_start = 1 HOURS //Must be 25% through a round to actually trigger. Pretty Rare event.

	tags = list(
		TAG_COMBAT,
		TAG_BATTLE,
		TAG_DISASTER //Oh yeah this is fucking BAAAAD LOL
	)

/datum/round_event/random_boss
	//INTENRAL VARS, DO NOT TOUCH UNLESS YOU KNOW WHAT YOU'RE DOING!
	var/chosen_boss = 0


/datum/random_boss
	//INTENRAL VARS, DO NOT TOUCH UNLESS YOU KNOW WHAT YOU'RE DOING!
	var/list/turfs = list()
	var/list/chosen_turf = list()

	//The types of mobs/atoms we are spawning in this patrol.
	//This also works with ambush configs as well if you wish to define preset spawns.
	var/list/atom_types = list()

	//The kinds of loot we'll spawn here. Used with pickweight.
	var/list/loot_atom_types = list()

	//The turfs we are allowing the mobs to spawn on.
	var/list/allowed_turfs = list()

	//The turfs we are not allowed to spawn on. Defaults with openspace included.
	var/list/blocked_turfs = list(/turf/open/transparent/openspace)

	//How much loot to spawn in lower amounts.
	var/loot_amt_lower = 1

	//How much loot to spawn in upper amounts.
	var/loot_amt_upper = 1

	//How far we should spread the loot around.
	var/loot_spread = 3

	//Global Announcement text.
	var/event_text

//Actually handles the spawning with the given arguments.
	//This can technically also spawn objects as well, such as /obj/structure/gob_portal, go wild with it!
/datum/random_boss/proc/spawn_mobs(atom_types, turfs)
	var/mob
	if(chosen_turf)
		for(var/obj/O in chosen_turf)
			if(O.density)
				continue //Find another turf, this one is too dense...
		if(atom_types)
			mob = pick(atom_types)
			new mob(pick(chosen_turf))

/datum/random_boss/proc/spawn_loot(loot_atom_types, loot_amt_lower, loot_amt_upper, loot_spread)
	var/amt2spawn = rand(loot_amt_lower, loot_amt_upper)
	var/treasure
	
	if(chosen_turf && loot_atom_types)
		//Clear old turf.
		turfs = list()
		for(var/i in 1 to amt2spawn)
			for(var/turf/open/T in range(loot_spread, chosen_turf))
				for(var/obj/O in get_turf(T))
					if(O.density)
						continue //Find another turf, this one is too dense...
					turfs += T
			if(loot_atom_types)
				treasure = pickweight(loot_atom_types)
				new treasure(pick(turfs))

		message_admins("A boss has been created in [get_area_name(chosen_turf)].")

/datum/random_boss/New(my_processing, datum/round_event_control/source)
	. = ..()
	//This should get overridden. Otherwise, if not? Well... Something fucked up.
	event_text = "A boss has been spotted in [get_area_name(src)]..."
	message_admins("A boss has been created in [get_area_name(src)], but no event_text was given!")

/datum/round_event/random_boss/start()
	. = ..()

	//Choose our patrol at random.
	chosen_boss = rand(1)

	switch(chosen_boss)
		if(1) //Dragon in the northern Hamlet!
			var/D = /datum/random_boss/dragon
			new D
		if(2) //The Abyssal One awakens along the shoreline! ... Currently unused. Dragon is always picked.
			var/D = /datum/random_boss/fish_boss
			new D


///////////////////////////
// BOSS VARIANTS BEGIN \\

//Remember! Change the name after /base/ to make a new datum path and to not override anything.
//Copy and edit the variables within to your liking, this is the default patrol that will spawn in the underdark.
/datum/random_boss/dragon/New(my_processing, datum/round_event_control/source)
	. = ..()

	//BIG EVIL BOSS DRAGON!!!
	atom_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/dragon/broodmother)

	//Hamlet center has only cobble rock, spawn there! Mappers can modify this.
	allowed_turfs = list(/turf/open/floor/rogue/cobblerock)

	event_text = pick("A loud roar can be heard in the distance, followed by a booming thump in the earth... You swore you could feel the ground shake... A Dragon has awoken!!!",
					"A heavy woosh flies overhead and shadows cast over you for a split second. A piercing roar can be heard far off in the distance... A Dragon has awoken!!!")

	loot_atom_types = list(/obj/item/roguecoin/copper/pile = 1,
						/obj/item/roguecoin/silver/pile = 1,
						/obj/item/roguecoin/gold/pile = 3) //Money! You get a ton of rewards when it dies via dragon rings and books as well!!!
	loot_amt_upper = 12
	loot_amt_lower = 8
	loot_spread = 4
	
	//WE SPAWN... IN THE HAMLET!!! THIS IS OUR HOME!!! BUZZ OFF!!! Plus we'll be hurting nearby skeletons giving players time to react upon approach.
	for(var/area/rogue/outdoors/beach/forest/hamlet/A in world)
		for(var/turf/open/T in A) //Check the turf.
			if(is_type_in_list(T, allowed_turfs))
				turfs += T

	if(!turfs)
		message_admins("No applicable turf was able to be found for [src.type]! Alert a coder, or a mapper to check it out!")
		return

	chosen_turf = pick(turfs)
	priority_announce("[event_text]", "Patrol Notice: [get_area_name(get_area(chosen_turf))]", 'sound/villain/dreamer_warning.ogg')
	spawn_mobs(atom_types, turfs)
	spawn_loot(loot_atom_types, loot_amt_lower, loot_amt_upper)
	qdel(src) //Clean ourselves up.

//May need to remove, this guy can spam a shit ton of mobs non-stop and easily lag the server if someone abuses it.
/datum/random_boss/fish_boss/New(my_processing, datum/round_event_control/source)
	. = ..()

	//"AUGH~", says the pufferfish.
	atom_types = list(/mob/living/simple_animal/hostile/boss/fishboss)

	//We spawn along the beach!
	allowed_turfs = list(/turf/open/floor/rogue/AzureSand)

	event_text = pick("The coast churns, water rising and clouds darkening along the ocean horizon. Thunder strikes as a loud boom can be heard... The Abyssal One has awoken!!!",
					"The shore crashes against the coast, spraying water up along the grove... Angry gurgling and bubbling can be heard... The Abyssal One has awoken!!!")

	loot_atom_types = list(/obj/item/roguecoin/copper/pile = 2,
						/obj/item/roguecoin/silver/pile = 1,
						/obj/item/roguecoin/gold/pile = 1) //Money! You get a ton of rewards when it dies via dragon rings and books as well!!!
	loot_amt_upper = 12
	loot_amt_lower = 8
	loot_spread = 4
	
	//Beach only!
	for(var/area/rogue/outdoors/beach/north/A in world)
		for(var/turf/open/T in A) //Check the turf.
			if(is_type_in_list(T, allowed_turfs))
				turfs += T
	for(var/area/rogue/outdoors/beach/south/A in world)
		for(var/turf/open/T in A) //Check the turf.
			if(is_type_in_list(T, allowed_turfs))
				turfs += T

	if(!turfs)
		message_admins("No applicable turf was able to be found for [src.type]! Alert a coder, or a mapper to check it out!")
		return

	chosen_turf = pick(turfs)
	priority_announce("[event_text]", "Patrol Notice: [get_area_name(get_area(chosen_turf))]", 'sound/villain/dreamer_warning.ogg')
	spawn_mobs(atom_types, turfs)
	spawn_loot(loot_atom_types, loot_amt_lower, loot_amt_upper)
	qdel(src) //Clean ourselves up.
// BOSS VARIANTS END \\
/////////////////////////

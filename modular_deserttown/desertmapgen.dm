/obj/effect/landmark/mapGenerator/rogue/desert
	mapGeneratorType = /datum/mapGenerator/desert
	endTurfX = 380
	endTurfY = 310
	startTurfX = 1
	startTurfY = 1

/obj/effect/landmark/mapGenerator/rogue/calderadesert
	mapGeneratorType = /datum/mapGenerator/desertcaldera
	endTurfX = 380
	endTurfY = 310
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/desert
	modules = list(/datum/mapGeneratorModule/desertmobs,
		/datum/mapGeneratorModule/desertsand,
		/datum/mapGeneratorModule/desertgrass,
		/datum/mapGeneratorModule/desertroad,
		/datum/mapGeneratorModule/desertwater,
		/datum/mapGeneratorModule/desertunderdarkstone,
		/datum/mapGeneratorModule/desertunderdarkmud,
		/datum/mapGeneratorModule/desertbogwater,
		/datum/mapGeneratorModule/desertbogdirt,
		/datum/mapGeneratorModule/desertbogstoneandroads
		)

/datum/mapGenerator/desertcaldera
	modules = list(/datum/mapGeneratorModule/desertlavadirt,
		/datum/mapGeneratorModule/desertlavastone
		)

//Randomly placed mobs across the world, very rare spawns only in the deep desert.
/datum/mapGeneratorModule/desertmobs
	clusterCheckFlags = CLUSTER_CHECK_ALL
	allowed_turfs = list(/turf/open/floor/rogue/dunes)
	// excluded_turfs = list()
	spawnableAtoms = list(/mob/living/carbon/human/species/skeleton/npc/easy = 0.1)
	// spawnableTurfs = list()
	allowed_areas = list(/area/rogue/outdoors/desertdeep)

/datum/mapGeneratorModule/desertsand
	clusterCheckFlags = CLUSTER_CHECK_ALL
	allowed_turfs = list(/turf/open/floor/rogue/dunes)
	// excluded_turfs = list()
	spawnableAtoms = list(/obj/structure/flora/roguetree/palm = 0.5,
							/obj/structure/flora/roguegrass/bush/desertshrub = 0.5,
							/obj/structure/flora/roguegrass/desertgrass = 1,
							/obj/structure/flora/roguetree/stump/log = 0.3,
							/obj/structure/flora/ausbushes/ppflowers = 0.1,
							/obj/structure/flora/ausbushes/ywflowers = 0.1,
							/obj/item/natural/stone = 1,
							/obj/structure/quicksand = 4,
							/obj/item/natural/rock = 1,
							/obj/item/magic/artifact = 0.1,
							/obj/structure/leyline/normal/coast = 0.05,
							/obj/structure/leyline/powerful = 0.05,
							/obj/structure/voidstoneobelisk = 0.05,
							/obj/structure/flora/roguegrass/herb/manabloom = 0.05,
							/obj/item/magic/manacrystal = 0.05,
							/obj/structure/flora/roguegrass/herb/random = 0.25,
							/obj/effect/decal/remains/bear = 0.3,
							/obj/effect/hunting_track = 1,
							/obj/effect/decal/remains/human = 0.3,)
	// spawnableTurfs = list()
	allowed_areas = list(/area/rogue/outdoors/desert, /area/rogue/outdoors/desertdeep)


/datum/mapGeneratorModule/desertgrass
	clusterCheckFlags = CLUSTER_CHECK_ALL
	allowed_turfs = list(/turf/open/floor/rogue/dirt, /turf/open/floor/rogue/desert_grass)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguetree/palm = 5,
							/obj/structure/flora/roguegrass/bush/desertshrub = 4,
							/obj/structure/flora/newtree = 4, //Was originally "newtreealt"
							/obj/structure/flora/roguegrass = 3,
							/obj/structure/flora/roguetree/stump/log = 0.5,
							/obj/structure/flora/ausbushes/ppflowers = 0.1,
							/obj/structure/flora/ausbushes/ywflowers = 0.1,
							/obj/structure/flora/roguegrass/maneater = 0.5,
							/obj/structure/flora/roguegrass/maneater/real/juvenile = 0.5,
							/obj/item/natural/stone = 1,
							/obj/item/natural/rock = 1,
							/obj/item/magic/artifact = 0.2,
							/obj/structure/leyline/normal/grove = 0.8,
							/obj/structure/voidstoneobelisk = 0.1,
							/obj/structure/flora/roguegrass/herb/manabloom = 0.1,
							/obj/item/magic/manacrystal = 0.1,
							/obj/structure/closet/dirthole/closed/loot = 0.5,
							/obj/structure/flora/roguegrass/swampweed = 0.5,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 0.5,
							/obj/structure/flora/roguegrass/herb/random = 2,
							/obj/effect/decal/remains/bear = 0.5,
							/obj/effect/decal/remains/human = 0.3,
							/obj/effect/hunting_track = 1,
							/obj/structure/zizo_bane = 0.5,
						)
	// spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=2,
	// 					/turf/open/water/swamp=2,)
	allowed_areas = list(/area/rogue/outdoors/desert, /area/rogue/outdoors/desertdeep)

/datum/mapGeneratorModule/desertroad
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/item/natural/stone = 2,/obj/item/grown/log/tree/stick = 1)
	allowed_areas = list(/area/rogue/outdoors/desert, /area/rogue/outdoors/desertdeep)

/datum/mapGeneratorModule/desertwater
	clusterCheckFlags = CLUSTER_CHECK_ALL
	allowed_turfs = list(/turf/open/water/cleanshallow)
	allowed_areas = list(/area/rogue/outdoors/desert, /area/rogue/outdoors/desertdeep)
	spawnableAtoms = list(	/obj/structure/flora/roguetree/stump/log = 1,
							/obj/structure/flora/ausbushes/reedbush = 1,
							/obj/structure/flora/roguegrass/water/reeds = 1,)

/datum/mapGeneratorModule/desertunderdarkstone
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/naturalstone)
	allowed_areas = list(/area/rogue/under/desertunderdark)
	spawnableAtoms = list(/obj/effect/spawner/lootdrop/rogueshroom/happy/random = 5,
							/obj/structure/flora/mushroomcluster = 5,
							/obj/structure/flora/tinymushrooms = 5,
							/obj/structure/roguerock = 20,
							/obj/item/natural/rock = 3,
							/obj/item/natural/stone = 5,
							/obj/structure/vine = 5)

/datum/mapGeneratorModule/desertunderdarkmud
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_areas = list(/area/rogue/under/desertunderdark)
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/mushroomcluster = 5,
							/obj/structure/flora/roguegrass/thorn_bush = 10,
							/obj/effect/spawner/lootdrop/rogueshroom/happy/random = 5,
							/obj/structure/flora/rogueshroom = 5,
							/obj/structure/flora/tinymushrooms = 5,
							/obj/structure/flora/roguegrass = 10,
							/obj/structure/flora/roguegrass/herb/random = 5,
							/obj/item/magic/artifact = 1,
							/obj/structure/zizo_bane = 2)

/datum/mapGeneratorModule/desertbogdirt
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	allowed_areas = list(/area/rogue/under/desertbog)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/bush = 5,
							/obj/structure/flora/roguegrass = 20,
							/obj/structure/flora/roguetree = 1,
							/obj/structure/flora/roguetree/evil = 0.05,
							/obj/structure/flora/roguegrass/maneater = 13,
							/obj/item/natural/stone = 10,
							/obj/item/natural/rock = 6,
							/obj/item/magic/artifact = 4,
							/obj/structure/leyline/powerful = 2,
							/obj/structure/voidstoneobelisk = 0.5,
							/obj/structure/flora/roguegrass/herb/manabloom = 2,
							/obj/item/magic/manacrystal = 1,
							/obj/structure/glowshroom = 10,
							/obj/structure/flora/roguetree/stump/log = 1,
							/obj/structure/flora/roguetree/stump = 1,
							/obj/structure/closet/dirthole/closed/loot = 3,
							/obj/structure/flora/roguegrass/swampweed = 10,
							/obj/structure/flora/roguegrass/bush/westleach = 10,
							/obj/structure/flora/roguegrass/maneater/real = 3,
							/obj/structure/zizo_bane = 1)

/datum/mapGeneratorModule/desertbogstoneandroads
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/naturalstone,
							/turf/open/floor/rogue/lightpath,
							/turf/open/floor/rogue/sandbrick)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	allowed_areas = list(/area/rogue/under/desertbog)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/desert = 5)
	spawnableAtoms = list(/obj/item/natural/stone = 5,
							/obj/item/natural/rock = 4,
							/obj/structure/glowshroom = 1,
							/obj/structure/flora/roguegrass/maneater = 1)

/datum/mapGeneratorModule/desertbogwater
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/water/swamp)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/under/desertbog)
	spawnableAtoms = list(/obj/structure/glowshroom = 20,
							/obj/item/restraints/legcuffs/beartrap/armed = 0.05,
							/obj/structure/flora/roguetree/stump/log = 0.5,
							/obj/structure/flora/roguegrass/water = 10,
							/obj/structure/flora/roguegrass/water/reeds = 5)

/datum/mapGeneratorModule/desertlavadirt
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	allowed_areas = list(/area/rogue/under/desertcaldera)
	excluded_areas = list(/area/rogue/under/desertcaldera/outlawsvillage)
	spawnableAtoms = list(/obj/structure/flora/mushroomcluster = 15,
							/obj/structure/flora/roguegrass/thorn_bush = 15,
							/obj/effect/spawner/lootdrop/rogueshroom/happy/random = 20,
							/obj/structure/flora/rogueshroom = 15,
							/obj/structure/flora/tinymushrooms = 15,
							/obj/structure/flora/roguegrass = 10,
							/obj/structure/flora/roguegrass/herb/random = 5,
							/obj/item/magic/artifact = 1,
							/obj/structure/leyline/powerful = 0.1,
							/obj/structure/leyline/normal/decap = 0.2,
							/obj/structure/voidstoneobelisk = 0.1,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 0.3,
							/obj/structure/zizo_bane = 1)
	spawnableTurfs = list(/turf/open/water/swamp = 0.5)

/datum/mapGeneratorModule/desertlavastone
	clusterCheckFlags = CLUSTER_CHECK_ALL
	allowed_turfs = list(/turf/open/floor/rogue/naturalstone)
	allowed_areas = list(/area/rogue/under/desertcaldera)
	excluded_areas = list(/area/rogue/under/desertcaldera/outlawsvillage)
	spawnableAtoms = list(/obj/effect/spawner/lootdrop/rogueshroom/happy/random = 5,
							/obj/structure/flora/mushroomcluster = 5,
							/obj/structure/flora/tinymushrooms = 5,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 0.5,
							/obj/structure/roguerock = 20,
							/obj/item/natural/rock = 3,
							/obj/item/natural/stone = 5,
							/obj/structure/vine = 5)

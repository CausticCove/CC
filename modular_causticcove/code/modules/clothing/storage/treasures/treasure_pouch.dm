//Don't overdo this, there are only 10 slots available, 5 of which are reserved for treasures anyways.
#define EXTRA_LOOT_AMT_MIN 1
#define EXTRA_LOOT_AMT_MAX 4

/obj/item/storage/belt/rogue/pouch/treasure
	name = "Golden Pouch"
	desc = "A pouch full of a myriad of riches! It's your lucky day! What's inside?!"
	icon_state = "pouch_merchant"
	component_type = /datum/component/storage/concrete/roguetown/treasure

/datum/component/storage/concrete/roguetown/treasure
	screen_max_rows = 5
	screen_max_columns = 2
	max_w_class = WEIGHT_CLASS_NORMAL
	not_while_equipped = TRUE

//The special rock of WEALTH. 1% chance of deleting an entire loot bag, unique to Treasure Bags only.
/obj/item/natural/stone/secret_rock_of_wealth
	name = "Rock of Extremely Heavy Wealth"
	desc = "A very VALUABLE and very HEAVY rock, said to be blessed by Xylix himself. A small engraving reads, 'WARNING!!! DO NOT USE!!! Strike once, and ye shall see what true wealth brings!' - Best bring a healer with you or pray to all that is above to grant you mercy for when you smite the next thing this stone hits."
	sellprice = 6.9420 //It's worth so much. So much bullshit.

	force = 99999 //You've only got one strike. Make it count!
	throwforce = 99999

	//Only one shot! Why did you break it?!
	max_integrity = 1
	obj_integrity = 1

	spark_chance = 100 //ALWAYS Spark.

//We get 3 random filters...
/obj/item/natural/stone/secret_rock_of_wealth/Initialize()
	. = ..()
	filters += filter(type="drop_shadow", x=0, y=0, size=1, offset=2, color=rgb(rand(1,255),rand(1,255),rand(1,255)))
	filters += filter(type="drop_shadow", x=0, y=0, size=1, offset=2, color=rgb(rand(1,255),rand(1,255),rand(1,255)))
	filters += filter(type="drop_shadow", x=0, y=0, size=1, offset=2, color=rgb(rand(1,255),rand(1,255),rand(1,255)))
	message_admins("A Rock of Extremely Heavy Wealth was created at: [ADMIN_VERBOSEJMP(src.loc)]")
	log_game("A Rock of Extremely Heavy Wealth was created.")

/obj/item/natural/stone/secret_rock_of_wealth/melee_attack_chain(mob/user, atom/target, params)
	. = ..()
	var/mob/living/carbon/human/H
	if(ishuman(user))
		H = user
	if(H)
		visible_message(span_danger("The rock explodes into a painful, shattering gore, sending sharp shards up into [user.name][user.p_s()] arm and obliterating \the [target.name] in the process!!!"))
		var/obj/item/bodypart/left_arm = H.get_bodypart(BODY_ZONE_L_ARM)
		var/obj/item/bodypart/right_arm = H.get_bodypart(BODY_ZONE_R_ARM)
		if(H.active_hand_index == 1) // == 1 is left, 2 is right. They should never be able to throw without these or use them without these arms.
			left_arm.dismember(skip_checks = TRUE) //THESE ARE COMING OFF.
		else
			right_arm.dismember(skip_checks = TRUE)
		
		H.Stun(150) //15 Second stun. You deserve this...
		H.Knockdown(150)

	message_admins("A Rock of Extremely Heavy Wealth WAS DESTROYED IN AN ATTACK AT: [ADMIN_VERBOSEJMP(src.loc)] !")
	log_game("A Rock of Extremely Heavy Wealth WAS DESTROYED IN AN ATTACK!")

	qdel(src) //Delete us IMMEDIATELY... WE'RE DONE FOR!!!

/obj/item/natural/stone/secret_rock_of_wealth/throw_at(atom/target, range, speed, mob/thrower, spin, diagonals_first, datum/callback/callback)
	. = ..()
	var/mob/living/carbon/human/H
	if(ishuman(thrower))
		H = thrower
	if(H)
		visible_message(span_danger("Raises their arm, the [src.name] glimmering brightly before being sent off hurling through the air in a glorious arc! Along with the arm of [thrower.name]..."))
		var/obj/item/bodypart/left_arm = H.get_bodypart(BODY_ZONE_L_ARM)
		var/obj/item/bodypart/right_arm = H.get_bodypart(BODY_ZONE_R_ARM)
		if(H.active_hand_index == 1) // == 1 is left, 2 is right. They should never be able to throw without these or use them without these arms.
			left_arm.dismember(skip_checks = TRUE)
		else
			right_arm.dismember(skip_checks = TRUE)

		H.Stun(150) //15 Second stun. You deserve this...
		H.Knockdown(150)

	message_admins("A Rock of Extremely Heavy Wealth WAS DESTROYED IN AN THROWN ATTACK AT: [ADMIN_VERBOSEJMP(src.loc)] !")
	log_game("A Rock of Extremely Heavy Wealth WAS DESTROYED IN A THROWN ATTACK!")

/obj/item/natural/stone/secret_rock_of_wealth/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	visible_message(span_danger("The [src.name] shatters gloriously on impact!!!"))
	qdel(src) //Delete us IMMEDIATELY... WE'RE DONE FOR!!!

//Do NOT apply stone_lore to this item. It's a unique/rare item.
/obj/item/natural/stone/secret_rock_of_wealth/stone_lore()
	return

	
/obj/item/storage/belt/rogue/pouch/treasure/PopulateContents()

	if(prob(1))
		new /obj/item/natural/stone/secret_rock_of_wealth(src) //The legendary rock of extremely heavy wealth. Oh, you don't believe me? Here, *gibs you*
		return

	var/rand_amt = rand(EXTRA_LOOT_AMT_MIN, EXTRA_LOOT_AMT_MAX)

	//Roll for the initial treasure. This is garunteed at least in every bag.
	if(prob(10)) //10% Chance for a random gem and 2 jewelry, lucky you!
		new /obj/effect/spawner/lootdrop/random_gem(src)
		new /obj/effect/spawner/lootdrop/valuable_jewelry_spawner(src)
		new /obj/effect/spawner/lootdrop/valuable_jewelry_spawner(src)

	else if(prob(25))
		new /obj/effect/spawner/lootdrop/valuable_jewelry_spawner(src)
		new /obj/effect/spawner/lootdrop/valuable_jewelry_spawner(src)

	else if(prob(33))
		new /obj/effect/spawner/lootdrop/valuable_jewelry_spawner(src)
		new /obj/effect/spawner/lootdrop/cheap_jewelry_spawner(src)

	else if(prob(50))
		if(prob(50)) //Chance to still get something good... Otherwise nah.
			new /obj/effect/spawner/lootdrop/valuable_jewelry_spawner(src)
		else
			new /obj/effect/spawner/lootdrop/cheap_jewelry_spawner(src)
		new /obj/effect/spawner/lootdrop/cheap_jewelry_spawner(src)

	else if(prob(66))
		new /obj/effect/spawner/lootdrop/cheap_jewelry_spawner(src)
		new /obj/effect/spawner/lootdrop/cheap_jewelry_spawner(src)

	else if(prob(50))//Your luck ran thin if you don't get anything...
		new /obj/effect/spawner/lootdrop/cheap_jewelry_spawner(src)

	//Roll for extra junk to flood the pouch with.
	for(var/i in 1 to rand_amt)
		if(prob(33))
			new /obj/effect/spawner/lootdrop/valuable_clutter_spawner(src)
		else //If we can't spawn the clutter; Drop some coins instead to garuntee something.
			if(prob(10))
				new /obj/item/roguecoin/gold/pile(src)
			else if(prob(50))
				new /obj/item/roguecoin/silver/pile(src)
			else
				new /obj/item/roguecoin/copper/pile(src)

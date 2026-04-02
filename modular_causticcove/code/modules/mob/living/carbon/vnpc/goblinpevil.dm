GLOBAL_LIST_INIT(evilgoblin_aggro, world.file2list("strings/rt/evilgobinaggrolines.txt"))

/mob/living/carbon/human/species/goblinevil
	name = "goblin"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	var/goblinevil_outfit = /datum/outfit/job/roguetown/goblinevil/npc
	var/is_silent = FALSE

	race = /datum/species/goblinp
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	ambushable = FALSE

	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	d_intent = INTENT_PARRY
	possible_mmb_intents = list(INTENT_SPECIAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	possible_rmb_intents = list(/datum/rmb_intent/feint, /datum/rmb_intent/aimed, /datum/rmb_intent/strong, /datum/rmb_intent/weak, /datum/rmb_intent/swift, /datum/rmb_intent/riposte)

/mob/living/carbon/human/species/goblinevil/npc
	faction = list("orcs", "station")
	aggressive = 1
	rude = TRUE
	mode = NPC_AI_IDLE
	wander = FALSE
	cmode_music = FALSE
	is_voracious_npc = TRUE
	voremode = TRUE

/mob/living/carbon/human/species/goblinevil/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(!is_silent && target != newtarg)
			say(pick(GLOB.evilgoblin_aggro))
			pointed(target)

/mob/living/carbon/human/species/goblinevil/npc/Initialize()
	. = ..()
	set_species(/datum/species/goblinp)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)
	load_gob_bellies()

/mob/living/carbon/human/species/goblinevil/npc/load_mob_bellies()
	..()

/mob/living/carbon/human/species/goblinevil/npc/after_creation()
	..()
	job = "Goblin"
	equipOutfit(new goblinevil_outfit)
	gender = pick(MALE, FEMALE)
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	var/hairf = pick(list(/datum/sprite_accessory/hair/head/lowbraid, 
						/datum/sprite_accessory/hair/head/countryponytailalt))
	var/hairm = pick(list(/datum/sprite_accessory/hair/head/ponytailwitcher, 
						/datum/sprite_accessory/hair/head/lowbraid))
	head.sellprice = 30

	src.set_patron(/datum/patron/inhumen/graggar)
	ADD_TRAIT(src, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_LIGHT_STEP, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)

	var/datum/bodypart_feature/hair/head/new_hair = new()
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	var/obj/item/organ/ears/organ_ears = getorgan(/obj/item/organ/ears)

	if(organ_eyes)
		organ_eyes.eye_color = "#FF0000"
		organ_eyes.accessory_colors = "#FF0000#FF0000"

	skin_tone = "50715C"

	if(organ_ears)
		organ_ears.accessory_colors = "#50715C"

	if(gender == FEMALE)
		new_hair.set_accessory_type(hairf, null, src)
		var/obj/item/organ/breasts/breasts = src.getorganslot(ORGAN_SLOT_BREASTS)
		if(!breasts)
			breasts = new()
			breasts.Insert(src, TRUE, FALSE)
		breasts.accessory_type = /datum/sprite_accessory/breasts/pair
		breasts.breast_size = rand(1,16)
		breasts.accessory_colors = "#50715C"

	else
		new_hair.set_accessory_type(hairm, null, src)
		
	var/obj/item/organ/butt/butt = src.getorganslot(ORGAN_SLOT_BUTT)
	if(!butt)
		butt = new()
		butt.Insert(src, TRUE, FALSE)
	butt.accessory_type = /datum/sprite_accessory/butt/pair
	butt.organ_size = rand(0,5)
	butt.accessory_colors = "#50715C"

	var/obj/item/organ/belly/belly = src.getorganslot(ORGAN_SLOT_BELLY)
	if(!belly)
		belly = new()
		belly.Insert(src, TRUE, FALSE)
	belly.accessory_type = /datum/sprite_accessory/belly
	belly.belly_size = 0
	belly.accessory_colors = "#50715C"

	head.add_bodypart_feature(new_hair)

	new_hair.accessory_colors = "#31302E"
	new_hair.hair_color = "#31302E"
	hair_color = "#31302E"

	dna.update_ui_block(DNA_HAIR_COLOR_BLOCK)
	dna.species.handle_body(src)
	if(gender == FEMALE)
		real_name = pick(world.file2list("strings/rt/names/other/halforcf.txt"))
	else
		real_name = pick(world.file2list("strings/rt/names/other/halforcm.txt"))
	update_hair()
	update_body()

/datum/outfit/job/roguetown/goblinevil/npc/pre_equip(mob/living/carbon/human/H) //gives some default skills and equipment for player controlled orcs
	H.STASTR = 12
	var/chance_zjumper = 5
	var/chance_treeclimber = 30
	H.STASPD = 14
	if(prob(chance_zjumper))
		ADD_TRAIT(H, TRAIT_ZJUMP, TRAIT_GENERIC)
		H.find_targets_above = TRUE
	if(prob(chance_treeclimber))
		H.tree_climber = TRUE
		H.find_targets_above = TRUE // so they can taunt
	H.STACON = 14
	H.STAWIL = 14
	H.STAINT = 4
	var/loadout = rand(1,5)
	switch(loadout)
		if(1) //tribal spear
			r_hand = /obj/item/rogueweapon/spear/stone
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
		if(2) //tribal axe
			r_hand = /obj/item/rogueweapon/stoneaxe
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
		if(3) //tribal club
			r_hand = /obj/item/rogueweapon/mace/woodclub
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
			if(prob(10))
				head = /obj/item/clothing/head/roguetown/helmet/leather/goblin
		if(4) //lightly armored sword/flail/daggers
			if(prob(50))
				r_hand = /obj/item/rogueweapon/sword/iron
			else
				r_hand = /obj/item/rogueweapon/mace/spiked
			if(prob(30))
				l_hand = /obj/item/rogueweapon/shield/wood
			if(prob(23))
				r_hand = /obj/item/rogueweapon/huntingknife/stoneknife
				l_hand = /obj/item/rogueweapon/huntingknife/stoneknife
			armor = /obj/item/clothing/suit/roguetown/armor/leather/goblin
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/leather/goblin
		if(5) //heavy armored sword/flail/shields
			if(prob(30))
				armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron/goblin
			else
				armor = /obj/item/clothing/suit/roguetown/armor/leather/goblin
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/goblin
			else
				head = /obj/item/clothing/head/roguetown/helmet/leather/goblin
	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE) // Trash mob
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)

//Credit to Syribirb for doing the entirety of the belly descriptions!
//EVIL BELLYCODE--------------------------------------------------------------
/mob/living/proc/load_gob_bellies()
	//Loading goblin bellies for goblin NPCs
	var/obj/belly/M = new /obj/belly(src)
	vore_selected = M
	M.immutable = TRUE
	M.can_taste = TRUE
	M.name = vore_stomach_name ? vore_stomach_name : "maw"
	M.desc = vore_stomach_flavor ? vore_stomach_flavor : "Finally the little beast gets its hands on you.  Tired and numb, you can resist no longer as the greenskin yanks your armor down to bring you level with their lips.  Jagged white teeth gleam at the edges of your vision, and you get one final glimpse of a dripping and pulsing throat before it overtakes you entirely. </br></br>Its tongue drags across your features, tasting you as claws dig into your sides.   You can feel those jagged teeth finally scrape across your scalp and towards the back of your head.   It holds you there for a sadistic minute or two.  Shrill laughter rumbles against your scalp, leaving drool to ooze down your chest and hot breath to billow down your neck…"
	M.digest_mode = vore_default_mode
	M.mode_flags = vore_default_flags
	M.item_digest_mode = vore_default_item_mode
	M.contaminates = vore_default_contaminates
	M.contamination_flavor = vore_default_contamination_flavor
	M.contamination_color = vore_default_contamination_color
	M.escapable = vore_escape_chance > 0
	M.escapechance = vore_escape_chance
	M.escapechance_absorbed = vore_escape_chance_absorbed
	M.digestchance = 0
	M.absorbchance = 0
	M.human_prey_swallow_time = swallowTime
	M.nonhuman_prey_swallow_time = swallowTime
	M.digest_brute = 0
	M.digest_burn = 0
	M.digest_mode = "Hold"
	M.vore_verb = "swallow"
	M.examine_messages = list(
		"%pred has %prey's head stuck in their mouth!",
		"Drool oozes down %prey's frame as they're crudely tasted with their struggling frame shoved ever deeper…")
	M.emote_lists[DM_HOLD] = list( // We need more that aren't repetitive. I suck at endo. -Ace
		"The insides knead at you gently for a moment.",
		"The guts glorp wetly around you as some air shifts.",
		"The predator takes a deep breath and sighs, shifting you somewhat.",
		"The stomach squeezes you tight for a moment, then relaxes harmlessly.",
		"The predator's calm breathing and thumping heartbeat pulses around you.",
		"The warm walls kneads harmlessly against you.",
		"The liquids churn around you, though there doesn't seem to be much effect.",
		"The sound of bodily movements drown out everything for a moment.",
		"The predator's movements gently force you into a different position.")
	can_be_drop_pred = TRUE // Mobs will eat anyone that decides to drop/slip into them by default.
	M.escape_attempt_messages_prey = "You start to kick away from %pred's grasp!"
	M.escape_messages_outside = "%prey manages to escape %pred's clutches!"
	M.escape_messages_prey = "You managed to get away from %pred's grasp!"
	M.escape_fail_messages_prey = "You managed to slip up, getting further trapped!"
	M.autotransferable = 1
	M.autotransferlocation = "throat"
	M.autotransferwait = 300
	M.autotransferchance = 100
	M.autotransfer_min_amount = 1
	M.autotransfer_whitelist = 53
	M.autotransfer_enabled = 1
	M.belly_fullscreen = "vbo_maw14"
	M.belly_fullscreen_color = "#823232"
	M.belly_fullscreen_color2 = "#823232"

	var/obj/belly/T = new /obj/belly(src)
	T.immutable = TRUE
	T.can_taste = TRUE
	T.name = vore_stomach_name ? vore_stomach_name : "throat"
	T.desc = vore_stomach_flavor ? vore_stomach_flavor : "You can hear the tiny thing outside struggling to keep you contained.  Each noisome slurp drags their tongue further down your face, smearing you in spit and matting against your scalp.   As the muscles of their throat catch your head, and eventually your neck. </br></br>GHlLRK.  GLmp… glnrk…   Strained, repetitive swallows work over your form as your head… and steadily the rest of you become nothing but a prominent BULGE on the gobbie's neck.  Teeth scrape back across your skin, leaving dull puffy scratches.  You're sunk into ever-deeper tunnels of tightened flesh as gravity steadily reverses on you. </br></br>The tightness of that throat leaves the smug beast's claws free to slide up your body, grabbing still your kicking thighs and legs just to use the new grip to cram you in deeper.  You're half submerged in the overly tight tunnel of the short beast's esophagus, helpless but to feel it's tongue coil up your legs and taste the salt of your skin."
	T.digest_mode = vore_default_mode
	T.mode_flags = vore_default_flags
	T.item_digest_mode = vore_default_item_mode
	T.contaminates = vore_default_contaminates
	T.contamination_flavor = vore_default_contamination_flavor
	T.contamination_color = vore_default_contamination_color
	T.escapable = vore_escape_chance > 0
	T.escapechance = 10
	T.escapechance_absorbed = vore_escape_chance_absorbed
	T.digestchance = 0
	T.absorbchance = 0
	T.human_prey_swallow_time = swallowTime
	T.nonhuman_prey_swallow_time = swallowTime
	T.digest_brute = 0
	T.digest_burn = 0
	T.digest_mode = "Hold"
	T.vore_verb = "swallow"
	T.examine_messages = list(
		"%pred has %prey's head stuck in their mouth!",
		"Drool oozes down %prey's frame as they're crudely tasted with their struggling frame shoved ever deeper…")
	T.emote_lists[DM_HOLD] = list(
		"The insides knead at you gently for a moment.",
		"The guts glorp wetly around you as some air shifts.",
		"The predator takes a deep breath and sighs, shifting you somewhat.",
		"The stomach squeezes you tight for a moment, then relaxes harmlessly.",
		"The predator's calm breathing and thumping heartbeat pulses around you.",
		"The warm walls kneads harmlessly against you.",
		"The liquids churn around you, though there doesn't seem to be much effect.",
		"The sound of bodily movements drown out everything for a moment.",
		"The predator's movements gently force you into a different position.")
	T.emote_lists[DM_DIGEST] = list(
		"The burning acids eat away at your form.",
		"The muscular stomach flesh grinds harshly against you.",
		"The caustic air stings your chest when you try to breathe.",
		"The slimy guts squeeze inward to help the digestive juices soften you up.",
		"The onslaught against your body doesn't seem to be letting up; you're food now.",
		"The predator's body ripples and crushes against you as digestive enzymes pull you apart.",
		"The juices pooling beneath you sizzle against your sore skin.",
		"The churning walls slowly pulverize you into meaty nutrients.",
		"The stomach glorps and gurgles as it tries to work you into slop.")
	can_be_drop_pred = TRUE // Mobs will eat anyone that decides to drop/slip into them by default.
	T.escape_attempt_messages_prey = "You start to climb up %pred's greedy throat!"
	T.escape_messages_outside = "%prey manages to slide out from the now pissed off predator."
	T.escape_messages_prey = "You managed to slide out from %pred's greedy throat"
	T.escape_fail_messages_prey = "%pred stifles your escape attempt with another greedy swallow."
	T.autotransferable = 1
	T.autotransferlocation = "stomach"
	T.autotransferwait = 300
	T.autotransferchance = 100
	T.autotransfer_min_amount = 1
	T.autotransfer_whitelist = 53
	T.autotransfer_enabled = 1
	T.belly_fullscreen = "vboanim_belly1"
	T.belly_fullscreen_color = "#823232"
	T.belly_fullscreen_color2 = "#823232"

	var/obj/belly/B = new /obj/belly(src)
	B.immutable = TRUE
	B.can_taste = TRUE
	B.name = vore_stomach_name ? vore_stomach_name : "stomach"
	B.desc = vore_stomach_flavor ? vore_stomach_flavor : "Finally, you're deposited in a stinking, fetid bog of a stomach.   Your face is humiliatingly squeezed through a sphincter at the very end before being MASHED against its deepest pit.  A slop of acids and the goblin's previous meals slosh as your face parts the goop… and then the rest of you is forced to curl to fill what little space you have. </br></br>In a smooth slurp, the rest of your body falls down their throat and into a rounded, wobbling bulge on the greenskin's midriff.  Fabric RIPS on the outside as they struggle to even stand with you weighing them down.  You can hear a few strained breaths, a hiccup- and then a ragged BELCH that causes the whole chamber to rumble around you. </br></br>BwhhhhHHHRRRP. </br></br>It tightens and robs you of your air as you're left to contemplate how you even FIT in here.   It's vice-tight and sweltering, and the disgusting pit forces you to twist, turn, and roll within the creechur as your outline is perfectly visible from the outside.   You can even feel the thing wetly drool atop the rounded orb.   Its claws dig into the underside of your heft, weighing just how much MEAL it took in. </br></br>Glrp.  Glllrgl."
	B.digest_mode = vore_default_mode
	B.mode_flags = vore_default_flags
	B.item_digest_mode = vore_default_item_mode
	B.contaminates = vore_default_contaminates
	B.contamination_flavor = vore_default_contamination_flavor
	B.contamination_color = vore_default_contamination_color
	B.escapable = vore_escape_chance > 0
	B.escapechance_absorbed = vore_escape_chance_absorbed
	B.digestchance = vore_digest_chance
	B.absorbchance = vore_absorb_chance
	B.human_prey_swallow_time = swallowTime
	B.nonhuman_prey_swallow_time = swallowTime
	B.vore_verb = "swallow"
	B.digest_brute = 0.5
	B.digest_burn = 0.5
	B.emote_lists[DM_HOLD] = list( // We need more that aren't repetitive. I suck at endo. -Ace
		"The insides knead at you gently for a moment.",
		"The guts glorp wetly around you as some air shifts.",
		"The predator takes a deep breath and sighs, shifting you somewhat.",
		"The stomach squeezes you tight for a moment, then relaxes harmlessly.",
		"The predator's calm breathing and thumping heartbeat pulses around you.",
		"The warm walls kneads harmlessly against you.",
		"The liquids churn around you, though there doesn't seem to be much effect.",
		"The sound of bodily movements drown out everything for a moment.",
		"The predator's movements gently force you into a different position.")
	B.emote_lists[DM_DIGEST] = list(
		"The burning acids eat away at your form.",
		"The muscular stomach flesh grinds harshly against you.",
		"The caustic air stings your chest when you try to breathe.",
		"The slimy guts squeeze inward to help the digestive juices soften you up.",
		"The onslaught against your body doesn't seem to be letting up; you're food now.",
		"The predator's body ripples and crushes against you as digestive enzymes pull you apart.",
		"The juices pooling beneath you sizzle against your sore skin.",
		"The churning walls slowly pulverize you into meaty nutrients.",
		"The stomach glorps and gurgles as it tries to work you into slop.")
	can_be_drop_pred = TRUE // Mobs will eat anyone that decides to drop/slip into them by default.
	B.escape_attempt_messages_prey = "You begin to attack %pred's taught stomach effectively!"
	B.escape_messages_outside = "%pred lurches over, horking up %prey. Ugh..."
	B.escape_messages_prey = "A sudden reflex, and you manage to make %pred cough you up. Slimy, but alive!"
	B.escape_fail_messages_prey = "%pred's stomach clenches down hard, preventing your escape."
	B.escapechance = 5
	B.belly_fullscreen = "vbo_belly5"
	B.belly_fullscreen_color = "#823232"
	B.belly_fullscreen_color2 = "#823232"

/mob/living/carbon/human/species/goblinevil/npc/death(gibbed, nocutscene)
	if(vore_organs.len > 0)
		for(var/obj/belly/B in vore_organs)
			B.release_all_contents(TRUE)
	. = ..()

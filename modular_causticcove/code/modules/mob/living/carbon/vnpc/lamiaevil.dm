GLOBAL_LIST_INIT(lamia_aggro, world.file2list("strings/rt/evillamiaaggrolines.txt"))

/mob/living/carbon/human/species/lamiaevil
	name = "lamia"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	var/lamiaevil_outfit = /datum/outfit/job/roguetown/lamiaevil/npc
	var/is_silent = FALSE

	race = /datum/species/demihuman
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	ambushable = FALSE

	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	d_intent = INTENT_PARRY
	possible_mmb_intents = list(INTENT_SPECIAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	possible_rmb_intents = list(/datum/rmb_intent/feint, /datum/rmb_intent/aimed, /datum/rmb_intent/strong, /datum/rmb_intent/weak, /datum/rmb_intent/swift, /datum/rmb_intent/riposte)

/mob/living/carbon/human/species/lamiaevil/npc
	faction = list("vbandit", "station")
	aggressive = 1
	rude = TRUE
	mode = NPC_AI_IDLE
	wander = FALSE
	cmode_music = FALSE
	is_voracious_npc = TRUE
	voremode = TRUE

/mob/living/carbon/human/species/lamiaevil/npc/Initialize()
	. = ..()
	set_species(/datum/species/demihuman)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)
	load_lamia_bellies()

/mob/living/carbon/human/species/lamiaevil/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(!is_silent && target != newtarg)
			say(pick(GLOB.lamia_aggro))
			pointed(target)


/mob/living/carbon/human/species/lamiaevil/npc/load_mob_bellies()
	..()


/mob/living/carbon/human/species/lamiaevil/npc/after_creation()
	..()
	job = "Bandit"
	equipOutfit(new lamiaevil_outfit)
	gender = pick(MALE, FEMALE)
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	var/hairf = pick(list(/datum/sprite_accessory/hair/head/himecut,
						/datum/sprite_accessory/hair/head/countryponytailalt,
						/datum/sprite_accessory/hair/head/stacy,
						/datum/sprite_accessory/hair/head/kusanagi_alt))
	var/hairm = pick(list(/datum/sprite_accessory/hair/head/ponytailwitcher,
						/datum/sprite_accessory/hair/head/dave,
						/datum/sprite_accessory/hair/head/emo,
						/datum/sprite_accessory/hair/head/sabitsuki,
						/datum/sprite_accessory/hair/head/sabitsuki_ponytail))
	head.sellprice = 30

	src.set_patron(/datum/patron/divine/dendor)
	ADD_TRAIT(src, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_LIGHT_STEP, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NATURAL_ARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CHUNKYFINGERS, TRAIT_GENERIC)
	var/datum/bodypart_feature/hair/head/new_hair = new()
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	var/obj/item/organ/ears/organ_ears = getorgan(/obj/item/organ/ears)

	if(organ_eyes)
		organ_eyes.eye_color = "#FF0000"
		organ_eyes.accessory_colors = "#FF0000#FF0000"
	var/skinchoose = rand(1,5)
	var/skincolor = "#fff0e9"
	var/skincolor2 = "fff0e9"
	switch(skinchoose) //choosing the skincolor of the snek
		if(1)
			skincolor = "#fff0e9"
			skincolor2 = "fff0e9"
		if(2)
			skincolor = "#edc6b3"
			skincolor2 = "edc5b3"
		if(3)
			skincolor = "#ba9882"
			skincolor2 = "ba9882"
		if(4)
			skincolor = "#9c6f52"
			skincolor2 = "9c6f52"
		if(5)
			skincolor = "#5d4c41"
			skincolor2 = "5d4c41"
	var/tailchoose = rand(1,5)
	var/tailcolor = "#520f0f"
	switch(tailchoose) //choosing the skincolor of the snek
		if(1)
			tailcolor = "#520f0f"
		if(2)
			tailcolor = "#1e5704"
		if(3)
			tailcolor = "#161c69"
		if(4)
			tailcolor = "#dfb988"
		if(5)
			tailcolor = "#9e6905"
	Taurize(/obj/item/bodypart/taur/lamia, tailcolor)

	skin_tone = skincolor2

	if(organ_ears)
		organ_ears.accessory_colors = skincolor

	if(gender == FEMALE)
		new_hair.set_accessory_type(hairf, null, src)
		var/obj/item/organ/breasts/breasts = src.getorganslot(ORGAN_SLOT_BREASTS)
		if(!breasts)
			breasts = new()
			breasts.Insert(src, TRUE, FALSE)
		breasts.accessory_type = /datum/sprite_accessory/breasts/pair
		breasts.breast_size = rand(1,16)
		breasts.accessory_colors = skincolor

	else
		new_hair.set_accessory_type(hairm, null, src)
		
	var/obj/item/organ/butt/butt = src.getorganslot(ORGAN_SLOT_BUTT)
	if(!butt)
		butt = new()
		butt.Insert(src, TRUE, FALSE)
	butt.accessory_type = /datum/sprite_accessory/butt/pair
	butt.organ_size = rand(0,5)
	butt.accessory_colors = skincolor

	var/obj/item/organ/belly/belly = src.getorganslot(ORGAN_SLOT_BELLY)
	if(!belly)
		belly = new()
		belly.Insert(src, TRUE, FALSE)
	belly.accessory_type = /datum/sprite_accessory/belly
	belly.belly_size = 0
	belly.accessory_colors = skincolor

	head.add_bodypart_feature(new_hair)

	new_hair.accessory_colors = "#31302E"
	new_hair.hair_color = "#31302E"
	hair_color = "#31302E"

	dna.update_ui_block(DNA_HAIR_COLOR_BLOCK)
	dna.species.handle_body(src)
	if(gender == FEMALE)
		real_name = pick(world.file2list("strings/rt/names/elf/elfwf.txt"))
	else
		real_name = pick(world.file2list("strings/rt/names/elf/elfwm.txt"))
	update_hair()
	update_body()

/datum/outfit/job/roguetown/lamiaevil/npc/pre_equip(mob/living/carbon/human/H) //tribal ass sneks in your area
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	if(prob(50))
		wrists = /obj/item/clothing/wrists/roguetown/bracers/copper
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/helmet/leather
	neck = /obj/item/clothing/neck/roguetown/gorget/copper
	if(prob(50))
		neck = /obj/item/clothing/neck/roguetown/leather
	H.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/natural_armor/dense(H)
	H.STASTR = 12
	H.STASPD = 16
	H.STACON = 14
	H.STAWIL = 14
	H.STAPER = 10
	H.STAINT = 3 //stupid snakes
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)



//Credit to Syribirb for doing the entirety of the belly descriptions!
//EVIL BELLYCODE--------------------------------------------------------------
/mob/living/proc/load_lamia_bellies()
	//Loading genderless catchall bellies
	var/obj/belly/M = new /obj/belly(src)
	vore_selected = M
	M.immutable = TRUE
	M.can_taste = TRUE
	M.name = vore_stomach_name ? vore_stomach_name : "maw"
	M.desc = vore_stomach_flavor ? vore_stomach_flavor : "Smooth scales cling to your legs.   Before you know it, you’re dragged into waiting, warm coils.  The girth of %pred’s tail climbs up your body, and they look down at you with a pleased gleam in their eye. Hands gently hug you within those waiting binds, and you’re left to merely struggle as they lazily use their lower body to overpower you</br></br>Hair drapes across your chest, and their grin only gets more pleased as they rest their head there for just a few moments.<b>Glrg…rrgl…</b>There’s a thick groan from their midriff, they’re hungry- but first things first they need to hear your heartbeat… your fear.   You can see their soft lips part in a too-white, fanged grin from below you.  </br></br>You can hardly move, your arms squirm against too-smooth scales as the constriction is nearly crushing.  Still though, the rest of their body is afforded that lazy attitude.  You can feel their tailtip </br></br>Warm, gooey tongue oozes up your chest, leaving a slimy trail of spit until they pass your jaw an push up your cheek. “Delicioussss… morsssel.”  The naga giggles, their lashes fluttering as they pepper a kiss along the opposite side of your face. Up, up. They’re teasing you.</br></br>Their lips rest on your ear, gently nibbling at the lobe as their warm breath washes over your head. A playful little bite before you hear their wet maw expand… ‘schlp.’ Their jaw unnaturally unhinges, and you’re overtaken in their lips as the flesh of it is the last thing you see. Fangs scrape across your scalp as drool oozes across your face and down your neck.</br></br><b>Schlrp.</b>"
	M.digest_mode = vore_default_mode
	M.mode_flags = vore_default_flags
	M.item_digest_mode = vore_default_item_mode
	M.contaminates = vore_default_contaminates
	M.contamination_flavor = vore_default_contamination_flavor
	M.contamination_color = vore_default_contamination_color
	M.escapable = vore_escape_chance > 0
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
		"%pred is currently pushing their mouth over %prey’s face! They’re wrapped tightly in thick coils as the snake’s lithe body smothers them. The naga’s jaw is unhinging as fangs scrape across their victim’s head… it seems they’re meant to be food soon enough.")
	M.emote_lists[DM_HOLD] = list(
		"Coils swim around your every inch, catching your arms every time they come loose, clenching around the soft parts of your body as if feeling and appraising you.",
		"A curious tailtip works across your thighs, gently teasing across sensitive skin as you’re shoved into %pred’s waiting mouth.",
		"Drool oozes down your chest as the jaw surrounding your head unhinges all the more.  Fangs slide across your skin as you’re shoved deeper by the effort of %pred’s lower body.",
		"Hands dance across your skin, gently feeling your musculature and soft areas both as the naga takes in the delectable prey they managed to capture.   Their upper body embraces you lazily, free to let their tail do all the work.")
	M.struggle_messages_inside = list(
		"Thick coils keep you pinned as you writhe to get any solace from the constriction.   Their tailtip darts across your thigh, teasingly re-coiling your leg as their tail swims about your frame.",
		"You thrash against %pred, but they hardly put any effort into using their upper body to keep you restrained.  The coils do all the work as they simply reach a delicate hand down your midriff and giggle around your head.",
		"You stretch in those coils in an attempt to slip their grip, but all that you manage to do is shove your face deep into that waiting maw.  %pred’s tongue smothers your entire face as you’re washed in their warm breath.",
		"You push out against the winding tail that holds you still, but %pred just bites on your head in response.  Twin fangs scrape against the back of your head, and the pulsing of the throat ahead of you is a grim foreshadowing of your fate…",
		"A thick <b>GLRNK</b> sounds as their throat muscles try to catch you, but your tossing makes it difficult.  Pushing out against the smooth scales around you, you claw for any way to resist the lithe creature atop you.",
		"As you recklessly thrash against %pred, their drool oozes down your chest messily.  You’re making swallowing hard, so their tongue simply sets its molten girth to tasting you until you calm within the squeezing of their coils.",
		"You’re able to push their head off of you!  Their delicate features flutter lashes back at you curiously, drool oozing down their chin.   Their face is faintly flushed, and when they open their mouth again, you can see the pulse of a throat before they try to plunge you straight back in. <b>Schlrp…</b>"
	)
	M.struggle_messages_outside = list(
		"%Prey thrashes against %pred’s tight coils!  There’s a muffled squeal from inside the naga’s mouth as their head gets slowly shoved deeper.",
		"%Prey writhes against the thick snake-like lower body holding them tight.  Despite their thrashings, %pred seems keen on holding them tight inside their mouth.",
		"%Pred rests gingerly atop %prey as they rail and thrash against the thick, warm coils surrounding them.  They hardly put any upper-body effort into keeping them restrained."
	)
	can_be_drop_pred = TRUE // Mobs will eat anyone that decides to drop/slip into them by default.
	M.escape_attempt_messages_prey = "You start to kick away from %pred's grasp!"
	M.escape_messages_outside = "%prey manages to escape %pred's clutches!"
	M.escape_messages_prey = "You managed to get away from %pred's grasp!"
	M.escape_fail_messages_prey = "You managed to slip up, getting further trapped!"
	M.escapechance = 25
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
	T.desc = vore_stomach_flavor ? vore_stomach_flavor : "<b>TSCHLr-Ghk… glrk…</b></br></br>Your frame travels down the naga’s throat in a thick bulge. Your body noisily works its way down their surprisingly accommodating throat. Drool oozes into your every inch as slowly but steadily their hands glide down your body. A sighed breath washes across your frame, warm and humid as they’re finally content they have you restrained. As you’re steadily slid deeper your world becomes nothing but noisy, grinding muscles ushering you forward and wet walls smothering your face.</br></br>You can still feel their coils all across your lower body, their back arching as they lift you against gravity. Their tailtip <b>THAPS</b> your behind as they giggle, still more than happy to play with you as they simply slide you down. Every writhe and struggle you make like this, suspended, is perfectly set to be a feast for their eyes. Your body bounces with each swallow deeper.</br></br>Your face is crammed against a tight sphincter leading to their stomach, your legs still vainly attempting to kick outside. It’s hard with the exertion of battle, every sore spot you have is being lovingly caressed by the naga’s insides as your muscles scream for relaxation…"
	T.digest_mode = vore_default_mode
	T.mode_flags = vore_default_flags
	T.item_digest_mode = vore_default_item_mode
	T.contaminates = vore_default_contaminates
	T.contamination_flavor = vore_default_contamination_flavor
	T.contamination_color = vore_default_contamination_color
	T.escapable = vore_escape_chance > 0
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
		"%pred has %prey halfway shoved down their throat! Their lower body kicks and writhes as their back arches, trying to break free of the tight coils! A thick bulge is visible on the naga’s neck, clearly showing their struggling outline..")
	T.emote_lists[DM_HOLD] = list( // We need more that aren't repetitive. I suck at endo. -Ace
		"A thick pulse of muscle travels over your body, pulling you deeper towards the naga’s stomach.",
		"Wet drool oozes into your every inch, you can feel the snake’s tongue coil against you just as much as its tail.  It tries its best to drag you in too.",
		"A hitched sigh oozes up around your lower body, their breath hot against your hips as you slide deeper.",
		"The naga locks their teeth around your hips to suckle across your frame, tasting you as you slide down.")
	can_be_drop_pred = TRUE // Mobs will eat anyone that decides to drop/slip into them by default.
	T.struggle_messages_inside = list(
		"You push against the noisily swallowing muscles of their throat, earning a <b>GLRT</b> from the hardworking walls.",
		"The bulge you make in %pred’s throat swells as your body writhes, but the most you can do is inadvertently smother your face in their internal slime.",
		"You kick and thrash against %pred’s coils on your lower body!   They tighten in response, gleefully squeezing your hips to get you under control.",
		"You arch your back and push your legs against the tight coils outside, only to have %pred’s claws firmly SMACK and grip your behind.   They use it like a handhold to try to shove you deeper.",
		"Your hips swing against %pred’s jaws, only to have their tongue slide around them, coiling to tug you deeper.",
		"Your hips push and jump against the tightening grip across your lower body, only to have their tailtip disarmingly sliide between your legs.  It grips your thighs once again, preceding a new tightening of their coils."
	)
	T.struggle_messages_outside = list(
		"%prey pushes against the tight coils as they’re flipped upside-down and shoved into %pred’s throat!",
		"The wriggling bulge that is %prey pushes out from the naga’s throat, you can see their outline shift within.",
		"%prey’s legs kick against the coils holding them aloft!  You hear another messy, slobbery swallow from the naga below as they try to contain them."
	)
	T.autotransferable = 1
	T.autotransferlocation = "stomach"
	T.autotransferwait = 300
	T.autotransferchance = 100
	T.autotransfer_min_amount = 1
	T.autotransfer_whitelist = 53
	T.autotransfer_enabled = 1
	T.escape_attempt_messages_prey = "You start to climb up %pred's greedy throat!"
	T.escape_messages_outside = "%prey manages to slide out from the now pissed off predator."
	T.escape_messages_prey = "You managed to slide out from %pred's greedy throat"
	T.escape_fail_messages_prey = "%pred stifles your escape attempt with another greedy swallow."
	T.escapechance = 10
	T.belly_fullscreen = "vboanim_belly1"
	T.belly_fullscreen_color = "#823232"
	T.belly_fullscreen_color2 = "#823232"

	var/obj/belly/B = new /obj/belly(src)
	B.immutable = TRUE
	B.can_taste = TRUE
	B.name = vore_stomach_name ? vore_stomach_name : "stomach"
	B.desc = vore_stomach_flavor ? vore_stomach_flavor : "You’re finally dropped from %pred’s coils, only for their mouth to snap up your hips.  Its warmth overtakes them, and soon enough the rest of your body is sliding down their squeezing throat with just the help of gravity.</br></br>The thick bulge you’ve created begins to disappear past their collarbone and bloat their midriff as you’re deposited inside a clinging, tight stomach.  The air is tainted with the smell of gall and the acrid waftings from some grinding, glorping chamber below.</br></br>Your face is crammed into the lower half of that chamber, immersed in a thick, warm, viscous solution.  It doesn’t tingle or even burn, it simply soaks your every inch… you feel a <b>SMACK</b> against your frame from the outside as the naga takes in your form with a kind of pleasure.</br></br>The whole chamber squeezes you tight, bubbling the excess air up %pred’s throat in a liquidy <b>bwhhHHRRP!!!</b>.  You’re left to simply stew as the every winding motion of the pred outside causes the bulge you make to wobble to and fro atop their hips.  Your frame is forced to curl to accommodate the new tightness, and eventually you can finally right yourself as you’re prepared for the looong gut inside their tail…"
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
	B.examine_messages = "%pred has a grotesquely bloated midriff!  It glorps and churns over some poor unfortunate, their outline quite clear beneath the half-snake’s skin."
	B.digest_brute = 0
	B.digest_burn = 0
	B.autotransferable = 1
	B.autotransferlocation = "tail"
	B.autotransferwait = 300
	B.autotransferchance = 100
	B.autotransfer_min_amount = 1
	B.autotransfer_whitelist = 53
	B.autotransfer_enabled = 1
	B.escape_attempt_messages_prey = "You begin to attack %pred's taught stomach effectively!"
	B.escape_messages_outside = "%pred lurches over, horking up %prey. Ugh..."
	B.escape_messages_prey = "A sudden reflex, and you manage to make %pred cough you up. Slimy, but alive!"
	B.escape_fail_messages_prey = "%pred's stomach clenches down hard, preventing your escape."
	B.escapechance = 5
	B.emote_lists[DM_HOLD] = list(
		"The guts around you steadily pulse, washing new, bubbling fluids across your entire body.",
		"A clench pushes more of that slop up to your neck, making sure you’re properly softened and lubricated for the winding guts below.",
		"A liquid gurgle emanates from a chamber beneath you.  That looong tailgut awaits, preparing itself to break you down.",
		"%pred simply goes about their day outside, each step sending a ripple through the thick, bloated gut that you occupy.",
		"You can hear %pred's heartbeat faintly through the walls, as well as their breath. There's a little delicate hitch in their breathing as a clench rolls through their middle.",
		"A hand passes over the bulge you make in %pred’s midriff from the outside, giving you a grope from beneath.")
	can_be_drop_pred = TRUE // Mobs will eat anyone that decides to drop/slip into them by default.
	B.struggle_messages_inside = list(
		"You kick against the tightening, wringing walls inside %pred!   A liquid <b>glrt</b> and a clench of those muscles bring you right back into line.",
		"You let out muffled squeals as you try to break free of the guts that surround you!  They cling tightly, sticking to your face and drowning you in thick, viscous goo.",
		"You arch your back, pushing out your arms to try to resist the slow churning of %pred’s midriff, but you’re just smothering yourself in their walls.",
		"As you thrash inside that gut, you make it slosh atop %pred’s hips.   You can feel a new vibration ring through the whole chamber as they let out a pleased sigh.",
		"You try to resist the slow churn of those muscles, pushing out against them, but you feel a hand on the outside cram itself against your outline to still you.   The whole chamber clenches, and another belch bubbles up the Naga’s throat…"
	)
	B.struggle_messages_outside = list(
		"%pred’s midriff wobbles with a shifting prey, their outline pushing a hand out of the smooth skin of their gut.",
		"%pred stifles a belch as their fat stomach jumps with motion from within.  There’s a faint squeal from beneath their skin.",
		"%pred’s gut lets out a worrying <b>GLRT</b> as it clenches over some poor unfortunate.  You can see their outline struggling to break free."
	)
	B.belly_fullscreen = "vbo_belly5"
	B.belly_fullscreen_color = "#823232"
	B.belly_fullscreen_color2 = "#823232"

	var/obj/belly/TL = new /obj/belly(src)
	TL.immutable = TRUE
	TL.can_taste = TRUE
	TL.name = vore_stomach_name ? vore_stomach_name : "tail"
	TL.desc = vore_stomach_flavor ? vore_stomach_flavor : "That gut finally begins to wobble side to side as you feel another sphincter open beneath you.  It eventually catches your legs, allowing them space to straighten out.  Even if you resist now, you’d only be shoving yourself through the slick passage.   The muscles tighten, catch and <b>pull.</b>  You find yourself sinking deeper into %pred’s guts than you thought possible as their midriff finally shrinks away, transferring the bulge of your frame into their long, winding tail.</br></br><b>Glrp… glrrglrg…slrsh.</b></br></br>It’s devilishly tight across your entire body, and you’re immediately coated in a thicker, tingling slime as your pre-lubed frame obediently sliiiides past %pred’s hip-bones.  They let out a pleased sigh as your weight passes their organs, bullying them out of the way.    A shudder runs through their hips, a slow rolling and bucking helping your passage until you’re finally completely immersed in their tail.</br></br>It’s a slow process as a slimy grool of digestive fluids and previous meals smeared across the seemingly endless walls is wrung into your body with every slow, deliberate inch you’re passed deeper.  The walls push in tightly against you.  Up and down are no longer a constant as your body is straightened out.   Whenever you’re face down, you feel the ground drag beneath you with the snake’s every motion, smothering your face against the walls."
	TL.digest_mode = vore_default_mode
	TL.mode_flags = vore_default_flags
	TL.item_digest_mode = vore_default_item_mode
	TL.contaminates = vore_default_contaminates
	TL.contamination_flavor = vore_default_contamination_flavor
	TL.contamination_color = vore_default_contamination_color
	TL.escapable = vore_escape_chance > 0
	TL.escapechance_absorbed = vore_escape_chance_absorbed
	TL.digestchance = vore_digest_chance
	TL.absorbchance = vore_absorb_chance
	TL.human_prey_swallow_time = swallowTime
	TL.nonhuman_prey_swallow_time = swallowTime
	TL.vore_verb = "swallow"
	TL.examine_messages = "There’s a thick, still wriggling bulge in %pred’s tail.  They’ve clearly had a meal recently.  It wetly <b>glrts</b> as it works the poor unfortunate over."
	TL.digest_brute = 3
	TL.digest_burn = 3
	TL.escape_attempt_messages_prey = "You begin to attack %pred's taught stomach effectively!"
	TL.escape_messages_outside = "%pred lurches over, horking up %prey. Ugh..."
	TL.escape_messages_prey = "A sudden reflex, and you manage to make %pred cough you up. Slimy, but alive!"
	TL.escape_fail_messages_prey = "%pred's stomach clenches down hard, preventing your escape."
	TL.escapechance = 5
	TL.emote_lists[DM_DIGEST] = list(
		"The churning walls that surround you clench tightly over your body, washing you in tingling fluids.",
		"A bubble passes through the winding guts with a <b>glrp</b>, giving you a fresh breath of acrid digestion.",
		"The snake slithers outside, dragging your body against the ground.  You feel stretched by the tightly clinging muscles as they strain to keep you in place.",
		"You feel %pred sit atop you from outside, the thick bulge compressed by their weight.  It just helps smear you against their internal walls.",
		"A sudden sliding of that tail causes you to slosh.  You can hear those muscles <b>glrrrgl</b> as they try to contain the motion.",
		"You hear some liquid slop shift from somewhere deeper in the winding tunnel that surrounds you.  <b>slrsh…</b>")
	can_be_drop_pred = TRUE // Mobs will eat anyone that decides to drop/slip into them by default.
	TL.struggle_messages_inside = list(
		"You push out against the winding guts surrounding you, but your arms slip against the built-up slop atop the villi that hold you tight.",
		"You arch your back and try to wiggle within %pred, but the tight walls of that tail smother your face as you smear yourself against them.",
		"You thrash inside %pred, and the muscles of their tail strain to contain you.  You can hear their vibrating, groaning shifting as they barely give way.",
		"A tight pulse wrings your body as you try to resist the motions of that tail.  It lets out a wet gurgle as yet more fluids drown over you.",
		"You try to rock the tail outside to throw off %pred’s balance, but you instead just make a liquid slosh as you’re washed in the acrid gutslime coating you.",
		"You struggle to throw off the tight muscles pushing you deeper, only managing to induce an upset, liquid gurgle that passes down the length of %pred’s tail.",
		"Your body slips against the vice tight internal walls while you attempt to resist their motion, but they make a firm clench across your body that makes it hard to move.",
		"The tail surrounding you tosses you against each wall with every slither.  It’s surprising that the naga can even move normally with you inside, but their agility feels largely unaffected."
	)
	TL.struggle_messages_outside = list(
		"One of the bulges inside %pred’s long tail pushes out, you swear you can see a face outlined beneath the groaning, gurgling scales.",
		"You hear a frustrated grunt muffled by %pred’s long tail.  Someone is pushing out against the walls from inside, causing all manner of unholy noises to groan out from within.",
		"%pred’s tail bulges with the resisting outline of someone within, before it visibly clenches across their frame.  You can see it, straightened out and prone, slid across the ground with every slither."
	)
	TL.belly_fullscreen = "vboanim_snakebelly1"
	TL.belly_fullscreen_color = "#823232"
	TL.belly_fullscreen_color2 = "#823232"

/mob/living/carbon/human/species/lamiaevil/npc/death(gibbed, nocutscene)
	if(vore_organs.len > 0)
		for(var/obj/belly/B in vore_organs)
			B.release_all_contents(TRUE)
	. = ..()

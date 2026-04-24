//Anything related to NPC that does vore.
/mob/living
	var/vore_stomach_name				// The name for the first belly if not "stomach"
	var/vore_stomach_flavor				// The flavortext for the first belly if not the default
	var/vore_default_mode = DM_DIGEST	// Default bellymode (DM_DIGEST, DM_HOLD, DM_ABSORB)
	var/vore_default_flags = 0			// No flags
	var/vore_digest_chance = 0		// Chance to switch to digest mode if resisted
	var/vore_absorb_chance = 0			// Chance to switch to absorb mode if resisted
	var/vore_escape_chance = 25			// Chance of resisting out of mob
	var/vore_escape_chance_absorbed = 20// Chance of absorbed prey finishing an escape. Requires a successful escape roll against the above as well.
	var/vore_default_item_mode = IM_DIGEST_FOOD			//How belly will interact with items
	var/vore_default_contaminates = FALSE				//Will it contaminate? // CHOMPedit: Put back to true like it always was.
	var/vore_default_contamination_flavor = "Generic"	//Contamination descriptors
	var/vore_default_contamination_color = "green"		//Contamination color
	var/swallowTime = 5 SECONDS	

/mob/living/carbon/human
	//are they able to eat nerds.
	var/is_voracious_npc = FALSE

/mob/living/carbon/human/proc/increase_belly_size()
	var/obj/item/organ/belly/_belly = getorganslot("belly")
	if(!_belly)
		return
	_belly.belly_size = 3
	src.regenerate_icons()

/mob/living/carbon/human/proc/decrease_belly_size()
	var/obj/item/organ/belly/_belly = getorganslot("belly")
	if(!_belly)
		return
	_belly.belly_size = 0
	src.regenerate_icons()

/mob/living/proc/load_mob_bellies()
	//A much more detailed version of the default /living implementation
	var/obj/belly/B = new /obj/belly(src)
	vore_selected = B
	B.immutable = TRUE
	B.can_taste = TRUE
	B.name = vore_stomach_name ? vore_stomach_name : "stomach"
	B.desc = vore_stomach_flavor ? vore_stomach_flavor : "Your surroundings are warm, soft, and slimy. Makes sense, considering you're inside %pred."
	B.digest_mode = vore_default_mode
	B.mode_flags = vore_default_flags
	B.item_digest_mode = vore_default_item_mode
	B.contaminates = vore_default_contaminates
	B.contamination_flavor = vore_default_contamination_flavor
	B.contamination_color = vore_default_contamination_color
	B.escapable = vore_escape_chance > 0
	B.escapechance = vore_escape_chance
	B.escapechance_absorbed = vore_escape_chance_absorbed
	B.digestchance = vore_digest_chance
	B.absorbchance = vore_absorb_chance
	B.human_prey_swallow_time = swallowTime
	B.nonhuman_prey_swallow_time = swallowTime
	B.vore_verb = "swallow"
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
	B.belly_fullscreen = "a_tumby"
	B.belly_fullscreen_color = "#823232"
	B.belly_fullscreen_color2 = "#823232"
//--------------------------------------------------------------------------
//Credit to Syribirb for doing the entirety of the belly descriptions!
/mob/living/proc/load_generic_bellies()
	//Loading genderless catchall bellies
	var/obj/belly/M = new /obj/belly(src)
	vore_selected = M
	M.immutable = TRUE
	M.can_taste = TRUE
	M.name = vore_stomach_name ? vore_stomach_name : "maw"
	M.desc = vore_stomach_flavor ? vore_stomach_flavor : "You're forcefully picked from the ground and lifted up to face your assailant. Their hands grip at your arms, holding them to your sides and restraining you. Your body is sore from fighting, you have a hard time breaking free of them. You're tugged in against their chest, the heat of their post-battle state settling into yours. You can hear their breath heave, their body taking a moment to rest as they look you over. There's a chuckle from up above, and when you finally look up to face them, there's a predatory look in %pred's eye. </br></br> They <b>heft</b> you a second time, lifting you up to their face as their lips part. A molten tongue slips up your cheek, leaving a wet trail of slobber across your face.   They make an appreciative little hum as their eyes flutter down at you.   Apparently you're delicious.  Their breath breaks against your face in warm billows. Their lips part, and you finally get a flash of their pulsing, dripping throat.</br></br>That's the last thing you see before you're smothered against their tongue. Teeth scrape against your scalp as their lips come around your neck. The wet muscle glides across your face as they <b>taste</b> you.  Breath billows around your body, drool oozes down your chest... It's easy to see where this is going."
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
		"%pred is currently lapping against %prey's face!  Threatening to swallow them down at any moment…")
	M.emote_lists[DM_HOLD] = list(
		"You're adjusted in that maw for a few moments, before you finally get another glimpse of daylight!  Of course, those lips slurp you back in within an instant as you struggle for air.",
		"%pred's tongue passes over your face, coating you in thick slobber as the rest of their maw clings tightly to your head.   Wet half-swallows prepare you for the upcoming plunge…",
		"%pred lets out a wet slurp around your neck, their hands wandering your body as they try to get a better handhold to shove you in!",
		"A groan emanates from %pred's midriff as you struggle against them.  You can feel it rumble against you, their body anticipating a meal.")
	M.struggle_messages_inside = list(
		"You struggle against %pred's grip!  Your body squirms against their grasp as their warm frame rubs up against you.",
		"Your resistance only pushes your face harder against %pred's molten tongue.  You can feel their throat pulse against your scalp… <i>schlrp</i>",
		"Slobber oozes down your chest as you resist %pred's attempt to shove you in deeper.  Their warm breath heaves across your face and neck, strained with the effort of trying to restrain you.",
		"You rail against %pred's greedy swallows, trying your hardest not to get sucked down their throat!",
		"Your arms push out against the tight grip holding them to your sides, and you try to kick your way free of your binds!   You can feel that mouth tighten, trying its best to swallow you down as you resist."
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
	T.desc = vore_stomach_flavor ? vore_stomach_flavor : "They finally lift up your body and toss you back into their throat. Wet walls grip at you from every angle as you slide back down that wet, pulsing tunnel. Molten heat surges from the walls around you and into your body, and you're coated in the thick grool of their internal fluids.</br></br>From every angle all you can hear is messy gulps, slurps, and swallows. Muscles grinding in an attempt to pack away a meal they can hardly handle. You are a bulge, writhing as you pass down %pred's throat.</br></br>It won't be long now, you hear another anticipatory groan from beneath as you're pulled ever deeper into %pred.  Your legs are pulled up over their head as gravity fully reverses.You feel hands claw and grip at your hips, shoving you down yet further…"
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
		"%pred has %prey halfway shoved into their maw! The lower half of their body writhes and shifts against their grip, but their upper half is already nothing but a bulge.")
	T.emote_lists[DM_HOLD] = list( // We need more that aren't repetitive. I suck at endo. -Ace
		"You hear %pred's heartbeat through the pulsing walls that hold you.  Their tongue crawls down your midriff as you feel yourself sinking deeper.",
		"A thick swallow splits the air, another pulse wrings your entire body as you're slowly consumed.",
		"Hands slide down your lower body, gripping into your hips and ass for a better hold to shove you deeper.",
		"Another gulp.   Every push further into their throat sends a bounce through your entire frame.",
		"Your body is compressed by another push deeper, the thick grool of %pred's throat oozing into every inch of your clothing as teeth scrape up your frame.")
	can_be_drop_pred = TRUE // Mobs will eat anyone that decides to drop/slip into them by default.
	T.struggle_messages_inside = list(
		"You push back against %pred's throat, but your arms are pinned to your sides.  It's all you can do to attempt to shift your lower body in a way that's slightly less convenient for them to swallow.",
		"You thrash against the squeezing throat muscles, your hips bouncing against the warm, wet jaws that slide up your body.",
		"You kick against %pred's entrenched hands, but their nails just dig deep into your thighs.  You find yourself hard pressed to break their grip as they shove you in more firmly.",
		"A wet groan comes from the grinding muscles around you as you try to slip your way back out of that throat.   You have to buck against the grip on your hips, your arms struggling against wet, slick muscles.",
		"Your back arches as you attempt to wriggle your way up out of the clenching throat that surrounds you.  The effort makes your face press up against the clenching esophagus all the more, smearing you in %pred's fluids."
	)
	T.struggle_messages_outside = list(
		"%prey kicks against %pred's grip on their legs!  The bulge inside that throat shifts faintly…",
		"%prey arches their back, thrashing against the bulging throat holding them!  You can see their face in a perfect outline.",
		"%prey wriggles against the tight throat that holds them.  A wet <b>GLRNK</b> marks a stark descent and a bounce that ripples through their frame as they're lowered just a few inches deeper."
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
	B.desc = vore_stomach_flavor ? vore_stomach_flavor : "<b>SCHLRP...ghlp... BHHHRRRRRRRP!!!</b></br></br>Your body is finally dropped through the rest of %pred's throat as you sliiide down their esophagus and into the pit of their gut. Face-first, you're smooshed into a thick grool comprising of all of their previous meals and a warm acrid fluid.</br></br>A hand braces your fall from beneath, you can feel it through the tight grip of the stomach that surrounds you.  It helps push the underside of that gut smothering against your face.  Your body is forced to curl in on itself by the gripping muscles. The atmosphere here is tainted with the smell of digestion, it creeps into your every breath.</br></br>By no force other than the tightness of the chamber that grips you, you finally manage to right yourself, feeling the sheer wobbly <b>bloat</b> you've forced upon the predator outside. The muscles that surround you churn, groan, and strain as they try their best to keep you contained. Your outline is nothing but a pretty decoration on %pred's midriff..."
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
	B.examine_messages = "%pred is bloated with some wriggling meal. Their stomach stretches over a bouncing, thick bulge, ripping through their clothing. Whoever it is occasionally shifts, pushing against the audibly straining, groaning muscles. They're still alive in there…"
	B.digest_brute = 0.5
	B.digest_burn = 0.5
	B.escape_attempt_messages_prey = "You begin to attack %pred's taught stomach effectively!"
	B.escape_messages_outside = "%pred lurches over, horking up %prey. Ugh..."
	B.escape_messages_prey = "A sudden reflex, and you manage to make %pred cough you up. Slimy, but alive!"
	B.escape_fail_messages_prey = "%pred's stomach clenches down hard, preventing your escape."
	B.escapechance = 5
	B.emote_lists[DM_DIGEST] = list(
		"You feel a hand pass over your frame from outside, then <b>SQUISH</b> you in against %pred's midriff.  It forces an idle belch up out of their lips…",
		"The noises of indigestion ripple from all around you as %pred's body struggles to take in such a massive meal. Each vibration of muscle straining against muscle ripples the entire chamber in wet <b>grrrrgls</b>.",
		"The stomach that surrounds you randomly clenches, forcing the acids up your body. You're drenched in %pred's internal fluids as you try to keep yourself righted.",
		"%pred simply goes about their day outside, each step sending a ripple through the thick, bloated gut that you occupy.",
		"You can hear %pred's heartbeat faintly through the walls, as well as their breath. There's a little delicate hitch in their breathing as a clench rolls through their middle.",
		"A vibration splits the air with a wet <b>glrbl</b> as that whole gut shifts you once again with a forceful clench.")
	can_be_drop_pred = TRUE // Mobs will eat anyone that decides to drop/slip into them by default.
	B.struggle_messages_inside = list(
		"You kick against the clenching walls that surround you, only to be greeted by yet more digestive noises.",
		"Your thrashing splashes the thick slop that surrounds you, forcing %pred's gut to slosh and wobble atop their midriff.",
		"You push your arms out against the tight stomach walls. You're greeted by another muscular clench, forcing them back in and threatening to flip you.",
		"As you wriggle and thrash against the tight stomach walls, your face is crammed up against them. You're smeared in thick digestive juices as you inadvertently smother yourself in those molten innards.",
		"A few struggles cause that gut to bounce, and a resulting clench causes gravity to reverse. Your face is squished against the pit of that stomach, and deprived of air you have to wriggle desperately to right yourself."
	)
	B.struggle_messages_outside = list(
		"%pred's bloated gut bounces with the shifting meal inside.",
		"You can see hands push out from within %pred's gut, before a liquid glorp and a clench shoves them back in.",
		"A rumble passes through %pred's fattened middle, the round of it wobbling with struggling prey.",
		"A thick bulge squirms inside the bloat of %pred's gut, and a clench forces out a muffled belch as the outline of some poor preything is briefly made visible."
	)
	B.belly_fullscreen = "vbo_belly5"
	B.belly_fullscreen_color = "#823232"
	B.belly_fullscreen_color2 = "#823232"
//--------------------------------------------------------------------------


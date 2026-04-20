/datum/advclass/trader/travelling_merchant
	name = "Travelling Merchant"
	tutorial = "You are a merchant forever on the move, stopping by for this week in the duchy of Azure Peak. While this isn't your home, you are extremely well connected, and can aquire goods for half the normal cost by pulling favours and rank, although getting to said supplies might be a bit bothersome. Better hire some mercs! Whenever you set up your own little peddling place, or work to supply the city's own merchant, keep in mind that you have little use for mammons, and would rather use them to expand your influence, as you are a multinational businessperson, and have little desire for local currency."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	category_tags = list(CTAG_TRADER, CTAG_COURTAGENT, CTAG_LICKER_WRETCH)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/stealing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/firearms = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE
	)
	class_select_category = CLASS_CAT_TRADER
	outfit = /datum/outfit/job/roguetown/adventurer/travelling_merchant
	subclass_stats = list(
		STATKEY_PER = 2,
		STATKEY_INT = 2,
	)
	traits_applied = list(TRAIT_SEEPRICES, TRAIT_CICERONE)

/datum/outfit/job/roguetown/adventurer/travelling_merchant/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You are a merchant forever on the move, stopping by for this week in the duchy of Azure Peak. While this isn't your home, you are extremely well connected, and can aquire goods for half the normal cost by pulling favours and rank, although getting to said supplies might be a bit bothersome. Better hire some mercs! Whenever you set up your own little peddling place, or work to supply the city's own merchant, keep in mind that you have little use for mammons, and would rather use them to expand your influence, as you are a multinational businessperson, and have little desire for local currency."))
	//Morshu drip
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/tights/green
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/orange
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/jacket
	head = /obj/item/clothing/head/roguetown/archercap
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/gun/ballistic/arquebus_pistol
	beltr = /obj/item/rogueweapon/scabbard/sheath/courtphysician
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/storage/backpack/rogue/backpack/bagpack
	neck = /obj/item/quiver/bulletpouch/iron
	r_hand = /obj/item/rogueweapon/sword/rapier/courtphysician
	//Signal horn + fultons + other slop
	backpack_contents = list(
		/obj/item/powderflask = 1,
		/obj/item/drop_signal_horn = 1,
		/obj/item/fulton = 5,
		/obj/item/flashlight/flare/torch/lantern = 1, //Lampoil?
		/obj/item/rope = 1, //Rope?
		/obj/item/bomb = 1, //Bomb?
		/obj/item/storage/belt/rogue/pouch/merchant/coins = 1,
	)
	//H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/travelling_merchant/checkfavours)
	//H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/travelling_merchant_sourcegoods)
	//H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/travelling_merchant_sellgoods)
	//H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/travelling_merchant_exploitmarket)
	H.AddComponent(/datum/component/travelling_merchant)


/*/obj/effect/proc_holder/spell/invoked/travelling_merchant/proc/getFavours(mob/living/user)
	var/datum/travelling_merchant = user.GetComponent(datum/travelling_merchant)
	return travelling_merchant.favours

/obj/effect/proc_holder/spell/invoked/travelling_merchant/checkfavours
	name = "Check favours"
	desc = "Using your trusty journal, you can take a moment to remember how much clout you have with your connections."

/obj/effect/proc_holder/spell/invoked/travelling_merchant/checkfavours/cast(mob/living/user)
	var favours = getFavours(user)
	to_chat(user, span_info("According to these pages, once you add everything up, it comes out to around [favours] mammons worth of clout."))

/obj/effect/proc_holder/spell/invoked/travelling_merchant/sourcegoods
	name = "Source goods"
	desc = "Use it on a hermes post to contact suppliers, arranging a dead drop for you to fetch.\nCooldown and package location difficulty is dependent on the amount of favours you are using."



/obj/effect/proc_holder/spell/invoked/travelling_merchant/sellgoods
	name = "Sell goods"
	desc = "Use it on a hermes post to contact buyers, arranging a dead drop for you to deliver.\nCooldown and package location difficulty is dependent on the amount of favours you are getting."

/obj/effect/proc_holder/spell/invoked/travelling_merchant/exploitmarket
	name = "Exploit market"
	desc = "Use it on a hermes post to contact counting houses, aquiring information on the favourable imports and exports of the world.\nCooldown and package location difficulty is dependent on the amount of favours you are using or getting."
*/

/datum/component/travelling_merchant
	var/favours = 300
	var/favourtimer
	var/list/allcats = list(
		"Alcohols",
		"Apparel",
		"Consumable",
		"Gems",
		"Instruments",
		"Luxury",
		"Livestock",
		"Cosmetics",
		"Raw Materials",
		"Seeds",
		"Tools",
		"Wardrobe",
		"Adventuring Supplies",
		"Armor (Light)",
		"Armor (Iron)",
		"Armor (Steel)",
		"Armor (Exotic)",
		"Potions",
		"Weapons (Ranged)",
		"Weapons (Iron and Shields)",
		"Weapons (Steel)",
		"Weapons (Foreign)",
		"Diplomacy and Persuasion",
		"Beverages",
		"Exotic Import",
		"General Labour",
		"Health and Hygiene",
		"Self Defense",
		"Travelling Merchant",
		"Private Workshop")
	var/list/unlockedcats = list(
		"Travelling Merchant",
		"Private Workshop"
	)
	var/catunlockspending = 6
	var/list/current_cart = list()

/datum/component/travelling_merchant/Initialize(...)
	. = ..()
	favourtimer = addtimer(CALLBACK(src, PROC_REF(AddFavoursOverTime)),5 MINUTES, TIMER_STOPPABLE | TIMER_LOOP)
	var/choice = SelectCategory()

	while(choice && catunlockspending > 0)
		catunlockspending -= 1
		unlockedcats += choice
		if(catunlockspending > 0)
			choice = SelectCategory()
	
/datum/component/travelling_merchant/proc/SelectCategory()
	var/list/catchoices = allcats - unlockedcats
	var/choice = tgui_input_list(parent,"Category slots currently left: [catunlockspending]","Choose your starting categories. You can choose additional categories later, at any hermes, and buy additional slots as well.",catchoices)
	return choice

/datum/component/travelling_merchant/proc/AddFavoursOverTime()
	favours += 50
	to_chat(parent,"Your previous deals still reverberate through your channels. Their debts, material or sentimental ever incuring interest... you are now 50 favours richer, for a total of [favours] mammons worth of clout.")

/datum/component/travelling_merchant/Destroy()
	deltimer(favourtimer)
	favourtimer = null
	. = ..()

/datum/component/travelling_merchant/proc/ui_static_data_fill_in()
	var/list/data = list()
	data["supplypacks"] = generate_supplypacks_data(SSmerchant.supply_packs, allcats)
	return data
	

/datum/component/travelling_merchant/proc/ui_dynamic_data_fill_in()
	var/list/data = list()
	data["favours"] = favours
	data["unlockedCats"] = unlockedcats
	data["catunlockspending"] = catunlockspending
	data["currentcart"] = generate_supplypacks_data(current_cart, unlockedcats)
	return data

/datum/component/travelling_merchant/proc/generate_supplypacks_data(sps, filtergroup)
	var/list/supplypacks = list()
	for(var/pack in sps)
		var/datum/supply_pack/PA
		if(sps[pack])
			PA = sps[pack]
		else if(pack)
			PA = pack
		if(!PA.group)
			continue
		if(!(PA.group in filtergroup))
			continue
		if(!supplypacks[PA.group])
			supplypacks[PA.group] = list()
		var/list/PAL = list()
		PAL["group"] = PA.group
		PAL["cost"] = PA.cost
		PAL["name"] = PA.name
		PAL["desc"] = PA.desc
		PAL["path"] = PA.type
		supplypacks[PA.group][PA.type] = PAL
	return supplypacks

/datum/component/travelling_merchant/proc/add_to_cart(path)
	if(ispath(text2path(path), /datum/supply_pack))
		var/datum/supply_pack/pacc = text2path(path)
		if((pacc.group in unlockedcats) && (favours >= pacc.cost))

			current_cart += pacc
			favours -= pacc.cost
			to_chat(parent, span_info("Your suppliers have been notified, and it is already being loaded to a balloon. Use your horn to call it in!"))


/obj/item/drop_signal_horn
	name = "drop signal horn"
	desc = "A horn capable of signalling your position to passing by trading balloons. If you know the right people, you can use one of these to call in your contractors to fulfill their obligations, and/or take goods off your hands. Keep in mind, this may attract people thirsty for your goods!"
	icon = 'icons/obj/items/signalhorn.dmi'
	icon_state = "signalhorn"
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK
	w_class = WEIGHT_CLASS_NORMAL
	grid_height = 32
	grid_width = 64
	var/obj/effect/landmark/quest_spawner/attunedmark
	var/bloon = FALSE

/obj/item/drop_signal_horn/examine()
	. = ..()
	if(attunedmark)
		. += "The horn is currently attuned to a landmark at the moment.\n"
		. += get_target_location()
	else
		. += "The horn is currently unattuned. You can attune it by blowing it, signalling your contractor's balloon to pick a place, after which, the horn will lead you to the meeting point. Once there, you'll have to blow the horn again, to signal that it's you. It will then unload cargo meant for you, and give you 10 minutes to fulton up any goods of your own."

/obj/item/drop_signal_horn/proc/createCrate(mob/living/user, datum/component/travelling_merchant/tmc)
	var/obj/structure/closet/crate/chest/C = new(get_turf(user))
	for(var/currpacc in tmc.current_cart)
		var/datum/supply_pack/rogue/currpacccasted = SSmerchant.supply_packs[currpacc]
		for(var/it in currpacccasted.contains)
			new it(C)
			tmc.current_cart -= currpacc
	C.visible_message("The balloon drops a crate!")

/obj/item/drop_signal_horn/proc/sendCrate(mob/living/user, obj/structure/closet/crate/C)

	var/datum/component/travelling_merchant/tmc = user.GetComponent(/datum/component/travelling_merchant)
	if(!tmc)
		return
	var/turf/CT = get_turf(C)
	if(attunedmark && (get_turf(attunedmark) == CT) && bloon)
		if(C.fulton)
			CT.visible_message("The [C]'s fulton activates, and the crate flies off to the skies, ready to be picked up by the balloon!")
			var/imakebigmoney = 0
			for(var/obj/item/iteminstance in C.contents)
				var/itemvalue = iteminstance.get_real_price()
				if(itemvalue)
					imakebigmoney += itemvalue
					qdel(iteminstance)
			qdel(C)
			imakebigmoney = round(imakebigmoney)
			to_chat(user, span_good("You have just sent up [imakebigmoney] mammons worth of goodies!"))
			tmc.favours += imakebigmoney
		else
			to_chat(user,span_warning("Attach a fulton first!"))
	else
		to_chat(user, span_warning("There is no balloon overhead, or it isn't ready to take your package!"))

/obj/item/drop_signal_horn/proc/bloongohome()
	attunedmark.visible_message("The balloon leaves.")
	if(prob(1))
		attunedmark.visible_message("A honeyspider waves from the balloon...? Wait who is piloting this thing?")
	attunedmark = null
	bloon = FALSE


/obj/item/drop_signal_horn/attack_self(mob/living/user)
	. = ..()
	var/datum/component/travelling_merchant/tmc = user.GetComponent(/datum/component/travelling_merchant)
	if(!tmc)
		to_chat(user, "The horn rejects you...")
	var/turf/CT = get_turf(src)
	if(attunedmark && (get_turf(attunedmark) == CT) && (!bloon))
		user.visible_message("[user] raises the horn to their mouth, preparing to signal for a balloon...")
		user.playsound_local(get_turf(user), 'sound/items/horn/signalhorn.ogg', 35, FALSE, pressure_affected = FALSE)
		if(do_after(user, 5 SECONDS))
			if(user.consider_ambush(TRUE, TRUE))
				var/additional_ambushes = rand(0,3)
				for(var/i = 0, i<additional_ambushes, i++)
					user.consider_ambush(TRUE, TRUE)
				user.visible_message(span_warningbig("[user] blows the horn, loud enough to be heard all the way from the skies! This will surely attract some attention..."))
				if(prob(5))
					attunedmark.visible_message(span_warningbig("The balloon is overhead, but they seem to hesitate... wretched rat bastards, we are dying here!"))
					to_chat(user, span_warningbig("I'll have to blow the horn again aren't I..."))
					return
				createCrate(user,tmc)
				visible_message("The balloon will hang around for around 10 minutes, send up stuff in a crate at this spot using fultons to sell them! Simply attach one, and tap it with this horn!")
				bloon = TRUE
				addtimer(CALLBACK(src, PROC_REF(bloongohome)),10 MINUTES)
			else
				to_chat(user, span_warning("You blow the horn but no sound comes out... the conditions seem to not be right, ensure there are no unnatural light sources are nearby, those seem to mess with your little magical horn?"))
		else
			user.visible_message("[user] lowers the horn from their lips...")
			return			
	else if(attunedmark)
		to_chat(user,span_warning("You try to blow the horn but absolutely no sound comes out. Wrong place! The horn can guide you if you look closely..."))
	else if(!attunedmark)
		user.visible_message("[user] blows the horn, signalling for a balloon")
		GLOB.quest_landmarks_list = shuffle(GLOB.quest_landmarks_list)
		//Get every quest marker
		for(var/obj/effect/landmark/quest_spawner/landmark in GLOB.quest_landmarks_list)
			if(locationgood(landmark))
				attunedmark = landmark
				var/direction_text = get_precise_direction_between(get_turf(src), get_turf(attunedmark))
				CT.visible_message("A balloon flies overhead, heading towards [direction_text]")
				user.playsound_local(get_turf(user), 'sound/items/horn/signalhorn.ogg', 35, FALSE, pressure_affected = FALSE)
				return

/obj/item/drop_signal_horn/proc/locationgood(landmark)
	var/turf/lmarkturf = get_turf(landmark)
	if(!lmarkturf.can_see_sky())
		return FALSE
	var/area/lmarkarea = get_area(lmarkturf)
	if(!(lmarkarea.threat_region in list(THREAT_REGION_AZUREAN_COAST, THREAT_REGION_MOUNT_DECAP)))
		return FALSE
	if(!lmarkarea.ambush_mobs)
		return FALSE
	return TRUE

/obj/item/drop_signal_horn/proc/get_target_location()
	var/turf/user_turf = get_turf(src)
	var/turf/target_turf = get_turf(attunedmark)
	if(user_turf == target_turf)
		return "You got the place, all that's left is to blow the horn!"
	var/last_z_level_hint
	if(target_turf.z != user_turf.z)
		var/z_diff = abs(target_turf.z - user_turf.z)
		last_z_level_hint = target_turf.z > user_turf.z ? "[z_diff] level\s above you" : "[z_diff] level\s below you"
	var/dx = target_turf.x - user_turf.x  // EAST direction
	var/dy = target_turf.y - user_turf.y  // NORTH direction
	var/distance = sqrt(dx*dx + dy*dy)
	var/direction_text = get_precise_direction_between(user_turf, target_turf)
	var/returnval = "The balloon awaits you [distance] paces to the [direction_text]!"
	if(last_z_level_hint)
		returnval += "\n[last_z_level_hint], that is."
	return returnval

/obj/item/fulton
	name = "fulton device"
	desc = "A little package, designed to be attached to storage chests, to be lifted into the air for merchant balloons. While you could use it anywhere... it's kind of pointless to litter the air with free stuff, so be sure you signal for a balloon first!"
	icon = 'modular/Neu_Food/icons/cookware/ration.dmi'
	icon_state = "ration_small"
	w_class = WEIGHT_CLASS_TINY
	grid_height = 32
	grid_width = 32

/datum/supply_pack/rogue/travelling_merchant
	group = "Travelling Merchant"
	crate_name = "Mercantile Supplies"
	crate_type = /obj/structure/closet/crate/chest

/datum/supply_pack/rogue/travelling_merchant/dsh
	name = "Spare drop signal horn"
	cost = 500
	contains = list(/obj/item/drop_signal_horn)

/datum/supply_pack/rogue/travelling_merchant/fultons
	name = "5 fultons"
	cost = 10
	contains = list(/obj/item/fulton)

/datum/supply_pack/rogue/travelling_merchant_pw
	group = "Private Workshop"
	crate_name = "Private Workshop"
	crate_type = /obj/structure/closet/crate/chest

/datum/supply_pack/rogue/travelling_merchant_pw/enchanting/woodcutting
	name = "Woodcutting enchantment scroll"
	cost = 100 
	contains = list(/obj/item/enchantmentscroll/woodcut)

/datum/supply_pack/rogue/travelling_merchant_pw/enchanting/mining
	name = "Mining enchantment scroll"
	cost = 100 
	contains = list(/obj/item/enchantmentscroll/mining)

/datum/supply_pack/rogue/travelling_merchant_pw/enchanting/light
	name = "Light enchantment scroll"
	cost = 100 
	contains = list(/obj/item/enchantmentscroll/light)
	
/datum/supply_pack/rogue/travelling_merchant_pw/enchanting/holding
	name = "Holding enchantment scroll"
	cost = 250
	contains = list(/obj/item/enchantmentscroll/holding)

/datum/supply_pack/rogue/travelling_merchant_pw/mats/gold
	name = "Raw gold"
	cost = 65
	contains = list(/obj/item/rogueore/gold)

/datum/supply_pack/rogue/travelling_merchant_pw/mats/iron
	name = "Raw iron"
	cost = 9
	contains = list(/obj/item/rogueore/iron)

/datum/supply_pack/rogue/travelling_merchant_pw/mats/coal
	name = "Coal"
	cost = 7
	contains = list(/obj/item/rogueore/coal)

/datum/supply_pack/rogue/travelling_merchant_pw/mats/log
	name = "Large wooden log"
	cost = 3
	contains = list(/obj/item/grown/log/tree)

/datum/supply_pack/rogue/travelling_merchant_pw/usables/repairpoor
	name = "Budget repair kit"
	cost = 50
	contains = list(/obj/item/repair_kit/bad, /obj/item/repair_kit/metal/bad)

/datum/supply_pack/rogue/travelling_merchant_pw/usables/emmed
	name = "Individual First Aid Pouch"
	cost = 30
	contains = list(/obj/item/storage/belt/rogue/pouch/medicine)

/datum/supply_pack/rogue/travelling_merchant_pw/usables/emmed
	name = "Mercenary First Aid Pouch"
	cost = 60
	contains = list(/obj/item/storage/belt/rogue/pouch/medicine/merc)


/datum/supply_pack/rogue/travelling_merchant_pw/food/misterymeat
	name = "Mistery meat...?" //Hehe
	cost = 1
	contains = list (/obj/item/ration/misterymeat)




/obj/item/storage/belt/rogue/pouch/medicine/merc
	populate_contents = list(
	/obj/item/needle,
	/obj/item/natural/cloth/presoaked/advanced,
	/obj/item/natural/cloth/presoaked/advanced,
	/obj/item/reagent_containers/glass/bottle/alchemical/healthpotnew
	)


/obj/item/natural/cloth/presoaked/advanced
	name = "Grenzelcloth"

/obj/item/natural/cloth/presoaked/advanced/Initialize()
	. = ..()
	medicine_quality = 1
	medicine_amount = 60
	desc += " This one has been imbued masterfully in a mixed medicinal coating..."
	detail_color = "#820000"

#define MISTERYMEAT_LIST list(\
	/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 5,\
	/obj/item/reagent_containers/food/snacks/rogue/meat_rotten = 2,\
	/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 2,\
	/obj/item/reagent_containers/food/snacks/rogue/meat/fatty = 1,\
	/obj/item/reagent_containers/food/snacks/rogue/meat/poultry = 4,\
	/obj/item/reagent_containers/food/snacks/rogue/meat/crab = 3,\
	/obj/item/reagent_containers/food/snacks/rogue/meat/rabbit = 4,\
	/obj/item/reagent_containers/food/snacks/rogue/meat/steak/wolf = 2,\
	/obj/item/reagent_containers/food/snacks/rogue/meat/fish = 5,\
	/obj/item/reagent_containers/food/snacks/rogue/meat/shellfish = 4,\
)

/obj/item/ration/misterymeat/Initialize()
	. = ..()
	var/foodstuffs = pickweight(MISTERYMEAT_LIST) //LET'S GO GAMBLING!
	food = new foodstuffs(src)
	food.rotprocess = FALSE
	name = "Mistery meat..."
	desc = "Who knows what's in it..."
	icon_state = "ration_large"



/obj/structure/closet/crate
	var/fulton = FALSE


/obj/item/clothing/suit/roguetown/shirt/tunic/orange
	color = CLOTHING_ORANGE



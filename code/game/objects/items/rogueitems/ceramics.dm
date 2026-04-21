/* Tools for using with Pottery */

/* Items made from Pottery */

// Uncooked items -- Still need to be brought to a kiln
// Those are all children of natural/clay so that they can inherit the Glaze method.

//Bottle - subtype of glass bottle
/obj/item/natural/clay/claybottle
	name = "unglazed clay bottle"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claybottleraw"
	desc = "A bottle fashioned from clay. Still needs to be baked to be useful." // Caustic edit
	cooked_type = /obj/item/reagent_containers/glass/bottle/claybottle

/obj/item/natural/clay/claybottleclassic
	name = "unglazed clay bottle"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claybottleraw"
	desc = "A bottle fashioned from clay. Still needs to be glazed to be useful."
	cooked_type = /obj/item/reagent_containers/glass/bottle/claybottleclassic

/obj/item/reagent_containers/glass/bottle/claybottle
	name = "clay vessel"
	desc = "A ceramic bottle." //The sprite was anything but small
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claybottlecook"
	volume = 75 // Larger than glass bottle
	sellprice = 6
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glazeable = TRUE  // Caustic edit

/obj/item/reagent_containers/glass/bottle/claybottleclassic
	name = "clay vessel"
	desc = "A ceramic bottle. Tyme caresses its curves and cracks with a faint, ethereal glimmer."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claybottlebaked"
	volume = 75 // Larger than glass bottle
	sellprice = 6
	reagent_flags = OPENCONTAINER	//So it doesn't appear through

/obj/item/reagent_containers/glass/bottle/claybottle/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Clay pottery, unlike its alloyed counterparts, can be stained in a dyebin.")

//Vase - bigger bottle
/obj/item/natural/clay/clayvase
	name = "unglazed clay vase"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayvaseraw"
	 // Caustic edit start
	desc = "A vase fashioned from clay. Still needs to be baked to be useful."
	cooked_type = /obj/item/reagent_containers/glass/bottle/claybottle/vase
	 // Caustic edit end

/obj/item/natural/clay/clayvaseclassic
	name = "unglazed clay vase"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayvaseraw"
	desc = "A vase fashioned from clay. Still needs to be glazed to be useful."
	cooked_type = /obj/item/reagent_containers/glass/bottle/clayvaseclassic

/obj/item/reagent_containers/glass/bottle/claybottle/vase  // Caustic edit. Now a subtype of claybottle
	name = "ceramic vase"
	desc = "A large sized ceramic vase."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayvasecook"
	volume = 65 // Larger than glass bottle
	sellprice = 9
	reagent_flags = OPENCONTAINER	//So it doesn't appear through

/obj/item/reagent_containers/glass/bottle/clayvaseclassic
	name = "ceramic vase"
	desc = "A large sized ceramic vase. Tyme caresses its curves and cracks with a faint, ethereal glimmer."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayvasebaked"
	volume = 65 // Larger than glass bottle
	sellprice = 9
	reagent_flags = OPENCONTAINER	//So it doesn't appear through

/obj/item/reagent_containers/glass/bottle/clayvase/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Clay pottery, unlike its alloyed counterparts, can be stained in a dyebin.")

//Fancy vase - bigger bottle + fancy
/obj/item/natural/clay/clayfancyvase
	name = "unglazed fancy clay vase"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayfancyvaseraw"
	desc = "A fancy vase fashioned from clay. Still needs to be baked to be useful."  // Caustic edit
	cooked_type = /obj/item/reagent_containers/glass/bottle/claybottle/vase/fancy

/obj/item/natural/clay/clayfancyvaseclassic
	name = "unglazed fancy clay vase"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayfancyvaseraw"
	desc = "A fancy vase fashioned from clay. Still needs to be glazed to be useful."
	cooked_type = /obj/item/reagent_containers/glass/bottle/clayfancyvaseclassic

/obj/item/reagent_containers/glass/bottle/claybottle/vase/fancy  // Caustic edit. Subtype of /vase, so extra lines removed
	name = "fancy ceramic vase"
	desc = "A large sized fancy ceramic vase."
	icon_state = "clayfancyvasecook"
	volume = 65 // Larger than glass bottle
	sellprice = 20
	reagent_flags = OPENCONTAINER	//So it doesn't appear through

/obj/item/reagent_containers/glass/bottle/clayfancyvaseclassic
	name = "fancy ceramic vase"
	desc = "A large sized fancy ceramic vase. Tyme caresses its curves and cracks with a faint, ethereal glimmer."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayfancyvasebaked"
	volume = 65 // Larger than glass bottle
	sellprice = 20
	reagent_flags = OPENCONTAINER	//So it doesn't appear through

/obj/item/reagent_containers/glass/bottle/clayfancyvase/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Clay pottery, unlike its alloyed counterparts, can be stained in a dyebin.")

//Flask (was a cup) - subtype of regular cup but can shatter.
/obj/item/natural/clay/claycup
	name = "unglazed clay flask"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claycupraw"
	desc = "A small flask fashioned from clay. Still needs to be baked to be useful."  // Caustic edit
	cooked_type = /obj/item/reagent_containers/glass/cup/claycup

/obj/item/natural/clay/claycupclassic
	name = "unglazed clay flask"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claycupraw"
	desc = "A small flask fashioned from clay. Still needs to be glazed to be useful."
	cooked_type = /obj/item/reagent_containers/glass/cup/claycupclassic

/obj/item/reagent_containers/glass/cup/claycup
	name = "clay flask"
	desc = "A small ceramic flask."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claycupcook"
	sellprice = 3
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glazeable = TRUE  // Caustic edit

/obj/item/reagent_containers/glass/cup/claycupclassic
	name = "clay flask"
	desc = "A small ceramic flask. Tyme caresses its curves and cracks with a faint, ethereal glimmer."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claycupbaked"
	sellprice = 3
	reagent_flags = OPENCONTAINER	//So it doesn't appear through

/obj/item/reagent_containers/glass/cup/claycup/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Clay pottery, unlike its alloyed counterparts, can be stained in a dyebin.")

// Raw teapot
/obj/item/natural/clay/rawteapot
	name = "raw teapot"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "teapot_raw"
	desc = "A teapot fashioned from clay. Still needs to be baked to be useful."
	cooked_type = /obj/item/reagent_containers/glass/bucket/pot/teapot

// Raw teacup
/obj/item/natural/clay/rawteacup
	name = "raw teacup"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "teacup_raw"
	desc = "A teacup fashioned from clay. Still needs to be baked to be useful."
	cooked_type = /obj/item/reagent_containers/glass/cup/ceramic

//Bricks - Makes bricks which are used for building. (Need brick-wall sprites for this.. augh..)
/obj/item/natural/clay/claybrick
	name = "uncooked clay brick"
	desc = "An uncooked clay brick. It still needs to be cooked in a kiln."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claybrickraw"
	cooked_type = /obj/item/natural/brick

//Statues - Basically cheapest version of the metal-made statues, but way easier to make given no rare material usage. Just skill. Plus, dyeable.
/obj/item/natural/clay/claystatue
	name = "uncooked clay statue"
	desc = "An uncooked clay statue. It still needs to be cooked in a kiln."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claystatueraw"
	cooked_type = /obj/item/roguestatue/clay

/obj/item/roguestatue/clay
	name = "ceramic statue"
	desc = "A ceramic statue, shining in its elegance!"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claystatuecooked1"
	smeltresult = null	//No resource return
	sellprice = 35 //Expert-tier Clay recipe. Skillgated to Towners, or those that take the 'Homesteader Expert' virtue. Let 'em cook.

/obj/item/roguestatue/clay/Initialize()
	. = ..()
	icon_state = "claystatuecooked[pick(1,2,3,4,5)]"

/obj/item/roguestatue/clay/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Clay pottery, unlike its alloyed counterparts, can be stained in a dyebin.")

/obj/item/roguestatue/glass
	name = "glass statue"
	desc = "A statue made of fine glass. An incredible amount of skill must have went into this fragile masterpiece!"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "statueglass1"
	smeltresult = null	//No resource return
	sellprice = 70		//Silver is roughly 90 mammon, steel is 40. This sits roughly between. It's high skill to make and a bit of a grind so - worth it since resources to make aren't rare..

/obj/item/roguestatue/glass/Initialize()
	. = ..()
	icon_state = "statueglass[pick(1,2,3,4,5)]"

/obj/item/roguestatue/clay/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Glassed pottery, unlike its alloyed counterparts, can be stained in a dyebin.")

// Caustic Edit start

// Clay pot
/obj/item/natural/clay/claypot
	name = "raw pot"
	icon = 'modular/Neu_Food/icons/cookware/pot.dmi'
	icon_state = "pote_clay_raw"
	desc = "A large pot fashioned from clay. Still needs to be baked to be useful."
	cooked_type = /obj/item/reagent_containers/glass/bucket/pot/clay


/obj/item/reagent_containers/glass/bucket/pot/clay
	name = "clay pot"
	desc = "A pot made out of clay. It can hold a lot of liquid, and makes a satisfying noise when tapped."
	icon_state = "pote_clay"
	volume = 180 // Between stone and iron pots. In terms of soup, it fits 6 ingredients compared to stone's 4, or iron's 8
	glazeable = TRUE

// Pre-glazed

/obj/item/reagent_containers/glass/bucket/pot/clay/brown
	name = "brown clay pot"
	desc = "A pot made out of clay. It can hold a lot of liquid, and makes a satisfying noise when tapped. Glazed and marked to mimic unfired clay."
	icon_state = "pote_clay_brown"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bucket/pot/clay/porcelain
	name = "porcelain clay pot"
	desc = "A pot made out of clay. It can hold a lot of liquid, and makes a satisfying noise when tapped. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "pote_clay_porcelain"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bucket/pot/clay/shattergold
	name = "shattergold clay pot"
	desc = "A pot made out of clay. It can hold a lot of liquid, and makes a satisfying noise when tapped. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "pote_clay_shattergold"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bucket/pot/clay/bluegold
	name = "bluegold clay pot"
	desc = "A pot made out of clay. It can hold a lot of liquid, and makes a satisfying noise when tapped. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "pote_clay_bluegold"
	glazeable = FALSE
	glazed = TRUE

// Clay mug
/obj/item/natural/clay/claymug
	name = "unglazed clay mug"
	icon = 'modular/Neu_Food/icons/cookware/cup.dmi'
	icon_state = "claymugraw"
	desc = "A mug fashioned from clay. Still needs to be baked to be useful."
	cooked_type = /obj/item/reagent_containers/glass/cup/claymug

/obj/item/reagent_containers/glass/cup/claymug
	name = "clay mug"
	desc = "A ceramic mug."
	icon_state = "claymugcook"
	sellprice = 3
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glazeable = TRUE

// Pre-glazed

/obj/item/reagent_containers/glass/cup/claymug/brown
	name = "brown clay mug"
	desc = "A ceramic mug. Glazed and marked to mimic unfired clay."
	icon_state = "claymugcook_brown"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claymug/porcelain
	name = "porcelain clay mug"
	desc = "A ceramic mug. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "claymugcook_porcelain"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claymug/shattergold
	name = "shattergold clay mug"
	desc = "A ceramic mug. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claymugcook_shattergold"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claymug/bluegold
	name = "bluegold clay mug"
	desc = "A ceramic mug. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claymugcook_bluegold"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

// Clay platter

/obj/item/natural/clay/clayplatter
	name = "raw clay platter"
	icon = 'modular/Neu_Food/icons/cookware/platter.dmi'
	icon_state = "platter_clay_raw"
	desc = "A disc of soft clay. Still needs to be baked to be useful."
	cooked_type = /obj/item/cooking/platter/clay

/obj/item/cooking/platter/clay
	name = "clay platter"
	desc = "A ceramic platter."
	icon_state = "platter_clay_cook"
	sellprice = 2
	glazeable = TRUE

// Pre-glazed

/obj/item/cooking/platter/clay/brown
	name = "brown clay platter"
	desc = "A ceramic platter. Glazed and marked to mimic unfired clay."
	icon_state = "platter_clay_cook_brown"
	sellprice = 7
	glazeable = FALSE
	glazed = TRUE

/obj/item/cooking/platter/clay/porcelain
	name = "porcelain clay platter"
	desc = "A ceramic platter. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "platter_clay_cook_porcelain"
	sellprice = 7
	glazeable = FALSE
	glazed = TRUE

/obj/item/cooking/platter/clay/shattergold
	name = "shattergold clay platter"
	desc = "A ceramic platter. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "platter_clay_cook_shattergold"
	sellprice = 7
	glazeable = FALSE
	glazed = TRUE

/obj/item/cooking/platter/clay/bluegold
	name = "bluegold clay platter"
	desc = "A ceramic platter. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "platter_clay_cook_bluegold"
	sellprice = 7
	glazeable = FALSE
	glazed = TRUE

// Clay bowl

/obj/item/natural/clay/claybowl
	name = "raw clay bowl"
	icon = 'modular/Neu_Food/icons/cookware/bowl.dmi'
	icon_state = "bowl_clay_raw"
	desc = "A bowl fashioned from clay. Still needs to be baked to be useful."
	cooked_type = /obj/item/reagent_containers/glass/bowl/clay

/obj/item/reagent_containers/glass/bowl/clay
	name = "clay bowl"
	icon_state = "bowl_clay_cook"
	sellprice = 3
	glazeable = TRUE

// Pre-glazed

/obj/item/reagent_containers/glass/bowl/clay/brown
	name = "brown clay bowl"
	desc = "It is the empty space that makes the bowl useful. Glazed and marked to mimic unfired clay."
	icon_state = "bowl_clay_cook_brown"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bowl/clay/porcelain
	name = "porcelain clay bowl"
	desc = "It is the empty space that makes the bowl useful. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "bowl_clay_cook_porcelain"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bowl/clay/shattergold
	name = "shattergold clay bowl"
	desc = "It is the empty space that makes the bowl useful. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "bowl_clay_cook_shattergold"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bowl/clay/bluegold
	name = "bluegold clay bowl"
	desc = "It is the empty space that makes the bowl useful. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "bowl_clay_cook_bluegold"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

// New clay teapot

/obj/item/natural/clay/clayteapot
	name = "raw clay teapot"
	icon = 'modular/Neu_Food/icons/cookware/pot.dmi'
	icon_state = "teapot_clay_raw"
	desc = "A teapot fashioned from clay. Still needs to be baked to be useful."
	cooked_type = /obj/item/reagent_containers/glass/bucket/pot/clayteapot

/obj/item/reagent_containers/glass/bucket/pot/clayteapot
	name = "clay teapot"
	desc = "It's a little teapot, short and stout. Here is its handle, here is its spout."
	dropshrink = 0.9
	icon_state = "teapot_clay_cook"
	fill_icon_thresholds = null
	volume = 90 // 3 ingredients. You could make soup in it, if you're a maniac
	sellprice = 12
	glazeable = TRUE

// Pre-glazed

/obj/item/reagent_containers/glass/bucket/pot/clayteapot/brown
	name = "brown clay teapot"
	desc = "A teapot fashioned from clay. Glazed and marked to mimic unfired clay."
	icon_state = "teapot_clay_cook_brown"
	sellprice = 17
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bucket/pot/clayteapot/porcelain
	name = "porcelain clay teapot"
	desc = "A teapot fashioned from clay. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "teapot_clay_cook_porcelain"
	sellprice = 17
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bucket/pot/clayteapot/shattergold
	name = "shattergold clay teapot"
	desc = "A teapot fashioned from clay. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "teapot_clay_cook_shattergold"
	sellprice = 17
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bucket/pot/clayteapot/bluegold
	name = "bluegold clay teapot"
	desc = "A teapot fashioned from clay. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "teapot_clay_cook_bluegold"
	sellprice = 17
	glazeable = FALSE
	glazed = TRUE

// New clay teacup
/obj/item/natural/clay/clayteacup
	name = "raw clay teacup"
	icon = 'modular/Neu_Food/icons/cookware/cup.dmi'
	icon_state = "claycupraw"
	desc = "A teacup fashioned from clay. Still needs to be baked to be useful."
	cooked_type = /obj/item/reagent_containers/glass/cup/clayteacup

/obj/item/reagent_containers/glass/cup/clayteacup
	name = "clay teacup"
	desc = "A small cup made of ceramic."
	icon_state = "claycupcook"
	dropshrink = 0.9
	volume = 15
	glazeable = TRUE

// Pre-glazed

/obj/item/reagent_containers/glass/cup/clayteacup/brown
	name = "brown clay teacup"
	desc = "A small cup made of ceramic. Glazed and marked to mimic unfired clay."
	icon_state = "claycupcook_brown"
	sellprice = 10
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/clayteacup/porcelain
	name = "porcelain clay teacup"
	desc = "A small cup made of ceramic. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "claycupcook_porcelain"
	sellprice = 10
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/clayteacup/shattergold
	name = "shattergold clay teacup"
	desc = "A small cup made of ceramic. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claycupcook_shattergold"
	sellprice = 10
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/clayteacup/bluegold
	name = "bluegold clay teacup"
	desc = "A small cup made of ceramic. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claycupcook_bluegold"
	sellprice = 10
	glazeable = FALSE
	glazed = TRUE

// Pre-glazed flask/cup

/obj/item/reagent_containers/glass/cup/claycup/brown
	name = "brown clay flask"
	desc = "A small ceramic flask. Glazed and marked to mimic unfired clay."
	icon_state = "claycupcook_brown"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claycup/porcelain
	name = "porcelain clay flask"
	desc = "A small ceramic flask. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "claycupcook_porcelain"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claycup/shattergold
	name = "shattergold clay flask"
	desc = "A small ceramic flask. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claycupcook_shattergold"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claycup/bluegold
	name = "bluegold clay flask"
	desc = "A small ceramic flask. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claycupcook_bluegold"
	sellprice = 8
	glazeable = FALSE
	glazed = TRUE

// Pre-glazed clay bottle

/obj/item/reagent_containers/glass/bottle/claybottle/brown
	name = "brown clay vessel"
	desc = "A ceramic bottle. Glazed and marked to mimic unfired clay."
	icon_state = "claybottlecook_brown"
	sellprice = 11
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/porcelain
	name = "porcelain clay vessel"
	desc = "A ceramic bottle. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "claybottlecook_porcelain"
	sellprice = 11
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/shattergold
	name = "shattergold clay vessel"
	desc = "A ceramic bottle. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claybottlecook_shattergold"
	sellprice = 11
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/bluegold
	name = "bluegold clay vessel"
	desc = "A ceramic bottle. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claybottlecook_bluegold"
	sellprice = 11
	glazeable = FALSE
	glazed = TRUE

// Pre-glazed clay vase

/obj/item/reagent_containers/glass/bottle/claybottle/vase/brown
	name = "brown clay vase"
	desc = "A large sized ceramic vase. Glazed and marked to mimic unfired clay."
	icon_state = "clayvasecook_brown"
	sellprice = 14
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/porcelain
	name = "porcelain clay vase"
	desc = "A large sized ceramic vase. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "clayvasecook_porcelain"
	sellprice = 14
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/shattergold
	name = "shattergold clay vase"
	desc = "A large sized ceramic vase. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "clayvasecook_shattergold"
	sellprice = 14
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/bluegold
	name = "bluegold clay vase"
	desc = "A large sized ceramic vase. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "clayvasecook_bluegold"
	sellprice = 14
	glazeable = FALSE
	glazed = TRUE

// Pre-glazed clay fancy vase

/obj/item/reagent_containers/glass/bottle/claybottle/vase/fancy/brown
	name = "brown fancy clay vase"
	desc = "A large sized fancy ceramic vase. Glazed and marked to mimic unfired clay."
	icon_state = "clayfancyvasecook_brown"
	sellprice = 19
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/fancy/porcelain
	name = "porcelain fancy clay vase"
	desc = "A large sized fancy ceramic vase. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "clayfancyvasecook_porcelain"
	sellprice = 19
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/fancy/shattergold
	name = "shattergold fancy clay vase"
	desc = "A large sized fancy ceramic vase. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "clayfancyvasecook_shattergold"
	sellprice = 19
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/fancy/bluegold
	name = "bluegold fancy clay vase"
	desc = "A large sized fancy ceramic vase. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "clayfancyvasecook_bluegold"
	sellprice = 19
	glazeable = FALSE
	glazed = TRUE

// Caustic Edit end

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
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glaze_bonus_pct = GLAZE_BONUS_PCT
	glazeable = TRUE  // Caustic edit

/obj/item/reagent_containers/glass/bottle/claybottleclassic
	name = "clay vessel"
	desc = "A ceramic bottle. Tyme caresses its curves and cracks with a faint, ethereal glimmer."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claybottlecook_baked" // Caustic Edit
	volume = 75 // Larger than glass bottle
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glaze_bonus_pct = GLAZE_BONUS_PCT

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
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glaze_bonus_pct = GLAZE_BONUS_PCT

/obj/item/reagent_containers/glass/bottle/clayvaseclassic
	name = "ceramic vase"
	desc = "A large sized ceramic vase. Tyme caresses its curves and cracks with a faint, ethereal glimmer."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayvasecook_baked" // Caustic Edit
	volume = 65 // Larger than glass bottle
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glaze_bonus_pct = GLAZE_BONUS_PCT

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
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glaze_bonus_pct = GLAZE_BONUS_PCT

/obj/item/reagent_containers/glass/bottle/clayfancyvaseclassic
	name = "fancy ceramic vase"
	desc = "A large sized fancy ceramic vase. Tyme caresses its curves and cracks with a faint, ethereal glimmer."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayfancyvasecook_baked" // Caustic Edit
	volume = 65 // Larger than glass bottle
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glaze_bonus_pct = GLAZE_BONUS_PCT

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

/obj/item/natural/clay/rawcup
	name = "unfired clay cup"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelaincupraw"
	cooked_type = /obj/item/reagent_containers/glass/cup/carved/porcelain
	desc = "A small cup fashioned from clay. It still needs to be fired to be useful."
	smeltresult = /obj/item/reagent_containers/glass/cup/carved/porcelain

/obj/item/natural/clay/rawcupfancy
	name = "unfired fancy clay goblet"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelaincupfancyraw"
	cooked_type = /obj/item/reagent_containers/glass/cup/carved/porcelainfancy
	desc = "A fancy goblet fashioned from clay. It still needs to be fired to be useful."
	smeltresult = /obj/item/reagent_containers/glass/cup/carved/porcelainfancy

/obj/item/natural/clay/rawbowl
	name = "unfired clay bowl"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainbowlraw"
	cooked_type = /obj/item/reagent_containers/glass/bowl/carved/porcelain
	desc = "A fancy bowl fashioned from clay. It still needs to be fired to be useful."
	smeltresult = /obj/item/reagent_containers/glass/bowl/carved/porcelain

/obj/item/natural/clay/rawspoon
	name = "unfired clay spoon"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainspoonraw"
	cooked_type = /obj/item/kitchen/spoon/carved/porcelain
	desc = "A fancy spoon fashioned from clay. It still needs to be fired to be useful."


/obj/item/natural/clay/rawfork
	name = "unfired clay fork"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainforkraw"
	cooked_type = /obj/item/kitchen/fork/carved/porcelain 
	desc = "A fancy fork fashioned from clay. It still needs to be fired to be useful."

/obj/item/natural/clay/rawplatter
	name = "unfired clay platter"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainplatterraw"
	cooked_type = /obj/item/cooking/platter/carved/porcelain
	desc = "A fancy platter fashioned from clay. It still needs to be fired to be useful."


/obj/item/reagent_containers/glass/cup/claycup
	name = "clay flask"
	desc = "A small ceramic flask."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claycupcook"
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glaze_bonus_pct = GLAZE_BONUS_PCT
	glazeable = TRUE  // Caustic edit

/obj/item/reagent_containers/glass/cup/claycupclassic
	name = "clay flask"
	desc = "A small ceramic flask. Tyme caresses its curves and cracks with a faint, ethereal glimmer."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "claycupcook_baked" // Caustic Edit
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glaze_bonus_pct = GLAZE_BONUS_PCT

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
	glaze_bonus_pct = GLAZE_BONUS_PCT

/obj/item/roguestatue/clay/Initialize()
	. = ..()
	icon_state = "claystatuecooked[pick(1,2,3,4,5)]"

/obj/item/roguestatue/glass
	name = "glass statue"
	desc = "A statue made of fine glass. An incredible amount of skill must have went into this fragile masterpiece!"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "statueglass1"
	smeltresult = null	//No resource return
	glaze_bonus_pct = GLAZE_BONUS_PCT

/obj/item/roguestatue/glass/Initialize()
	. = ..()
	icon_state = "statueglass[pick(1,2,3,4,5)]"

/obj/item/roguestatue/clay/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Glassed pottery, unlike its alloyed counterparts, can be stained in a dyebin.")

// LITERALLY EVERYTHING ELSE. ORGANIZATION BE DAMNED!

/obj/item/natural/clay/rawbauble
	name = "unfired clay bauble"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainbaubleraw"
	desc = "A bauble fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/bauble
	smeltresult = /obj/item/natural/clay/porcelain/bauble

/obj/item/natural/clay/rawcameo
	name = "unfired clay cameo"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelaincameoraw"
	desc = "A cameo fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/cameo
	smeltresult = /obj/item/natural/clay/porcelain/cameo

/obj/item/natural/clay/rawbust
	name = "unfired clay bust"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainbustraw"
	desc = "A large bust fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/bust
	smeltresult = /obj/item/natural/clay/porcelain/bust

/obj/item/natural/clay/rawfigurine
	name = "unfired clay figurine"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainfigurineraw"
	desc = "A small figurine fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/figurine
	smeltresult = /obj/item/natural/clay/porcelain/figurine

/obj/item/natural/clay/rawurn
	name = "unfired large clay urn"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainurnraw"
	desc = "A large, lidded urn fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/urn
	smeltresult = /obj/item/natural/clay/porcelain/urn

/obj/item/natural/clay/rawstatuette
	name = "unfired clay statuette"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainstatueraw"
	desc = "A medium-sized statuette fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/statuette
	smeltresult = /obj/item/natural/clay/porcelain/statuette

/obj/item/natural/clay/rawobelisk
	name = "unfired clay obelisk"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainobeliskraw"
	desc = "A medium-sized obelisk fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/obelisk
	smeltresult = /obj/item/natural/clay/porcelain/obelisk

/obj/item/natural/clay/rawduck
	name = "unfired clay duck"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainduckraw"
	desc = "An adorable duck statue fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/duck
	smeltresult = /obj/item/natural/clay/porcelain/duck

/obj/item/natural/clay/rawcomb
	name = "unfired clay comb"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelaincombraw"
	desc = "A fashionable comb fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/comb
	smeltresult = /obj/item/natural/clay/porcelain/comb

/obj/item/natural/clay/rawtablet
	name = "unfired clay tablet"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelaintabletraw"
	desc = "A medium-sized tablet fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/tablet
	smeltresult = /obj/item/natural/clay/porcelain/tablet

/obj/item/natural/clay/rawturtle
	name = "unfired clay turtle statuette"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainturtleraw"
	desc = "A large turtle statuette fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/turtle
	smeltresult = /obj/item/natural/clay/porcelain/turtle

/obj/item/natural/clay/rawfish
	name = "unfired clay fish figurine"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainfishraw"
	desc = "A small fish figurine fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/fish
	smeltresult = /obj/item/natural/clay/porcelain/fish

/obj/item/natural/clay/rawmoon
	name = "unfired clay moon"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainmoonraw"
	desc = "A medium-sized moon statue fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/moon
	smeltresult = /obj/item/natural/clay/porcelain/moon

/obj/item/natural/clay/rawsun
	name = "unfired clay sun"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainsunraw"
	desc = "A medium-sized sun statue fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/sun
	smeltresult = /obj/item/natural/clay/porcelain/sun

/obj/item/natural/clay/rawheart
	name = "unfired clay heart"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainheartraw"
	desc = "A heart fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/heart
	smeltresult = /obj/item/natural/clay/porcelain/heart

/obj/item/natural/clay/rawdisplay
	name = "unfired clay display stand"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainstandraw"
	desc = "A small display stand fashioned out of clay."
	cooked_type = /obj/item/natural/clay/porcelain/display
	smeltresult = /obj/item/natural/clay/porcelain/display

/obj/item/natural/clay/rawring
	name = "unfired clay ring"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporeclainringraw"
	desc = "A dainty ring fashioned out of clay."
	cooked_type = /obj/item/clothing/ring/porcelain
	smeltresult = /obj/item/clothing/ring/porcelain

/obj/item/natural/clay/rawamulet
	name = "unfired clay amulet"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainamuletraw"
	desc = "A delicate amulet fashioned out of clay."
	cooked_type = /obj/item/clothing/neck/roguetown/carved/porcelainamulet
	smeltresult = /obj/item/clothing/neck/roguetown/carved/porcelainamulet

/obj/item/natural/clay/rawcirclet
	name = "unfired clay circlet"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelaincircletraw"
	desc = "An elegant circlet fashioned out of clay."
	cooked_type = /obj/item/clothing/head/roguetown/circlet/carvedgem/porcelain
	smeltresult = /obj/item/clothing/head/roguetown/circlet/carvedgem/porcelain

// THE COOKED ITEMS, AGAIN, ORGANIZATION BE DAMNED
/obj/item/natural/clay/porcelain
	name = "porcelain base"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clayporcelainbauble"
	desc = "This is a base item, if you are seeing this, it's a bug, report it lol."
	dropshrink = FALSE
	obj_flags = CAN_BE_HIT|UNIQUE_RENAME
	
/obj/item/natural/clay/porcelain/bauble
	name = "porcelain bauble"
	desc = "A small porcelain bauble."
	icon_state = "clayporcelainbauble"
	
/obj/item/natural/clay/porcelain/cameo
	name = "porcelain cameo"
	desc = "A small porcelain cameo."
	icon_state = "clayporcelaincameo"
	
/obj/item/natural/clay/porcelain/bust
	name = "porcelain bust"
	desc = "A large porcelain bust."
	icon_state = "clayporcelainbust"
	
/obj/item/natural/clay/porcelain/figurine
	name = "porcelain figurine"
	desc = "A small figurine made out of porcelain."
	icon_state = "clayporcelainfigurine"

/obj/item/natural/clay/porcelain/urn
	name = "large porcelain urn"
	desc = "A large, lidded urn made out of porcelain."
	icon_state = "clayporcelainurn"

/obj/item/natural/clay/porcelain/statuette
	name = "porcelain statuette"
	desc = "A medium-sized statuette made out of porcelain."
	icon_state = "clayporcelainstatue"

/obj/item/natural/clay/porcelain/obelisk
	name = "porcelain obelisk"
	desc = "A medium-sized obelisk made out of porcelain."
	icon_state = "clayporcelainobelisk"

/obj/item/natural/clay/porcelain/sun
	name = "porcelain sun"
	desc = "A medium-sized sun statue made out of porcelain."
	icon_state = "clayporcelainsun"

/obj/item/natural/clay/porcelain/moon
	name = "porcelain moon"
	desc = "A medium-sized moon statue made out of porcelain."
	icon_state = "clayporcelainmoon"

/obj/item/natural/clay/porcelain/heart
	name = "porcelain heart"
	desc = "A heart made out of porcelain."
	icon_state = "clayporcelainheart"

/obj/item/natural/clay/porcelain/display
	name = "porcelain display stand"
	desc = "A small display stand made out of porcelain."
	icon_state = "clayporcelainstand"

/obj/item/natural/clay/porcelain/fish
	name = "porcelain fish figurine"
	desc = "A small fish figurine made out of porcelain."
	icon_state = "clayporcelainfish"

/obj/item/natural/clay/porcelain/turtle
	name = "porcelain turtle statuette"
	desc = "A large turtle statuette made out of porcelain."
	icon_state = "clayporcelainturtle"

/obj/item/natural/clay/porcelain/duck
	name = "porcelain duck statue"
	desc = "An adorable duck statue made out of porcelain."
	icon_state = "clayporcelainduck"

/obj/item/natural/clay/porcelain/comb
	name = "porcelain comb"
	desc = "A fashionable comb made out of porcelain."
	icon_state = "clayporcelaincomb"

/obj/item/natural/clay/porcelain/tablet
	name = "porcelain tablet"
	desc = "A medium-sized tablet made out of porcelain."
	icon_state = "clayporcelaintablet"

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
	name = "baked clay pot"
	desc = "A pot made out of clay. It can hold a lot of liquid, and makes a satisfying noise when tapped. Glazed and marked to mimic rough brown clay."
	icon_state = "pote_clay_baked"
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
	reagent_flags = OPENCONTAINER	//So it doesn't appear through
	glazeable = TRUE

// Pre-glazed

/obj/item/reagent_containers/glass/cup/claymug/brown
	name = "baked clay mug"
	desc = "A ceramic mug. Glazed and marked to mimic rough brown clay."
	icon_state = "claymugcook_baked"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claymug/porcelain
	name = "porcelain clay mug"
	desc = "A ceramic mug. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "claymugcook_porcelain"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claymug/shattergold
	name = "shattergold clay mug"
	desc = "A ceramic mug. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claymugcook_shattergold"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claymug/bluegold
	name = "bluegold clay mug"
	desc = "A ceramic mug. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claymugcook_bluegold"
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
	glazeable = TRUE

// Pre-glazed

/obj/item/cooking/platter/clay/brown
	name = "baked clay platter"
	desc = "A ceramic platter. Glazed and marked to mimic rough brown clay."
	icon_state = "platter_clay_cook_baked"
	glazeable = FALSE
	glazed = TRUE

/obj/item/cooking/platter/clay/porcelain
	name = "porcelain clay platter"
	desc = "A ceramic platter. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "platter_clay_cook_porcelain"
	glazeable = FALSE
	glazed = TRUE

/obj/item/cooking/platter/clay/shattergold
	name = "shattergold clay platter"
	desc = "A ceramic platter. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "platter_clay_cook_shattergold"
	glazeable = FALSE
	glazed = TRUE

/obj/item/cooking/platter/clay/bluegold
	name = "bluegold clay platter"
	desc = "A ceramic platter. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "platter_clay_cook_bluegold"
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
	glazeable = TRUE

// Pre-glazed

/obj/item/reagent_containers/glass/bowl/clay/brown
	name = "baked clay bowl"
	desc = "It is the empty space that makes the bowl useful. Glazed and marked to mimic rough brown clay."
	icon_state = "bowl_clay_cook_baked"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bowl/clay/porcelain
	name = "porcelain clay bowl"
	desc = "It is the empty space that makes the bowl useful. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "bowl_clay_cook_porcelain"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bowl/clay/shattergold
	name = "shattergold clay bowl"
	desc = "It is the empty space that makes the bowl useful. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "bowl_clay_cook_shattergold"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bowl/clay/bluegold
	name = "bluegold clay bowl"
	desc = "It is the empty space that makes the bowl useful. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "bowl_clay_cook_bluegold"
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
	glazeable = TRUE

// Pre-glazed

/obj/item/reagent_containers/glass/bucket/pot/clayteapot/brown
	name = "baked clay teapot"
	desc = "A teapot fashioned from clay. Glazed and marked to mimic rough brown clay."
	icon_state = "teapot_clay_cook_baked"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bucket/pot/clayteapot/porcelain
	name = "porcelain clay teapot"
	desc = "A teapot fashioned from clay. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "teapot_clay_cook_porcelain"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bucket/pot/clayteapot/shattergold
	name = "shattergold clay teapot"
	desc = "A teapot fashioned from clay. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "teapot_clay_cook_shattergold"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bucket/pot/clayteapot/bluegold
	name = "bluegold clay teapot"
	desc = "A teapot fashioned from clay. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "teapot_clay_cook_bluegold"
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
	glazeable = TRUE

// Pre-glazed

/obj/item/reagent_containers/glass/cup/clayteacup/brown
	name = "baked clay teacup"
	desc = "A small cup made of ceramic. Glazed and marked to mimic rough brown clay."
	icon_state = "claycupcook_baked"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/clayteacup/porcelain
	name = "porcelain clay teacup"
	desc = "A small cup made of ceramic. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "claycupcook_porcelain"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/clayteacup/shattergold
	name = "shattergold clay teacup"
	desc = "A small cup made of ceramic. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claycupcook_shattergold"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/clayteacup/bluegold
	name = "bluegold clay teacup"
	desc = "A small cup made of ceramic. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claycupcook_bluegold"
	glazeable = FALSE
	glazed = TRUE

// Pre-glazed flask/cup

/obj/item/reagent_containers/glass/cup/claycup/brown
	name = "baked clay flask"
	desc = "A small ceramic flask. Glazed and marked to mimic rough brown clay."
	icon_state = "claycupcook_baked"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claycup/porcelain
	name = "porcelain clay flask"
	desc = "A small ceramic flask. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "claycupcook_porcelain"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claycup/shattergold
	name = "shattergold clay flask"
	desc = "A small ceramic flask. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claycupcook_shattergold"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/cup/claycup/bluegold
	name = "bluegold clay flask"
	desc = "A small ceramic flask. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claycupcook_bluegold"
	glazeable = FALSE
	glazed = TRUE

// Pre-glazed clay bottle

/obj/item/reagent_containers/glass/bottle/claybottle/brown
	name = "baked clay vessel"
	desc = "A ceramic bottle. Glazed and marked to mimic rough brown clay."
	icon_state = "claybottlecook_baked"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/porcelain
	name = "porcelain clay vessel"
	desc = "A ceramic bottle. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "claybottlecook_porcelain"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/shattergold
	name = "shattergold clay vessel"
	desc = "A ceramic bottle. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claybottlecook_shattergold"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/bluegold
	name = "bluegold clay vessel"
	desc = "A ceramic bottle. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "claybottlecook_bluegold"
	glazeable = FALSE
	glazed = TRUE

// Pre-glazed clay vase

/obj/item/reagent_containers/glass/bottle/claybottle/vase/brown
	name = "baked clay vase"
	desc = "A large sized ceramic vase. Glazed and marked to mimic rough brown clay."
	icon_state = "clayvasecook_baked"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/porcelain
	name = "porcelain clay vase"
	desc = "A large sized ceramic vase. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "clayvasecook_porcelain"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/shattergold
	name = "shattergold clay vase"
	desc = "A large sized ceramic vase. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "clayvasecook_shattergold"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/bluegold
	name = "bluegold clay vase"
	desc = "A large sized ceramic vase. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "clayvasecook_bluegold"
	glazeable = FALSE
	glazed = TRUE

// Pre-glazed clay fancy vase

/obj/item/reagent_containers/glass/bottle/claybottle/vase/fancy/brown
	name = "brown fancy clay vase"
	desc = "A large sized fancy ceramic vase. Glazed and marked to mimic rough brown clay."
	icon_state = "clayfancyvasecook_baked"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/fancy/porcelain
	name = "porcelain fancy clay vase"
	desc = "A large sized fancy ceramic vase. Gilded and coated in white glaze. This is fit for nobility."
	icon_state = "clayfancyvasecook_porcelain"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/fancy/shattergold
	name = "shattergold fancy clay vase"
	desc = "A large sized fancy ceramic vase. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "clayfancyvasecook_shattergold"
	glazeable = FALSE
	glazed = TRUE

/obj/item/reagent_containers/glass/bottle/claybottle/vase/fancy/bluegold
	name = "bluegold fancy clay vase"
	desc = "A large sized fancy ceramic vase. Known as kintsugi to the Kazengunese. This method mends cracked and broken pottery with molten gold."
	icon_state = "clayfancyvasecook_bluegold"
	glazeable = FALSE
	glazed = TRUE

// Caustic Edit end

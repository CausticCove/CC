/datum/crafting_recipe/roguetown/ceramics
	abstract_type = /datum/crafting_recipe/roguetown/ceramics
	display_category = ITEM_CAT_POTTERY
	skillcraft = /datum/skill/craft/ceramics

/datum/crafting_recipe/roguetown/ceramics/clay
	structurecraft = /obj/structure/fluff/ceramicswheel

/datum/crafting_recipe/roguetown/ceramics/glass
	tools = list(/obj/item/rogueweapon/blowrod) // To shape it
	structurecraft = /obj/machinery/light/rogue/smelter // To heat it

// Caustic Edit - Just redoing and reorganizing these crafting recipes. It's confused me long enough just what the hell is what. This whole file is likely modified!
/datum/crafting_recipe/roguetown/ceramics/kneaded_clay
	name = "kneaded clay"
	result = list(/obj/item/natural/clay/kneaded)
	reqs = list(/obj/item/natural/clay = 2)
	tools = list(/obj/item/reagent_containers)
	req_table = TRUE
	craftdiff = 0

/datum/crafting_recipe/roguetown/ceramics/refined_clay
	name = "refined clay"
	result = list(/obj/item/natural/clay/refined)
	reqs = list(/obj/item/natural/clay/kneaded = 1, /obj/item/ash = 2, /obj/item/natural/dirtclod/sand = 1)
	tools = list(/obj/item/reagent_containers)
	req_table = TRUE
	craftdiff = 1

/datum/crafting_recipe/roguetown/ceramics/glass_clay
	name = "glass batch"
	result = list(/obj/item/natural/glassbatch)
	reqs = list(/obj/item/natural/clay = 2, /obj/item/ash = 2, /obj/item/alch/stonedust = 1)
	tools = list(/obj/item/reagent_containers/glass/mortar, /obj/item/pestle)
	craftdiff = 2

/* 0 diff */

/datum/crafting_recipe/roguetown/ceramics/clay/clayplatter
	name = "clay platter"
	result = list(/obj/item/natural/clay/clayplatter)
	reqs = list(/obj/item/natural/clay = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/ceramics/clay/clayplatter3
	name = "clay platter 3x"
	result = list(/obj/item/natural/clay/clayplatter, /obj/item/natural/clay/clayplatter, /obj/item/natural/clay/clayplatter)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 0

/datum/crafting_recipe/roguetown/ceramics/clay/claybowl
	name = "clay bowl"
	result = list(/obj/item/natural/clay/claybowl)
	reqs = list(/obj/item/natural/clay = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/ceramics/clay/claybowl3
	name = "clay bowl 3x"
	result = list(/obj/item/natural/clay/claybowl, /obj/item/natural/clay/claybowl, /obj/item/natural/clay/claybowl)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 0

/datum/crafting_recipe/roguetown/ceramics/clay/claybrick
	name = "clay brick"
	result = list(/obj/item/natural/clay/claybrick)
	reqs = list(/obj/item/natural/clay = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/ceramics/clay/claybrick3
	name = "clay brick 3x"
	result = list(/obj/item/natural/clay/claybrick, /obj/item/natural/clay/claybrick, /obj/item/natural/clay/claybrick)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 0

/* 1 diff */

/datum/crafting_recipe/roguetown/ceramics/clay/clayvase
	name = "clay vase, dyeable"
	result = list(/obj/item/natural/clay/clayvase)
	reqs = list(/obj/item/natural/clay = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/ceramics/clay/clayvaseclassic
	name = "clay vase, traditional"
	result = list(/obj/item/natural/clay/clayvaseclassic)
	reqs = list(/obj/item/natural/clay = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/ceramics/clay/claymug
	name = "clay mug"
	result = list(/obj/item/natural/clay/claymug)
	reqs = list(/obj/item/natural/clay = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/ceramics/clay/claymug3
	name = "clay mug 3x"
	result = list(/obj/item/natural/clay/claymug, /obj/item/natural/clay/claymug, /obj/item/natural/clay/claymug)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/ceramics/clay/claybottle
	name = "clay bottle, dyeable"
	result = list(/obj/item/natural/clay/claybottle)
	reqs = list(/obj/item/natural/clay = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/ceramics/clay/claybottleclassic
	name = "clay bottle, traditional"
	result = list(/obj/item/natural/clay/claybottleclassic)
	reqs = list(/obj/item/natural/clay = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/ceramics/clay/claypot
	name = "clay pot"
	result = list(/obj/item/natural/clay/claypot)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 1

/* 2 diff */

/datum/crafting_recipe/roguetown/ceramics/clay/claycup
	name = "clay flask, dyeable"
	result = list(/obj/item/natural/clay/claycup)
	reqs = list(/obj/item/natural/clay = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/claycup3
	name = "clay flask, dyeable (3x)"
	result = list(/obj/item/natural/clay/claycup, /obj/item/natural/clay/claycup, /obj/item/natural/clay/claycup)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/claycupclassic
	name = "clay flask, traditional"
	result = list(/obj/item/natural/clay/claycupclassic)
	reqs = list(/obj/item/natural/clay = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/claycup3classic3
	name = "clay flask, traditional (3x)"
	result = list(/obj/item/natural/clay/claycupclassic, /obj/item/natural/clay/claycupclassic, /obj/item/natural/clay/claycupclassic)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/teapot
	name = "clay teapot"
	result = list(/obj/item/natural/clay/clayteapot)
	reqs = list(/obj/item/natural/clay = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/teacup
	name = "clay teacup"
	result = list(/obj/item/natural/clay/clayteacup)
	reqs = list(/obj/item/natural/clay = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/teacup3
	name = "clay teacup x3"
	result = list(/obj/item/natural/clay/clayteacup, /obj/item/natural/clay/clayteacup, /obj/item/natural/clay/clayteacup)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/teapot
	name = "teapot (old)"
	result = list(/obj/item/natural/clay/rawteapot)
	reqs = list(/obj/item/natural/clay = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/teacup
	name = "teacup (old)"
	result = list(/obj/item/natural/clay/rawteacup)
	reqs = list(/obj/item/natural/clay = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/claystatueany
	name = "clay statue (any design)"
	result = list(/obj/item/natural/clay/claystatue)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/claystatue1
	name = "clay statue (style I)"
	result = list(/obj/item/natural/clay/claystatue/design1)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/claystatue2
	name = "clay statue (style II)"
	result = list(/obj/item/natural/clay/claystatue/design2)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/claystatue3
	name = "clay statue (style III)"
	result = list(/obj/item/natural/clay/claystatue/design3)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/claystatue4
	name = "clay statue (style IV)"
	result = list(/obj/item/natural/clay/claystatue/design4)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clay/claystatue5
	name = "clay statue (style V)"
	result = list(/obj/item/natural/clay/claystatue/design5)
	reqs = list(/obj/item/natural/clay = 3)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clayplatter
	name = "porcelain platter"
	result = list(/obj/item/natural/clay/rawplatter)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/claybowl
	name = "porcelain bowl"
	result = list(/obj/item/natural/clay/rawbowl)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clayspoon
	name = "porcelain spoon"
	result = list(/obj/item/natural/clay/rawspoon)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/clayfork
	name = "porcelain fork"
	result = list(/obj/item/natural/clay/rawfork)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/ceramics/claytablet
	name = "porcelain tablet"
	result = list(/obj/item/natural/clay/rawtablet)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 2

/* 3 diff */

/datum/crafting_recipe/roguetown/ceramics/clay/clayfancyvase
	name = "fancy clay vase, dyeable"
	result = list(/obj/item/natural/clay/clayfancyvase)
	reqs = list(/obj/item/natural/clay = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/clay/clayfancyvaseclassic
	name = "fancy clay vase, traditional"
	result = list(/obj/item/natural/clay/clayfancyvaseclassic)
	reqs = list(/obj/item/natural/clay = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/claybauble
	name = "porcelain bauble x3"
	result = list(/obj/item/natural/clay/rawbauble, /obj/item/natural/clay/rawbauble, /obj/item/natural/clay/rawbauble)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/claycameo
	name = "porcelain cameo"
	result = list(/obj/item/natural/clay/rawcameo)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/claydisplay
	name = "porcelain display stand"
	result = list(/obj/item/natural/clay/rawdisplay)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/clayring
	name = "porcelain ring"
	result = list(/obj/item/natural/clay/rawring)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/clayamulet
	name = "porcelain amulet"
	result = list(/obj/item/natural/clay/rawamulet)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/claycirclet
	name = "porcelain circlet"
	result = list(/obj/item/natural/clay/rawcirclet)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/clayobelisk
	name = "porcelain obelisk"
	result = list(/obj/item/natural/clay/rawobelisk)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/claycomb
	name = "porcelain comb"
	result = list(/obj/item/natural/clay/rawcomb)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/clayheart
	name = "porcelain heart"
	result = list(/obj/item/natural/clay/rawheart)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/clayurn
	name = "porcelain urn"
	result = list(/obj/item/natural/clay/rawurn)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ceramics/portable_hookah
	name = "portable hookah"
	result = list(/obj/item/portable_hookah)
	reqs = list(
	/obj/item/natural/hide/cured = 1,
	/obj/item/natural/clay = 2,
	/obj/item/candle/yellow = 1
	)
	craftdiff = 3

/* 4 diff */

/datum/crafting_recipe/roguetown/ceramics/claystatuette
	name = "porcelain statuette"
	result = list(/obj/item/natural/clay/rawstatuette)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/clayfigurine
	name = "porcelain figurine"
	result = list(/obj/item/natural/clay/rawfigurine)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/clayturtle
	name = "porcelain turtle statuette"
	result = list(/obj/item/natural/clay/rawturtle)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/clayduck
	name = "porcelain duck figurine"
	result = list(/obj/item/natural/clay/rawduck)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/clayfish
	name = "porcelain fish figurine"
	result = list(/obj/item/natural/clay/rawfish)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/claysun
	name = "porcelain sun"
	result = list(/obj/item/natural/clay/rawsun)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/claymoon
	name = "porcelain moon"
	result = list(/obj/item/natural/clay/rawmoon)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/claybust
	name = "porcelain bust"
	result = list(/obj/item/natural/clay/rawbust)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/glass/bottles
	name = "glass bottle (x2)"
	result = list(
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/glass/bottle
		)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/glass/alchemicalbottles
	name = "glass alchemical vials (x6)"
	result = list(
		/obj/item/reagent_containers/glass/bottle/alchemical,
		/obj/item/reagent_containers/glass/bottle/alchemical,
		/obj/item/reagent_containers/glass/bottle/alchemical,
		/obj/item/reagent_containers/glass/bottle/alchemical,
		/obj/item/reagent_containers/glass/bottle/alchemical,
		/obj/item/reagent_containers/glass/bottle/alchemical
		)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/glass/cups
	name = "glass goblet (x3)"
	result = list(
		/obj/item/reagent_containers/glass/cup/glass,
		/obj/item/reagent_containers/glass/cup/glass,
		/obj/item/reagent_containers/glass/cup/glass
		)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/glass/cups
	name = "glass flute (x3)"
	result = list(
		/obj/item/reagent_containers/glass/cup/glass/flute,
		/obj/item/reagent_containers/glass/cup/glass/flute,
		/obj/item/reagent_containers/glass/cup/glass/flute
		)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/glass/smallcups
	name = "glass cup (x3)"
	result = list(
		/obj/item/reagent_containers/glass/cup/glass/small,
		/obj/item/reagent_containers/glass/cup/glass/small,
		/obj/item/reagent_containers/glass/cup/glass/small
		)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/ceramics/glass/carafe
	name = "glass carafe"
	result = list(/obj/item/reagent_containers/glass/carafe/glass)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 4

/* 5 diff */

/datum/crafting_recipe/roguetown/ceramics/claygoblet
	name = "fancy porcelain goblet"
	result = list(/obj/item/natural/clay/rawcupfancy)
	reqs = list(/obj/item/natural/clay/refined = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/ceramics/glass/statueany
	name = "glass statue (any design)" //CC Edit
	result = list(/obj/item/roguestatue/glass)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/ceramics/glass/statue1
	name = "glass statue (style I)"
	result = list(/obj/item/roguestatue/glass/design1)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/ceramics/glass/statue2
	name = "glass statue (style II)"
	result = list(/obj/item/roguestatue/glass/design2)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/ceramics/glass/statue3
	name = "glass statue (style III)"
	result = list(/obj/item/roguestatue/glass/design3)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/ceramics/glass/statue4
	name = "glass statue (style IV)"
	result = list(/obj/item/roguestatue/glass/design4)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/ceramics/glass/statue5
	name = "glass statue (style V)"
	result = list(/obj/item/roguestatue/glass/design5)
	reqs = list(/obj/item/natural/glassbatch = 1)
	craftdiff = 5
// Caustic Edit End

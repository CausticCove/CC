// File for all cooked seafood meals, not including those that count as pastries.

/*........... Pepperfilet */
/obj/item/reagent_containers/food/snacks/rogue/pepperfish
	cuisine = CUISINE_RANESHENI
	dish_type = DISH_SEAFOOD
	name = "pepperfilet"
	desc = "Roasted fish flipped against itself and coated in pepper."
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "pepperfish"
	tastes = list("warm fish" = 1, "pepper" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = MEATSLAB_NUTRITION)
	faretype = FARE_FINE
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	//CC Edit Begin
	foodtype = MEAT
	//CC Edit End


/* salmon st dendor*/
/obj/item/reagent_containers/food/snacks/rogue/dendorsalmon
	cuisine = CUISINE_SOUTH_IMPERIAL|CUISINE_OTAVAIS
	dish_type = DISH_SEAFOOD | DISH_VEGETABLE
	name = "saint dendor's salmon"
	desc = "A dish invented in Otava, of a green sauce of fat and herbs atop salmon."
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "salmon_st_columbia"
	tastes = list("warm fish" = 1, "fatty herbaceousness" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = NUTRITION_MEAL_AND_HALF)
	faretype = FARE_FINE
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	//CC Edit Begin
	foodtype = MEAT | VEGETABLES
	//CC Edit End


/* salmon wit the berry on it */
/obj/item/reagent_containers/food/snacks/rogue/berrysalmon
	cuisine = CUISINE_SOUTH_IMPERIAL
	dish_type = DISH_SEAFOOD | DISH_FRUIT
	name = "berrymash salmon"
	desc = "A dish of jacksberries mashed atop peppered salmon. Hearty."
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "salmon_berry"
	tastes = list("peppered fish" = 1, "fruity lightness" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = NUTRITION_MEAL_AND_HALF)
	faretype = FARE_FINE
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	//CC Edit Begin
	foodtype = MEAT | FRUIT
	//CC Edit End


/* lobsta with the pepper all over it*/
/obj/item/reagent_containers/food/snacks/rogue/pepperlobsta
	cuisine = CUISINE_SOUTH_IMPERIAL|CUISINE_OTAVAIS
	dish_type = DISH_SEAFOOD
	name = "peppertail"
	desc = "A sprinkle of pepper atop the tail of a cretinous beast, meant to make it palatable for more than peasantry."
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "pepper_tail"
	tastes = list("peppered crustacean" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = NUTRITION_MEAL_AND_QUARTER)
	faretype = FARE_NEUTRAL
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	//CC Edit Begin
	foodtype = MEAT
	//CC Edit End


/*garlick seabass*/
/obj/item/reagent_containers/food/snacks/rogue/garlickbass
	cuisine = CUISINE_SOUTH_IMPERIAL|CUISINE_OTAVAIS
	dish_type = DISH_SEAFOOD | DISH_VEGETABLE
	name = "garlicked seabass"
	desc = "Seabass, with cloves of garlick smothered onto it. Delicious."
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "garlick_seabass"
	tastes = list("pungent aromatics" = 1, "flaky fish goodness" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = NUTRITION_MEAL_AND_HALF)
	faretype = FARE_NEUTRAL
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	//CC Edit Begin
	foodtype = MEAT | VEGETABLES
	//CC Edit End


/*milk clam*/
/obj/item/reagent_containers/food/snacks/rogue/milkclam
	cuisine = CUISINE_SOUTH_IMPERIAL|CUISINE_OTAVAIS
	dish_type = DISH_SEAFOOD | DISH_DAIRY
	name = "milkclams"
	desc = "Clams, simmered in milk... How queer."
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "milk_clams"
	tastes = list("milky crustacean" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = NUTRITION_MEAL_AND_HALF)
	faretype = FARE_FINE
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	//CC Edit Begin
	foodtype = MEAT | DAIRY
	//CC Edit End


/*ale cod*/
/obj/item/reagent_containers/food/snacks/rogue/alecod
	cuisine = CUISINE_SOUTH_IMPERIAL|CUISINE_NORTHERN
	dish_type = DISH_SEAFOOD
	name = "alecod"
	desc = "Cod with ale poured over it right after cooking. A... choice pick."
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "ale_cod"
	tastes = list("flaky ale-soaked fish" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = NUTRITION_MEAL_AND_HALF)
	faretype = FARE_NEUTRAL
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	//CC Edit Begin
	foodtype = MEAT
	//CC Edit End


/*onion plaice*/
/obj/item/reagent_containers/food/snacks/rogue/onionplaice
	cuisine = CUISINE_SOUTH_IMPERIAL
	dish_type = DISH_SEAFOOD | DISH_VEGETABLE
	name = "plaice with onion"
	desc = "A slab of plaice with fried onion. Delicious!"
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "onion_plaice"
	tastes = list("oniony fish" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = NUTRITION_MEAL_AND_HALF)
	faretype = FARE_FINE
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	//CC Edit Begin
	foodtype = MEAT | VEGETABLES
	//CC Edit End


/*buttery soles*/
/obj/item/reagent_containers/food/snacks/rogue/buttersole
	cuisine = CUISINE_SOUTH_IMPERIAL|CUISINE_OTAVAIS
	dish_type = DISH_SEAFOOD
	name = "buttered sole"
	desc = "A slab of sole, buttered and crispy at the edges."
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "butter_sole"
	tastes = list("fatty fish" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = NUTRITION_MEAL_AND_HALF)
	faretype = FARE_POOR
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	//CC Edit Begin
	foodtype = MEAT | DAIRY
	//CC Edit End


/*jellied eel*/
/obj/item/reagent_containers/food/snacks/rogue/jelliedeel
	cuisine = CUISINE_SOUTH_IMPERIAL
	dish_type = DISH_SEAFOOD
	name = "jellied eel"
	desc = "Jellied eel! Eel in jelly made of eel! By the ten!"
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "jellied_eel"
	tastes = list("slimy, slippery fish" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = NUTRITION_MEAL_AND_QUARTER)
	faretype = FARE_LAVISH
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	//CC Edit Begin
	foodtype = MEAT
	//CC Edit End

/* ............ Shellfish ................... */
/obj/item/reagent_containers/food/snacks/rogue/fryfish/lobster/meal
	cuisine = CUISINE_SOUTH_IMPERIAL|CUISINE_OTAVAIS
	name = "buttered lobster"
	desc = "A lobster, covered in butter. Delicious!"
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "lobster_meal"
	tastes = list("lobster" = 1, "butter" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = NUTRITION_MEAL_AND_HALF)
	faretype = FARE_FINE // Idc lobster is not considered fine dining back then it is now since it use butter + rare fish.
	portable = FALSE
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/mealbuff
	//CC Edit Begin
	dish_type = DISH_SEAFOOD | DISH_DAIRY
	foodtype = MEAT | DAIRY
	//CC Edit End
// Close enough crab cake has two steps but it is a whatever

/obj/item/reagent_containers/food/snacks/rogue/crabcake
	cuisine = CUISINE_SOUTH_IMPERIAL
	dish_type = DISH_SEAFOOD | DISH_BREAD
	name = "crab cake"
	desc = "A variant of the handpie filled with buttery, savory shellfish meat and made with a buttered slice of dough."
	icon = 'modular/Neu_Food/icons/cooked/cooked_seafood_meal.dmi'
	icon_state = "crab_cake"
	eat_effect = /datum/status_effect/buff/greatmealbuff
	bitesize = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = SMALLDOUGH_NUTRITION + MEATSLAB_NUTRITION)
	tastes = list("crispy butterdough and shellfish meat" = 1)
	faretype = FARE_LAVISH
	rotprocess = null
	dropshrink = 0.8
	//CC Edit Begin
	foodtype = MEAT | GRAIN
	//CC Edit End

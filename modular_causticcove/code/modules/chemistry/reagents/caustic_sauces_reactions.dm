//Basically all the sauce recipies + reagent reactions to make sauces and stocks. Chemical reactions, ratios, etc etc.
// --- Base Components ---
/datum/container_craft/cooking/sauce
	abstract_type = /datum/container_craft/cooking/sauce
	//reagent_requirements = list( //This is only here as an example! This is what the base container_craft/cooking has, but can and should be modified for each sauce recipe!
	//	/datum/reagent/water = STEW_WATER_REQUIRED
	//)

/datum/container_craft/cooking/sauce/chicken_broth
	name = "Chicken Broth"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/rogue/meat/mince/poultry = 1)
	created_reagent = /datum/reagent/consumable/soup/chicken_broth
	reagent_requirements = list(
		/datum/reagent/consumable/soup/bone_broth = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/meat_broth
	name = "Meat Broth"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 1)
	created_reagent = /datum/reagent/consumable/soup/meat_broth
	reagent_requirements = list(
		/datum/reagent/consumable/soup/bone_broth = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/melted_sugar
	name = "Melted Sugar"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/sugar = 1)
	created_reagent = /datum/reagent/consumable/soup/melted_sugar
//	water_conversion = 6 //This will multiply the reagent requirements (5 water) by 6 to give 30 units of melted sugar output
	reagent_requirements = list(
		/datum/reagent/water = STEW_WATER_REQUIRED
	)

/datum/chemical_reaction/mix_tomato_sauce //for fantasy italian cooking
	name = "mix tomato sauce"
	id = /datum/reagent/consumable/sauce/tomato_sauce
	results = list(/datum/reagent/consumable/sauce/tomato_sauce = 1)
	required_reagents = list(/datum/reagent/consumable/soup/stew/chicken = 1, /datum/reagent/consumable/soup/stew/tomato_soup = 1)
	required_temp = 350


// --- GRENZELHOFT SAUCES (ALL SAVORY!!!) ---
//jagersosse
/datum/container_craft/cooking/sauce/jagersosse
	name = "Jagersosse"
	wildcard_requirements = list(/obj/item/alch/calendula = 1)
	created_reagent = /datum/reagent/consumable/sauce/jagersosse
	reagent_requirements = list(
		/datum/reagent/consumable/oil/tallow = STEW_WATER_REQUIRED
	)

//bierrettichsosse
/datum/container_craft/cooking/sauce/bierrettichsosse
	name = "Bierrettichsosse"
	wildcard_requirements = list(/obj/item/alch/calendula = 1)
	created_reagent = /datum/reagent/consumable/sauce/bierrettichsosse
	reagent_requirements = list(
		/datum/reagent/consumable/sauce/landsknechtsosse = STEW_WATER_REQUIRED
	)

//kartoffelsosse - finished
/datum/container_craft/cooking/sauce/kartoffelsosse
	name = "Kartoffelsosse"
	wildcard_requirements = list(/obj/item/alch/calendula = 1)
	created_reagent = /datum/reagent/consumable/sauce/kartoffelsosse
	reagent_requirements = list(
		/datum/reagent/consumable/sauce/pre_kartoffelsosse = STEW_WATER_REQUIRED
	)

//grenzernitzelsosse
/datum/container_craft/cooking/sauce/pre_grenzernitzelsosse_2
	name = "thick gravy mixture (grenzernitzelsosse)"
	wildcard_requirements = list(/obj/item/reagent_containers/powder/flour = 1)
	created_reagent = /datum/reagent/consumable/sauce/pre_grenzernitzelsosse_2
	reagent_requirements = list(
		/datum/reagent/consumable/sauce/pre_grenzernitzelsosse = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/grenzernitzelsosse
	name = "Grenzernitzelsosse"
	wildcard_requirements = list(/obj/item/alch/calendula = 1)
	created_reagent = /datum/reagent/consumable/sauce/grenzernitzelsosse
	reagent_requirements = list(
		/datum/reagent/consumable/sauce/pre_grenzernitzelsosse_2 = STEW_WATER_REQUIRED
	)

//Grenzel Reactions
//landsknechtsosse
/datum/chemical_reaction/beer_to_landsknechtsosse //cooking beer cooks it
	name = "beer to landsknechtsosse"
	id = /datum/reagent/consumable/sauce/landsknechtsosse
	results = list(/datum/reagent/consumable/sauce/landsknechtsosse = 1)
	required_reagents = list(/datum/reagent/consumable/ethanol/beer = 1)
	required_temp = 350

//kartoffelsosse
/datum/chemical_reaction/pre_kartoffelsosse //2 step process to make harder sauces
	name = "gravy mixture (kartoffelsosse)"
	id = /datum/reagent/consumable/sauce/pre_kartoffelsosse
	results = list(/datum/reagent/consumable/sauce/pre_kartoffelsosse = 1)
	required_reagents = list(/datum/reagent/consumable/oil/tallow = 1, /datum/reagent/consumable/sauce/landsknechtsosse = 1)
	required_temp = 350

//grenzernitzelsosse
/datum/chemical_reaction/pre_grenzernitzelsosse //3 step process to make the best sauces
	name = "gravy mixture (grenzernitzelsosse)"
	id = /datum/reagent/consumable/sauce/pre_grenzernitzelsosse
	results = list(/datum/reagent/consumable/sauce/pre_grenzernitzelsosse = 1)
	required_reagents = list(/datum/reagent/consumable/oil/tallow = 1, /datum/reagent/consumable/ethanol/cider = 1)
	required_temp = 350


// --- ETRUSCAN SAUCES (ALL SPICY!!!) ---
//Tarassaco di Oglio
/datum/container_craft/cooking/sauce/tarassaco
	name = "Tarassaco di Oglio"
	wildcard_requirements = list(/obj/item/alch/taraxacum = 1)
	created_reagent = /datum/reagent/consumable/sauce/tarassaco
	reagent_requirements = list(
		/datum/reagent/consumable/oil/tallow = STEW_WATER_REQUIRED
	)

//Zalsa alla Zegezta
/datum/container_craft/cooking/sauce/zalsa
	name = "Zalsa alla Zegezta"
	wildcard_requirements = list(/obj/item/alch/taraxacum = 1)
	created_reagent = /datum/reagent/consumable/sauce/zalsa
	reagent_requirements = list(
		/datum/reagent/consumable/sauce/tomato_sauce = STEW_WATER_REQUIRED
	)

//Zalsa alla Zancle
/datum/container_craft/cooking/sauce/zalsa_zancle
	name = "Zalsa alla Zancle"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/rogue/veg/garlick_clove = 1)
	created_reagent = /datum/reagent/consumable/sauce/zalsa_zancle
	reagent_requirements = list(
		/datum/reagent/consumable/sauce/zalsa = STEW_WATER_REQUIRED
	)

//Zalsa alla Zelinunte
/datum/container_craft/cooking/sauce/zalsa_zelinunte
	name = "Zalsa alla Zelinunte"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/rogue/veg/onion_sliced = 1)
	created_reagent = /datum/reagent/consumable/sauce/zalsa_zelinunte
	reagent_requirements = list(
		/datum/reagent/consumable/sauce/zalsa_zancle = STEW_WATER_REQUIRED
	)


// --- Otavan (All sweet) ---
//PRESERVES PREPARATION
/datum/container_craft/cooking/sauce/apple_confiture
	name = "Apple Confiture"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/apple = 1)
	created_reagent = /datum/reagent/consumable/sauce/apple_confiture
	reagent_requirements = list(
		/datum/reagent/consumable/soup/melted_sugar = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/pear_confiture
	name = "Pear Confiture"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/pear = 1)
	created_reagent = /datum/reagent/consumable/sauce/pear_confiture
	reagent_requirements = list(
		/datum/reagent/consumable/soup/melted_sugar = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/lemon_confiture
	name = "Lemon Confiture"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lemon = 1)
	created_reagent = /datum/reagent/consumable/sauce/lemon_confiture
	reagent_requirements = list(
		/datum/reagent/consumable/soup/melted_sugar = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/lime_confiture
	name = "Lime Confiture"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lime = 1)
	created_reagent = /datum/reagent/consumable/sauce/lime_confiture
	reagent_requirements = list(
		/datum/reagent/consumable/soup/melted_sugar = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/tangerine_confiture
	name = "Tangerine Confiture"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/tangerine = 1)
	created_reagent = /datum/reagent/consumable/sauce/tangerine_confiture
	reagent_requirements = list(
		/datum/reagent/consumable/soup/melted_sugar = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/plum_confiture
	name = "Plum Confiture"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/plum = 1)
	created_reagent = /datum/reagent/consumable/sauce/plum_confiture
	reagent_requirements = list(
		/datum/reagent/consumable/soup/melted_sugar = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/strawberry_confiture
	name = "Strawberry Confiture"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/strawberry = 1)
	created_reagent = /datum/reagent/consumable/sauce/strawberry_confiture
	reagent_requirements = list(
		/datum/reagent/consumable/soup/melted_sugar = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/blackberry_confiture
	name = "Blackberry Confiture"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/blackberry = 1)
	created_reagent = /datum/reagent/consumable/sauce/blackberry_confiture
	reagent_requirements = list(
		/datum/reagent/consumable/soup/melted_sugar = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/raspberry_confiture
	name = "Raspberry Confiture"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/raspberry = 1)
	created_reagent = /datum/reagent/consumable/sauce/raspberry_confiture
	reagent_requirements = list(
		/datum/reagent/consumable/soup/melted_sugar = STEW_WATER_REQUIRED
	)

//JAM FERMENTING T2 SWEET SAUCES
/datum/brewing_recipe/apple_jam
	name = "Apple Jam"
	category = "Other"
	bottle_name = "apple jam"
	bottle_desc = "A container of locally preserved apples."
	reagent_to_brew = /datum/reagent/consumable/sauce/apple_jam
	needed_reagents = list(/datum/reagent/consumable/sauce/apple_confiture = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/sugar = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/pear_jam
	name = "Pear Jam"
	category = "Other"
	bottle_name = "pear jam"
	bottle_desc = "A container of locally preserved pears."
	reagent_to_brew = /datum/reagent/consumable/sauce/pear_jam
	needed_reagents = list(/datum/reagent/consumable/sauce/pear_confiture = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/sugar = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/lemon_jam
	name = "Lemon Jam"
	category = "Other"
	bottle_name = "lemon jam"
	bottle_desc = "A container of locally preserved lemons."
	reagent_to_brew = /datum/reagent/consumable/sauce/lemon_jam
	needed_reagents = list(/datum/reagent/consumable/sauce/lemon_confiture = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/sugar = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/lime_jam
	name = "Lime Jam"
	category = "Other"
	bottle_name = "lime jam"
	bottle_desc = "A container of locally preserved limes."
	reagent_to_brew = /datum/reagent/consumable/sauce/lime_jam
	needed_reagents = list(/datum/reagent/consumable/sauce/lime_confiture = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/sugar = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/tangerine_jam
	name = "Tangerine Jam"
	category = "Other"
	bottle_name = "tangerine jam"
	bottle_desc = "A container of locally preserved tangerines."
	reagent_to_brew = /datum/reagent/consumable/sauce/tangerine_jam
	needed_reagents = list(/datum/reagent/consumable/sauce/tangerine_confiture = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/sugar = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/plum_jam
	name = "Plum Jam"
	category = "Other"
	bottle_name = "tangerine jam"
	bottle_desc = "A container of locally preserved plums."
	reagent_to_brew = /datum/reagent/consumable/sauce/plum_jam
	needed_reagents = list(/datum/reagent/consumable/sauce/plum_confiture = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/sugar = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/strawberry_jam
	name = "Strawberry Jam"
	category = "Other"
	bottle_name = "strawberry jam"
	bottle_desc = "A container of locally preserved strawberries."
	reagent_to_brew = /datum/reagent/consumable/sauce/strawberry_jam
	needed_reagents = list(/datum/reagent/consumable/sauce/strawberry_confiture = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/sugar = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/blackberry_jam
	name = "Blackberry Jam"
	category = "Other"
	bottle_name = "blackberry jam"
	bottle_desc = "A container of locally preserved minty blackberries."
	reagent_to_brew = /datum/reagent/consumable/sauce/blackberry_jam
	needed_reagents = list(/datum/reagent/consumable/sauce/blackberry_confiture = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/sugar = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/raspberry_jam
	name = "Raspberry Jam"
	category = "Other"
	bottle_name = "raspberry jam"
	bottle_desc = "A container of locally preserved raspberries."
	reagent_to_brew = /datum/reagent/consumable/sauce/raspberry_jam
	needed_reagents = list(/datum/reagent/consumable/sauce/raspberry_confiture = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/sugar = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

//T3 otavan sauces: better jams!
/datum/brewing_recipe/apple_moutarde
	name = "Apple Moutarde"
	category = "Other"
	bottle_name = "apple moutarde"
	bottle_desc = "A container of locally preserved minty apples."
	reagent_to_brew = /datum/reagent/consumable/sauce/apple_moutarde
	needed_reagents = list(/datum/reagent/consumable/sauce/apple_jam = 100)
	needed_items = list(/obj/item/alch/mentha = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/pear_moutarde
	name = "Pear Moutarde"
	category = "Other"
	bottle_name = "pear jam"
	bottle_desc = "A container of locally preserved minty pears."
	reagent_to_brew = /datum/reagent/consumable/sauce/pear_moutarde
	needed_reagents = list(/datum/reagent/consumable/sauce/pear_jam = 100)
	needed_items = list(/obj/item/alch/mentha = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/lemon_moutarde
	name = "Lemon Moutarde"
	category = "Other"
	bottle_name = "lemon moutarde"
	bottle_desc = "A container of locally preserved minty lemons."
	reagent_to_brew = /datum/reagent/consumable/sauce/lemon_moutarde
	needed_reagents = list(/datum/reagent/consumable/sauce/lemon_jam = 100)
	needed_items = list(/obj/item/alch/mentha = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/lime_moutarde
	name = "Lime Moutarde"
	category = "Other"
	bottle_name = "lime moutarde"
	bottle_desc = "A container of locally preserved minty limes."
	reagent_to_brew = /datum/reagent/consumable/sauce/lime_moutarde
	needed_reagents = list(/datum/reagent/consumable/sauce/lime_jam = 100)
	needed_items = list(/obj/item/alch/mentha = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/tangerine_moutarde
	name = "Tangerine Moutarde"
	category = "Other"
	bottle_name = "tangerine moutarde"
	bottle_desc = "A container of locally preserved minty tangerines."
	reagent_to_brew = /datum/reagent/consumable/sauce/tangerine_moutarde
	needed_reagents = list(/datum/reagent/consumable/sauce/tangerine_jam = 100)
	needed_items = list(/obj/item/alch/mentha = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/plum_moutarde
	name = "Plum Moutarde"
	category = "Other"
	bottle_name = "tangerine moutarde"
	bottle_desc = "A container of locally preserved minty plums."
	reagent_to_brew = /datum/reagent/consumable/sauce/plum_moutarde
	needed_reagents = list(/datum/reagent/consumable/sauce/plum_jam = 100)
	needed_items = list(/obj/item/alch/mentha = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/strawberry_moutarde
	name = "Strawberry Moutarde"
	category = "Other"
	bottle_name = "strawberry moutarde"
	bottle_desc = "A container of locally preserved minty strawberries."
	reagent_to_brew = /datum/reagent/consumable/sauce/strawberry_moutarde
	needed_reagents = list(/datum/reagent/consumable/sauce/strawberry_jam = 100)
	needed_items = list(/obj/item/alch/mentha = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/blackberry_moutarde
	name = "Blackberry Moutarde"
	category = "Other"
	bottle_name = "blackberry moutarde"
	bottle_desc = "A container of locally preserved minty blackberries."
	reagent_to_brew = /datum/reagent/consumable/sauce/blackberry_moutarde
	needed_reagents = list(/datum/reagent/consumable/sauce/blackberry_jam = 100)
	needed_items = list(/obj/item/alch/mentha = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/raspberry_moutarde
	name = "Raspberry Moutarde"
	category = "Other"
	bottle_name = "raspberry moutarde"
	bottle_desc = "A container of locally preserved raspberries."
	reagent_to_brew = /datum/reagent/consumable/sauce/raspberry_moutarde
	needed_reagents = list(/datum/reagent/consumable/sauce/raspberry_jam = 100)
	needed_items = list(/obj/item/alch/mentha = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

//T4 Otavan Sauces: Insert honey
/datum/brewing_recipe/apple_etruscole
	name = "Apple Etruscole"
	category = "Other"
	bottle_name = "apple etruscole"
	bottle_desc = "A container of locally preserved apples."
	reagent_to_brew = /datum/reagent/consumable/sauce/apple_etruscole
	needed_reagents = list(/datum/reagent/consumable/sauce/apple_moutarde = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/rogue/honey = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/pear_etruscole
	name = "Pear Etruscole"
	category = "Other"
	bottle_name = "pear etruscole"
	bottle_desc = "A container of locally preserved pears."
	reagent_to_brew = /datum/reagent/consumable/sauce/pear_etruscole
	needed_reagents = list(/datum/reagent/consumable/sauce/pear_moutarde = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/rogue/honey = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/lemon_etruscole
	name = "Lemon Etruscole"
	category = "Other"
	bottle_name = "lemon etruscole"
	bottle_desc = "A container of locally preserved lemons."
	reagent_to_brew = /datum/reagent/consumable/sauce/lemon_etruscole
	needed_reagents = list(/datum/reagent/consumable/sauce/lemon_moutarde = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/rogue/honey = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/lime_etruscole
	name = "Lime Etruscole"
	category = "Other"
	bottle_name = "lime etruscole"
	bottle_desc = "A container of locally preserved limes."
	reagent_to_brew = /datum/reagent/consumable/sauce/lime_etruscole
	needed_reagents = list(/datum/reagent/consumable/sauce/lime_moutarde = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/rogue/honey = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/tangerine_etruscole
	name = "Tangerine Etruscole"
	category = "Other"
	bottle_name = "tangerine etruscole"
	bottle_desc = "A container of locally preserved tangerines."
	reagent_to_brew = /datum/reagent/consumable/sauce/tangerine_etruscole
	needed_reagents = list(/datum/reagent/consumable/sauce/tangerine_moutarde = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/rogue/honey = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/plum_etruscole
	name = "Plum Etruscole"
	category = "Other"
	bottle_name = "tangerine etruscole"
	bottle_desc = "A container of locally preserved plums."
	reagent_to_brew = /datum/reagent/consumable/sauce/plum_etruscole
	needed_reagents = list(/datum/reagent/consumable/sauce/plum_moutarde = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/rogue/honey = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/strawberry_etruscole
	name = "Strawberry Etruscole"
	category = "Other"
	bottle_name = "strawberry etruscole"
	bottle_desc = "A container of locally preserved strawberries."
	reagent_to_brew = /datum/reagent/consumable/sauce/strawberry_etruscole
	needed_reagents = list(/datum/reagent/consumable/sauce/strawberry_moutarde = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/rogue/honey = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/blackberry_etruscole
	name = "Blackberry Etruscole"
	category = "Other"
	bottle_name = "blackberry etruscole"
	bottle_desc = "A container of locally preserved blackberries."
	reagent_to_brew = /datum/reagent/consumable/sauce/blackberry_etruscole
	needed_reagents = list(/datum/reagent/consumable/sauce/blackberry_moutarde = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/rogue/honey = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/raspberry_etruscole
	name = "Raspberry Etruscole"
	category = "Other"
	bottle_name = "raspberry etruscole"
	bottle_desc = "A container of locally preserved raspberries."
	reagent_to_brew = /datum/reagent/consumable/sauce/raspberry_etruscole
	needed_reagents = list(/datum/reagent/consumable/sauce/raspberry_moutarde = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/rogue/honey = 2)
	brewed_amount = 2
	brew_time = 3 MINUTES
	sell_value = 50


// --- Aavnic (All sour) ---
//Sour cream (T1 Sour Sauce)
/datum/brewing_recipe/sour_cream
	name = "Sour Cream"
	category = "Other"
	bottle_name = "sour cream"
	bottle_desc = "A container of soured cream."
	reagent_to_brew = /datum/reagent/consumable/sauce/sour_cream
	needed_reagents = list(/datum/reagent/consumable/milk = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lime = 4)
	brewed_amount = 3
	brew_time = 3 MINUTES
	sell_value = 50

/datum/container_craft/cooking/sauce/raspberry_confiture
	name = "Raspberry Confiture"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/raspberry = 1)
	created_reagent = /datum/reagent/consumable/sauce/raspberry_confiture
	reagent_requirements = list(
		/datum/reagent/consumable/soup/melted_sugar = STEW_WATER_REQUIRED
	)

//Saiga's Bile (T2 Sour Sauce)
/datum/container_craft/cooking/sauce/saiga_bile_lime
	name = "Saiga's Bile (Lime)"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lime = 1)
	created_reagent = /datum/reagent/consumable/sauce/saiga_bile
	reagent_requirements = list(
		/datum/reagent/consumable/milk = STEW_WATER_REQUIRED
	)

/datum/container_craft/cooking/sauce/saiga_bile_lemon
	name = "Saiga's Bile (Lemon)"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lemon = 1)
	created_reagent = /datum/reagent/consumable/sauce/saiga_bile
	reagent_requirements = list(
		/datum/reagent/consumable/milk = STEW_WATER_REQUIRED
	)

//Saigazhuss (T3 Sour Sauce)
/datum/container_craft/cooking/sauce/saigazhuss
	name = "Saigazhuss"
	wildcard_requirements = list(/obj/item/alch/paris = 1)
	created_reagent = /datum/reagent/consumable/sauce/saigazhuss
	reagent_requirements = list(
		/datum/reagent/consumable/sauce/saiga_bile = STEW_WATER_REQUIRED
	)

//Ttekkemali (T4 Sour Sauce)
/datum/container_craft/cooking/sauce/ttekkemali
	name = "Ttekkemali"
	wildcard_requirements = list(/obj/item/reagent_containers/food/snacks/rogue/veg/garlick_clove = 1)
	created_reagent = /datum/reagent/consumable/sauce/ttekkemali
	reagent_requirements = list(
		/datum/reagent/consumable/sauce/saigazhuss = STEW_WATER_REQUIRED
	)


// --- Hammerholdian (High quality sauces, dwarves dont fuck with food, all T3s) ---
/datum/brewing_recipe/bronze_bullion
	name = "Bronze Bullion"
	category = "Other"
	bottle_name = "bronze bullion"
	bottle_desc = "A container of an especially spicy 'barbeque' sauce."
	reagent_to_brew = /datum/reagent/consumable/sauce/bronze_bullion
	needed_reagents = list(/datum/reagent/consumable/sugar/molasses = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/rogue/veg/garlick_clove = 3, /obj/item/alch/mentha = 1)
	brewed_amount = 3
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/dead_horse_sauce
	name = "Dead Horse Sauce"
	category = "Other"
	bottle_name = "dead horse sauce"
	bottle_desc = "A container of an especially sweet 'barbeque' sauce."
	reagent_to_brew = /datum/reagent/consumable/sauce/dead_horse_sauce
	needed_reagents = list(/datum/reagent/consumable/sugar/molasses = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/grown/fruit/tomato = 3, /obj/item/alch/mentha = 1)
	brewed_amount = 3
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/milk_of_quartz
	name = "Milk of Quartz"
	category = "Other"
	bottle_name = "milk of quartz"
	bottle_desc = "A container of an especially savory 'barbeque' sauce."
	reagent_to_brew = /datum/reagent/consumable/sauce/milk_of_quartz
	needed_reagents = list(/datum/reagent/consumable/sugar/molasses = 100, /datum/reagent/consumable/milk = 50)
	needed_items = list(/obj/item/alch/mentha = 1)
	brewed_amount = 3
	brew_time = 3 MINUTES
	sell_value = 50

/datum/brewing_recipe/native_lye
	name = "Native Lye"
	category = "Other"
	bottle_name = "milk of quartz"
	bottle_desc = "A container of an especially sour 'dressing' sauce."
	reagent_to_brew = /datum/reagent/consumable/sauce/native_lye
	needed_reagents = list(/datum/reagent/consumable/sugar/molasses = 100)
	needed_items = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lemon = 2, /obj/item/reagent_containers/food/snacks/rogue/veg/garlick_clove = 3, )
	brewed_amount = 3
	brew_time = 3 MINUTES
	sell_value = 50

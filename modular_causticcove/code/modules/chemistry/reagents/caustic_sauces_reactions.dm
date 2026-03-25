//Basically all the sauce recipies + reagent reactions to make sauces and stocks. Chemical reactions, ratios, etc etc.
#define STEW_COOKING_TIME 60 SECONDS
//MISC STUFF
/datum/chemical_reaction/water_boil_away //boiling water at too high a temp makes it POOF, useful for getting rid of it from other goodies
	name = "water boil away"
	id = /datum/reagent/water
	results = list(/datum/reagent/water = -1)
	required_reagents = list(/datum/reagent/water = 1)
	required_temp = 400

/datum/stew_recipe/bone_broth
	inputs = list(/obj/item/natural/bone)
	output = /datum/reagent/consumable/soup/bone_broth
	cooktime = STEW_COOKING_TIME //longer than the other drinks
	req_liquid = /datum/reagent/water

/datum/stew_recipe/chicken_broth
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/meat/mince/poultry)
	output = /datum/reagent/consumable/soup/chicken_broth
	cooktime = STEW_COOKING_TIME //longer than the other drinks
	req_liquid = /datum/reagent/consumable/soup/bone_broth

/datum/stew_recipe/meat_broth
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak)
	output = /datum/reagent/consumable/soup/meat_broth
	cooktime = STEW_COOKING_TIME //longer than the other drinks
	req_liquid = /datum/reagent/consumable/soup/bone_broth

/datum/chemical_reaction/mix_tomato_sauce //for fantasy italian cooking
	name = "mix tomato sauce"
	id = /datum/reagent/consumable/sauce/tomato_sauce
	results = list(/datum/reagent/consumable/sauce/tomato_sauce = 1)
	required_reagents = list(/datum/reagent/consumable/soup/stew/chicken = 1, /datum/reagent/consumable/soup/stew/tomato_soup = 1)
	required_temp = 350

/datum/stew_recipe/melted_sugar
	inputs = list(/obj/item/reagent_containers/food/snacks/sugar)
	output = /datum/reagent/consumable/soup/melted_sugar
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/water

//GRENZELHOFT SAUCES (ALL SAVORY!!!)
//landsknechtsosse
/datum/chemical_reaction/beer_to_landsknechtsosse //cooking beer cooks it
	name = "beer to landsknechtsosse"
	id = /datum/reagent/consumable/sauce/landsknechtsosse
	results = list(/datum/reagent/consumable/sauce/landsknechtsosse = 1)
	required_reagents = list(/datum/reagent/consumable/ethanol/beer = 1)
	required_temp = 350

//jagersosse
/datum/stew_recipe/jagersosse
	inputs = list(/obj/item/alch/taraxacum)
	output = /datum/reagent/consumable/sauce/jagersosse
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/oil/tallow

//bierrettichsosse
/datum/stew_recipe/bierrettichsosse
	inputs = list(/obj/item/alch/calendula)
	output = /datum/reagent/consumable/sauce/bierrettichsosse
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/sauce/landsknechtsosse

//kartoffelsosse
/datum/chemical_reaction/pre_kartoffelsosse //2 step process to make harder sauces
	name = "gravy mixture"
	id = /datum/reagent/consumable/sauce/pre_kartoffelsosse
	results = list(/datum/reagent/consumable/sauce/pre_kartoffelsosse = 1)
	required_reagents = list(/datum/reagent/consumable/oil/tallow = 1, /datum/reagent/consumable/sauce/landsknechtsosse = 1)
	required_temp = 350

/datum/stew_recipe/kartoffelsosse
	inputs = list(/obj/item/alch/calendula)
	output = /datum/reagent/consumable/sauce/kartoffelsosse
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/sauce/pre_kartoffelsosse

//grenzernitzelsosse
/datum/chemical_reaction/pre_grenzernitzelsosse //3 step process to make the best sauces
	name = "gravy mixture"
	id = /datum/reagent/consumable/sauce/pre_grenzernitzelsosse
	results = list(/datum/reagent/consumable/sauce/pre_grenzernitzelsosse = 1)
	required_reagents = list(/datum/reagent/consumable/oil/tallow = 1, /datum/reagent/consumable/ethanol/cider = 1)
	required_temp = 350

/datum/stew_recipe/pre_grenzernitzelsosse_2
	inputs = list(/obj/item/reagent_containers/powder/flour)
	output = /datum/reagent/consumable/sauce/pre_grenzernitzelsosse_2
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/sauce/pre_grenzernitzelsosse

/datum/stew_recipe/grenzernitzelsosse
	inputs = list(/obj/item/alch/calendula)
	output = /datum/reagent/consumable/sauce/grenzernitzelsosse
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/sauce/pre_grenzernitzelsosse_2

//ETRUSCAN SAUCES (ALL SPICY!!!)
//Tarassaco di Oglio
/datum/stew_recipe/tarassaco
	inputs = list(/obj/item/alch/taraxacum)
	output = /datum/reagent/consumable/sauce/tarassaco
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/water

//Zalsa alla Zegezta
/datum/stew_recipe/zalsa
	inputs = list(/obj/item/alch/taraxacum)
	output = /datum/reagent/consumable/sauce/zalsa
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/sauce/tomato_sauce

//Zalsa alla Zancle
/datum/stew_recipe/zalsa_zancle
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/veg/garlick_clove)
	output = /datum/reagent/consumable/sauce/zalsa_zancle
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/sauce/zalsa

//Zalsa alla Zelinunte
/datum/stew_recipe/zalsa_zelinunte
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/veg/onion_sliced)
	output = /datum/reagent/consumable/sauce/zalsa_zelinunte
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/sauce/zalsa_zancle

//Otavan (All sweet)
//PRESERVES PREPARATION
/datum/stew_recipe/apple_confiture
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/apple)
	output = /datum/reagent/consumable/sauce/apple_confiture
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/soup/melted_sugar

/datum/stew_recipe/pear_confiture
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/pear)
	output = /datum/reagent/consumable/sauce/pear_confiture
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/soup/melted_sugar

/datum/stew_recipe/lemon_confiture
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lemon)
	output = /datum/reagent/consumable/sauce/lemon_confiture
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/soup/melted_sugar

/datum/stew_recipe/lime_confiture
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lime)
	output = /datum/reagent/consumable/sauce/lime_confiture
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/soup/melted_sugar

/datum/stew_recipe/tangerine_confiture
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/tangerine)
	output = /datum/reagent/consumable/sauce/tangerine_confiture
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/soup/melted_sugar

/datum/stew_recipe/plum_confiture
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/plum)
	output = /datum/reagent/consumable/sauce/plum_confiture
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/soup/melted_sugar

/datum/stew_recipe/strawberry_confiture
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/strawberry)
	output = /datum/reagent/consumable/sauce/strawberry_confiture
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/soup/melted_sugar

/datum/stew_recipe/blackberry_confiture
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/blackberry)
	output = /datum/reagent/consumable/sauce/blackberry_confiture
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/soup/melted_sugar
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

//Aavnic (All sour)

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

//Saiga's Bile (T2 Sour Sauce)
/datum/stew_recipe/saiga_bile_lime
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lime)
	output = /datum/reagent/consumable/sauce/saiga_bile
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/milk

/datum/stew_recipe/saiga_bile_lemon
	inputs = list(/obj/item/reagent_containers/food/snacks/grown/fruit/lemon)
	output = /datum/reagent/consumable/sauce/saiga_bile
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/milk

//Saigazhuss (T3 Sour Sauce)
/datum/stew_recipe/saigazhuss
	inputs = list(/obj/item/alch/paris)
	output = /datum/reagent/consumable/sauce/saigazhuss
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/sauce/saiga_bile

//Ttekkemali (T4 Sour Sauce)
/datum/stew_recipe/ttekkemali
	inputs = list(/obj/item/reagent_containers/food/snacks/rogue/veg/garlick_clove)
	output = /datum/reagent/consumable/sauce/ttekkemali
	cooktime = STEW_COOKING_TIME
	req_liquid = /datum/reagent/consumable/sauce/saigazhuss

//Hammerholdian (High quality sauces, dwarves dont fuck with food, all T3s)
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

#undef STEW_COOKING_TIME

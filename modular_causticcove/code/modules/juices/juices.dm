/datum/reagent/consumable/juice
	name = "joicue"
	description = "No?"
	metabolization_rate = 1
	nutriment_factor = 5
	taste_description = "Mia forgot to change something"

/datum/reagent/consumable/juice/on_mob_life(mob/living/carbon/M)
	M.reagents.add_reagent(/datum/reagent/water, 1)
	. = ..()

/datum/reagent/consumable/juice/jackberry
	name = "Jackberry juice"
	description = "A measure of produce juice"
	taste_description = "berry"
	//TODO Colour fuckery. For now just use a static one and nicely pretend they are all the same inside
	color = "#F1EBDB" //Using white grapes for now because why not


/datum/reagent/consumable/juice/jackberry/poisonous
	name = "Jackberry juice"
	description = "A measure of produce juice"
	taste_description = "bitterness"

/datum/reagent/consumeable/juice/apple
	name = "Apple juice"
	description = "A measure of produce juice"
	taste_description = "starchy apple"
	color = "#D7B086"

/datum/reagent/consumable/juice/tomato
	name = "Tomato juice"
	description = "A measure of produce juice"
	taste_description = "tomato"
	color = "#FF6347"

/datum/reagent/consumable/juice/strawberry
	name = "Strawberry juice"
	description = "A measure of produce juice"
	taste_description = "strawberry"
	color = "#FA5053"

/datum/reagent/consumable/juice/blackberry
	name = "Blackberry juice"
	description = "A measure of produce juice"
	taste_description = "blackberry"
	color = "#272C3F"

/datum/reagent/consumable/juice/raspberry
	name = "Raspberry juice"
	description = "A measure of produce juice"
	taste_description = "raspberry"
	color = "#A01600"

/datum/reagent/consumable/juice/pear
	name = "Pear juice"
	description = "A measure of produce juice"
	taste_description = "pear"
	color = "#D2B48C"

/datum/reagent/consumable/juice/lemon
	name = "Lemon juice"
	description = "Stories say that vermin folk do not understand the difference between lemon and lemon juice"
	taste_description = "lemon"
	color = "#FFFF00"

/datum/reagent/consumable/juice/lime
	name = "Lime juice"
	description = "A measure of produce juice"
	taste_description = "lime"
	color = "#00FF00"

/datum/reagent/consumable/juice/tangerine
	name = "Tangerine juice"
	description = "A measure of produce juice"
	taste_description = "tangerine"
	color = "#FFA500"

/datum/reagent/consumable/juice/plum
	name = "Plum juice"
	description = "A measure of produce juice"
	taste_description = "plum"
	color = "#8B008B"

/datum/reagent/consumable/juice/carrot
	name = "Cattor juice"
	description = "A measure of produce juice"
	taste_description = "carrot"
	color = "#ed9121"

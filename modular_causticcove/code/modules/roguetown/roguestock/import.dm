//So that folk can easily acquire ration papers en masse. It's hard to craft them otherwise and very tedious.
/datum/roguestock/import/rationpapers
	name = "Crate of Ration Papers"
	desc = "An imported Crate of (x10) Ration Papers, created by distant talented chefs. They are used to help keep food preserved forever."
	item_type = /obj/structure/closet/crate/chest/steward/rationpapers
	export_price = 300 //300 Price due to being a hard thing to create, and you get 10 of them.
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/rationpapers/Initialize()
	. = ..()
	new /obj/item/ration(src)
	new /obj/item/ration(src)
	new /obj/item/ration(src)
	new /obj/item/ration(src)
	new /obj/item/ration(src)
	new /obj/item/ration(src)
	new /obj/item/ration(src)
	new /obj/item/ration(src)
	new /obj/item/ration(src)
	new /obj/item/ration(src)

//Helps with followers of Noc specifically, these are also relatively tedious to craft. Great for anything else needing paper too.
/datum/roguestock/import/parchmentpapers
	name = "Crate of Parchment Papers"
	desc = "An imported Crate of (x15) Parchment Papers, for when you need to do a lot of writing and enscribing."
	item_type = /obj/structure/closet/crate/chest/steward/parchmentpapers
	export_price = 250 //You get 15 papers. Enough for 1 Noc revive, and plenty enough for anything else needing paper.
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/parchmentpapers/Initialize()
	. = ..()

	//Wall of paper text.
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)
	new /obj/item/paper(src)

//Commenting out in favor of merchant acquiring these things.

//Designed for rare/uncraftable items or items that are not able to be purchased at the merchant.
//These items are typically reserved for the keep, or for very rich folk wanting to put on a new fashion statement and/or trend.
/* /datum/roguestock/import/exoticclothes
	name = "Crate of Exotic Clothing"
	desc = "An imported Crate of Exotic Clothing, hand weaved by the finest tailors from across the lands."
	item_type = /obj/structure/closet/crate/chest/steward/exoticclothes
	export_price = 1000 //Beautiful, Expensive, limited to clothing that cannot be crafted by normal means or earned anywhere else.
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/exoticclothes/Initialize()
	. = ..()
	new /obj/item/clothing/cloak/matron(src)
	new /obj/item/clothing/cloak/tribal(src) //This also includes things that don't SEEM to be rare, but are in fact, rare as fuck. This doesn't exist anywhere else.
	new /obj/item/clothing/cloak/cape/blkknight(src)
	new /obj/item/clothing/cloak/tabard/blkknight(src)
	new /obj/item/clothing/suit/roguetown/shirt/robe/wizard(src) //Obtainable, but only by the court magos. Why not let others wear it?
 */

/datum/roguestock/import/marraigecrate
	name = "Crate of Marriage Necessities"
	desc = "An imported crate of goods for marraige! Includes 2 Gold Rings, 2 Apple Nut Cakes, and 3 Apfelweinheim Ciders!"
	item_type = /obj/structure/closet/crate/chest/steward/marraigecrate
	export_price = 1500 //We're married! Yes it cost us a fortune!
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/marraigecrate/Initialize()
	. = ..()
	new /obj/item/reagent_containers/food/snacks/grown/apple(src) //So the Bishop can actually marry the two.
	new /obj/item/clothing/ring/band/gold(src)
	new /obj/item/clothing/ring/band/gold(src)
	new /obj/item/reagent_containers/food/snacks/rogue/applenutcake(src)
	new /obj/item/reagent_containers/food/snacks/rogue/applenutcake(src)
	new /obj/item/reagent_containers/glass/bottle/rogue/beer/apfelweinheim(src)
	new /obj/item/reagent_containers/glass/bottle/rogue/beer/apfelweinheim(src)
	new /obj/item/reagent_containers/glass/bottle/rogue/beer/apfelweinheim(src)
	new /obj/item/reagent_containers/glass/bottle/rogue/beer/apfelweinheim(src)

/datum/roguestock/import/goldarmorcrate
	name = "Crate of Kingly Golden Armor"
	desc = "An imported Crate of Golden Armor, designed for a King! Features a partial set of Golden Armor, with Blacksteel added to fit any part not covered."
	item_type = /obj/structure/closet/crate/chest/steward/goldarmorcrate
	//Features Blacksteel and Gold armor. Very valuable. Should not be easily affordable by any typical means.
	export_price = 5000 //Doubled integrity for GOLDEN armor. Should be very, very valuable and only issued out to important folk for rare occasions. Not cost effective.
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/goldarmorcrate/Initialize()
	. = ..()
	new /obj/item/clothing/suit/roguetown/armor/plate/cuirass/fluted/gold/king(src) //Chestplate
	new /obj/item/clothing/mask/rogue/facemask/goldmask(src) //Mask
	new /obj/item/clothing/neck/roguetown/gorget/gold/king(src) //Gorget
	new /obj/item/clothing/wrists/roguetown/bracers/gold/king(src) //Bracers
	new /obj/item/clothing/under/roguetown/platelegs/blacksteel/modern(src) //Blacksteel Pants (no gold variant sorry)
	new /obj/item/clothing/gloves/roguetown/plate/blacksteel/modern(src) //Blacksteel Gloves (no gold variant sorry)
	new /obj/item/clothing/shoes/roguetown/boots/armor/gold/king(src) //Boots
	new /obj/item/clothing/head/roguetown/helmet/heavy/sheriff/gold/king(src) //Barbute Helm
	new /obj/item/clothing/head/roguetown/helmet/heavy/knight/gold/king(src) //Armet Helm


/datum/roguestock/import/ornatejewelry
	name = "Crate of Ornate Jewelry"
	desc = "An imported Crate of Orante Jewelry, containing a good mix of gold-plated items to make the rich look richer."
	item_type = /obj/structure/closet/crate/chest/steward/ornatejewelry
	export_price = 1500 //Cosmetic Jewelry, triumph jewelry, they do not have high sell prices.
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/ornatejewelry/Initialize()
	. = ..()
	//The sellprice of all of these combined will never reach enough income to provide meaningful impact. You lose more than you gain with these.
	new /obj/item/clothing/head/roguetown/circlet/triumph(src)
	new /obj/item/clothing/ring/gold/triumph(src)
	new /obj/item/clothing/neck/roguetown/ornateamulet/noble/triumph(src)
	new /obj/item/clothing/mask/rogue/lordmask/triumph(src)

/datum/roguestock/import/fishingbait
	name = "Crate of Rare Fishing Bait"
	desc = "An imported Crate of Rare Fishing Bait! Contains 10 Grubs, and 5 Leeches. Fishing Equipment not included."
	item_type = /obj/structure/closet/crate/chest/steward/fishingbait
	export_price = 175
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/fishingbait/Initialize()
	. = ..()
	//Why are grubs so rare! Woe! Box of grubs upon ye!
	//10 Grubs total.
	//5 Leeches total. (For when you need to spawn a creature in.)
	new /obj/item/natural/worms/grubs(src)
	new /obj/item/natural/worms/grubs(src)
	new /obj/item/natural/worms/grubs(src)
	new /obj/item/natural/worms/grubs(src)
	new /obj/item/natural/worms/grubs(src)
	new /obj/item/natural/worms/grubs(src)
	new /obj/item/natural/worms/grubs(src)
	new /obj/item/natural/worms/grubs(src)
	new /obj/item/natural/worms/grubs(src)
	new /obj/item/natural/worms/grubs(src)
	new /obj/item/natural/worms/leech(src)
	new /obj/item/natural/worms/leech(src)
	new /obj/item/natural/worms/leech(src)
	new /obj/item/natural/worms/leech(src)
	new /obj/item/natural/worms/leech(src)

//The fisherman gets bait, so does the hunter! Just so they don't have to grind a bunch of mammon for it.
/datum/roguestock/import/huntingbait
	name = "Crate of Hunting Bait"
	desc = "An imported Crate of Hunting Bait. Contains 7 Sweetbait, 3 bloodbait, for a total of 10 bait."
	item_type = /obj/structure/closet/crate/chest/steward/huntingbait
	export_price = 200
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/huntingbait/Initialize()
	. = ..()
	new /obj/item/bait/bloody(src)
	new /obj/item/bait/bloody(src)
	new /obj/item/bait/bloody(src)
	new /obj/item/bait/sweet(src)
	new /obj/item/bait/sweet(src)
	new /obj/item/bait/sweet(src)
	new /obj/item/bait/sweet(src)
	new /obj/item/bait/sweet(src)
	new /obj/item/bait/sweet(src)
	new /obj/item/bait/sweet(src)

//The fisherman gets bait, so does the hunter! Just so they don't have to grind a bunch of mammon for it.
/datum/roguestock/import/alchemyitems
	name = "Crate of Alchemy Ingredients"
	desc = "An imported Crate of Alchemy Ingredients. Contains various amounts of hard to obtain alchemy items for use in potion making!"
	item_type = /obj/structure/closet/crate/chest/steward/alchemyitems
	export_price = 500 //Contains a lot of valuable, hard to acquire ingredients that are not associated to plants or herbs.
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/alchemyitems/Initialize()
	. = ..()
	//Contains 2 items of each ingredient.
	//Holds a lot of rare items that are not easily accessible to specific healer/alchemical roles and are dependant on others.
	//Contains Sinew, Bones, Troll Horns, Silver Dust, Gold Dust, Pure Essentia, Feua Dust, and Alchemical Ozium, for a total of 16 alchemical ingredients.
	new /obj/item/alch/sinew(src)
	new /obj/item/alch/sinew(src)
	new /obj/item/alch/bone(src)
	new /obj/item/alch/bone(src)
	new /obj/item/alch/horn(src)
	new /obj/item/alch/horn(src)
	new /obj/item/alch/silverdust(src)
	new /obj/item/alch/silverdust(src)
	new /obj/item/alch/golddust(src)
	new /obj/item/alch/golddust(src)
	new /obj/item/alch/magicdust(src)
	new /obj/item/alch/magicdust(src)
	new /obj/item/alch/feaudust(src)
	new /obj/item/alch/feaudust(src)
	new /obj/item/alch/ozium(src)
	new /obj/item/alch/ozium(src)

//Farmers rejoice! Good fertilizer!
/datum/roguestock/import/farmfertilizer
	name = "Crate of Fertilizer"
	desc = "An imported Crate of Fertilizer. Used within farms to ensure high quality growth in soil!"
	item_type = /obj/structure/closet/crate/chest/steward/farmfertilizer
	export_price = 100 //Cheap to import, just ask the steward for some, they should easily be able to get ya some.
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/farmfertilizer/Initialize()
	. = ..()
	//Contains 20 fertilizer.
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)
	new /obj/item/fertilizer(src)


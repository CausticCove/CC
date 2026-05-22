
// Wild plants for gathering or decor. Sorting these by their plant_def.dm appearances


/obj/structure/flora/roguegrass/herb/wild
	name = "wild plant"
	desc = "Oh no! Something happened that shouldn't! Commit evil war crimes to the coders!"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "eggplant3"

// Cereals

/obj/structure/flora/roguegrass/herb/wild/wheat
	name = "wild wheat"
	desc = "Wild wheat. A staple cereal and quite possibly the most common farmed plant. Whether by wind or bird, its seeds have made their way here, growing amidst the weeds and grasses."
	icon_state = "wheat2"
	herbtype = /obj/item/natural/chaff/wheat

/obj/structure/flora/roguegrass/herb/wild/oats
	name = "wild oats"
	desc = "Wild oats. A common cereal, often grown as feed for saiga or swine."
	icon_state = "oat2"
	herbtype = /obj/item/natural/chaff/oat

/obj/structure/flora/roguegrass/herb/wild/rice
	name = "wild rice"
	desc = "Wild rice. Native to Kazengun and Lingyue, this water-loving plant has made itself at home in the sodden grasses."
	icon_state = "rice2"
	herbtype = /obj/item/natural/chaff/rice

// Trees

/obj/structure/flora/roguegrass/herb/wild/apple
	name = "wild apple tree"
	desc = "A wild apple tree. A common orchard plant, often enjoyed baked into pies or brewed ciders. There are many varieties, and this particular wild one is quite sour."
	icon_state = "apple2"
	debris = list(/obj/item/grown/log/tree/small = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/apple

/obj/structure/flora/roguegrass/herb/wild/pear
	name = "wild pear tree"
	desc = "A wild pear tree. A common orchard plant, sometimes called a brother-plant to apples. The fruit is quite sweet, if somewhat tough-skinned."
	icon_state = "pear2"
	debris = list(/obj/item/grown/log/tree/small = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/fruit/pear

/obj/structure/flora/roguegrass/herb/wild/plum
	name = "wild plum tree"
	desc = "A wild plum tree. A smooth-skinned fruit with juicy, sweet-tart flesh and a deep purple or red hue."
	icon_state = "plum2"
	debris = list(/obj/item/grown/log/tree/small = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/fruit/plum

/obj/structure/flora/roguegrass/herb/wild/tangerine
	name = "wild tangerine tree"
	desc = "A wild tangerine tree. A small, easy-to-peel citrus fruit with a vibrant orange color and sweet, juicy segments."
	icon_state = "tangerine2"
	debris = list(/obj/item/grown/log/tree/small = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/fruit/tangerine

/obj/structure/flora/roguegrass/herb/wild/lime
	name = "wild lime tree"
	desc = "A wild lime tree. A small, green citrus fruit with a sharp, tangy flavor, often used to add zest to dishes and drinks."
	icon_state = "lime2"
	debris = list(/obj/item/grown/log/tree/small = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/fruit/lime

/obj/structure/flora/roguegrass/herb/wild/lemon
	name = "wild lemon tree"
	desc = "A wild lemon tree. A bright yellow citrus fruit, prized for its tart, refreshing juice and fragrant zest. Despite the common saying, Psydon did not give Humenity lemons."
	icon_state = "lemon2"
	debris = list(/obj/item/grown/log/tree/small = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/fruit/lemon

/obj/structure/flora/roguegrass/herb/wild/rocknut
	name = "wild rocknut tree"
	desc = "A wild rocknut tree. A small tree that produces hard-shelled nuts, often used for their use in sweets, and as stimulants in zigs."
	icon_state = "nuts2"
	debris = list(/obj/item/grown/log/tree/small = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/nut

// Bushes

/obj/structure/flora/roguegrass/herb/wild/jackberry
	name = "wild jackberry bush"
	desc = "A wild jackberry bush. A thorny shrub that produces small, sweet berries. The thorns of the bush are sharp and surprisingly durable, leading them to commonly be used as sewing needles."
	icon_state = "berry2"
	debris = list(/obj/item/grown/log/tree/stick = 1, /obj/item/natural/thorn = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/berries/rogue

/obj/structure/flora/roguegrass/herb/wild/jackberry/poison
	desc = "A wild jackberry bush. A thorny shrub that produces small, sweet berries. The thorns of the bush are sharp and surprisingly durable, leading them to commonly be used as sewing needles."
	herbtype = /obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison

/obj/structure/flora/roguegrass/herb/wild/jackberry/poison/examine(mob/user)
	. = ..()
	if(!user.get_client_color(/datum/client_colour/monochrome))
		. += span_notice("On closer examination... The leaves and stems have a strange discoloration around them.")

/obj/structure/flora/roguegrass/herb/wild/strawberry
	name = "wild strawberry bush"
	desc = "A wild strawberry. A small, red berry with a sweet taste that grows low to the ground."
	icon_state = "strawberry2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/fruit/strawberry

/obj/structure/flora/roguegrass/herb/wild/blackberry
	name = "wild blackberry bush"
	desc = "A wild blackberry bush. A small, dark berry with a sweet-tart taste that grows on thorny canes."
	icon_state = "blackberry2"
	debris = list(/obj/item/grown/log/tree/stick = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/fruit/blackberry

/obj/structure/flora/roguegrass/herb/wild/raspberry
	name = "wild raspberry bush"
	desc = "A wild raspberry bush. A small, red berry with a sweet taste similar in appearance to blackberries."
	icon_state = "raspberry2"
	debris = list(/obj/item/grown/log/tree/stick = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/fruit/raspberry

/obj/structure/flora/roguegrass/herb/wild/tomato
	name = "wild tomato vines"
	desc = "A wild tomato vine growing on an unfortunate sapling. A round, juicy fruit often used in sauces."
	icon_state = "tomato2"
	debris = list(/obj/item/grown/log/tree/stick = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/fruit/tomato

/obj/structure/flora/roguegrass/herb/wild/eggplant
	name = "wild eggplant vines"
	desc = "A wild eggplant vine growing on an unfortunate sapling. A purple fruit with a spongy texture and a slightly bitter taste, often used in cooking. It gets its name from the fact that young, unripe eggplants are small and white, resembling eggs."
	icon_state = "eggplant2"
	debris = list(/obj/item/grown/log/tree/stick = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/eggplant

/obj/structure/flora/roguegrass/herb/wild/sugarcane
	name = "wild sugarcane"
	desc = "A wild sugarcane plant. A tall, green reed that produces a sweet, juicy stalk, often used for its high sugar content. Not native to Azurian forests, but its myriad bogs and murky ponds have allowed it to take root and grow in the wild."
	icon_state = "sugarcane2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/sugarcane

/obj/structure/flora/roguegrass/herb/wild/coffee
	name = "wild coffee bush"
	desc = "A wild coffee bush. Grows small, bitter berries whose seeds are used to brew coffee."
	icon_state = "coffee2"
	debris = list(/obj/item/grown/log/tree/stick = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/coffee

/obj/structure/flora/roguegrass/herb/wild/tea
	name = "wild tea bush"
	desc = "A wild tea bush. Grows small, aromatic leaves used to make tea."
	icon_state = "tea2"
	debris = list(/obj/item/grown/log/tree/stick = 1)
	herbtype = /obj/item/reagent_containers/food/snacks/grown/tea

// Vegetables

/obj/structure/flora/roguegrass/herb/wild/cabbage
	name = "wild cabbage"
	desc = "A wild cabbage plant. A dense leafy vegetable with a watery taste. A symbol of prosperity for elves."
	icon_state = "cabbage2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/cabbage/rogue

/obj/structure/flora/roguegrass/herb/wild/carrot
	name = "wild carrot patch"
	desc = "Wild carrots. A crunchy, orange root vegetable. This wild variety is often smaller and more bitter than its cultivated counterpart."
	icon_state = "carrot2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/carrot

/obj/structure/flora/roguegrass/herb/wild/onion
	name = "wild onion patch"
	desc = "Wild onions. A pungent, white or yellow root vegetable. This wild variety is often smaller than its cultivated counterpart. Often mistaken for garlick in the wild."
	icon_state = "onion2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/onion/rogue

/obj/structure/flora/roguegrass/herb/wild/garlick
	name = "wild garlick patch"
	desc = "Wild garlick. A pungent root vegetable. This wild variety is often smaller than its cultivated counterpart. Often confused for onion in the wild."
	icon_state = "onion2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/garlick/rogue

/obj/structure/flora/roguegrass/herb/wild/potato
	name = "wild potato patch"
	desc = "Wild potatoes. A starchy, brown root vegetable. The dwarven symbol of growth."
	icon_state = "potato2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/potato/rogue

/obj/structure/flora/roguegrass/herb/wild/turnip
	name = "wild turnip patch"
	desc = "Wild turnips. The peasant's and beggar's staple."
	icon_state = "turnip2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/vegetable/turnip

/obj/structure/flora/roguegrass/herb/wild/pumpkin
	name = "wild pumpkin"
	desc = "Wild pumpkins. A gourd with a thick skin and orange flesh. Often seen as a symbol of autumn. The carved and hollowed shells are often used as decorative lanterns."
	icon_state = "pumpkin2"
	herbtype = /obj/item/natural/shellplant/pumpkin

/obj/structure/flora/roguegrass/herb/wild/westleach
	name = "wild westleach plant"
	desc = "A wild westleach plant. A common pipeweed known for its relaxing properties."
	icon_state = "westleach2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed

/obj/structure/flora/roguegrass/herb/wild/swampweed
	name = "wild swampweed plant"
	desc = "A wild swampweed plant. A pipeweed known for its mind-opening properties. Though valued by scholars and magicians, it has a strong smell, and increases appetite."
	icon_state = "swampweed2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/rogue/swampweed

// Flowers

/obj/structure/flora/roguegrass/herb/wild/sunflowers
	name = "wild sunflowers"
	desc = "Wild sunflowers. A flower known for its bright yellow petals and dark center, seen as a symbol of Astrata, and the summer."
	icon_state = "sunflower2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/sunflower

/obj/structure/flora/roguegrass/herb/wild/poppy
	name = "wild poppies"
	desc = "Wild poppies. A flower known for its bright red petals and the sedative properties of its seeds. These flowers are considered a symbol of Eora."
	icon_state = "poppy2"
	herbtype = /obj/item/reagent_containers/food/snacks/grown/rogue/poppy


// Wild plant(herb) seeds

// Cereals

/obj/item/herbseed/wheat
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/wheat
	seed_identity = "wild wheat seeds"

/obj/item/herbseed/oats
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/oats
	seed_identity = "wild oat seeds"

/obj/item/herbseed/rice
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/rice
	seed_identity = "wild rice seeds"

// Trees

/obj/item/herbseed/apple
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/apple
	seed_identity = "wild apple seeds"

/obj/item/herbseed/pear
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/pear
	seed_identity = "wild pear seeds"

/obj/item/herbseed/plum
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/plum
	seed_identity = "wild plum seeds"

/obj/item/herbseed/tangerine
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/tangerine
	seed_identity = "wild tangerine seeds"

/obj/item/herbseed/lime
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/lime
	seed_identity = "wild lime seeds"

/obj/item/herbseed/lemon
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/lemon
	seed_identity = "wild lemon seeds"

/obj/item/herbseed/rocknut
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/rocknut
	seed_identity = "wild rocknut seeds"

// Bushes

/obj/item/herbseed/jackberry
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/jackberry
	seed_identity = "wild jackberry seeds"

/obj/item/herbseed/jackberry/poison
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/jackberry/poison

/obj/item/herbseed/strawberry
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/strawberry
	seed_identity = "wild strawberry seeds"

/obj/item/herbseed/blackberry
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/blackberry
	seed_identity = "wild blackberry seeds"

/obj/item/herbseed/raspberry
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/raspberry
	seed_identity = "wild raspberry seeds"

/obj/item/herbseed/tomato
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/tomato
	seed_identity = "wild tomato seeds"

/obj/item/herbseed/eggplant
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/eggplant
	seed_identity = "wild eggplant seeds"

/obj/item/herbseed/sugarcane
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/sugarcane
	seed_identity = "wild sugarcane seeds"

/obj/item/herbseed/coffee
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/coffee
	seed_identity = "wild coffee seeds"

/obj/item/herbseed/tea
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/tea
	seed_identity = "wild tea seeds"

// Vegetables

/obj/item/herbseed/cabbage
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/cabbage
	seed_identity = "wild cabbage seeds"

/obj/item/herbseed/carrot
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/carrot
	seed_identity = "wild carrot seeds"

/obj/item/herbseed/onion
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/onion
	seed_identity = "wild onion seeds"

/obj/item/herbseed/garlick
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/garlick
	seed_identity = "wild garlick seeds"

/obj/item/herbseed/potato
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/potato
	seed_identity = "wild potato seeds"

/obj/item/herbseed/turnip
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/turnip
	seed_identity = "wild turnip seeds"

/obj/item/herbseed/pumpkin
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/pumpkin
	seed_identity = "wild pumpkin seeds"

/obj/item/herbseed/westleach
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/westleach
	seed_identity = "wild westleach seeds"

/obj/item/herbseed/swampweed
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/swampweed
	seed_identity = "wild swampweed seeds"

// Flowers

/obj/item/herbseed/sunflowers
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/sunflowers
	seed_identity = "wild sunflower seeds"

/obj/item/herbseed/poppy
	makes_herb = /obj/structure/flora/roguegrass/herb/wild/poppy
	seed_identity = "wild poppy seeds"


// Crafting the seeds

// Cereals

/datum/crafting_recipe/roguetown/farming/wildwheat
	name = "wild wheat seeds"
	result = /obj/item/herbseed/wheat
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/wheat = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildoats
	name = "wild oat seeds"
	result = /obj/item/herbseed/oats
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/wheat/oat = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildrice
	name = "wild rice seeds"
	result = /obj/item/herbseed/rice
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/rice = 1)
	craftdiff = 1

// Trees

/datum/crafting_recipe/roguetown/farming/wildapple
	name = "wild apple seeds"
	result = /obj/item/herbseed/apple
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/apple = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildpear
	name = "wild pear seeds"
	result = /obj/item/herbseed/pear
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/pear = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildplum
	name = "wild plum seeds"
	result = /obj/item/herbseed/plum
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/plum = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildtangerine
	name = "wild tangerine seeds"
	result = /obj/item/herbseed/tangerine
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/tangerine = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildlime
	name = "wild lime seeds"
	result = /obj/item/herbseed/lime
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/lime = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildlemon
	name = "wild lemon seeds"
	result = /obj/item/herbseed/lemon
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/lemon = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildrocknut
	name = "wild rocknut seeds"
	result = /obj/item/herbseed/rocknut
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/nut = 1)
	craftdiff = 1

// Bushes

/datum/crafting_recipe/roguetown/farming/wildberry
	name = "wild jackberry seeds"
	result = /obj/item/herbseed/jackberry
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/berryrogue = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildberrypoison
	name = "wild jackberry seeds"
	result = /obj/item/herbseed/jackberry/poison
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/berryrogue/poison = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildstrawberry
	name = "wild strawberry seeds"
	result = /obj/item/herbseed/strawberry
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/strawberry = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildblackberry
	name = "wild blackberry seeds"
	result = /obj/item/herbseed/blackberry
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/blackberry = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildraspberry
	name = "wild raspberry seeds"
	result = /obj/item/herbseed/raspberry
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/raspberry = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildtomato
	name = "wild tomato seeds"
	result = /obj/item/herbseed/tomato
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/tomato = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildeggplant
	name = "wild eggplant seeds"
	result = /obj/item/herbseed/eggplant
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/eggplant = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildsugarcane
	name = "wild sugarcane seeds"
	result = /obj/item/herbseed/sugarcane
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/sugarcane = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildcoffee
	name = "wild coffee seeds"
	result = /obj/item/herbseed/coffee
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/coffee = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildtea
	name = "wild tea seeds"
	result = /obj/item/herbseed/tea
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/tea = 1)
	craftdiff = 1

// Vegetables

/datum/crafting_recipe/roguetown/farming/wildcabbage
	name = "wild cabbage seeds"
	result = /obj/item/herbseed/cabbage
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/cabbage = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildcarrot
	name = "wild carrot seeds"
	result = /obj/item/herbseed/carrot
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/carrot = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildonion
	name = "wild onion seeds"
	result = /obj/item/herbseed/onion
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/onion = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildgarlick
	name = "wild garlick seeds"
	result = /obj/item/herbseed/garlick
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/garlick = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildpotato
	name = "wild potato seeds"
	result = /obj/item/herbseed/potato
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/potato = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildturnip
	name = "wild turnip seeds"
	result = /obj/item/herbseed/turnip
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/turnip = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildpumpkin
	name = "wild pumpkin seeds"
	result = /obj/item/herbseed/pumpkin
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/pumpkin = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildwestleach
	name = "wild westleach seeds"
	result = /obj/item/herbseed/westleach
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/pipeweed = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildswampweed
	name = "wild swampweed seeds"
	result = /obj/item/herbseed/swampweed
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/swampweed = 1)
	craftdiff = 1

// Flowers

/datum/crafting_recipe/roguetown/farming/wildsunflowers
	name = "wild sunflower seeds"
	result = /obj/item/herbseed/sunflowers
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/sunflower = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/farming/wildpoppy
	name = "wild poppy seeds"
	result = /obj/item/herbseed/poppy
	reqs = list(/obj/item/compost = 1, /obj/item/seeds/poppy = 1)
	craftdiff = 1


// Spawners

// Base / All the wild plants

/obj/structure/flora/roguegrass/herb/wild/random
	name = "random wild plant"
	desc = "Haha, im in danger."
	icon = 'modular_causticcove/icons/roguetown/helpers/spawnerhelpers.dmi'
	icon_state = "wild_plant"
	var/list/plant_types = list(
	/obj/structure/flora/roguegrass/herb/wild/wheat,
	/obj/structure/flora/roguegrass/herb/wild/oats,
	/obj/structure/flora/roguegrass/herb/wild/rice,
	/obj/structure/flora/roguegrass/herb/wild/apple,
	/obj/structure/flora/roguegrass/herb/wild/pear,
	/obj/structure/flora/roguegrass/herb/wild/plum,
	/obj/structure/flora/roguegrass/herb/wild/tangerine,
	/obj/structure/flora/roguegrass/herb/wild/lime,
	/obj/structure/flora/roguegrass/herb/wild/lemon,
	/obj/structure/flora/roguegrass/herb/wild/rocknut,
	/obj/structure/flora/roguegrass/herb/wild/jackberry,
	/obj/structure/flora/roguegrass/herb/wild/jackberry/poison,
	/obj/structure/flora/roguegrass/herb/wild/strawberry,
	/obj/structure/flora/roguegrass/herb/wild/blackberry,
	/obj/structure/flora/roguegrass/herb/wild/raspberry,
	/obj/structure/flora/roguegrass/herb/wild/tomato,
	/obj/structure/flora/roguegrass/herb/wild/eggplant,
	/obj/structure/flora/roguegrass/herb/wild/sugarcane,
	/obj/structure/flora/roguegrass/herb/wild/coffee,
	/obj/structure/flora/roguegrass/herb/wild/tea,
	/obj/structure/flora/roguegrass/herb/wild/cabbage,
	/obj/structure/flora/roguegrass/herb/wild/carrot,
	/obj/structure/flora/roguegrass/herb/wild/onion,
	/obj/structure/flora/roguegrass/herb/wild/garlick,
	/obj/structure/flora/roguegrass/herb/wild/potato,
	/obj/structure/flora/roguegrass/herb/wild/turnip,
	/obj/structure/flora/roguegrass/herb/wild/pumpkin,
	/obj/structure/flora/roguegrass/herb/wild/westleach,
	/obj/structure/flora/roguegrass/herb/wild/swampweed,
	/obj/structure/flora/roguegrass/herb/wild/sunflowers,
	/obj/structure/flora/roguegrass/herb/wild/poppy)

/obj/structure/flora/roguegrass/herb/wild/random/Initialize()
	var/chosen_plant = pick(plant_types)
	var/obj/structure/flora/roguegrass/herb/wild/boi = new chosen_plant
	boi.forceMove(get_turf(src))
	boi.pixel_x += rand(-3,3)
	. = ..()
	return INITIALIZE_HINT_QDEL //Hint Qdel within the init proc.

// Bog

/obj/structure/flora/roguegrass/herb/wild/random/bog
	name = "random wild bog plant"
	icon_state = "wild_plant_bog"
	plant_types = list(
	/obj/structure/flora/roguegrass/herb/wild/rice,
	/obj/structure/flora/roguegrass/herb/wild/jackberry,
	/obj/structure/flora/roguegrass/herb/wild/jackberry/poison,
	/obj/structure/flora/roguegrass/herb/wild/sugarcane,
	/obj/structure/flora/roguegrass/herb/wild/coffee,
	/obj/structure/flora/roguegrass/herb/wild/tea,
	/obj/structure/flora/roguegrass/herb/wild/swampweed,
	/obj/structure/flora/roguegrass/herb/wild/poppy
	)

// Grove / Forest

/obj/structure/flora/roguegrass/herb/wild/random/grove
	name = "random wild grove plant"
	icon_state = "wild_plant_grove"
	plant_types = list(
	/obj/structure/flora/roguegrass/herb/wild/wheat,
	/obj/structure/flora/roguegrass/herb/wild/oats,
	/obj/structure/flora/roguegrass/herb/wild/apple,
	/obj/structure/flora/roguegrass/herb/wild/pear,
	/obj/structure/flora/roguegrass/herb/wild/plum,
	/obj/structure/flora/roguegrass/herb/wild/tangerine,
	/obj/structure/flora/roguegrass/herb/wild/lime,
	/obj/structure/flora/roguegrass/herb/wild/lemon,
	/obj/structure/flora/roguegrass/herb/wild/jackberry,
	/obj/structure/flora/roguegrass/herb/wild/jackberry/poison,
	/obj/structure/flora/roguegrass/herb/wild/strawberry,
	/obj/structure/flora/roguegrass/herb/wild/blackberry,
	/obj/structure/flora/roguegrass/herb/wild/raspberry,
	/obj/structure/flora/roguegrass/herb/wild/tomato,
	/obj/structure/flora/roguegrass/herb/wild/eggplant,
	/obj/structure/flora/roguegrass/herb/wild/cabbage,
	/obj/structure/flora/roguegrass/herb/wild/pumpkin,
	/obj/structure/flora/roguegrass/herb/wild/westleach,
	/obj/structure/flora/roguegrass/herb/wild/sunflowers)

// Basin / Near town

/obj/structure/flora/roguegrass/herb/wild/random/basin
	name = "random wild basin plant"
	icon_state = "wild_plant_basin"
	plant_types = list(
	/obj/structure/flora/roguegrass/herb/wild/wheat,
	/obj/structure/flora/roguegrass/herb/wild/oats,
	/obj/structure/flora/roguegrass/herb/wild/apple,
	/obj/structure/flora/roguegrass/herb/wild/pear,
	/obj/structure/flora/roguegrass/herb/wild/jackberry,
	/obj/structure/flora/roguegrass/herb/wild/jackberry/poison,
	/obj/structure/flora/roguegrass/herb/wild/strawberry,
	/obj/structure/flora/roguegrass/herb/wild/blackberry,
	/obj/structure/flora/roguegrass/herb/wild/raspberry,
	/obj/structure/flora/roguegrass/herb/wild/cabbage,
	/obj/structure/flora/roguegrass/herb/wild/carrot,
	/obj/structure/flora/roguegrass/herb/wild/turnip,
	/obj/structure/flora/roguegrass/herb/wild/pumpkin,
	/obj/structure/flora/roguegrass/herb/wild/sunflowers)

// Coast

/obj/structure/flora/roguegrass/herb/wild/random/coast
	name = "random wild coast plant"
	icon_state = "wild_plant_coast"
	plant_types = list(
	/obj/structure/flora/roguegrass/herb/wild/oats,
	/obj/structure/flora/roguegrass/herb/wild/jackberry,
	/obj/structure/flora/roguegrass/herb/wild/jackberry/poison,
	/obj/structure/flora/roguegrass/herb/wild/cabbage,
	/obj/structure/flora/roguegrass/herb/wild/carrot,
	/obj/structure/flora/roguegrass/herb/wild/onion,
	/obj/structure/flora/roguegrass/herb/wild/garlick,
	/obj/structure/flora/roguegrass/herb/wild/potato,
	/obj/structure/flora/roguegrass/herb/wild/turnip,
	/obj/structure/flora/roguegrass/herb/wild/pumpkin,
	/obj/structure/flora/roguegrass/herb/wild/westleach,
	/obj/structure/flora/roguegrass/herb/wild/sunflowers,
	/obj/structure/flora/roguegrass/herb/wild/poppy)

// Mount Decap

/obj/structure/flora/roguegrass/herb/wild/random/decap
	name = "random wild decap plant"
	icon_state = "wild_plant_decap"
	plant_types = list(
	/obj/structure/flora/roguegrass/herb/wild/oats,
	/obj/structure/flora/roguegrass/herb/wild/rocknut,
	/obj/structure/flora/roguegrass/herb/wild/jackberry,
	/obj/structure/flora/roguegrass/herb/wild/jackberry/poison,
	/obj/structure/flora/roguegrass/herb/wild/blackberry,
	/obj/structure/flora/roguegrass/herb/wild/raspberry,
	/obj/structure/flora/roguegrass/herb/wild/onion,
	/obj/structure/flora/roguegrass/herb/wild/garlick,
	/obj/structure/flora/roguegrass/herb/wild/potato,
	/obj/structure/flora/roguegrass/herb/wild/turnip,
	/obj/structure/flora/roguegrass/herb/wild/sunflowers,
	/obj/structure/flora/roguegrass/herb/wild/poppy)



// Mapgen stuffs to actually put the plants in

// Bog

/datum/mapGeneratorModule/bog/place()
	spawnableAtoms |= list(/obj/structure/flora/roguegrass/herb/wild/random/bog = 4)
	. = ..()

/datum/mapGeneratorModule/boggrass/place()
	spawnableAtoms |= list(/obj/structure/flora/roguegrass/herb/wild/random/bog = 4)
	. = ..()

// Grove / Forest

/datum/mapGeneratorModule/forest/place()
	spawnableAtoms |= list(/obj/structure/flora/roguegrass/herb/wild/random/grove = 4)
	. = ..()

/datum/mapGeneratorModule/forestgrass/place()
	spawnableAtoms |= list(/obj/structure/flora/roguegrass/herb/wild/random/grove = 4)
	. = ..()

// Basin / Near town

/datum/mapGeneratorModule/roguetownfield/place()
	spawnableAtoms |= list(/obj/structure/flora/roguegrass/herb/wild/random/basin = 5)
	. = ..()

/datum/mapGeneratorModule/roguetowngrass/place()
	spawnableAtoms |= list(/obj/structure/flora/roguegrass/herb/wild/random/basin = 5)
	. = ..()

// Coast
/datum/mapGeneratorModule/beach/place()
	spawnableAtoms |= list(/obj/structure/flora/roguegrass/herb/wild/random/coast = 15)
	. = ..()

/datum/mapGeneratorModule/beachgrass/place()
	spawnableAtoms |= list(/obj/structure/flora/roguegrass/herb/wild/random/coast = 15)
	. = ..()

// Mount Decap

/datum/mapGeneratorModule/decapsnow/place()
	spawnableAtoms |= list(/obj/structure/flora/roguegrass/herb/wild/random/decap = 7)
	. = ..()

/datum/mapGeneratorModule/decapgrass/place()
	spawnableAtoms |= list(/obj/structure/flora/roguegrass/herb/wild/random/decap = 7)
	. = ..()

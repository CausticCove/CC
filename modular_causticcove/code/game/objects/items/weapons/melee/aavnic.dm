/obj/item/rogueweapon/stoneaxe/woodcut/wardenpick/steppesman //Just a reskin of the Warden's one for now!
	name = "aavnic pioneer's valaška"
	desc = "A steel axe of Aavnic make that combines a deadly weapon with a walking stick - hence its pointed end. It has a flat head that \
	fits the hand comfortably, and it's usable for chopping and smashing. You could probably stab someone if you tried really hard."
	icon = 'modular_causticcove/icons/items/axes.dmi'
	icon_state = "valaska_pioneer"

/obj/item/rogueweapon/spear/boar/steppesman //Just a reskin of the boar spear!
	name = "aavnic khanjali shortspear"
	desc = "A spear with a wide head and a pair of wings below the head. The wings are designed to prevent a boar from charging past the spearhead. \
	It is also useful for parrying and stopping a charging opponent."
	icon = 'modular_causticcove/icons/items/spears.dmi'
	icon_state = "khanjali_spear"
	force_wielded = 30
	wdefense = 5
	max_blade_int = 180

/obj/item/rogueweapon/huntingknife/idagger/steel/steppesman
	name = "aavnic khanjali"
	desc = "A uniquely long, double bladed steel dagger, commonly found in the Steppes of Avar, often used to compliment a Rider's arsenal, \
	typically used alongside the Shashka, or Valaska. However on occasion, more desperate Fighters in need of a weapon with reach, \
	find that affixing the blade to a sturdy wooden shaft works in a pinch."
	icon = 'modular_causticcove/icons/items/daggers.dmi'
	icon_state = "khanjali"
	sheathe_icon = "khanjali"

/obj/item/rogueweapon/scabbard/sheath/noble/khanjali
	name = "aavnic khanjali sheath"
	desc = "An ornately handcrafted leather scabbard with steel reinforcements at the base, and a fine metallic ballpoint at the tip. \
	The Khanjali daggers are of immense spiritual, and ceremonial importance, each blade, and scabbard supposedly being handcrafted by a Warrior's family, \
	often holding runes or sigils depicting the Family's God or Deity of choice, as a way to attempt at ensuring their loved one's safe return home."
	icon = 'modular_causticcove/icons/items/scabbard.dmi'
	icon_state = "khanjali_scabbard"
	item_state = "khanjali_scabbard"
	valid_blade = /obj/item/rogueweapon/huntingknife/idagger/steel/steppesman

/obj/item/rogueweapon/scabbard/sheath/noble/shashka
	name = "aavnic shashka sheath"
	desc = "A slingable sheath made of leather, meant to host surprises in smaller sizes."
	icon = 'modular_causticcove/icons/items/scabbard.dmi'
	icon_state = "shashka_scabbard"
	item_state = "shashka_scabbard"
	valid_blade = /obj/item/rogueweapon/sword/sabre/steppesman

//Recipes for the above! Quick and dirty copy paste job for now.

/datum/anvil_recipe/weapons/steel/valaska
	name = "Aavnic Pioneer's Valaška, Steel (+1 Small Log)"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/stoneaxe/woodcut/wardenpick/steppesman
	additional_items = list(/obj/item/grown/log/tree/small)
	display_category = ITEM_CAT_WEAPONS_AXES

/datum/anvil_recipe/weapons/steel/khanjalispear
	name = "Aavnic Khanjali Shortspear, Steel (+1 Steel, +1 Small Log)"
	req_bar = /obj/item/ingot/steel
	req_blade = /obj/item/blade/steel_polearm
	additional_items = list(/obj/item/ingot/steel, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/boar/steppesman
	display_category = ITEM_CAT_WEAPONS_POLEARMS

/datum/anvil_recipe/weapons/steel/dagger
	name = "Aavnic Khanjali, Steel"
	req_bar = /obj/item/ingot/steel
	req_blade = /obj/item/blade/steel_knife
	created_item = /obj/item/rogueweapon/huntingknife/idagger/steel/steppesman
	display_category = ITEM_CAT_WEAPONS_DAGGERS

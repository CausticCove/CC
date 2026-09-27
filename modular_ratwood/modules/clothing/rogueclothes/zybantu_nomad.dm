#define CLOTHING_DARKDRAB		"#7c6d5c"

//Just the nomad clothes.
/obj/item/clothing/cloak/cape/nomad
	color = CLOTHING_DARKDRAB

/obj/item/clothing/neck/roguetown/coif/padded/nomad
	color = CLOTHING_DARKDRAB

/obj/item/clothing/suit/roguetown/shirt/undershirt/nomad
	color = CLOTHING_DARKDRAB

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/hierophant/nomad
	name = "nomad shawl"
	desc = "Thick and protective while remaining light and breezy. A staple of Zybantu nomads. Distinctly Dunewell..."
	color = CLOTHING_DARKDRAB

/obj/item/clothing/head/roguetown/roguehood/shalal/nomad
	color = CLOTHING_DARKDRAB

/obj/item/clothing/mask/rogue/ragmask/nomad
	color = CLOTHING_DARKDRAB


/obj/item/rogueweapon/shield/iron/nomad
	name = "nomad shield"
	desc = "A slim shield, likely wrought of gilbranze and iron alike. An unholy combination. \
	The work is of another lyfe, not yet seen since the first era."
	icon = 'modular_ratwood/icons/roguetown/weapons/shields32.dmi'
	icon_state = "ironsh_nomad" //Temp, but it works.
	coverage = 60 //+10
	max_integrity = 200 //-20

/obj/item/rogueweapon/spear/nomad
	name = "nomad spear"
	desc = "An odd sort of spear. No amount of further leverage will help, for you've all you need in one hand. \
	Weighted poorly to a mind yet untrained in the use of it. \
	All the same, it's a reinforcement for the fighting style of Dunewell's nomads. A shield over the arm, a spear in the hand."
	icon = 'modular_ratwood/icons/roguetown/weapons/polearms64.dmi'
	icon_state = "nomadspear"//Temp sprite.
	force = 25
	minstr = 6//-2
	max_blade_int = 230
	max_integrity = 250
	possible_item_intents = list(SPEAR_THRUST, SPEAR_CUT, SPEAR_BASH)
	gripped_intents = null
	gripsprite = FALSE
	smeltresult = /obj/item/ingot/steel

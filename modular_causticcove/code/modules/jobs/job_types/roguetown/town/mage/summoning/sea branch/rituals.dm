////////////////ENCHANTING RITUALS///////////////////
/datum/runeritual/enchanting/waterbreathing
	name = "Water Breathing"
	desc = "Lets you breath underwater."
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/obj/item/rogueore/cinnabar = 1,/obj/item/paper/scroll = 1, /obj/item/magic/deepsea/tierone = 2, /obj/item/magic/leyline = 1)
	result_atoms = list(/obj/item/enchantmentscroll/basic/waterbreath)

/datum/runeritual/enchanting/barotrauma
	name = "Baromind"
	desc = "Increase your intelligence, at the cost of your will."
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/rogueore/cinnabar = 1,/obj/item/paper/scroll = 1,/obj/item/magic/deepsea/tiertwo = 2, /obj/item/alch/mentha = 2, /obj/item/alch/waterdust = 1)
	result_atoms = list(/obj/item/enchantmentscroll/superior/barotrauma)

/datum/runeritual/enchanting/energysiphon
	name = "Energy Leech"
	desc = "Steals energy from foes."
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/obj/item/rogueore/cinnabar = 1,/obj/item/paper/scroll = 1,/obj/item/magic/deepsea/tierthree = 2, /obj/item/alch/hypericum = 2)
	result_atoms = list(/obj/item/enchantmentscroll/greater/energysiphon)

//Summoning//
/datum/runeritual/summoning/oceanglider
	name = "T1 - oceanglider"
	desc = "summons a deep sea oceanglider"
	blacklisted = FALSE
	tier = 1
	required_atoms = list(/obj/item/ash = 2, /obj/item/alch/waterdust = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/deepsea/stingray

/datum/runeritual/summoning/coralback
	name = "T2 - coralback"
	desc = "summons a coralback"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/magic/deepsea/tierone = 3, /obj/item/alch/waterdust = 2)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/deepsea/coralback

/datum/runeritual/summoning/ghostlight
	name = "T3 - ghostlight"
	desc = "summons a deep sea ghostlight"
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/obj/item/magic/deepsea/tiertwo = 2, /obj/item/alch/waterdust = 3)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/deepsea/ghostlight

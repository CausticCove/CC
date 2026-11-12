////////////////ENCHANTING RITUALS///////////////////
/datum/runeritual/enchanting/waterbreathing
	name = "Water Breathing"
	desc = "Lets you breath underwater."
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/rogueore/cinnabar = 1, /obj/item/reagent_containers/glass/bottle/alchemical = 1, /obj/item/magic/deepsea/tierone = 1, /obj/item/alch/waterdust = 1)
	result_atoms = list(/obj/item/enchantmentscroll/superior/waterbreath)

/datum/runeritual/enchanting/barotrauma
	name = "Baromind"
	desc = "Increase your intelligence, at the cost of your will."
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/rogueore/cinnabar = 1, /obj/item/reagent_containers/glass/bottle/alchemical = 1,/obj/item/magic/deepsea/tierthree = 1, /obj/item/alch/waterdust = 1)
	result_atoms = list(/obj/item/enchantmentscroll/superior/barotrauma)

/datum/runeritual/enchanting/chargedthorns
	name = "Charged Thorns"
	desc = "Zap those who dare attack you."
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/rogueore/cinnabar = 1, /obj/item/reagent_containers/glass/bottle/alchemical = 1,/obj/item/magic/deepsea/tiertwo = 1, /obj/item/alch/waterdust = 1)
	result_atoms = list(/obj/item/enchantmentscroll/superior/barotrauma)

//Tier 3
/datum/runeritual/enchanting/energysiphon
	name = "Energy Leech"
	desc = "Steals energy from foes."
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/obj/item/rogueore/cinnabar = 1, /obj/item/reagent_containers/glass/bottle/alchemical = 1,/obj/item/magic/deepsea/tierthree = 1, /obj/item/alch/waterdust = 2, /obj/item/magic/elemental/fragment = 1)
	result_atoms = list(/obj/item/enchantmentscroll/greater/energysiphon)

/datum/runeritual/enchanting/steamburst
	name = "Steam Burst"
	desc = "Knock back foes."
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/obj/item/rogueore/cinnabar = 1, /obj/item/reagent_containers/glass/bottle/alchemical = 1,/obj/item/magic/deepsea/tiertwo = 1, /obj/item/alch/waterdust = 2, /obj/item/magic/infernal/core = 1)
	result_atoms = list(/obj/item/enchantmentscroll/greater/steamburst)

/datum/runeritual/enchanting/strengthcrash
	name = "Strength Crash"
	desc = "Trade your health for heavy offense."
	blacklisted = FALSE
	tier = 3
	required_atoms = list(/obj/item/rogueore/cinnabar = 1, /obj/item/reagent_containers/glass/bottle/alchemical = 1,/obj/item/magic/deepsea/tierone = 1, /obj/item/alch/waterdust = 2, /obj/item/magic/fae/heartwoodcore = 1)
	result_atoms = list(/obj/item/enchantmentscroll/greater/strengthcrash)

//Tier 4
/datum/runeritual/enchanting/murkyveil
	name = "Murky Veil"
	desc = "Hide yourself from prying eyes."
	blacklisted = FALSE
	tier = 4
	required_atoms = list(/obj/item/rogueore/cinnabar = 1, /obj/item/reagent_containers/glass/bottle/alchemical = 1,/obj/item/magic/deepsea/tierthree = 1, /obj/item/alch/waterdust = 3, /obj/item/magic/fae/sylvanessence = 2, /obj/item/magic/infernal/flame = 2)
	result_atoms = list(/obj/item/enchantmentscroll/mythic/murkyveil)

/datum/runeritual/enchanting/lightweight
	name = "Light weight"
	desc = "Hide yourself from prying eyes."
	blacklisted = FALSE
	tier = 4
	required_atoms = list(/obj/item/rogueore/cinnabar = 1, /obj/item/reagent_containers/glass/bottle/alchemical = 1,/obj/item/magic/deepsea/tiertwo = 1, /obj/item/alch/waterdust = 3, /obj/item/magic/fae/sylvanessence = 2, /obj/item/magic/elemental/relic = 2)
	result_atoms = list(/obj/item/enchantmentscroll/mythic/lightweight)

//Summoning//
/datum/runeritual/summoning/oceanglider
	name = "Challenge Oceanglider"
	desc = "Summons a deep sea oceanglider"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/alch/waterdust = 1, /obj/item/magic/leyline = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/deepsea/stingray

/datum/runeritual/summoning/coralback
	name = "Challenge Heartstone"
	desc = "Summons an awakened heartstone"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/alch/waterdust = 1, /obj/item/magic/leyline = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/deepsea/coralback

/datum/runeritual/summoning/ghostlight
	name = "Challenge Ghostlight"
	desc = "Summons a deep sea ghostlight"
	blacklisted = FALSE
	tier = 2
	required_atoms = list(/obj/item/alch/waterdust = 1, /obj/item/magic/leyline = 1)
	mob_to_summon = /mob/living/simple_animal/hostile/retaliate/rogue/deepsea/ghostlight

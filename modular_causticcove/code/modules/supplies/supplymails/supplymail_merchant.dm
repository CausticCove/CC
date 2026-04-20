/datum/supply_mail/potions
	name = "Small cache of potions"
	desc = "A variety box of potion bottles"
	cost = 50
	supply_tier = SUPPLY_TIER_COMMON
	contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/reagent_containers/glass/bottle/rogue/manapot,
		/obj/item/reagent_containers/glass/bottle/rogue/manapot,
		/obj/item/reagent_containers/glass/bottle/rogue/stampot
	)
	recipents = list(
		/datum/job/roguetown/merchant,
		/datum/job/roguetown/shophand
	)

/datum/supply_mail/potions/health
	name = "Small cache of health potions"
	desc = "5 red potions"
	cost = 50
	supply_tier = SUPPLY_TIER_BUDGET
	contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
	)

/datum/supply_mail/potions/mana
	name = "Tiny cache of mana potions"
	desc = "3 blue potions"
	cost = 15
	supply_tier = SUPPLY_TIER_BUDGET
	contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/manapot,
		/obj/item/reagent_containers/glass/bottle/rogue/manapot,
		/obj/item/reagent_containers/glass/bottle/rogue/manapot
	)

/datum/supplyfacedatum

	var/obj/structure/roguemachine/supplyface/parent



/datum/supplyfacedatum/ui_interact(mob/user, datum/tgui/ui)



/datum/supplyfacedatum/ui_static_data(mob/user)
	var/list/data = list()
	//data["favous"] = favours

	data["supplymails"]["categories"] = list()

	data["supplymails"]["categories"]["Potions"] = list()

	AddSupplyMailToList(data["supplymails"]["categories"]["Potions"], /datum/supply_mail/potions)

	AddSupplyMailToList(data["supplymails"]["categories"]["Potions"], /datum/supply_mail/potions/health)

	AddSupplyMailToList(data["supplymails"]["categories"]["Potions"], /datum/supply_mail/potions/mana)

	return data

/datum/supplyfacedatum/proc/AddSupplyMailToList(list/appending, datum/supply_mail/sm)
	appending[sm::name] = list(
		"path" = sm,
		"price" = sm.cost,
		"desc" = sm.desc,
		"tier" = sm.supply_tier,
		"contents" = list(),
		recipents = sm.recipents
	)
	for(var/path in sm.contents)
		var/atom/A = path
		appending[sm::name]["contents"] += A.name + "\n"


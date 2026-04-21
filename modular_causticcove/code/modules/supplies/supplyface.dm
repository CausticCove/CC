/obj/structure/roguemachine/supplyface
	name = "SUPPLYFACE"
	desc = "A specialized goldface, which, instead of paying with coins, accepts favours from the Azurian Mercenary's Guild."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "streetvendor1" //Placeholder :tm:
	var/favours = 100
	var/cooldown = 0

/obj/structure/roguemachine/supplyface/Initialize()
	. = ..()

/obj/structure/roguemachine/supplyface/attackby(obj/item/P, mob/user, params)
	if(istype(P, /obj/item/voucher/quest))
		favours += 50
		playsound(loc, 'sound/misc/machinevomit.ogg', 100, TRUE, -1)
		say("Genuine voucher accepted!")
		qdel(P)

/obj/structure/roguemachine/supplyface/attack_hand(mob/living/user)
	var/datum/job/mob_job = user.job ? SSjob.GetJob(user.job) : null
	if(istype(mob_job, /datum/job/roguetown/merchant))
		say("Welcome "+ user.name + "... contact with the Mercenary's Guild estabilished.")
		ui_interact(user)
	else
		say(user.name + " is not authorized as a merchant. This incident will be reported.")
		return

/obj/structure/roguemachine/supplyface/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Supplies", "Order Supplies")
		ui.open()
	


/obj/structure/roguemachine/supplyface/ui_static_data(mob/user)
	var/list/data = list()
	data["favours"] = favours

	data["supplymails"] = list()

	data["supplymails"]["categories"] = list()

	data["supplymails"]["categories"]["Potions"] = list()

	AddSupplyMailToList(data["supplymails"]["categories"]["Potions"], /datum/supply_mail/potions)

	AddSupplyMailToList(data["supplymails"]["categories"]["Potions"], /datum/supply_mail/potions/health)

	AddSupplyMailToList(data["supplymails"]["categories"]["Potions"], /datum/supply_mail/potions/mana)

	return data

/obj/structure/roguemachine/supplyface/proc/AddSupplyMailToList(list/appending, datum/supply_mail/sm)
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

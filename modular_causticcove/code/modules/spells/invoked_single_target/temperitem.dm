//Shameless copy of Fit Clothing, reworked to be suited towards metal armors.
#define ENCHANT_DURATION 15 MINUTES
#define ENCHANT_DURATION_WILDERNESS 300 MINUTES

//Encourage smelting down gold treasures to upgrade one's armors during repairs when one returns to town.
/obj/effect/proc_holder/spell/invoked/temperitem
	name = "Temper Item"
	desc = "Temper Item allows you to enchant metal armor pieces to increase their integrity.\n\
	You can sacrifice a gold ore/ingot, and an iron ingot, to make the effects permanent. \n\ "
	releasedrain = 50
	chargedrain = 0
	chargetime = 0
	recharge_time = 30 SECONDS
	antimagic_allowed = TRUE

/obj/effect/proc_holder/spell/invoked/temperitem/cast(list/targets, mob/user = usr)
	var/target = targets[1]
	var/obj/item/sacrifice_ingot
	var/obj/item/sacrifice_gold

	//var/list/enchant_types = list("Durability" = DURABILITY_ENCHANT)

	for(var/obj/item/I1 in user.held_items)
		if(istype(I1, /obj/item/ingot/iron))
			sacrifice_ingot = I1
	for(var/obj/item/I2 in user.held_items)
		if(istype(I2, /obj/item/rogueore/gold)||istype(I2, /obj/item/ingot/gold)) //Very valuable. Encourages smelting down treasures for enchantment.
			sacrifice_gold = I2

	if(istype(target, /obj/item/clothing/))
		var/obj/item/clothing/suit/roguetown/armor/clothingenchant = target
		//Temper any anvil item.
		if((!(clothingenchant.anvilrepair)||isnull(clothingenchant.anvilrepair)))
			to_chat(user, span_warning("You can only temper metal armors or clothing."))
			return
		var/enchant_type = DURABILITY_ENCHANT
		var/enchant_duration = sacrifice_gold ? ENCHANT_DURATION_WILDERNESS : ENCHANT_DURATION
		if(sacrifice_gold && sacrifice_ingot)
			to_chat(user, "I consumes both, the [sacrifice_gold] and the [sacrifice_ingot] to enchant [clothingenchant] permanently.")
			qdel(sacrifice_gold)
			qdel(sacrifice_ingot)
		playsound(loc, 'sound/foley/sewflesh.ogg', 100, TRUE, -2)
		if(clothingenchant.GetComponent(/datum/component/temper_clothing))
			qdel(clothingenchant.GetComponent(/datum/component/temper_clothing))
		clothingenchant.AddComponent(/datum/component/temper_clothing, enchant_duration, TRUE, /datum/skill/magic/arcane, enchant_type)
		user.visible_message("[user] fits the [clothingenchant], allowing them to fit their wearer better")
		return TRUE
	else
		to_chat(user, span_warning("You can only fit light armor pieces"))
		revert_cast()
		return FALSE

#undef ENCHANT_DURATION
#undef ENCHANT_DURATION_WILDERNESS

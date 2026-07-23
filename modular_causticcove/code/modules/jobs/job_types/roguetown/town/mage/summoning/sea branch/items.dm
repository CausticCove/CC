//T1 is basic and mundane
//T2 is superior
//T3 is Greater
/obj/item/enchantmentscroll/basic/waterbreath
	name = "enchanting scroll of fire resistance"
	desc = "A scroll imbued with an enchantment of fire resistance. Prevents you from catching fire."
	component = /datum/magic_item/mundane/waterbreath

/obj/item/enchantmentscroll/basic/waterbreath/attack_obj(obj/item/O, mob/living/user)
	if(!..())
		return
	if(istype(O,/obj/item/clothing))
		to_chat(user, span_notice("You open [src] and place [O] within. Moments later, it flashes blue with arcana, and [src] crumbles to dust."))
		var/magiceffect= new component
		O.AddComponent(/datum/component/magic_item, magiceffect)
		O.name += " of waterbreathing"
		qdel(src)
	else
		to_chat(user, span_notice("Nothing happens. Perhaps you can't enchant [O] with this?"))

/obj/item/enchantmentscroll/superior/barotrauma
	name = "enchanting scroll of baromind"
	desc = "A scroll imbued with an enchantment of baromind. Increases intelligence, but reduces Will."
	component = /datum/magic_item/superior/barotrauma

/obj/item/enchantmentscroll/superior/barotrauma/attack_obj(obj/item/O, mob/living/user)
	if(!..())
		return
	if(istype(O,/obj/item/clothing))
		to_chat(user, span_notice("You open [src] and place [O] within. Moments later, it flashes blue with arcana, and [src] crumbles to dust."))
		var/magiceffect= new component
		O.AddComponent(/datum/component/magic_item, magiceffect)
		O.name += " of baromind"
		qdel(src)
	else
		to_chat(user, span_notice("Nothing happens. Perhaps you can't enchant [O] with this?"))

/obj/item/enchantmentscroll/greater/energysiphon
	name = "enchanting scroll of energy leech"
	desc = "A scroll imbued with an enchantment of energy leech. Steals energy of enemies that hit you when applied on armor, or enemies that you hit when applied on weapons."
	component = /datum/magic_item/greater/energysiphon

/obj/item/enchantmentscroll/greater/energysiphon/attack_obj(obj/item/O, mob/living/user)
	if(!..())
		return
	if(istype(O,/obj/item/clothing)|| istype(O,/obj/item/rogueweapon))
		to_chat(user, span_notice("You open [src] and place [O] within. Moments later, it flashes blue with arcana, and [src] crumbles to dust."))
		var/magiceffect= new component
		O.AddComponent(/datum/component/magic_item, magiceffect)
		O.name += " of energy leech"
		qdel(src)
	else
		to_chat(user, span_notice("Nothing happens. Perhaps you can't enchant [O] with this?"))

//FAIRY
/obj/item/magic/deepsea
	w_class = WEIGHT_CLASS_SMALL
//	sellprice = T1SELLPRICE
	icon = 'modular_causticcove/icons/mob/monster/summons/sea.dmi'
	tier = 1

/obj/item/magic/deepsea/examine(mob/user)
	. = ..()
	. += span_notice("It can be used to heal Deep Sea summons.")

/obj/item/magic/deepsea/tierone
    name = "aquatic sliver"
    icon_state = "water_one"
    desc = "A sliver of the deep sea"
    tier = 1

/obj/item/magic/deepsea/tiertwo
    name = "aquatic mote"
    icon_state = "water_two"
    desc = "A mote of power from the abyssal depths."
    tier = 2

/obj/item/magic/deepsea/tierthree
    name = "aquatic esscense"
    icon_state = "water_three"
    desc = "The esscense of deep sea beast"
    tier = 3

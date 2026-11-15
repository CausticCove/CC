//tier 2
/obj/item/enchantmentscroll/superior/waterbreath
	name = "runic tincture of water breathing"
	desc = "A vial of quicksilver ink, imbued with an enchantment of water breathing."
	component = /datum/magic_item/superior/waterbreath

/obj/item/enchantmentscroll/superior/waterbreath/attack_obj(obj/item/O, mob/living/user)
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
	name = "runic tincture of baromind"
	desc = "A vial of quicksilver ink, imbued with an enchantment of baromind. Increases intelligence, but reduces Will."
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

/obj/item/enchantmentscroll/superior/chargedthorns
	name = "runic tincture of charged thorns"
	desc = "A vial of quicksilver ink, imbued with an enchantment of charged thorns."
	component = /datum/magic_item/superior/chargedthorns

/obj/item/enchantmentscroll/superior/chargedthorns/attack_obj(obj/item/O, mob/living/user)
	if(!..())
		return
	if(istype(O,/obj/item/clothing))
		to_chat(user, span_notice("You open [src] and place [O] within. Moments later, it flashes blue with arcana, and [src] crumbles to dust."))
		var/magiceffect= new component
		O.AddComponent(/datum/component/magic_item, magiceffect)
		O.name += " of charged thorns"
		qdel(src)
	else
		to_chat(user, span_notice("Nothing happens. Perhaps you can't enchant [O] with this?"))

//tier 3
/obj/item/enchantmentscroll/greater/energysiphon
	name = "runic tincture of energy leech"
	desc = "A vial of quicksilver ink, imbued with an enchantment of energy leech. Steals energy of enemies that hit you when applied on armor, or enemies that you hit when applied on weapons."
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

/obj/item/enchantmentscroll/greater/steamburst
	name = "runic tincture of steam burst"
	desc = "A vial of quicksilver ink, imbued with an enchantment of steamburst. You create bursts of explosive steam upon being hit."
	component = /datum/magic_item/greater/steamburst

/obj/item/enchantmentscroll/greater/steamburst/attack_obj(obj/item/O, mob/living/user)
	if(!..())
		return
	if(istype(O,/obj/item/clothing))
		to_chat(user, span_notice("You open [src] and place [O] within. Moments later, it flashes blue with arcana, and [src] crumbles to dust."))
		var/magiceffect= new component
		O.AddComponent(/datum/component/magic_item, magiceffect)
		O.name += " of steamburst"
		qdel(src)
	else
		to_chat(user, span_notice("Nothing happens. Perhaps you can't enchant [O] with this?"))

/obj/item/enchantmentscroll/greater/strengthcrash
	name = "runic tincture of strength crash"
	desc = "A vial of quicksilver ink, imbued with an enchantment of strengthcrash. Gain a boon to strength whilst becoming fraile under critical blows."
	component = /datum/magic_item/greater/strengthcrash

/obj/item/enchantmentscroll/greater/strengthcrash/attack_obj(obj/item/O, mob/living/user)
	if(!..())
		return
	if(istype(O,/obj/item/clothing)|| istype(O,/obj/item/rogueweapon))
		to_chat(user, span_notice("You open [src] and place [O] within. Moments later, it flashes blue with arcana, and [src] crumbles to dust."))
		var/magiceffect= new component
		O.AddComponent(/datum/component/magic_item, magiceffect)
		O.name += " of strength crash"
		qdel(src)
	else
		to_chat(user, span_notice("Nothing happens. Perhaps you can't enchant [O] with this?"))

//tier 4
/obj/item/enchantmentscroll/mythic/murkyveil
	name = "runic tincture of murky veil"
	desc = "A vial of quicksilver ink, imbued with an enchantment of murky veil."
	component = /datum/magic_item/mythic/murkyveil

/obj/item/enchantmentscroll/mythic/murkyveil/attack_obj(obj/item/O, mob/living/user)
	if(!..())
		return
	if(istype(O,/obj/item/clothing/ring))
		to_chat(user, span_notice("You open [src] and place [O] within. Moments later, it flashes blue with arcana, and [src] crumbles to dust."))
		var/magiceffect= new component
		O.AddComponent(/datum/component/magic_item, magiceffect)
		O.name += " of mundane"
		qdel(src)
	else
		to_chat(user, span_notice("Nothing happens. Perhaps you can't enchant [O] with this?"))

/obj/item/enchantmentscroll/mythic/lightweight
	name = "runic tincture of lightweight"
	desc = "A vial of quicksilver ink, imbued with an enchantment of murky veil."
	component = /datum/magic_item/mythic/lightweight

/obj/item/enchantmentscroll/mythic/lightweight/attack_obj(obj/item/O, mob/living/user)
	if(!..())
		return
	if(istype(O,/obj/item/clothing))
		to_chat(user, span_notice("You open [src] and place [O] within. Moments later, it flashes blue with arcana, and [src] crumbles to dust."))
		var/magiceffect= new component
		O.AddComponent(/datum/component/magic_item, magiceffect)
		O.name += " of lightweight"
		qdel(src)
	else
		to_chat(user, span_notice("Nothing happens. Perhaps you can't enchant [O] with this?"))

//The enchanting bits
/obj/item/magic/deepsea
	w_class = WEIGHT_CLASS_SMALL
	icon = 'modular_causticcove/icons/mob/monster/summons/sea.dmi'
	tier = 1

/obj/item/magic/deepsea/examine(mob/user)
	. = ..()
	. += span_notice("It can be used to heal Deep Sea summons.")

/obj/item/magic/deepsea/tierone
    name = "aquatic esscense"
    icon_state = "water_one"
    desc = "A sliver of the deep sea"
    tier = 2

/obj/item/magic/deepsea/tiertwo
    name = "abnormal aquatic esscense"
    icon_state = "water_two"
    desc = "A mote of power from the abyssal depths."
    tier = 3

/obj/item/magic/deepsea/tierthree
    name = "deep aquatic esscense"
    icon_state = "water_three"
    desc = "The esscense of deep sea beast"
    tier = 4

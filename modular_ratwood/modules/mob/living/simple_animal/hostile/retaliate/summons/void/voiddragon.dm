/mob/living/simple_animal/hostile/retaliate/rogue/voiddragon/boss
	health = 8000
	maxHealth = 8000
	enraged = TRUE
	loot = list(/obj/item/roguekey/mage/dragon)

/obj/item/roguekey/mage/dragon
	name = "void key"
	desc = "A shimmering, awful looking key. Once embedded in a dragon's scales, now no more than a trophy."
	icon = 'modular_ratwood/icons/roguetown/items/keys.dmi'
	icon_state = "voidkey"//Temp. I hate temp sprites!!!!
	lockid = "void_dragon"

/obj/effect/oneway/dragon
	name = "magical barrier"
	max_integrity = 99999
	desc = "Victory or death - once you pass this point you will either triumph or fall. Recommended 5 players or more."
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	invisibility = SEE_INVISIBLE_LIVING
	anchored = TRUE

/obj/effect/oneway/dragon/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, /obj/item/roguekey/mage/dragon))
		visible_message(span_boldannounce("The magical barrier disperses!"))
		qdel(src)

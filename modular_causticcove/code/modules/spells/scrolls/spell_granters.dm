/obj/item/book/granter/spell/sizespell // Enlarge/Reduce Size Spell
	name = "Scroll of Reduce/Enlarge"
	spell = /datum/action/cooldown/spell/touch/sizespell
	spellname = "Reduce/Enlarge"
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "scrolldarkred"
	oneuse = TRUE
	drop_sound = 'sound/foley/dropsound/paper_drop.ogg'
	pickup_sound = 'sound/blank.ogg'

/obj/item/book/granter/spell/mirror_transform // Mirror Transform Spell
	name = "Scroll of Mirror Transform"
	spell = /datum/action/cooldown/spell/mirror_transform
	spellname = "Mirror Transform"
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "scrolldarkred"
	oneuse = TRUE
	drop_sound = 'sound/foley/dropsound/paper_drop.ogg'
	pickup_sound = 'sound/blank.ogg'

/obj/item/book/granter/spell/sizespell/loadout // Loadout specific ones!
	needLit = FALSE

/obj/item/book/granter/spell/mirror_transform/loadout // Mirror Transform Spell
    needLit = FALSE

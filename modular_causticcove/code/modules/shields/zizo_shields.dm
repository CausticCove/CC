/obj/item/rogueweapon/shield/ironshzizo
	name = "Zizoid shield"
	desc = "A heavy and encumbering iron shield. This one has HER symbol painted on it."
	icon_state = "ironshzizo"
	icon = 'modular_causticcove/icons/weapons/shields32.dmi'
	force = 20
	throwforce = 25 // "I can do this all day."
	dropshrink = 0.8
	coverage = 50
	resistance_flags = null
	flags_1 = CONDUCT_1
	attacked_sound = list('sound/combat/parry/shield/metalshield (1).ogg','sound/combat/parry/shield/metalshield (2).ogg','sound/combat/parry/shield/metalshield (3).ogg')
	parrysound = list('sound/combat/parry/shield/metalshield (1).ogg','sound/combat/parry/shield/metalshield (2).ogg','sound/combat/parry/shield/metalshield (3).ogg')
	possible_item_intents = list(SHIELD_SMASH_METAL, SHIELD_BLOCK) // No SHIELD_BASH. Too heavy to swing quickly, or something.
	max_integrity = 220
	anvilrepair = /datum/skill/craft/weaponsmithing

/obj/item/rogueweapon/shield/ironshzizo/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -5,"sy" = -1,"nx" = 6,"ny" = -1,"wx" = 0,"wy" = -2,"ex" = 0,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.6,"sx" = 1,"sy" = 4,"nx" = 1,"ny" = 2,"wx" = 3,"wy" = 3,"ex" = -3,"ey" = 3,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)

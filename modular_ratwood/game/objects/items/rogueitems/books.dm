/obj/item/book/rogue/bibble/zizo
	name = "Lexicon of Her Truth"
	desc = "By learning Her teachings, we will one day walk in Her footsteps.' A volume forbidden to be read by the Holy See, containing a retelling of the mortal life and ascension of Zizo, the Lady of Darkness - or at least the version of them held by the cultists of her 'Salvation'. Smells suspiciously of dried blood."
	icon = 'modular_ratwood/icons/roguetown/items/bookszizo.dmi'
	icon_state = "zizoble_0"
	base_icon_state = "zizoble"
	title = "Lexicon of Her Truth"
	dat = "gott.json"

/obj/item/book/rogue/bibble/zizo/attack(mob/living/M, mob/user)
	return

/obj/item/book/rogue/bibble/zizo/MiddleClick(mob/user, params)
	return

/obj/item/book/rogue/bibble/zizo/read(mob/living/carbon/human/user)
	if(!open)
		to_chat(user, span_info("Open it first."))
		return FALSE
	if(!user.client || !user.hud_used)
		return
	if(!user.hud_used.reads)
		return
	if(!user.can_read(src))
		return
	if(in_range(user, src) || isobserver(user))
		user.changeNext_move(CLICK_CD_MELEE)
		var/m
		var/list/verses = world.file2list("strings/zizobibble.txt")
		m = pick(verses)
		user.say(m)

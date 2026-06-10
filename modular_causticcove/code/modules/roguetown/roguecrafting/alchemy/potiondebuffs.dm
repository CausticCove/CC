/atom/movable/screen/alert/status_effect/debuff/alch
	desc = "You feel weaker."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/strengthpoison
	id = "strpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/strengthpoison
	effectedstats = list(STATKEY_STR = -3)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/strengthpoison
	name = STATKEY_STR
	desc = "You feel like your muscles are deflating."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/perceptionpoison
	id = "perpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/perceptionpoison
	effectedstats = list(STATKEY_PER = -3)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/perceptionpoison
	name = STATKEY_PER
	desc = "You feel like you have cataracts."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/intelligencepoison
	id = "intpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/intelligencepoison
	effectedstats = list(STATKEY_INT = -3)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/intelligencepoison
	name = STATKEY_INT
	desc = "You feel... dumb...?"
	icon_state = "debuff"

/datum/status_effect/debuff/alch/constitutionpoison
	id = "conpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/constitutionpoison
	effectedstats = list(STATKEY_CON = -3)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/constitutionpoison
	name = STATKEY_CON
	desc = "You feel more like a princess than a warrior."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/endurancepoison
	id = "endpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/endurancepoison
	effectedstats = list(STATKEY_WIL = -3)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/endurancepoison
	name = STATKEY_WIL
	desc = "You feel innocent and suggestible."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/speedpoison
	id = "spdpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/speedpoison
	effectedstats = list(STATKEY_SPD = -3)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/speedpoison
	name = STATKEY_SPD
	desc = "You feel like you're trudging through a bog."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/fortunepoison
	id = "forpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/fortunepoison
	effectedstats = list(STATKEY_LCK = -3)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/fortunepoison
	name = STATKEY_LCK
	desc = "You feel like you just shattered a mirror, or walked under a ladder."
	icon_state = "debuff"

//STRONG poisons because IT'S NOT ENOUGH I NEED HER BRAINDEAD

/atom/movable/screen/alert/status_effect/debuff/alch/strong
	desc = "You feel a LOT weaker."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/strong/strengthpoison
	id = "strongstrpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/strong/strengthpoison
	effectedstats = list(STATKEY_STR = -5)
	duration = 5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/strong/strengthpoison
	name = STATKEY_STR
	desc = "You feel like you couldn't lift two pillows tied to a stick if you tried."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/strong/perceptionpoison
	id = "strongperpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/strong/perceptionpoison
	effectedstats = list(STATKEY_PER = -5)
	duration = 5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/strong/perceptionpoison
	name = STATKEY_PER
	desc = "You feel like a cave mole staring at the sun."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/strong/intelligencepoison
	id = "strongintpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/strong/intelligencepoison
	effectedstats = list(STATKEY_INT = -5)
	duration = 5 MINUTES

/datum/status_effect/debuff/alch/intelligencepoison/on_apply()
	if(owner && isliving(owner) && owner.ckey == "ssscratches") //teehee :}
		effectedstats = list(STATKEY_INT = -15)
	. = ..()

/atom/movable/screen/alert/status_effect/debuff/alch/strong/intelligencepoison
	name = STATKEY_INT
	desc = "Duhhhhhhhh... hehehe..."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/strong/constitutionpoison
	id = "strongconpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/strong/constitutionpoison
	effectedstats = list(STATKEY_CON = -5)
	duration = 5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/strong/constitutionpoison
	name = STATKEY_CON
	desc = "You feel like a pane of glass."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/strong/endurancepoison
	id = "strongendpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/strong/endurancepoison
	effectedstats = list(STATKEY_WIL = -5)
	duration = 5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/strong/endurancepoison
	name = STATKEY_WIL
	desc = "You feel like you should take everything told to you at face value."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/strong/speedpoison
	id = "strongspdpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/strong/speedpoison
	effectedstats = list(STATKEY_SPD = -5)
	duration = 5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/strong/speedpoison
	name = STATKEY_SPD
	desc = "You feel like a vegetable."
	icon_state = "debuff"

/datum/status_effect/debuff/alch/strong/fortunepoison
	id = "strongforpoison"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/fortunepoison
	effectedstats = list(STATKEY_LCK = -5)
	duration = 5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/alch/strong/fortunepoison
	name = STATKEY_LCK
	desc = "You feel like you just walked under a ladder, spilt a jar of salt, shattered a mirror, opened your umbrella indoors while putting your shoes on the table. And to top it off, it's Friday the 13th!"
	icon_state = "debuff"

//Kink related "Poison"

/datum/status_effect/buff/alch/bimboliquer
	var/removable = FALSE
	id = "bimboliquer"
	alert_type = /atom/movable/screen/alert/status_effect/buff/alch/bimboliquer
	effectedstats = list(STATKEY_INT = -8, STATKEY_CON = 3, STATKEY_LCK = 2)
	duration = 4 HOURS

/datum/status_effect/buff/alch/bimboliquer/on_apply()
	. = ..()
	spawn(300)
		if(owner && istype(owner, /mob/living))
			to_chat(owner, span_userdanger("<spawn class='big'>You feel like you can return to your original intelligence by clicking the status effect!</span>"))
		removable = TRUE

/atom/movable/screen/alert/status_effect/buff/alch/bimboliquer
	name = STATKEY_INT
	desc = "My head feels like soooo cloudy and funny! I like never want it to stop! (After 30 seconds, you can press this button to return to your original intelligence.)"
	icon_state = "buff"

/atom/movable/screen/alert/status_effect/buff/alch/bimboliquer/Click()
	. = ..()
	var/mob/living/L = usr
	if(!istype(L)) // how though
		return
	var/datum/status_effect/buff/alch/bimboliquer/effect = L.has_status_effect(/datum/status_effect/buff/alch/bimboliquer)
	if(!effect.removable)
		to_chat(L, span_userdanger("<span class='warning'>I can't turn back yet!</span>"))
		return
	L.remove_status_effect(/datum/status_effect/buff/alch/bimboliquer)

/datum/status_effect/debuff/alch/baothasantidote
	var/removable = FALSE
	id = "baothasantidote"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/alch/baothasantidote
	effectedstats = list(STATKEY_INT = -15)
	duration = 4 HOURS

/datum/status_effect/debuff/alch/baothasantidote/on_apply()
	. = ..()
	spawn(300)
		if(owner && istype(owner, /mob/living))
			to_chat(owner, span_userdanger("<spawn class='big'>You feel like you can return to your original intelligence by clicking the status effect!</span>"))
			removable = TRUE

/atom/movable/screen/alert/status_effect/debuff/alch/baothasantidote
	name = STATKEY_INT
	desc = "Uhmm... uhhhh.... dduhhhhhh.... heheheh....(After 30 seconds, you can press this button to return to your original intelligence.)"
	icon_state = "debuff"

/atom/movable/screen/alert/status_effect/debuff/alch/baothasantidote/Click()
	. = ..()
	var/mob/living/L = usr
	if(!istype(L)) // how though
		return
	var/datum/status_effect/debuff/alch/baothasantidote/effect = L.has_status_effect(/datum/status_effect/debuff/alch/baothasantidote)
	if(!effect.removable)
		to_chat(L, span_userdanger("<span class='warning'>I can't turn back yet!</span>"))
		return
	L.remove_status_effect(/datum/status_effect/debuff/alch/baothasantidote)

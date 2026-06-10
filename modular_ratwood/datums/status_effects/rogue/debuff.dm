/* Kockout */
/datum/status_effect/debuff/knockout
	id = "knockout"
	effectedstats = null
	alert_type = null
	duration = 12 SECONDS
	var/knockout_power = 20 SECONDS //CC Edit - So we can make custon knockout timers.
	var/time = 0

//CC Edit - So we can make custon knockout durations.
/datum/status_effect/debuff/knockout/on_creation(mob/living/new_owner, new_knockout_power)
	if(new_knockout_power)
		knockout_power = new_knockout_power
	return ..()
	

/datum/status_effect/debuff/knockout/tick()
	time += 1
	switch(time)
		if(3)
			if(prob(50)) //You don't always know...
				var/msg = pick("I feel sleepy...", "I feel relaxed.", "My eyes feel a little heavy.")
				to_chat(owner, span_warn(msg))

		if(5)
			if(prob(50))
				owner.Slowdown(20)
			else
				owner.Slowdown(10)
		if(8)
			if(iscarbon(owner))
				var/mob/living/carbon/C = owner
				var/msg = pick("yawn", "cough", "clearthroat")
				C.emote(msg, forced = TRUE)
		if(12)
			// it's possible that stacking effects delay this.
			// If we hit 12 regardless we end
			Destroy()

/datum/status_effect/debuff/knockout/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		if(C.IsSleeping()) //No need to add more it's already pretty long.
			return ..()
		C.SetSleeping(knockout_power) //CC Edit - So we can make custon knockout timers.
	..()

/atom/movable/screen/alert/status_effect/debuff/knockout
	name = "Drowsy"

//Does nothing by itself, but cannot be healed by any normal means unlike other wounds.
//Critical Vulnerability will make a limb more exposed to damage from wounds. Causing new wounds to rip open faster and more ferociously.
//It does not add or make the wounds bleed faster. It only makes them form faster.


/obj/item/bodypart
	//Used to making wounds form faster on limbs that are critically vulnerable.
	var/critically_vulnerable = FALSE

/datum/wound/critical_vulnerability
	name = "critical vulnerability"
	check_name = span_artery("VULNERABLE")
	bleed_rate = 0
	sewn_bleed_rate = 0
	clotting_threshold = null
	sewn_clotting_threshold = null
	mob_overlay = " " //No overlay.
	whp = 300 //5 Minutes to heal with sleep. Should get a better item to heal this or see a doctor.
	woundpain = 0
	sew_threshold = 9999 //Shouldn't be sewable.
	can_sew = FALSE
	critical = FALSE //Not a 'critical' wound, so it doesn't keep re-applying itself during surgery.
	can_cauterize = FALSE
	passive_healing = 0
	sleep_healing = 1
	severity = WOUND_SEVERITY_CRIT_VULNERABLE
	healable_by_miracles = TRUE

/datum/wound/critical_vulnerability/on_bodypart_gain(obj/item/bodypart/affected)
	. = ..()
	//If our limb is not vulnerable, make it vulnerable.
	if(!affected.critically_vulnerable)
		affected.critically_vulnerable = TRUE
		to_chat(owner, span_bignotice(" My [affected.name] is now Vulnerable to future damage, I should seek a doctor or miracle worker to remedy this. "))

/datum/wound/critical_vulnerability/on_bodypart_loss(obj/item/bodypart/affected)
	. = ..()
	//If our wound is removed, remove our limb's vulnerability.
	if(affected.critically_vulnerable)
		affected.critically_vulnerable = FALSE
		to_chat(owner, span_bignotice(" My [affected.name] is no longer Vulnerable."))

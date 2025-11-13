/datum/charflaw/mind_broken
	name = "Asundered Mind"
	desc = "My mind is asundered, wether it was by own means or an unfortunate accident. Nothing seems real to me... \
	\nWARNING: HALLUCINATIONS MAY JUMPSCARE YOU, AND PREVENT YOU FROM TELLING APART REALITY AND IMAGINATION. \
	FURTHERMORE, THIS DOES NOT EXEMPT YOU FROM ANY RULES SET BY THE SERVER. ESCALATION STILL APPLIES."

/datum/charflaw/mind_broken/on_mob_creation(mob/user)
	var/mob/living/carbon/human/insane_fool = user
	insane_fool.hallucination = INFINITY
	ADD_TRAIT(user, TRAIT_PSYCHOSIS, TRAIT_GENERIC) //Fancy audio effects...

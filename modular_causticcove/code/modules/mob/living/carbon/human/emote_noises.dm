//Caustic modular file for noisemotes

/datum/emote/living/foxscream
	key = "foxscream"
	key_third_person = "yelps"
	message = "yelps!"
	emote_type = EMOTE_AUDIBLE
	message_muffled = "makes a muffled yelp!"
	is_animal = TRUE
	show_runechat = FALSE

/mob/living/carbon/human/verb/foxscream()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "Foxscream"
		set category = "NOISES"
		emote("foxscream", intentional = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/snarl
	key = "snarl"
	key_third_person = "snarls"
	message = "Snarls!"
	emote_type = EMOTE_AUDIBLE
	message_muffled = "makes a muffled snarl!"
	is_animal = TRUE
	show_runechat = FALSE

/mob/living/carbon/human/verb/snarl()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/wild_tongue))
		set name = "Snarl"
		set category = "NOISES"
		emote("snarl", intentional = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

/datum/emote/living/con_squeak
	key = "con_squeak"
	key_third_person = "squeaks like a toy."
	message = "squeaks like a toy!"
	emote_type = EMOTE_AUDIBLE
	message_muffled = "makes a muffled squeak!"

/mob/living/carbon/human/verb/con_squeak()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/construct))
		set name = "Squeak (Construct)"
		set category = "NOISES"
		emote("con_squeak", intentional = TRUE)
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

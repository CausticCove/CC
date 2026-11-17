//Function designed specifically for the Mangled Jaw vice. Effectively acts as a hematoma wound on the head.
//These wounds act in stages within the reagent_containers.dm for the Mangled Jaw vice.
/datum/wound/jaw_abuse
	name = "abused jaw"
	check_name = "abused jaw"
	whp = 1
	woundpain = 2
	can_sew = FALSE
	can_cauterize = FALSE
	passive_healing = 1 //Heals 1 HP/s.

	healable_by_miracles = FALSE //This will heal on its own. Miracles can reduce pain but cannot heal them as a means to side-step the vice.

	//Internal var handled in reagent_containers for incrementing stages.
	var/stage = 0

	//Holds a list of all of the wounds in ascending order.
	var/list/jaw_wounds_ascending = list(/datum/wound/jaw_abuse/first_stage,
										/datum/wound/jaw_abuse/second_stage,
										/datum/wound/jaw_abuse/third_stage,
										/datum/wound/jaw_abuse/fourth_stage,
										/datum/wound/jaw_abuse/forced_stage)

/datum/wound/jaw_abuse/first_stage
	name = "sore jaw"
	check_name = "sore jaw"
	whp = 3 //3 seconds of minor pain. Take it slow. Don't eat all at once. Long enough for people to keep force feeding.
	woundpain = 5
	stage = 1

/datum/wound/jaw_abuse/second_stage
	name = "strained jaw"
	check_name = "aching jaw"
	whp = 4 //4 seconds of pain. Slow your bites.
	woundpain = 15
	stage = 2

/datum/wound/jaw_abuse/third_stage
	name = "aching jaw" //Still somewhat tolerable, just aching.
	check_name = "aching jaw"
	whp = 5 //5 seconds of pain. Most food can be consumed in moderation at this point in a few bites if you need to quickly consume it.
	passive_healing = 1
	woundpain = 30 //Just a little painful...
	stage = 3

/datum/wound/jaw_abuse/fourth_stage
	name = "abused jaw"
	check_name = "abused jaw"
	whp = 8 //8 seconds of pain and a whole world of hurt. Can't go beyond this, but at this point you cannot eat anymore and must wait a bit.
	passive_healing = 1
	woundpain = 45
	stage = 4

//Stage 5 you cannot bite and your speech is impeded for the time being. This hurts your mouth a lot and makes it hard to articulate words.
/datum/wound/jaw_abuse/forced_stage
	name = "severely abused jaw"
	check_name = "severely abused jaw"
	whp = 25 //Someone is force feeding you. More than likely doing it for torture or for medical purposes, either way, this hurts a lot and for a good while.
	passive_healing = 1
	woundpain = 100
	stage = 5

/datum/wound/jaw_abuse/forced_stage/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_NO_BITE, "[type]")
	ADD_TRAIT(affected, TRAIT_GARGLE_SPEECH, "[type]")

/datum/wound/jaw_abuse/forced_stage/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_NO_BITE, "[type]") // Fixes mangled jaw muting you permanently
	REMOVE_TRAIT(affected, TRAIT_GARGLE_SPEECH, "[type]")

//Resets the whp to its initial value, used for tolerating the pain and refreshing forced feeding.
/datum/wound/jaw_abuse/proc/refresh()
	whp = initial(whp)

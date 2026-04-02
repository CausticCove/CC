/mob/living/carbon/human/species/hobgoblin/npc
	aggressive=1
	mode = NPC_AI_IDLE
	dodgetime = 20 //Bigger, Better, dodges every 2 seconds
	flee_in_pain = FALSE //GOBBY NO LIKE PAIN BUT ME BIG HOBBY WE NO HATE PAIN!!! (They're stronger.)
	npc_jump_chance = 40 //Not as nimble, less jumping...
	npc_jump_distance = 4 //But further distance by 1 tile compared to goblins.
	rude = TRUE
	wander = FALSE

	//smart_combatant = TRUE

	//Can use special attacks, but cannot parry or feint our foe.
	special_attacker = TRUE

/mob/living/carbon/human/species/hobgoblin/npc/ambush
	wander = TRUE
	//attack_speed = 1 //Unused var from npc AI? If it gets used in the future uncomment this.

//These guys will cast miracles from Graggar himself.
/mob/living/carbon/human/species/hobgoblin/npc/miracle_worker
	//No jumping. This drains stamina like CRAZY with spellcasters.
	npc_jump_chance = 0
	npc_jump_distance = 5 //Should never jump but on the off chance it does WOW they got a huge leap.
	hobgob_outfit = /datum/outfit/job/roguetown/npc/hobgoblin/miracle_worker

	//These are miracle workers for Graggar! They cast spells!
	spell_caster = TRUE
	
	//Should only get within 3 tiles of distance.
	min_dis_to_target = 3

/mob/living/carbon/human/species/hobgoblin/npc/miracle_worker/ambush
	wander = TRUE

//For anyone referencing how to add spells to a mob, please ensure that all spell-related changes are placed in *after* creation. Especially for mobs who have miracles and patrons.
//Don't forget to actually give them a patron as well.
/mob/living/carbon/human/species/hobgoblin/npc/miracle_worker/after_creation()
	. = ..()

	//Grant our devotion to our patron -> Graggar
	set_patron(/datum/patron/inhumen/graggar)
	var/datum/devotion/C = new /datum/devotion(src, src.patron)
	C.grant_miracles(src, cleric_tier = CLERIC_T2, passive_gain = CLERIC_REGEN_WEAK, devotion_limit = CLERIC_REQ_2, is_npc = TRUE)

	//Max out our devotion.
	C.devotion = C.max_devotion

	//Add the related traits.
	ADD_TRAIT(src, TRAIT_HERESIARCH, TRAIT_GENERIC)

	//Define the cooldown, this is added on top of the casted spell's cooldown. So if the spell is 5 Seconds, this will add 3-5 extra Seconds.
	spell_cd_offset = rand(3 SECONDS, 5 SECONDS) //This is effectively 30-50ds

	//Define the channel duration. This is how long an NPC will channel a spell for before moving and attacking a target again.
	spell_channel_duration = rand(1 SECONDS, 2 SECONDS)//This is effectively 10-20ds

	//Remove any spells with no logic attached.
	prepare_spell_list(LOGIC_NONE)

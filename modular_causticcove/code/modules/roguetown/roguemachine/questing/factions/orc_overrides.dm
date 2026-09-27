//Overrides the Orc faction to allow spawning the Juggernaut variants.
//They're the same as warlord just they have full plate basically and are tougher.
/datum/quest_faction/orc

	boss_mob_types = list(
		/mob/living/carbon/human/species/orc/npc/warlord = 100,
		/mob/living/carbon/human/species/orc/npc/juggernaut = 50,
	)

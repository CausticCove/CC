GLOBAL_LIST_EMPTY(compliance_settings)

/datum/compliance_setting
	var/name = "Parent compliance datum"
	var/desc

/datum/compliance_setting/armed_dangerous
	name = "Armed and Dangerous"
	desc = "You are considered to be Armed and Dangerous. \n\n\
	You willingly allow hostile acts to be performed against you within reason, this does not allow you to enact RDM. \n\n\
	Ambushes can, and will most likely be used by other players against you. \n\n\
	Your bounty will be claimed with minimal, to no escalation whatsoever, as long as there is valid reason for these actions. \n\n\
	Anyone, at any time, anywhere, may kill you or capture you without word, and you could possibly never be revived for the rest of the round.\n\n\
	By choosing this, you are considered to be a cold-hearted killer, merciless and showing no remorse. You are, in essence, a monster who must pay for your capital crimes. \n\n\
	You cannot change this during gameplay. YOU HAVE BEEN WARNED." 

/datum/compliance_setting/armed_compliant
	name = "Armed and Compliant"
	desc = "You are considered to be Armed and compliant. \n\n\
	You willingly allow hostile acts to be performed against you, but only in a manner that is roleplayed or acted out. \n\n\
	Ambushes can, and will most likely be used by other players against you. \n\n\
	On the contrary, your bounty will be claimed with announced effort, and actions will be carried out through roleplay. \n\n\
	This option expects you to roleplay appropriately. \n\n\
	By choosing this, you are considered to be a bad person with bad intentions, but not too far gone that you cannot be reasoned with for your crimes. \n\n\
	You cannot change this during gameplay. YOU HAVE BEEN WARNED."

/datum/compliance_setting/non_belligerent
	name = "Non-Belligerent"
	desc = "You are considered to be Non-Belligerent. \n\n\
	You do not allow combat, and are also not allowed to dish out combat against those claiming your bounties. \n\n\
	You typically do not have a high bounty, and are locked out of choosing higher pay bounties. \n\n\
	This tells the other person you do not wish to engage in mechanical PvP at all, outside of controlled scenarios. \n\n\
	By choosing this option, you are considered to be a pacifist, or somebody who has commited petty crimes. \n\n\
	You cannot change this during gameplay. YOU HAVE BEEN WARNED."

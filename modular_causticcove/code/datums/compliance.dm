GLOBAL_LIST_EMPTY(compliance_settings)

/datum/compliance_setting
	var/name = "Parent compliance datum"
	var/desc

/datum/compliance_setting/armed_dangerous
	name = "Armed and Dangerous"
	desc = "You are considered to be Armed and Dangerous. \n\n\
	You are considered a dangerous and capable individual. \n\n\
	You willingly invite other players to engage you in combat and perform hostile acts towards you within reason. This does not allow you to enact RDM. \n\n\
	You may be ambushed for your valuables, become a target for wretches and bandits or be hunted down for your bounty with minimal or no escalation. You should remain alert at all times \n\n\
	As long as there is a valid reason, you may find yourself quickly involved in sudden acts of violence and combat where you may be mortally wounded or imprisoned! \n\n\
	Those who carry bounties and have chosen to have violent crimes in their bounties such as 'mass murder, killing of guards, assassination of nobles' or similar should consider that those crimes belong in this category otherwise you may want to tone down the severity of your crimes. Although exceptions can be made in the sake for roleplay. \n\n\
	We recommend this option for players who wish for a more dangerous experience. \n\n\
	You cannot change this during gameplay. YOU HAVE BEEN WARNED." 

/datum/compliance_setting/armed_compliant
	name = "Armed and Compliant"
	desc = "You are considered to be Armed and compliant. \n\n\
	You are considered a capable individual to be approached with caution. \n\n\
	You are willing to participate in mechanical PVP and have it performed against you so long as there has been proper escalation and build up via roleplay.\n\n\
	By choosing this option you are inviting others to engage you in roleplay with the possibility of some combat if the situation calls for it. \n\n\
	We recommend this option for rugged warriors or criminals who CAN be reasoned with. \n\n\
	You may engage Armed and Dangerous individuals within reason, honoring the fact you have chosen this option for a more RP focused engagement. \n\n\
	You cannot change this during gameplay. YOU HAVE BEEN WARNED."

/datum/compliance_setting/non_belligerent
	name = "Non-Belligerent"
	desc = "You are considered to be Non-Belligerent. \n\n\
	You do not allow combat, and are also not allowed to dish out combat against those claiming your bounties. \n\n\
	You typically do not have a high bounty, and are locked out of choosing higher pay bounties. \n\n\
	This tells the other person you do not wish to engage in mechanical PvP at all, outside of controlled scenarios. \n\n\
	By choosing this option, you are considered to be a pacifist, or somebody who has commited petty crimes. \n\n\
	You cannot change this during gameplay. YOU HAVE BEEN WARNED."

//This DM is mostly used to override the surgery skills of surgery steps.
//Most surgeries should require at least Journeyman to perform.
/datum/surgery_step/amputate
	skill_min = SKILL_LEVEL_APPRENTICE
	skill_median = SKILL_LEVEL_EXPERT //Used to be journeyman.

//Should be relatively easy yet difficult to remove bad blood, to help deal with toxins from bad surgeries.
/datum/surgery_step/bloodlet
	skill_min = SKILL_LEVEL_APPRENTICE //Used to be journeyman.
	skill_median = SKILL_LEVEL_MASTER //Used to be expert.

/datum/surgery_step/relocate_bone
	skill_min = SKILL_LEVEL_APPRENTICE
	skill_median = SKILL_LEVEL_EXPERT //Used to be journeyman.

/datum/surgery_step/set_bone
	skill_min = SKILL_LEVEL_JOURNEYMAN
	skill_median = SKILL_LEVEL_MASTER //Used to be expert.

//The most basic healing surgery practice. Applies failures to the untrained hand unless you're journeyman or above.
//You may freak out and wonder "Now everyone can do it!", but those people who do perform it, without the right bedding
//Or without the right skills, can and may kill themselves from the toxins alone that occur from infections.
//If they do perform self healing, they will die to their own hubris... Infections are capable of being fatal.
/datum/surgery_step/heal
	skill_min = SKILL_LEVEL_NONE // Used to be apprentice.
	skill_median = SKILL_LEVEL_JOURNEYMAN //Used to be apprentice.

//Similar to healing, this is also a rather crucial step to surgeries. Doing incisions require delicate and steady hands.
//Don't let the knight in full bulky, heavy ass armor, after fighting god knows how many enemies, suddenly be able to have the steady hands
// of a SURGEON!
/datum/surgery_step/incise
	skill_min = SKILL_LEVEL_NONE //Used to be novice.
	skill_median = SKILL_LEVEL_JOURNEYMAN //Used to be apprentice.

/datum/surgery_step/clamp
	skill_min = SKILL_LEVEL_NOVICE //Used to be apprentice.
	skill_median = SKILL_LEVEL_JOURNEYMAN

//Used for deeper surgeries, don't destroy the skin by ripping them open, you need to keep a clean incision.
/datum/surgery_step/retract
	skill_min = SKILL_LEVEL_APPRENTICE
	skill_median = SKILL_LEVEL_EXPERT //Used to be journeyman.

//Cauterization is dangerous as you leave behind dead skin that can easily fester if not done in a certain way.
/datum/surgery_step/cauterize
	skill_min = SKILL_LEVEL_NOVICE
	skill_median = SKILL_LEVEL_EXPERT //Used to be apprentice.

/datum/surgery_step/remove_object
	skill_min = SKILL_LEVEL_NONE //Used to be novice.
	skill_median = SKILL_LEVEL_NOVICE

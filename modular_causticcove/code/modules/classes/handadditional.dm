//The Bodyguard. A hand variant that plays like an unarmed, skinless, rageless, barbarian, High con+wil and access to alot of traits to let them take punishment. GET DOWN MILORD
/datum/advclass/hand/bodyguard
	name = "Bodyguard"
	tutorial = "Raised to be a human shield you are no knight, you are a literal hand of the crown you serve. You do not clad yourself in heavier armors for you do not need them, your body is your charges shield. Your body is a honed fortress all for the sake of protecting the crown and throne. A blade rammed through your chest is not enough to deter you from your duty, bite not this hand."
	outfit = /datum/outfit/job/roguetown/hand/bodyguard

	category_tags = list(CTAG_HAND)
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_BLOOD_RESISTANCE, TRAIT_NOPAINSTUN, TRAIT_CRITICAL_RESISTANCE, TRAIT_CIVILIZEDBARBARIAN)
	subclass_stats = list(
		STATKEY_PER = 1,
		STATKEY_INT = 1,
		STATKEY_STR = 1,
		STATKEY_CON = 3,
		STATKEY_WIL = 3,
		STATKEY_LCK = 1,
	)

	age_mod = /datum/class_age_mod/hand_bodyguard
	subclass_skills = list(
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/athletics = SKILL_LEVEL_MASTER,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/cooking = SKILL_LEVEL_APPRENTICE, //The Hand that feeds...
		/datum/skill/misc/hunting = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/hand/bodyguard/pre_equip(mob/living/carbon/human/H)
	r_hand = /obj/item/rogueweapon/katar/punchdagger
	head = /obj/item/clothing/head/roguetown/chaperon/noble/hand
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/hand
	pants = /obj/item/clothing/under/roguetown/tights/black
	gloves = /obj/item/clothing/gloves/roguetown/bandages/weighted
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/dtace = 1,
		/obj/item/rogueweapon/scabbard/sheath/royal = 1,
		/obj/item/storage/keyring/lord = 1,
		/obj/item/roguekey/skeleton = 1,
		/obj/item/repair_kit = 1,
		/obj/item/clothing/gloves/roguetown/knuckles = 1,
		)
	if(H.mind)
		SStreasury.grant_savings(ECONOMIC_RICH, H)

/datum/class_age_mod/hand_bodyguard
	target_age = AGE_OLD
	skill_mods = list(
		/datum/skill/combat/unarmed = SKILL_LEVEL_MASTER,
	)

	stat_mods = list(
		STATKEY_LCK = 2
	)



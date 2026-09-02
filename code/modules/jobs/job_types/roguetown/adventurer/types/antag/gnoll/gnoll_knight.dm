/datum/advclass/gnoll/knight
	name = "Gnoll Knight"
	tutorial = "You were forged in the fires of the volcano, burn marks have long since healed, but the armor hammered against your muscle isn't so fleeting."
	allowed_sexes = list(MALE, FEMALE)

	outfit = /datum/outfit/job/roguetown/gnoll/knight
	category_tags = list(CTAG_GNOLL)
	traits_applied = list(TRAIT_HEAVYARMOR,TRAIT_NOPAINSTUN) // CC edit, added TRAIT NOPAINSTUN to specifically the knight


	cmode_music = 'sound/music/cmode/antag/combat_thewall.ogg'
	reset_stats = TRUE
	subclass_stats = list( //Caustic Edit start.
		STATKEY_STR = 2,
		STATKEY_WIL = 5,
		STATKEY_CON = 5,
		STATKEY_SPD = 2,
		STATKEY_INT = 1
	)
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT, //CC edit. increased skill from journeyman to expert. to be reduced if this is too strong.
		/datum/skill/misc/swimming = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/athletics = SKILL_LEVEL_MASTER,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_LEGENDARY,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/labor/butchering = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/tanning = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/hunting = SKILL_LEVEL_JOURNEYMAN,
	) //Caustic Edit end.
	cmode_music = 'sound/music/combat_graggar.ogg'

/datum/outfit/job/roguetown/gnoll/knight/pre_equip(mob/living/carbon/human/H)
	if(H.mind)
		H.set_species(/datum/species/gnoll)
		H.skin_armor = new /obj/item/clothing/suit/roguetown/armor/regenerating/skin/gnoll_armor/knight(H)
		neck = /obj/item/storage/belt/rogue/pouch/healing
		backr = /obj/item/storage/backpack/rogue/satchel/gnoll
		don_pelt(H)

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/gnoll_armor/knight
	icon_state = "knight"
	max_integrity = 800
	armor = ARMOR_GNOLL_STRONG
	// Stronger, so repair less armor when it repairs //CC edit start - increasing repair rate since armor no longer repairs in combat anymore.
	auto_repair_mode_base = 100
	relative_repair_interval = 15 SECONDS //CC edit end

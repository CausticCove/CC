/datum/advclass/mage/spellthief
	name = "Spellthief"
	tutorial = "You are a rogue, either by choice or hardship. Your study of the arcyne knowledge, stolen or not, now aids in your roguish endeavors."
	outfit = /datum/outfit/job/roguetown/adventurer/spellthief
	traits_applied = list(TRAIT_DODGEEXPERT , TRAIT_ARCYNE_T2)
	subclass_stats = list(
		STATKEY_STR = -1,
		STATKEY_INT = 2,
		STATKEY_PER = 1,
		STATKEY_WIL = 1,
		STATKEY_SPD = 2
	)
	subclass_spellpoints = 12
	subclass_skills = list(
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/bows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/stealing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/magic/arcane = SKILL_LEVEL_APPRENTICE,

	)
/datum/outfit/job/roguetown/adventurer/spellthief/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You are a rogue, either by choice or hardship. Your study of the arcyne knowledge, stolen or not, now aids in your roguish endeavors."))
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	backl = /obj/item/storage/backpack/rogue/backpack
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/quiver/Warrows
	beltr = /obj/item/rogueweapon/mace/cudgel
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	backpack_contents = list(
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/rogueweapon/huntingknife/idagger/steel = 1,
		/obj/item/lockpickring/mundane = 1,
		/obj/item/recipe_book/survival = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/invisibility)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/lesserknock)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
	H.grant_language(/datum/language/thievescant)

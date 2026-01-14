/datum/advclass/wretch/shrine_defiler
	name = "Shrine Defiler"
	tutorial = "Curiosity got the best of you. You serve no master, other than PROGRESS itself. Your old charge is long gone. And yet, you are still here. You seek to spread your inhumen energies to the town- Willingly, or not."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = NON_DWARVEN_RACE_TYPES //no dwarf sprites
	outfit = /datum/outfit/job/roguetown/wretch/shrine_defiler
	subclass_languages = list(/datum/language/kazengunese)
	category_tags = list(CTAG_WRETCH)
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_CRITICAL_RESISTANCE, TRAIT_ZOMBIE_IMMUNE, TRAIT_MAGEARMOR, TRAIT_GRAVEROBBER, TRAIT_ARCYNE_T3)
	cmode_music = 'sound/music/combat_kazengite.ogg'
	subclass_stats = list(
		STATKEY_WIL = 2,
		STATKEY_STR = 3,
		STATKEY_SPD = 1,
		STATKEY_INT = 3
	)
	subclass_spellpoints = 4
	subclass_skills = list(
		/datum/skill/magic/holy = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/magic/arcane = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN
	)

/datum/outfit/job/roguetown/wretch/shrine_defiler/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("Curiosity got the best of you. You serve no master, other than PROGRESS itself. Your old charge is long gone. And yet, you are still here. You seek to spread your inhumen energies to the town- Willingly, or not."))
	if(H.mind)
		H.mind.current.faction += "[H.name]_faction"
		H.set_patron(/datum/patron/inhumen/zizo)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T3, passive_gain = CLERIC_REGEN_MAJOR, devotion_limit = CLERIC_REQ_3)
	head = /obj/item/clothing/head/roguetown/mentorhat
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants2
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt2
	shoes = /datum/supply_pack/rogue/wardrobe/shoes/sandals
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/kazengun
	backl = /obj/item/storage/backpack/rogue/satchel
	H.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/minion_order)
	H.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/gravemark)
	H.set_blindness(0)

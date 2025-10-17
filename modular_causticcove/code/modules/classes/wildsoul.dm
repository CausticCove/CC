

/datum/job/roguetown/wildsoul
	title = "Wild Soul"
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 8
	spawn_positions = 8
	allowed_races = RACES_NO_CONSTRUCT
	tutorial = "You've never been one for the comforts of society. Whether born and raised in the wild, or having eschewed the comforts of the city after some incident, you've learned to survive on your own within Dendor's realm. You still need to live carefully, though; you're part of an ecosystem you're not above, and for every creature you hunt, another will make you its hunted."
	outfit = null 
	outfit_female = null 

	show_in_credits = FALSE
	min_pq = null
	max_pq = null
	announce_latejoin = FALSE
	wanderer_examine = TRUE
	advjob_examine = FALSE //not sure if leaving them unmarked as wild souls is a good idea? it might be worth adding an examine text message for a wild soul with the "in town" debuff later, but we'll see 
	always_show_on_latechoices = TRUE
	same_job_respawn_delay = 2 MINUTES
	//job_reopens_slots_on_death = TRUE
	//if new players take wild soul slots and die we can just uncomment this
	selection_color = JCOLOR_YEOMAN
	job_traits = list(TRAIT_OUTDOORSMAN, TRAIT_WILD_EATER, TRAIT_AZURENATIVE)
	 //Other traits like FERAL, WOODWALKER, CIVILIZEDBARBARIAN, SEEDKNOW, and STRONGBITE to be applied to subclasses

	round_contrib_points = 1 //just in case we start using PQ at some point, equal to mercenary
	advclass_cat_rolls = list(CTAG_WILDSOUL = 20)//I don't understand how this works and it scares me
	display_order = JDO_WILDSOUL 
	cmode_music = 'modular_causticcove/sound/music/combat_wildsoul.ogg'
	virtue_restrictions = list(/datum/virtue/utility/noble, /datum/virtue/utility/deathless) //no deathless bc infinite hunger + nat armor is silly
	job_subclasses = list(
		/datum/advclass/wildsoul/direbear,
		/datum/advclass/wildsoul/mantid,
		/datum/advclass/wildsoul/lampternfly,
		/datum/advclass/wildsoul/zad
	)

/datum/advclass/wildsoul/direbear
	name = "Soul of the Direbear"
	tutorial = "Strong, heavy, durable- but not swift. Not particularly wise, either, but does it matter how smart someone else is if you can crush their skull in one hand?"
	traits_applied = list(TRAIT_CRITICAL_RESISTANCE, TRAIT_CIVILIZEDBARBARIAN, TRAIT_STRONGBITE, TRAIT_FERAL, TRAIT_NATURAL_ARMOR)
	category_tags = list(CTAG_WILDSOUL)
	subclass_stats = list(
		STATKEY_STR = 4,
		STATKEY_INT = -3,
		STATKEY_PER = 2,
		STATKEY_WIL = 3,
		STATKEY_SPD = -2,
		STATKEY_CON = 4 //decent chance this con score is too high, but worth experimenting with
	)
	subclass_skills = list(
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_MASTER,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE, //just cus ur a wild guy doesn't mean you learned how to swim
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/butchering = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/farming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE
	) //not too many skills, the real gold here is the traits
	outfit = /datum/outfit/job/roguetown/wildsoul/direbear

/datum/outfit/job/roguetown/wildsoul/direbear/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/rogueweapon/huntingknife/stoneknife
	H.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/natural_armor/heavy(H)
	give_feral_eyes(H)

/datum/advclass/wildsoul/mantid
	name = "Soul of the Mantid"
	tutorial = "To fight head on never was your style. You prefer the subtle options; to be hidden, quiet, and strike at the opportune moment. But be wary, as that lack of brute strength and thick armor means you can't cut yourself out of an aspiring hunter's net so easily."
	traits_applied = list(TRAIT_FERAL, TRAIT_NATURAL_ARMOR, TRAIT_STRONGBITE, TRAIT_WOODWALKER, TRAIT_DODGEEXPERT)
	category_tags = list(CTAG_WILDSOUL)
	subclass_stats = list(
		STATKEY_STR = 4,
		STATKEY_INT = -1,
		STATKEY_PER = 4,
		STATKEY_WIL = 1,
		STATKEY_SPD = 3,
		STATKEY_CON = 2
	)
	subclass_skills = list(
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_MASTER,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN, //kind of experimenting here. we'll see how it feels
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/fishing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/butchering = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/stealing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/farming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE
	)
	outfit = /datum/outfit/job/roguetown/wildsoul/mantid

/datum/outfit/job/roguetown/wildsoul/mantid/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	head = /obj/item/clothing/head/roguetown/roguehood
	suit = /obj/item/clothing/suit/roguetown/shirt/rags
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/rogueweapon/huntingknife
	H.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/natural_armor(H)
	give_feral_eyes(H)

/datum/advclass/wildsoul/lampternfly
	name = "Soul of the Lampternfly"
	tutorial = "Some things in this world have a magical spark to them; you're one of them. Having an immensely potent arcyne nature, even without training, you're capable of commanding many magycks; but be careful, for an opposing hunter's command of a bow can prove just as deadly."
	traits_applied = list(TRAIT_ARCYNE_T3, TRAIT_NATURAL_ARMOR, TRAIT_FERAL, TRAIT_WOODWALKER)
	category_tags = list(CTAG_WILDSOUL)
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_INT = 3,
		STATKEY_PER = 3,
		STATKEY_WIL = 1,
		STATKEY_SPD = 3,
		STATKEY_CON = -1
	)
	subclass_spellpoints = 15 //slightly worse than adventurer mage since you get better traits n' skills
	subclass_skills = list( //still can't read lol
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN, //gotta be able to ESCAPE
		/datum/skill/magic/arcane = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/polearms = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/alchemy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/butchering = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/tanning = SKILL_LEVEL_APPRENTICE, //tome in waiting crafting
		/datum/skill/labor/farming = SKILL_LEVEL_APPRENTICE
	)
	outfit = /datum/outfit/job/roguetown/wildsoul/lampternfly

/datum/outfit/job/roguetown/wildsoul/lampternfly/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	mouth = /obj/item/roguegem/amethyst	
	head = /obj/item/clothing/head/roguetown/roguehood
	belt = /obj/item/storage/belt/rogue/leather/rope
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	H.put_in_hands(new /obj/item/clothing/neck/roguetown/collar/leather/nomagic(H), TRUE) //either for "they tried and failed to capture me" roleplay or for people who REALLY want a challenge
	H.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/natural_armor(H)
	give_feral_eyes(H)
	if(H.age == AGE_OLD)
		H.adjust_skillrank_up_to(/datum/skill/magic/arcane, SKILL_LEVEL_EXPERT, TRUE)
		H.mind?.adjust_spellpoints(6)
	H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()

/datum/advclass/wildsoul/zad
	name = "Soul of the Zad"
	tutorial = "Wise, keenly aware, yet never settling down, you haven't eschewed the idea of creating things- rather, you've only eschewed the society that traps the world in meaningless contest. You'll reap the rewards of your own labor- even if that means dying for it."
	traits_applied = list(TRAIT_FERAL, TRAIT_NATURAL_ARMOR, TRAIT_WOODWALKER, TRAIT_SEEDKNOW) //tempted to remove trait_feral from them
	category_tags = list(CTAG_WILDSOUL)
	subclass_stats = list(
		STATKEY_STR = -1,
		STATKEY_INT = 3,
		STATKEY_PER = 3,
		STATKEY_WIL = 2,
		STATKEY_SPD = 3,
		STATKEY_CON = -1
	) //same as lampternfly subclass
	subclass_skills = list(
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN, //good luck getting surgical tools if that's your goal
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/cooking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/tanning = SKILL_LEVEL_JOURNEYMAN, //still worse than a dedicated tailor off the start, but enough for most armor
		/datum/skill/craft/carpentry = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_EXPERT,
		/datum/skill/labor/farming = SKILL_LEVEL_EXPERT,
		/datum/skill/labor/lumberjacking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/fishing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/butchering = SKILL_LEVEL_EXPERT,
		/datum/skill/labor/mining = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/slings = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE
	) //most skills of all, but least combat effective. also no reading still lol. books are for nerds, you learn how to do your shit the proper way
	outfit = /datum/outfit/job/roguetown/wildsoul/zad
/datum/outfit/job/roguetown/wildsoul/zad/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	suit = /obj/item/clothing/suit/roguetown/shirt/rags
	shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/quiver/sling/iron
	beltr = /obj/item/gun/ballistic/revolver/grenadelauncher/sling
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/stoneaxe

	H.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/natural_armor(H)
	give_feral_eyes(H)
	H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()

/datum/outfit/job/roguetown/wildsoul/proc/give_feral_eyes(mob/living/carbon/human/man)
	var/obj/item/organ/eyes/eyes = man.getorganslot(ORGAN_SLOT_EYES)
	var/color_one
	var/color_two
	var/heterochromia
	if(eyes)
		color_one = eyes.eye_color
		color_two = eyes.second_color
		heterochromia = eyes.heterochromia
		eyes.Remove(man,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/feral
	if(color_one)
		eyes.eye_color = color_one
	if(color_two)
		eyes.second_color = color_two
	if(heterochromia)
		eyes.heterochromia = heterochromia
	eyes.Insert(man)
	man.dna.organ_dna["eyes"]:organ_type = /obj/item/organ/eyes/night_vision/feral

/obj/item/organ/eyes/night_vision/feral
	name = "feral eyes"
	desc = ""

/atom/movable/screen/alert/status_effect/buff/feraldebuff
	name = "Feral Natured"
	desc = "These civilized realms are not meant for me. I can feel the walls closing in."
	icon_state = "debuff"

/datum/status_effect/buff/feraldebuff
	id = "feraldebuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/feraldebuff
	effectedstats = list(STATKEY_PER = -5, STATKEY_SPD = -2, STATKEY_STR = -4, STATKEY_WIL = -4, STATKEY_CON = -3)

/datum/status_effect/buff/feraldebuff/process()

	.=..()
	var/area/rogue/our_area = get_area(owner)
	if(!(our_area.town_area))
		owner.remove_status_effect(/datum/status_effect/buff/feraldebuff)


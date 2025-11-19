/datum/advclass/bogguardsman/wildsoul
	name = "Domesticated Wildsoul"
	tutorial = "You were once upon a time part of the wild. Now you have taken up the duty to protecting it, whenever because of the safety and curiosity of the settlement that you now serve, longing for a purpose, or merely being part of something greater and a concentrated effort, the safety of the roads for these fragile towners and traders rest in your hands and claws. Keep your cradle safe and free of riff raffs, together with your more civilized allies."
	outfit = /datum/outfit/job/roguetown/bogguardsman/wildsoul
	category_tags = list(CTAG_WARDEN)
	traits_applied = list(TRAIT_CRITICAL_RESISTANCE, TRAIT_CIVILIZEDBARBARIAN, TRAIT_STRONGBITE, TRAIT_FERAL, TRAIT_NATURAL_ARMOR, TRAIT_WOODSMAN)
	subclass_stats = list(
		STATKEY_STR = 4,
		STATKEY_INT = -3,
		STATKEY_WIL = 3,
		STATKEY_SPD = -2,
		STATKEY_CON = 4
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
	)

/datum/outfit/job/roguetown/bogguardsman/wildsoul

/datum/outfit/job/roguetown/bogguardsman/wildsoul/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets
	beltl = /obj/item/rogueweapon/huntingknife/stoneknife
	H.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/natural_armor/heavy(H)
	beltl = /obj/item/storage/keyring/guard
	beltr = /obj/item/signal_horn
	give_feral_eyes(H)
	

/datum/outfit/job/roguetown/bogguardsman/wildsoul/proc/give_feral_eyes(mob/living/carbon/human/man)
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

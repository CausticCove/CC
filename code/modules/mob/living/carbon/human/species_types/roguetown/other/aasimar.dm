/mob/living/carbon/human/species/aasimar
	race = /datum/species/aasimar

/datum/species/aasimar
	name = "Aasimar"
	id = "aasimar"
	origin_default = /datum/virtue/origin/otava
	origin = "Otava"
	base_name = "Godtouched"
	desc_title = "Aasimar"
	desc = "Aasimar are born of a rare union between Humens and Angels. \
	They bear the mark of their celestial touch through their many varying physical features. \
	Their looks resemble the traditional characteristics of whichever of the Gods their Angel parent was associated with. \
	Most commonly, Aasimar are similar to Humens, albeit taller, and commonly possess an uncanny beauty. \
	When compared to the average Humen, they have strangely colored skin and are more physically frail. \
	Because of their upbringing, they make for natural conduits for godly powers. \
	Azure Peak's populace holds them with a mixture of uneasy mixture of fear and respect. \
	Due to their celestial nature, it is widely believed that an Aasimar's death is a bad omen..."

	max_age = "???"

	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = TRUE
	disliked_food = NONE
	liked_food = NONE
	possible_ages = ALL_AGES_LIST
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
	allowed_body_builds = STANDARD_BODY_BUILDS
	default_body_build_m = BODY_BUILD_BULKY
	default_body_build_f = BODY_BUILD_SLIM
	race_bonus = list(STAT_FORTUNE = 1)
	enflamed_icon = "widefire"
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/bodypart_feature/legwear,
		/datum/customizer/bodypart_feature/piercing,
		/datum/customizer/organ/testicles/anthro,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/breasts/human,
		/datum/customizer/organ/vagina/human_anthro,
		/datum/customizer/organ/wings/anthro,
		/datum/customizer/organ/ears/wings,
		/datum/customizer/organ/horns/wings,
		/datum/customizer/organ/snout/wings,
		//Caustic edit
		/datum/customizer/organ/belly/human,
		/datum/customizer/organ/butt/human,
		//Caustic edit end
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
		/datum/body_marking_set/belly,
		/datum/body_marking_set/bellysocks,
		/datum/body_marking_set/tiger,
		/datum/body_marking_set/tiger_dark,
		/datum/body_marking_set/gradient,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks, //Azure > Hearth
		/datum/body_marking/eyeliner,
		/datum/body_marking/tonage,
	)
	languages = list(
		/datum/language/common,
		/datum/language/celestial
	)

	custom_selection = list(
		"+1 FOR" = STATKEY_LCK,
		"+1 INT" = STATKEY_INT,
		"+1 CON" = STATKEY_CON,
		"+1 WIL" = STATKEY_WIL,
		"+1 PER" = STATKEY_PER,
		"No Hunger & Thirst" = TRAIT_NOHUNGER
	)
	mechanics_explanations = list("Are the only race whose lux is already purified when extracted. However, their lux takes far longer to regrow than every other races.")

/datum/species/aasimar/after_creation(mob/living/carbon/C)
	..()
	to_chat(C, "<span class='info'>I can speak Celestial with ,c before my speech.</span>")

/datum/species/aasimar/get_skin_list()
	return list(
		"Cultor" = SKIN_COLOR_CULTOR,
		"Spiritus" = SKIN_COLOR_SPIRITUS,
		"Planetar" = SKIN_COLOR_PLANETAR,
		"Deva"	   = SKIN_COLOR_DEVA,
		"Solar" = SKIN_COLOR_SOLAR,
		"Empyrea" = SKIN_COLOR_EMPYREA,
		"Gaeia" = SKIN_COLOR_GAEIA,
		"Celestial" = SKIN_COLOR_CELESTIAL,
		"Olympia" = SKIN_COLOR_OLYMPIA,
		"Necral" = SKIN_COLOR_NECRAL,
		"Abyssal" = SKIN_COLOR_ABYSSAL,
		//Caustic edit
		"Ruinous" = SKIN_COLOR_RUINOUS,
		"Godshadowed" = SKIN_COLOR_GODSHADOWED,
		"Rememberance" = SKIN_COLOR_REMEMBERANCE,
		"Contemplative" = SKIN_COLOR_CONTEMPLATIVE
		//Caustic edit end
	)

/datum/species/aasimar/get_hairc_list()
	return sortList(list(
	"white - silver" = "d3d9e3",
	"white - alabaster" = "fffffc",
	"white - skies" = "a1b4d4",
	"yellow - sunlight" = "f3f797",
	"red - flame" = "ab4637"
	))

/datum/species/tieberian/random_name(gender,unique,lastname)

	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/aasm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/aasf.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/other/aasm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/other/aasf.txt") )
	return randname

/datum/species/aasimar/random_surname()
	return

/datum/species/aasimar/get_string_bonus_stats(return_null_if_no_stats = FALSE, end_with_glue = FALSE)
	return ..(TRUE, TRUE) + "CHOOSE: +1 bonus stat of your choosing, OR No Hunger & Thirst"

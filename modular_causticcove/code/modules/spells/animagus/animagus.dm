/obj/effect/proc_holder/spell/self/animagus // Mostly experimental. Shameless rip of druid's wild shape. Hopefully, I can tailor this to be a more arcane themed spell
	name = "Animagus Form"
	desc = "Take on the form of an animal."
	overlay_state = "zad"
	clothes_req = FALSE
	human_req = FALSE
	chargedrain = 0
	chargetime = 5 SECONDS
	recharge_time = 30 SECONDS
	cooldown_min = 50
	invocations = list("")
	invocation_type = "shout"
	action_icon_state = "shapeshift"

	var/list/possible_shapes = list(
		/mob/living/carbon/human/species/animagus/cat,
		/mob/living/carbon/human/species/animagus/zad
	)

/obj/effect/proc_holder/spell/self/animagus/cast(list/targets, mob/living/carbon/human/user = usr)
	. = ..()

	if(user.has_status_effect(/datum/status_effect/debuff/submissive))
		to_chat(user, span_warning("Your will is too broken to change form."))
		return FALSE

	if(istype(user, /mob/living/carbon/human/species/animagus))
		user.animagus_untransform()
		return FALSE

	var/list/choices = list()

	for(var/mob/living/carbon/human/species/animagus/shape as anything in possible_shapes)
		var/icon/icon = icon(shape.wildshape_icon, shape.wildshape_icon_state)

		var/size_x = icon.Width()
		var/size_y = icon.Height()

		var/image/icon_img = image(icon)

		icon_img.pixel_x = -(size_x / 2) + 16
		icon_img.pixel_y = -(size_y / 2) + 16
		
		choices[shape.name] = icon_img

	var/new_animagus_type = show_radial_menu(user, user, choices)

	if(!new_animagus_type)
		revert_cast()
		return FALSE

	user.Stun(30)
	user.Knockdown(30)
	INVOKE_ASYNC(user, TYPE_PROC_REF(/mob/living/carbon/human, animagus_transformation), GLOB.animagusshapes[new_animagus_type])

	return TRUE

// Mob itself
/mob/living/carbon/human/species/animagus
	var/datum/language_holder/stored_language
	var/list/stored_skills
	var/list/stored_experience
	var/list/stored_spells

	var/wildshape_icon
	var/wildshape_icon_state

/mob/living/carbon/human/species/animagus/proc/gain_inherent_skills() // Gotta have at least some magic skill. You keep your spells on transform.
	if(src.mind)
		src.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)

/mob/living/carbon/human/species/animagus/update_inv_gloves() //Prevents weird blood overlays
	remove_overlay(GLOVES_LAYER)
	remove_overlay(GLOVESLEEVE_LAYER)

/mob/living/carbon/human/species/animagus/update_inv_shoes() //Prevents weird blood overlays
	remove_overlay(SHOES_LAYER)

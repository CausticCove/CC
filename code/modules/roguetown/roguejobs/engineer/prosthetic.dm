/obj/item/bodypart/proc/prosthetic_attachment(var/mob/living/carbon/human/H, var/mob/user)
	if(!ishuman(H))
		return

	if(user.zone_selected != body_zone)
		to_chat(user, span_warning("[src] isn't the right type for [parse_zone(user.zone_selected)]."))
		return -1

	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if(affecting)
		return

	if(user.temporarilyRemoveItemFromInventory(src))
		attach_limb(H)
		user.visible_message(span_notice("[user] attaches [src] to [H]."))
		return 1

/////     ARMS     /////

/obj/item/bodypart/l_arm/prosthetic/woodleft
	name = "wooden left arm"
	desc = "A left arm of wood."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "pr_arm"
	item_state = "pr_arm"
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC	//allows removals
	static_icon = TRUE			//returns icon to initial icon state after removal under get_limb_icon
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 20
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 300
	sellprice = 30
	fingers = FALSE //can't swing weapons but can pick stuff up and punch
	anvilrepair = /datum/skill/craft/carpentry
	dismember_wound = /datum/wound/bruise/large

/obj/item/bodypart/l_arm/prosthetic/bronzeleft
	name = "bronze left arm"
	desc = "A replacement left arm, engineered out of bronze."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "bp_arm"
	prosthetic_prefix = "prs"
	resistance_flags = FIRE_PROOF
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	static_icon = TRUE			//returns icon to initial icon state after removal under get_limb_icon
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 110
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 350
	sellprice = 30
	fingers = TRUE // it acts like a normal arm
	anvilrepair = /datum/skill/craft/engineering
	smeltresult = /obj/item/ingot/bronze
	dismember_wound = /datum/wound/bruise/large

/obj/item/bodypart/l_arm/prosthetic/attack(mob/living/M, mob/user)
	prosthetic_attachment(M, user)

/obj/item/bodypart/r_arm/prosthetic/woodright
	name = "wooden right arm"
	desc = "A right arm of wood."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "pr_arm"
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	static_icon = TRUE			//returns icon to initial icon state after removal under get_limb_icon
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 40
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 300
	sellprice = 30
	fingers = FALSE //can't swing weapons but can pick stuff up and punch
	anvilrepair = /datum/skill/craft/carpentry
	dismember_wound = /datum/wound/bruise/large

/obj/item/bodypart/r_arm/prosthetic/bronzeright
	name = "bronze right arm"
	desc = "A replacement right arm, engineered out of bronze."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "bp_arm"
	prosthetic_prefix = "prs"
	resistance_flags = FIRE_PROOF
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	static_icon = TRUE			//returns icon to initial icon state after removal under get_limb_icon
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 220
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 350
	sellprice = 30
	fingers = TRUE // it acts like a normal arm
	anvilrepair = /datum/skill/craft/engineering
	smeltresult = /obj/item/ingot/bronze
	dismember_wound = /datum/wound/bruise/large

/obj/item/bodypart/r_arm/prosthetic/attack(mob/living/M, mob/user)
	prosthetic_attachment(M, user)

/////     LEGS     /////

/obj/item/bodypart/l_leg/prosthetic
	name = "wooden left leg"
	desc = "A left leg made of wood."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "pr_leg"
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	static_icon = TRUE			//returns icon to initial icon state after removal under get_limb_icon
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 40
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 300
	sellprice = 30
	anvilrepair = /datum/skill/craft/carpentry
	dismember_wound = /datum/wound/bruise/large

/obj/item/bodypart/l_leg/prosthetic/bronzeleft
	name = "bronze left leg"
	desc = "A replacement left leg, engineered out of bronze."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "bp_leg"
	prosthetic_prefix = "prs"
	resistance_flags = FIRE_PROOF
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 220
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 350
	sellprice = 30
	anvilrepair = /datum/skill/craft/engineering
	smeltresult = /obj/item/ingot/bronze

/obj/item/bodypart/l_leg/prosthetic/attack(mob/living/M, mob/user)
	prosthetic_attachment(M, user)

/obj/item/bodypart/r_leg/prosthetic
	name = "wooden right leg"
	desc = "A right leg made of wood."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "pr_leg"
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	static_icon = TRUE			//returns icon to initial icon state after removal under get_limb_icon
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 40
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 300
	sellprice = 30
	anvilrepair = /datum/skill/craft/carpentry
	dismember_wound = /datum/wound/bruise/large

/obj/item/bodypart/r_leg/prosthetic/bronzeright
	name = "bronze right leg"
	desc = "A replacement right leg, engineered out of bronze."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "bp_leg"
	prosthetic_prefix = "prs"
	resistance_flags = FIRE_PROOF
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	static_icon = TRUE			//returns icon to initial icon state after removal under get_limb_icon
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 220
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 350
	sellprice = 30
	anvilrepair = /datum/skill/craft/engineering
	smeltresult = /obj/item/ingot/bronze


/obj/item/bodypart/r_leg/prosthetic/attack(mob/living/M, mob/user)
	prosthetic_attachment(M, user)
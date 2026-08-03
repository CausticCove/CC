/obj/item/clothing/suit/roguetown/armor/regenerating/skin/natural_armor //Reworked to see if it functions better while utilizing the armor/regenerating/skin type instead.
	name = "natural armor"
	desc = ""
	slot_flags = null
	body_parts_covered = COVERAGE_FULL_BODY_ACTUAL
	body_parts_inherent = COVERAGE_FULL_BODY_ACTUAL
	armor = ARMOR_PADDED_BAD
	blade_dulling = DULLING_BASHCHOP
	sewrepair = FALSE
	max_integrity = ARMOR_INT_CHEST_CIVILIAN
	item_flags = DROPDEL

	repairmsg_begin = "My natural armour begins to slowly mend itself..."
	repairmsg_continue = "My natural armour mends some of its abuse.."
	repairmsg_stop = "My natural armour stops mending from the onslaught!"
	repairmsg_end = "My natural armour has fully repaired itself!"
	var/repairmsg_toohungry = "I'm too hungry to continue mending my natural armor!"
	var/repairmsg_nohungry = "With that meal, I can feel my natural armor growing stronger again!"

	var/regen_cost = 2
	interrupt_damount = 15
	repair_time = 30 SECONDS

	var/mob/living/carbon/human/skin_haver

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/natural_armor/dense
	name = "dense natural armor"
	max_integrity = ARMOR_INT_CHEST_MEDIUM_SCALE // The classes that get this also have crit resistance and decent con as is. Might still need to lower this if they can infinitely tank anyways.
	armor = ARMOR_BRONZE
	blocksound = CHAINHIT //gonna see if this sound helps differentiate it from the light nat armor

	regen_cost = 2
	interrupt_damount = 25

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/natural_armor/Initialize(mapload)
	. = ..()
	skin_haver = loc
	trait_add(skin_haver)
	return

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/natural_armor/Destroy()
	trait_remove(skin_haver)
	. = ..()

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/natural_armor/proc/trait_add(mob/living/user)
	skin_haver = user
	ADD_TRAIT(skin_haver, TRAIT_NATURAL_ARMOR, TRAIT_GENERIC)
	return

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/natural_armor/proc/trait_remove(mob/living/user)
	skin_haver = user
	REMOVE_TRAIT(skin_haver, TRAIT_NATURAL_ARMOR, TRAIT_GENERIC)
	return

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/natural_armor/armour_regen()
	if(HAS_TRAIT_FROM(skin_haver, TRAIT_NOHUNGER, TRAIT_VIRTUE)) // Hard coding the incompatibility of deathless' hunger removal, since domesticated wildsoul can still have deathless. Can still be nobreath through other sources.
		REMOVE_TRAIT(skin_haver, TRAIT_NOHUNGER, TRAIT_VIRTUE)
		to_chat(skin_haver, span_danger("My natural armor awakens a hunger in me."))

	if(skin_haver.nutrition <= NUTRITION_LEVEL_HUNGRY) //If you are getting hungry, lets just end repairing early.
		reptimer = null

		if(obj_integrity >= max_integrity) //It COULD be already fixed though, too
			to_chat(loc, span_notice(repairmsg_end))
		else
			to_chat(loc, span_notice(repairmsg_toohungry))

		return

	var/repair_amount = ..()

	if(repair_amount > 0)
		//Every 1 point of integrity is 2 points of hunger
		skin_haver.adjust_nutrition(-repair_amount * regen_cost)

/obj/item/clothing/suit/roguetown/armor/regenerating/skin/natural_armor/proc/restart_regen()
	if(obj_integrity >= max_integrity)
		return

	if(!reptimer)
		// If relative repair mode is on, use the interval instead of repairing 20% every repair_time seconds
		var/wait_time = relative_repair_mode ? relative_repair_interval : repair_time

		to_chat(loc, span_notice(repairmsg_nohungry))
		reptimer = addtimer(CALLBACK(src, PROC_REF(armour_regen)), wait_time, TIMER_OVERRIDE|TIMER_UNIQUE|TIMER_STOPPABLE)

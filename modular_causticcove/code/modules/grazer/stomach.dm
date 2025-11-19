/obj/item/organ/stomach/grazer
	name = "grazer stomach"
	desc = "In addition to being able to hold and digest normal food, this one is all well suited for processing grass and other fibers"
	var/datum/action/item_action/organ_action/use/grazer/graze

/obj/item/organ/stomach/grazer/Destroy()
	QDEL_NULL(graze)
	return ..()

/obj/item/organ/stomach/grazer/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(QDELETED(graze))
		graze = new(src)
	graze.Grant(M)

/obj/item/organ/stomach/grazer/Remove(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(QDELETED(graze))
		return
	graze.Remove(M)


/datum/action/item_action/organ_action/use/grazer
	name = "Graze"
	desc = "Graze for food"
	
/datum/action/item_action/organ_action/use/grazer/Trigger()
	var/turf/ownerturf = get_turf(owner)
	for(var/maybegrass in ownerturf.contents)
		if(istype(maybegrass,/obj/structure/flora/roguegrass))
			owner.visible_message(span_notice("[owner] begins to graze the shrub..."))
			if(do_after(owner,2 SECONDS))
				owner.reagents.add_reagent(/datum/reagent/consumable/nutriment, 3) //Equal to basically an apple per shrub
				qdel(maybegrass)
	if((istype(ownerturf, /turf/open/floor/rogue/grass) || istype(ownerturf, /turf/open/floor/rogue/grassred) || istype(ownerturf, /turf/open/floor/rogue/grassyel) || istype(ownerturf, /turf/open/floor/rogue/grasscold)))
		owner.visible_message(span_notice("[owner] begins to graze the grass..."))
		if(do_after(owner, 20 SECONDS))
			ownerturf.ChangeTurf(/turf/open/floor/rogue/dirt, flags = CHANGETURF_INHERIT_AIR)
			owner.reagents.add_reagent(/datum/reagent/consumable/nutriment, 20) //2m^2 of grass is 10-12 MJ, an apple is 300 KJ on verage, this means it S H O U L D be 110 nutriment, but walancejak

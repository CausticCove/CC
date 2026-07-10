/obj/item/reagent_containers/food/snacks/rogue/egg
	icon = 'modular/Neu_Food/icons/cooked/cooked_egg.dmi'
	name = "egg"
	desc = "A raw egg."
	icon_state = "egg"
	dropshrink = 0.8
	list_reagents = list(/datum/reagent/consumable/eggyolk = 5)
	cooked_type = null
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/friedegg/fried
	filling_color = "#F0E68C"
	foodtype = MEAT
	grind_results = list()
	rotprocess = SHELFLIFE_SHORT

	var/fertile = FALSE

/obj/item/reagent_containers/food/snacks/rogue/egg/rot()
	..()
	if(fertile)
		if(isturf(loc))
			//CC Edit: Technically we rot every minute, so it's futile to do amount grown, because even in worst case scenario, that's 600 amount grown every tick milord.
			/*amount_grown += rand(1,2)
			if(amount_grown >= 100)*/
			visible_message(span_notice("[src] hatches with a quiet cracking sound."))
			new /mob/living/simple_animal/chick(get_turf(src))
			STOP_PROCESSING(SSobj, src)
			qdel(src)


/obj/item/reagent_containers/food/snacks/rogue/egg/become_rotten()
	. = ..()
	if(.)
		fertile = FALSE


/obj/item/reagent_containers/food/snacks/rogue/egg/Crossed(mob/living/carbon/human/H)
	..()
	if(istype(H))
		var/turf/T = get_turf(src)
		var/obj/O = new /obj/effect/decal/cleanable/food/egg_smudge(T)
		O.pixel_x = rand(-8,8)
		O.pixel_y = rand(-8,8)
		visible_message("<span class='warning'>[H] crushes [src] underfoot.</span>")
		qdel(src)


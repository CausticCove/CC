/mob/living/carbon/human/species/human/northern/bum/boss
	d_intent = INTENT_PARRY
	dodgetime = 10 //CC Edit - Slippery Bastard.

/mob/living/carbon/human/species/human/northern/bum/boss/after_creation()
	..()
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/vagrant_boss)

//The KING
/datum/outfit/job/roguetown/vagrant_boss/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(25))
		head = /obj/item/clothing/head/roguetown/knitcap
	else
		head = /obj/item/clothing/head/roguetown/helmet/leather

	if(prob(50))
		cloak = /obj/item/clothing/cloak/raincloak/brown
	else
		cloak = /obj/item/clothing/cloak/raincloak/furcloak/crafted

	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l

	if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/leather
	else
		armor = /obj/item/clothing/suit/roguetown/armor/leather/hide

	if(prob(80))
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	else//Proper gloves!
		gloves = null

	if(prob(80))
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	else//Stole a pair of bracers!
		wrists = /obj/item/clothing/wrists/roguetown/bracers

//Again, roll for weapon. If any.
	if(prob(25))
		r_hand = /obj/item/rogueweapon/mace/spiked
		l_hand = /obj/item/rogueweapon/shield/wood
	else if(prob(25))
		r_hand = /obj/item/rogueweapon/sword/iron
		l_hand = /obj/item/rogueweapon/shield/wood

	H.STASTR = 14
	H.STASPD = 8
	H.STACON = 14
	H.STAWIL = 14
	H.STAINT = 1

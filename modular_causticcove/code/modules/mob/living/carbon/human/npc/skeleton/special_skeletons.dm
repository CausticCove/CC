/mob/living/carbon/human/species/skeleton/npc/special/vile_doctor
	dodgetime = 15 //Moves a lot
	d_intent = INTENT_DODGE //Expert in this
	threat_point = THREAT_ELITE

/mob/living/carbon/human/species/skeleton/npc/special/vile_doctor/after_creation()
	. = ..()
	equipOutfit(/datum/outfit/job/roguetown/skeleton/npc/vile_doctor)

/mob/living/carbon/human/species/skeleton/npc/special/disgraced_noble
	dodgetime = 15 //Moves a lot
	threat_point = THREAT_ELITE

/mob/living/carbon/human/species/skeleton/npc/special/disgraced_noble/after_creation()
	. = ..()
	equipOutfit(/datum/outfit/job/roguetown/skeleton/npc/disgraced_noble)

/mob/living/carbon/human/species/skeleton/npc/special/mad_duke

/mob/living/carbon/human/species/skeleton/npc/special/mad_duke/after_creation()
	. = ..()
	equipOutfit(/datum/outfit/job/roguetown/skeleton/npc/mad_duke)

/datum/outfit/job/roguetown/skeleton/npc/vile_doctor/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 12
	H.STACON = 5 //Fragile to mages/sunders
	H.STAWIL = 10
	H.STASPD = 14 // that dagger WILL get thru ur parry.
	H.STAINT = 10 //Miniboss, lets them do fients + specials
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC) //Unique fighting style
	name = "Vile Doctor"
	belt = /obj/item/storage/belt/rogue/leather/black
	mask = /obj/item/clothing/mask/rogue/physician/plaguebearer //Tougher face armor only otherwise on wretches, also unique loot for defeating them
	head = /obj/item/clothing/head/roguetown/physician
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/physician
	pants = /obj/item/clothing/under/roguetown/trou/leather/courtphysician
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	neck = /obj/item/clothing/neck/roguetown/coif/padded
	r_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/rondel
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)

/datum/outfit/job/roguetown/skeleton/npc/disgraced_noble/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 12 // stabs quick, stabs strong.
	H.STACON = 8
	H.STAWIL = 10
	H.STASPD = 12 //Lets them keep the pace a bit against dodgers.
	H.STAINT = 12 //Miniboss, lets them do fients + specials, better than doctor at fients/resisting them
	name = "Disgraced Ancient Noble"
	var/skeletonclass = rand(0,2) // lets shake it up a little :3
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	l_hand = /obj/item/rogueweapon/sword/rapier/dec
	pants = /obj/item/clothing/under/roguetown/platelegs/aalloy
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/aalloy/heavy
	wrists = /obj/item/clothing/wrists/roguetown/bracers/aalloy
	neck = /obj/item/clothing/neck/roguetown/coif/padded //Tougher
	head = /obj/item/clothing/head/roguetown/chaperon/noble/evil

	if(skeletonclass == 0) // "standard"
		id = /obj/item/clothing/ring/onyxa
		mask = /obj/item/clothing/mask/rogue/sack
		gloves = /obj/item/clothing/gloves/roguetown/chain/aalloy
		cloak = /obj/item/clothing/cloak/half/red
	if(skeletonclass == 1)
		id = /obj/item/clothing/ring/gold// slightly better
		r_hand = /obj/item/rogueweapon/shield/tower/metal/alloy // and a shield to go with it
		mask = /obj/item/clothing/mask/rogue/sack
		gloves = /obj/item/clothing/gloves/roguetown/plate/aalloy
		cloak = /obj/item/clothing/cloak/half/orange
	if(skeletonclass == 2)
		id = /obj/item/clothing/ring/coral // +30 value compared to onyx btw
		H.adjust_skillrank(H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)) // hardest, probably
		mask = /obj/item/clothing/mask/rogue/facemask // nose crits not as easy
		gloves = /obj/item/clothing/gloves/roguetown/chain/aalloy
		cloak = /obj/item/clothing/cloak/cape/purple

	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)

/datum/outfit/job/roguetown/skeleton/npc/mad_duke/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 14 // stabs quick, stabs strong.
	H.STAPER = 16
	H.STACON = 16
	H.STAWIL = 20
	H.STASPD = 14
	H.STAINT = 8
	name = "The Mad Duke"
	id = /obj/item/clothing/ring/ruby
	mask = /obj/item/clothing/mask/rogue/facemask/goldmask
	belt = /obj/item/storage/belt/rogue/leather/plaquegold/steward
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	r_hand = /obj/item/clothing/neck/roguetown/psicross/inhumen/g
	l_hand = /obj/item/rogueweapon/sword/rapier/lord
	pants = /obj/item/clothing/under/roguetown/platelegs/paalloy
	shirt = /obj/item/clothing/suit/roguetown/shirt/dress/royal/prince
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/paalloy
	wrists = /obj/item/clothing/wrists/roguetown/bracers/paalloy
	head = /obj/item/clothing/head/roguetown/crown/mad_duke_crown
	cloak = /obj/item/clothing/cloak/lordcloak
	neck = /obj/item/clothing/neck/roguetown/chaincoif/paalloy
	gloves = /obj/item/clothing/gloves/roguetown/plate/paalloy
	H.adjust_skillrank(/datum/skill/combat/polearms, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)

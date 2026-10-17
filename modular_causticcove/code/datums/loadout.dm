//Loadout Items

#define ARMOR_LOADOUT_CLOTHING list("blunt" = 20, "slash" = 20, "stab" = 20, "piercing" = 0, "fire" = 0)

/datum/loadout_item/sizespell //I'd have this even further up the list if I could, but I don't want to needlessly edit the Azure loadouts
	name = "scroll of enlarge and reduce"
	path = /obj/item/book/granter/spell/sizespell/loadout

/datum/loadout_item/mirror_transform
    name = "scroll of mirrored transform"
    path = /obj/item/book/granter/spell/mirror_transform/loadout

/obj/item/clothing/head/roguetown/mentorhat/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/suit/roguetown/armor/basiceast/mentorsuit/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/mask/rogue/facemask/yoruku_kitsune/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/mask/rogue/facemask/yoruku_oni/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/head/roguetown/mentorhat/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/gloves/roguetown/eastgloves1/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants1/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/head/roguetown/grenzelhofthat/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/gloves/roguetown/angle/grenzelgloves/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/under/roguetown/heavy_leather_pants/grenzelpants/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/shoes/roguetown/grenzelhoft/loadout
	armor = ARMOR_LOADOUT_CLOTHING

/obj/item/clothing/suit/roguetown/armor/brigandine/heavy/triumph
	name = "brigandine with plate"
	desc = "A brigandine cuirass covered with an additional layer of plate armor. </br><i>'Henry's \
	come to see us!'</i>"
	icon_state = "heavybrig"
	icon = 'icons/clothing/donor_clothes.dmi'
	mob_overlay_icon = 'icons/clothing/onmob/donor_clothes.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

//Eastern

/datum/loadout_item/mentorhat
	name = "bamboo hat"
	path = /obj/item/clothing/head/roguetown/mentorhat/loadout

/datum/loadout_item/mentorsuit
	name = "old doboo Robe"
	path = /obj/item/clothing/suit/roguetown/armor/basiceast/mentorsuit/loadout

/datum/loadout_item/yorukuhood
	name = "shadowed hood"
	path =  /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/yoruku

/datum/loadout_item/kitsunemask
	name = "kitsune mask"
	path = /obj/item/clothing/mask/rogue/facemask/yoruku_kitsune/loadout

/datum/loadout_item/onimask
	name = "oni mask"
	path = /obj/item/clothing/mask/rogue/facemask/yoruku_oni/loadout

/datum/loadout_item/easterngloves
	name = "eastern gloves"
	path = /obj/item/clothing/gloves/roguetown/eastgloves1/loadout

/datum/loadout_item/easternpants
	name = "eastern pants"
	path = /obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants1/loadout

//Grenzelhoft

/datum/loadout_item/grenzelhofthat
	name = "grenzelhoft hat"
	path = /obj/item/clothing/head/roguetown/grenzelhofthat/loadout

/datum/loadout_item/grenzelhoftshirt
	name = "grenzelhoftian hip-shirt"
	path = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft/loadout

/datum/loadout_item/grenzelhoftgloves
	name = "grenzelhoftian gloves"
	path = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves/loadout

/datum/loadout_item/grenzelhoftpants
	name = "grenzelhoftian paumpers"
	path = /obj/item/clothing/under/roguetown/heavy_leather_pants/grenzelpants/loadout

/datum/loadout_item/grenzelhoftboots
	name = "grenzelhoftian boots"
	path = /obj/item/clothing/shoes/roguetown/grenzelhoft/loadout

//Leashes for weird people

/datum/loadout_item/leash
	name = "rope leash"
	path = /obj/item/leash/

/datum/loadout_item/leash_leather
	name = "leather leash"
	path = /obj/item/leash/leather

/datum/loadout_item/leash_chain
	name = "chain leash"
	path = /obj/item/leash/chain

/datum/loadout_item/artificers_cap
	name = "artificer's cap"
	path = /obj/item/clothing/head/roguetown/articap

//Reform Gem option in the Loadout!

/datum/loadout_item/reform_gem
	name = "reformation gem"
	path = /obj/item/reformation_gem
	cost = 0 //Make it free to grab! It's a scene tool after all.

//Accessability of most Universal Donor-type items for regular players, with all necessary permissions granted.

/datum/loadout_item/verified
	triumph_cost = 1
	sort_category = "Verified"

/datum/loadout_item/verified/universal/azurosa
	name = "Gift - Azurosa Flower"
	path = /obj/item/alch/rosa/azure

/datum/loadout_item/verified/universal/azurosa_seeds
	name = "Gift - Azurosa Flower, Seeds"
	path = /obj/item/storage/belt/rogue/pouch/azurosa_seeds

/datum/loadout_item/verified/universal/azurosa_crown
	name = "Gift - Azurosa Flowers, Crown"
	path = /obj/item/flowercrown/rosa/azure

/datum/loadout_item/verified/universal/azurosa_bouquet
	name = "Gift - Azurosa Flowers, Bouquet"
	path = /obj/item/bouquet/rosa/azure

/datum/loadout_item/verified/universal/cackledagger
	name = "Gift - Kit, Cackledagger"
	path = /obj/item/enchantingkit/cackledagger

/datum/loadout_item/verified/universal/longsword
	name = "Gift - Kit, Elegant Longsword"
	path = /obj/item/enchantingkit/weapon/donator_longsword

/datum/loadout_item/verified/universal/longsword_imbued
	name = "Gift - Kit, Imbued Longsword"
	path = /obj/item/enchantingkit/weapon/donator_imbuedlongsword

/datum/loadout_item/verified/universal/cloak_goldmaillekini
	name = "Gift - Golden Maillekini"
	path = /obj/item/clothing/cloak/donator_goldmaillekini

/datum/loadout_item/verified/universal/maille_chainkini
	name = "Gift - Kit, Maillekini"
	path = /obj/item/enchantingkit/maillekini

/datum/loadout_item/verified/universal/highheelshoes
	name = "Gift - High-Heeled Shoes"
	path = /obj/item/clothing/shoes/roguetown/simpleshoes/heels

/datum/loadout_item/verified/universal/highheelshoes_gold
	name = "Gift - High-Heeled Shoes, Gold"
	path = /obj/item/clothing/shoes/roguetown/simpleshoes/heels/donator_gold

/datum/loadout_item/verified/universal/highheelshoes_silver
	name = "Gift - High-Heeled Shoes, Silver"
	path = /obj/item/clothing/shoes/roguetown/simpleshoes/heels/donator_silver

/datum/loadout_item/verified/universal/elegant_armory
	name = "Gift - Kit, Elegant Armory"
	path = /obj/item/enchantingkit/donator_universal_armory

/datum/loadout_item/verified/universal/elegant_whip
	name = "Gift - Kit, Elegant Whip"
	path = /obj/item/enchantingkit/weapon/donator_universal_whips

/datum/loadout_item/verified/universal/elegant_urumi
	name = "Gift - Kit, Elegant Urumi"
	path = /obj/item/enchantingkit/weapon/donator_universal_urumi

/datum/loadout_item/verified/universal/elegant_shield
	name = "Gift - Kit, Elegant Shield"
	path = /obj/item/enchantingkit/donator_universal_shield

/datum/loadout_item/verified/universal/grenzshortsword
	name = "Gift - Kit, Katzbalger Shortsword"
	path = /obj/item/enchantingkit/weapon/donator_universal_grenzshortsword

/datum/loadout_item/verified/universal/grenzrapier
	name = "Gift - Kit, Smallsword-Style Rapier"
	path = /obj/item/enchantingkit/donator_universal_grenzrapier

/datum/loadout_item/verified/universal/cuirassplackart
	name = "Gift - Kit, Armored Plackart"
	path = /obj/item/enchantingkit/plackart

/datum/loadout_item/verified/universal/jadehalfmask_donator
	name = "Gift - Kit, Jade Halfask"
	path = /obj/item/enchantingkit/jadehalfmask

/datum/loadout_item/verified/universal/maille_cropped
	name = "Gift - Kit, Cropped Haubergeon"
	path = /obj/item/enchantingkit/croppedhaubergeon

/datum/loadout_item/verified/universal/maille_throwback
	name = "Gift - Kit, Elven Haubergeon"
	path = /obj/item/enchantingkit/elvenchainmail

/datum/loadout_item/verified/universal/cuirass_heartplate
	name = "Gift - Kit, Heartplate"
	path = /obj/item/enchantingkit/heartplate

/datum/loadout_item/verified/universal/armor_gothic_iron
	name = "Gift - Kit, Gothic Iron Armor"
	path = /obj/item/enchantingkit/gothicironarmor

/datum/loadout_item/verified/universal/armor_gothic_steel
	name = "Gift - Kit, Gothic Steel Armor"
	path = /obj/item/enchantingkit/gothicsteelarmor

/datum/loadout_item/verified/universal/armor_gothic_burgeonet
	name = "Gift - Kit, Gothic Burgeonet"
	path = /obj/item/enchantingkit/gothicburgeonet

/datum/loadout_item/verified/universal/armor_gothic_psydonic
	name = "Gift - Kit, Gothic Psydonic Cuirass"
	path = /obj/item/enchantingkit/gothicpsydoniccuirass

/datum/loadout_item/verified/universal/armor_gothic_sallet
	name = "Gift - Kit, Gothic Sallet"
	path = /obj/item/enchantingkit/gothicsallet

/datum/loadout_item/verified/universal/cuirass_throwback
	name = "Gift - Kit, Heroic Leather Cuirass"
	path = /obj/item/enchantingkit/heroicleathercuirass

/datum/loadout_item/verified/universal/armor_triheartfelt
	name = "Gift - Kit, Diplomat's Plate Armor"
	path = /obj/item/enchantingkit/triheartfelt

/datum/loadout_item/verified/universal/headpiece_decoration
	name = "Gift - Oathtaker's Orle"
	path = /obj/item/clothing/head/roguetown/decoration/orle

/datum/loadout_item/verified/universal/headpiece_oathkeeperdeclone
	name = "Gift - Oathtaker's Decoration, Standalone"
	path = /obj/item/clothing/head/roguetown/decoration/orle/donator_oathkeeper/crest

/datum/loadout_item/verified/universal/cloak_oathkeeperlong
	name = "Gift - Oathtaker's Noble Longcoat"
	path = /obj/item/clothing/cloak/tabard/stabard/surcoat/donator_oathkeeper

/datum/loadout_item/verified/universal/cloak_oathkeepershort
	name = "Gift - Oathtaker's Noble Shortcoat"
	path = /obj/item/clothing/cloak/tabard/stabard/donator_oathkeeper

/datum/loadout_item/verified/universal/headpiece_oathkeeperdec
	name = "Gift - Oathtaker's Decoration, Shieldcrest"
	path = /obj/item/clothing/head/roguetown/decoration/orle/donator_oathkeeper

/datum/loadout_item/verified/universal/headpiece_greatplume
	name = "Gift - Helmet Cosmetic, Greatplume"
	path = /obj/item/clothing/head/roguetown/decoration/greatplume

/datum/loadout_item/verified/universal/headpiece_featherplume
	name = "Gift - Helmet Cosmetic, Featherplume"
	path = /obj/item/clothing/head/roguetown/decoration/featherplume

/datum/loadout_item/verified/universal/headpiece_crestplume
	name = "Gift - Helmet Cosmetic, Crestplume"
	path = /obj/item/clothing/head/roguetown/decoration/crestplume

/datum/loadout_item/verified/universal/armorpiece_shoulderguard
	name = "Gift - Armor Cosmetic, Shoulderguard"
	path = /obj/item/clothing/cloak/tabard/stabard/donator_shoulderguard

/datum/loadout_item/verified/universal/headpiece_orle
	name = "Gift - Helmet Cosmetic, Orle"
	path = /obj/item/clothing/head/roguetown/decoration/orle/donator_dyeable

/datum/loadout_item/verified/universal/greatcoat
	name = "Gift - Greatcoat"
	path = /obj/item/clothing/cloak/donator_greatcoat

/datum/loadout_item/verified/universal/greatcoat_dyeable
	name = "Gift - Greatcoat, Dyeable"
	path = /obj/item/clothing/cloak/donator_greatcoat/dyeable

/datum/loadout_item/verified/universal/shadedhat
	name = "Gift - Shaded Hat"
	path = /obj/item/clothing/head/roguetown/roguehood/shadedhat

/datum/loadout_item/verified/universal/brimmedhat
	name = "Gift - Brimmed Hat"
	path = /obj/item/clothing/head/roguetown/duelhat/donator_brimmedhat

/datum/loadout_item/verified/universal/beltedbackpackkit
	name = "Gift - Kit, Belted Backpack"
	path = /obj/item/enchantingkit/beltedbackpack

/datum/loadout_item/verified/universal/doublet
	name = "Gift - Doublet"
	path = /obj/item/clothing/suit/roguetown/shirt/doublet

/datum/loadout_item/verified/universal/doublet_apoth
	name = "Gift - Doublet, Pale Green"
	path = /obj/item/clothing/suit/roguetown/shirt/apothshirt/donator

/datum/loadout_item/verified/universal/belt
	name = "Gift - Belt of Caped Leather"
	path = /obj/item/storage/belt/rogue/leather/donator //If-or-when the aforementioned bug's fixed, replace this with /obj/item/enchantingkit/beltleather.

/datum/loadout_item/verified/universal/belt_fur
	name = "Gift - Belt of Caped Fur"
	path = /obj/item/storage/belt/rogue/leather/donator_fur //If-or-when the aforementioned bug's fixed, replace this with /obj/item/enchantingkit/beltfur.

/datum/loadout_item/verified/universal/belt_bronze
	name = "Gift - Belt of Bronze Maille"
	path = /obj/item/storage/belt/rogue/leather/donator_bronze

/datum/loadout_item/verified/universal/belt_iron
	name = "Gift - Belt of Iron Maille"
	path = /obj/item/storage/belt/rogue/leather/donator_iron //If-or-when the aforementioned bug's fixed, replace this with /obj/item/enchantingkit/beltironmaille.

/datum/loadout_item/verified/universal/belt_steel
	name = "Gift - Belt of Maille"
	path = /obj/item/storage/belt/rogue/leather/donator_steel //If-or-when the aforementioned bug's fixed, replace this with /obj/item/enchantingkit/beltsteelmaille.

/datum/loadout_item/verified/universal/belt_leathergirdle
	name = "Gift - Belted Girdle of Leather"
	path = /obj/item/storage/belt/rogue/leather/donator_leathergirdle

/datum/loadout_item/verified/universal/belt_bronzegirdle
	name = "Gift - Belted Plackart of Bronze"
	path = /obj/item/storage/belt/rogue/leather/donator_bronzegirdle

/datum/loadout_item/verified/universal/belt_irongirdle
	name = "Gift - Belted Plackart of Iron"
	path = /obj/item/storage/belt/rogue/leather/donator_irongirdle

/datum/loadout_item/verified/universal/belt_steelgirdle
	name = "Gift - Belted Plackart of Steel"
	path = /obj/item/storage/belt/rogue/leather/donator_steelgirdle

/datum/loadout_item/verified/universal/armorpiece_shoulderguard
	name = "Gift - Armor Cosmetic, Shoulderguard"
	path = /obj/item/clothing/cloak/tabard/stabard/donator_shoulderguard

/datum/loadout_item/verified/universal/armorpiece_armharness
	name = "Gift - Armor Cosmetic, Arm Harness"
	path = /obj/item/enchantingkit/donator_universal_armharness

/datum/loadout_item/verified/universal/heelkit
	name = "Gift - Armor Cosmetic, Heelification Elixir"
	path = /obj/item/heelkit

/datum/loadout_item/verified/universal/donator_cropped_gambeson
	name = "Gift - Kit, Cropped Gambeson"
	path = /obj/item/enchantingkit/donator_cropped_gambeson

/datum/loadout_item/verified/universal/donator_jacketed_gambeson_short
	name = "Gift - Kit, Short Jacketed Gambeson"
	path = /obj/item/enchantingkit/donator_jacketed_gambeson_short

/datum/loadout_item/verified/universal/donator_jacketed_gambeson_long
	name = "Gift - Kit, Long Jacketed Gambeson"
	path = /obj/item/enchantingkit/donator_jacketed_gambeson_long

/datum/loadout_item/verified/universal/donator_heavybrig
	name = "Gift - Brigandine with Plate"
	path = /obj/item/enchantingkit/triumph_armorkit_heavybrig

/datum/loadout_item/verified/universal/armorpiece_decapauldron
	name = "Gift - Armor Cosmetic, Decablessed Pauldrons"
	path = /obj/item/enchantingkit/donator_universal_decapauldron

/datum/loadout_item/verified/universal/armorpiece_steelpauldron
	name = "Gift - Armor Cosmetic, Steel Pauldrons"
	path = /obj/item/enchantingkit/donator_universal_steelpauldron

/datum/loadout_item/verified/universal/donator_brimmedhat
	name = "Gift - Brimmed Hat"
	path = /obj/item/clothing/head/roguetown/duelhat/donator_brimmedhat

/datum/loadout_item/verified/universal/donator_avantynehelm
	name = "Gift - Kit, Avantyne-Threaded Barbute"
	path = /obj/item/enchantingkit/donator_avantynehelm

/datum/loadout_item/verified/universal/donator_shawl
	name = "Gift - Scarfed Shawl"
	path = /obj/item/clothing/head/roguetown/shawl/donator

/datum/loadout_item/verified/universal/donator_rockhillarmet
	name = "Gift - Kit, Knight-Errant's Armet"
	path = /obj/item/enchantingkit/donator_rockhillarmet

/datum/loadout_item/verified/universal/donator_rockhillmaile
	name = "Gift - Kit, Jacketed Plate-and-Maille"
	path = /obj/item/enchantingkit/donator_rockhillmaille

/datum/loadout_item/verified/universal/donator_drowgoggles
	name = "Gift - Kit, Skikuldic Goggles"
	path = /obj/item/clothing/mask/rogue/spectacles/iron/drow

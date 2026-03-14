/datum/crafting_recipe/roguetown/leather/leash
	name = "leather leash"
	result = /obj/item/leash/leather
	reqs = list(
	/obj/item/natural/hide/cured = 1, 
	/obj/item/natural/fibers = 1,)
	craftdiff = 1
	tools = list()
	structurecraft = null

/datum/crafting_recipe/roguetown/armor/guncloak  
    name = "pistol bandolier"
    reqs = list(
        /obj/item/natural/hide/cured = 6,
        /obj/item/rope = 1,
        /obj/item/natural/cloth = 1,
        /obj/item/natural/fibers = 1,)
    result = /obj/item/clothing/suit/roguetown/armor/guncloak
    craftdiff = 1  
    tools = list(/obj/item/needle)
    structurecraft = /obj/machinery/tanningrack
    skillcraft = /datum/skill/craft/tanning

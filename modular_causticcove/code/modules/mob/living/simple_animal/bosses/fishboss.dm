/mob/living/simple_animal/hostile/boss/fishboss/better_loot

/mob/living/simple_animal/hostile/boss/fishboss/better_loot/death()
	src.visible_message("<span class='warning'>The bloated, grotesque fishman explodes in a shower of gore!</span>","<span class='warning'>The bloated, grotesque fishman explodes in a shower of gore!</span>")
	src.spawn_gibs()
	src.spawn_gibs()
	src.spawn_gibs()
	new/obj/item/rogueweapon/mace/goden/deepduke(src.drop_location())
	new/obj/effect/spawner/lootdrop/blacksteel_equipment_spawner(src.drop_location())
	var/jewelry_ammount = rand(1,6)
	for(var/i =1 to jewelry_ammount)
		new/obj/effect/spawner/lootdrop/valuable_jewelry_spawner(src.drop_location())
	if(prob(30))
		new /obj/item/book/granter/arcane_aspect/magic/minor(src.drop_location())
	if(prob(30))
		new /obj/item/book/granter/arcane_aspect/magic/major(src.drop_location())
	qdel(src)
	return

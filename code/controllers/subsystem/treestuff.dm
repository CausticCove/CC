SUBSYSTEM_DEF(treesetup)
	name = "treesetup"
	//CC Edit Begin
	init_order = INIT_ORDER_TREESETUP
	flags = SS_NO_FIRE
	//CC Edit End

	var/list/initialize_me = list()

/datum/controller/subsystem/treesetup/Initialize(timeofday)
	InitializeTrees()
	return ..()

/datum/controller/subsystem/treesetup/proc/InitializeTrees()
	for(var/A in initialize_me)
		var/obj/structure/flora/newtree/T = A
		T.build_branches()

	for(var/A in initialize_me)
		var/obj/structure/flora/newtree/T = A
		T.build_leafs()

	initialize_me = list()

/atom/movable
	var/autotransferable = TRUE // Toggle for autotransfer mechanics.
	var/belly_cycles = 0 // Counting current belly process cycles for autotransfer.

/atom/movable/proc/dropInto(var/atom/destination)
	while(istype(destination))
		var/atom/drop_destination = destination.onDropInto(src)
		if(!istype(drop_destination) || drop_destination == destination)
			return forceMove(destination)
		destination = drop_destination
	return moveToNullspace()

/atom/movable/onDropInto(var/atom/movable/AM)
	return loc // If onDropInto returns something, then dropInto will attempt to drop AM there.

// Helper procs called on entering/exiting a belly. Does nothing by default, override on children for special behavior.
/atom/movable/proc/enter_belly(obj/belly/B)
	return

/atom/movable/proc/exit_belly(obj/belly/B)
	return
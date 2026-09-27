/obj/effect/proc_holder/spell/targeted/turf_teleport
	name = "Turf Teleport"
	desc = ""
	nonabstract_req = TRUE

	var/inner_tele_radius = 1
	var/outer_tele_radius = 2

	var/include_space = FALSE //whether it includes space tiles in possible teleport locations
	var/include_dense = FALSE //whether it includes dense tiles in possible teleport locations
	var/include_teleport_restricted = FALSE //whether it includes tiles restricted from normal teleportation
	var/sound1 = 'sound/blank.ogg'
	var/sound2 = 'sound/blank.ogg'

	var/can_leave_area = TRUE //Caustic Edit - Add in a check to verify that a Turf is within an area for Bosses to utilize this teleport - but stay in their room.

/obj/effect/proc_holder/spell/targeted/turf_teleport/cast(list/targets,mob/user = usr)
	playsound(get_turf(user), sound1, 50,TRUE)
	var/area/user_area = get_area(user) //Caustic Edit - Using this to compare to a Turf's area and ensure that if they cannot leave the area they cast it in, the Turf is not a different area.
	for(var/mob/living/target in targets)
		var/list/turfs = new/list()
		for(var/turf/T in range(target,outer_tele_radius))
			if(!can_leave_area && (get_area(T) != user_area)) //Caustic Edit - Check if the Area of this possible destination is the same as the user's area. If not, they cannot TP here!
				continue
			if(T in range(target,inner_tele_radius))
				continue
			if(T.density && !include_dense)
				continue
			if(T.teleport_restricted && !include_teleport_restricted)
				continue
			if(T.x>world.maxx-outer_tele_radius || T.x<outer_tele_radius)
				continue	//putting them at the edge is dumb
			if(T.y>world.maxy-outer_tele_radius || T.y<outer_tele_radius)
				continue
			turfs += T

		if(!turfs.len)
			var/list/turfs_to_pick_from = list()
			for(var/turf/T in orange(target,outer_tele_radius))
				if(!(T in orange(target,inner_tele_radius)))
					turfs_to_pick_from += T
			turfs += pick(/turf in turfs_to_pick_from)

		var/turf/picked = pick(turfs)

		if(!picked || !isturf(picked))
			return

		if(do_teleport(user, picked, forceMove = TRUE, channel = TELEPORT_CHANNEL_MAGIC))
			playsound(get_turf(user), sound1, 50,TRUE)

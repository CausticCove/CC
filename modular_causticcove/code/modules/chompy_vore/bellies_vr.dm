//
// Bellies subsystem - Process vore bellies
//

PROCESSING_SUBSYSTEM_DEF(bellies)
	name = "Bellies"
	wait = 6 SECONDS
	flags = SS_KEEP_TIMING|SS_NO_INIT
	runlevels = RUNLEVEL_GAME|RUNLEVEL_POSTGAME

/datum/controller/subsystem/processing/bellies/Recover()
	log_runtime("[name] subsystem Recover().")
	var/list/old_processing = SSbellies.processing.Copy()
	for(var/datum/D in old_processing)
		if(!isbelly(D))
			log_runtime("[name] subsystem Recover() found inappropriate item in list: [D.type]")

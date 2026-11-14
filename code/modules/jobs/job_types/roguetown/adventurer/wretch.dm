// Wretch, soft antagonists. Giving them 9 points as stat (matching mercs) on average since they're a driving antagonist on AP or assistant antagonist.
/datum/job/roguetown/wretch
	title = "Wretch"
	flag = WRETCH
	department_flag = ANTAGONIST
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	
	tutorial = "Somewhere in your lyfe, you fell to the wrong side of civilization. Hounded by the consequences of your actions, you spend your daes prowling the roads for easy marks and loose purses, scraping to get by."
	outfit = null
	outfit_female = null
	display_order = JDO_WRETCH
	show_in_credits = FALSE
	min_pq = 20 // CC Edit - 20 PQ as opposed to 10 PQ by default
	max_pq = null

	obsfuscated_job = TRUE
	class_categories = TRUE

	advclass_cat_rolls = list(CTAG_WRETCH = 20)
	PQ_boost_divider = 10
	round_contrib_points = 2

	announce_latejoin = FALSE
	wanderer_examine = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = FALSE
	same_job_respawn_delay = 1 MINUTES
	virtue_restrictions = list(/datum/virtue/heretic/zchurch_keyholder) //all wretch classes automatically get this
	job_traits = list(TRAIT_STEELHEARTED, TRAIT_OUTLAW, TRAIT_HERESIARCH, TRAIT_SELF_SUSTENANCE, TRAIT_ZURCH)
	job_subclasses = list(
		/datum/advclass/wretch/licker,
		/datum/advclass/wretch/deserter,
		/datum/advclass/wretch/deserter/generic,
		/datum/advclass/wretch/berserker,
		/datum/advclass/wretch/roguemage,
		/datum/advclass/wretch/necromancer,
		/datum/advclass/wretch/heretic,
		/datum/advclass/wretch/heretic/spy,
		/datum/advclass/wretch/outlaw,
		/datum/advclass/wretch/poacher,
		/datum/advclass/wretch/plaguebearer,
		/datum/advclass/wretch/pyromaniac,
		/datum/advclass/wretch/vigilante,
		/datum/advclass/wretch/munitioneer,
		/datum/advclass/wretch/pariah,
		/datum/advclass/wretch/heretic_spellblade,
		/datum/advclass/wretch/ancient_spellblade,
		/datum/advclass/wretch/ancient_deathknight
	)
	has_subprefs = TRUE
	default_subprefs = list("bounty_poster_key" = null, "bounty_severity_key" = null, "my_crime" = null, "favorite_advclass" = null)

// for future viewers, here's how you add subprefs to a job. adventurer provides a simpler example for how to merely add subclass favoriting.
/datum/job/roguetown/wretch/Topic(href, list/href_list)
	var/client/C = usr.client // gettin the usual vars setup
	if(!C || !C.prefs)
		return
	var/list/roleprefs = get_roleprefs(C)
	if(href_list["poster"]) // here, we handle the actual user input. in this case, poster is a tgui select
		var/list/poster_choices = list()
		for(var/key in GLOB.bounty_posters)
			poster_choices[GLOB.bounty_posters[key]] = key
		roleprefs["bounty_poster_key"] = poster_choices[tgui_input_list(usr, "Who placed a bounty on you?", "Bounty Poster", poster_choices)]
		update_subprefs_window(usr) // make sure to call this every time you change data so the ui will actually reflect it!
	if(href_list["severity"]) // ...and same for severity
		var/list/sev_choices = list()
		for(var/key in GLOB.wretch_severities)
			sev_choices[GLOB.wretch_severities[key]] = key
		roleprefs["bounty_severity_key"] = sev_choices[tgui_input_list(usr, "How severe are your crimes?", "Bounty Amount", sev_choices)]
		update_subprefs_window(usr)
	if(href_list["crime"])
		roleprefs["my_crime"] = tgui_input_text(usr, "What is your crime?", "Crime", roleprefs["my_crime"], multiline=TRUE, encode=FALSE) // this is filtered with html_encode later; doing so twice would lead to strangeness
		update_subprefs_window(usr)
	. = ..()

// this is where we put the actual window setup. it'll be called once each update, to keep the information up-to-date, so just read from prefs n display it
/datum/job/roguetown/wretch/update_subprefs_window(mob/user)
	var/client/C = usr.client
	if(!C || !C.prefs)
		return
	var/list/roleprefs = get_roleprefs(C)
	var/datum/advclass/favorite = roleprefs["favorite_advclass"] // note that this key is shared between a bunch of different things n is treated specially. if it's set, you'll automatically try to roll that subclass
	var/favorite_name = favorite ? favorite::name : "Choose"
	var/HTML = {"
		<i>You can choose a favorite subclass here. You'll automatically select this subclass on roundstart if possible.</i><br/><br/>
		<b>Selected class:</b> <a href="?src=[REF(src)];class=1">[favorite_name]</a><br/><br/>
		<i>Set your [title]-specific bounty here. If a global bounty is set, this will override it.</i><br><i>Any fields set here will not prompt you at roundstart.</i><br/><br/>
		<b>Bounty Poster:</b> <a href="?src=[REF(src)];poster=1">[roleprefs["bounty_poster_key"]?GLOB.bounty_posters[roleprefs["bounty_poster_key"]]:"Unset"]</a><br/>
		<b>Bounty Severity:</b> <a href="?src=[REF(src)];severity=1">[roleprefs["bounty_severity_key"]?GLOB.wretch_severities[roleprefs["bounty_severity_key"]]:"Unset"]</a><br/>
		<b>Bounty Reason:</b> <a href="?src=[REF(src)];crime=1">[roleprefs["my_crime"]?"Edit":"Unset"]</a><br/>
		[roleprefs["my_crime"]?"<hr/>[roleprefs["my_crime"]]<hr/>":""]<br/>
		<center><a href="?src=[REF(src)];subprefsexit=1">EXIT</a>\t\t<a href="?src=[REF(src)];subprefsreset=1">RESET</a></center>
	"}
	// the fact that the window width/height will be different each time is the main reason this isn't all done in a parent proc on /datum/job
	var/datum/browser/popup = new(user, "[JOB_SUBPREFS_WINDOW_ID]", "<div align='center'>[title] Preferences</div>", 500, 500)
	popup.set_content(HTML)
	popup.open(FALSE)
	if(winexists(usr, "[JOB_SUBPREFS_WINDOW_ID]"))
		winset(usr, "[JOB_SUBPREFS_WINDOW_ID]", "focus=true")

/datum/job/roguetown/wretch/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		// Assign wretch antagonist datum so wretches appear in antag list
		if(H.mind && !H.mind.has_antag_datum(/datum/antagonist/wretch))
			var/datum/antagonist/new_antag = new /datum/antagonist/wretch()
			H.mind.add_antag_datum(new_antag)

// Proc for wretch to select a bounty
/proc/wretch_select_bounty(mob/living/carbon/human/H)
	var/datum/preferences/P = H?.client?.prefs
	var/bounty_poster_key
	var/bounty_severity_key
	var/my_crime
	var/list/roleprefs = P?.job_subprefs?["Wretch"]
	if(roleprefs && length(roleprefs))
		bounty_poster_key = roleprefs["bounty_poster_key"]
		bounty_severity_key = roleprefs["bounty_severity_key"]
		my_crime = roleprefs["my_crime"]
	else if(P?.preset_bounty_enabled)
		bounty_poster_key = P.preset_bounty_poster_key
		bounty_severity_key = P.preset_bounty_severity_key
		my_crime = P.preset_bounty_crime

	if(bounty_poster_key && !GLOB.bounty_posters[bounty_poster_key])
		bounty_poster_key = null

	if(bounty_severity_key && !GLOB.wretch_bounty_severities[bounty_severity_key])
		bounty_severity_key = null

	if(!bounty_poster_key)
		var/list/poster_choices = list()
		for(var/key in GLOB.bounty_posters)
			poster_choices[GLOB.bounty_posters[key]] = key
		var/choice = input(H, "Who placed a bounty on you?", "Bounty Poster") as anything in poster_choices
		bounty_poster_key = poster_choices[choice]

	if(!bounty_severity_key)
		var/list/sev_choices = list()
		for(var/key in GLOB.wretch_bounty_severities)
			sev_choices[GLOB.wretch_bounty_severities[key]["name"]] = key
		var/choice = input(H, "How severe are your crimes?", "Bounty Amount") as anything in sev_choices
		bounty_severity_key = sev_choices[choice]

	var/bounty_poster = GLOB.bounty_posters[bounty_poster_key]

	var/list/sev_data = GLOB.wretch_bounty_severities[bounty_severity_key]
	var/bounty_total = rand(sev_data["min"], sev_data["max"])
	if(bounty_severity_key == "ATROCITY")
		if(bounty_poster_key == "AZURIA")
			GLOB.outlawed_players += H.real_name
		else
			GLOB.excommunicated_players += H.real_name
	if(!my_crime)
		my_crime = input(H, "What is your crime?", "Crime") as text|null
	if(!my_crime)
		my_crime = "crimes against the Crown"

	var/race = H.dna.species
	var/gender = H.gender
	var/list/d_list = H.get_mob_descriptors()

	var/descriptor_height = build_coalesce_description_nofluff(
		d_list, H, list(MOB_DESCRIPTOR_SLOT_HEIGHT), "%DESC1%"
	)
	var/descriptor_body = build_coalesce_description_nofluff(
		d_list, H, list(MOB_DESCRIPTOR_SLOT_BODY), "%DESC1%"
	)
	var/descriptor_voice = build_coalesce_description_nofluff(
		d_list, H, list(MOB_DESCRIPTOR_SLOT_VOICE), "%DESC1%"
	)
	add_bounty(H.real_name, race, gender, descriptor_height, descriptor_body, descriptor_voice, bounty_total, FALSE, my_crime, bounty_poster)
	to_chat(H, span_danger("You are NOT an Antagonistic role. You are at most a 'soft-antag'. You are an outcast, an outlaw or a heretic. You are unwanted by society and potentially wanted with a bounty. Play this role in good faith and understand that sowing too much chaos will lead to consequences. This role does not give you the go ahead to attack others without warning, frag or spam skeletons in town. Your goal as a wretch is to pursue your personal goals and reach the end of the week alive and not in captivity. Remember this is HRP. ")) //Caustic Cove Edit

/proc/update_wretch_slots()
	var/datum/job/wretch_job = SSjob.GetJob("Wretch")
	if(!wretch_job)
		return

	var/player_count = length(GLOB.joined_player_list)
	var/slots = 8 //Caustic edit, static 8 slots
	
	//Add 1 slot for every 10 players over 30. Less than 40 players, 5 slots. 40 or more players, 6 slots. 50 or more players, 7 slots - etc.
	if(player_count > 40)
		var/extra = floor((player_count - 40) / 10)
		slots += extra

	slots = min(slots, 8) //Caustic edit, static 8 slots

	wretch_job.total_positions = slots
	wretch_job.spawn_positions = slots

/datum/job/roguetown/mercenary
	title = "Mercenary"
	flag = MERCENARY
	department_flag = SIDEFOLK
	faction = "Station"
	total_positions = 8
	spawn_positions = 8
	allowed_sexes = list(MALE, FEMALE)

	tutorial = "Blood stains your hands and the coins you hold. You are a sell-sword, a mercenary, a contractor of war. Where you come from, what you are, who you serve.. none of it matters. What matters is that the mammon flows to your pocket."
	display_order = JDO_MERCENARY
	selection_color = JCOLOR_WANDERER
	min_pq = 5 //CC Edit - From 3 to 5 Please don't be advent+ //Will be handled by classes if PQ limiting is needed. --But Until then, learn escalation, mercs.
	max_pq = null
	round_contrib_points = 1
	townie_contract_gate_exempt = TRUE
	outfit = null	//Handled by classes
	outfit_female = null
	advclass_cat_rolls = list(CTAG_MERCENARY = 20)
	job_traits = list(TRAIT_STEELHEARTED)
	always_show_on_latechoices = TRUE
	class_categories = TRUE
	job_subclasses = list(
		/datum/advclass/mercenary/anthrax,
		/datum/advclass/mercenary/anthrax_assassin,
		/datum/advclass/mercenary/atgervi,
		/datum/advclass/mercenary/atgervi_shaman,
		/datum/advclass/mercenary/etrusca_condottiero,
		/datum/advclass/mercenary/etrusca_balestrieri,
		/datum/advclass/mercenary/desert_rider,
		/datum/advclass/mercenary/desert_rider_zeybek,
		/datum/advclass/mercenary/desert_rider_sahir,
		/datum/advclass/mercenary/desert_rider_almah,
		/datum/advclass/mercenary/forlorn,
		/datum/advclass/mercenary/vaquero,
		/datum/advclass/mercenary/freelancer,
		/datum/advclass/mercenary/freelancer_lancer,
		/datum/advclass/mercenary/freelancer_sabrist,
		/datum/advclass/mercenary/grenzelhoft,
		/datum/advclass/mercenary/grenzelhoft_halberdier,
		/datum/advclass/mercenary/grenzelhoft_crossbowman,
		/datum/advclass/mercenary/grenzelhoft_mage,
		/datum/advclass/mercenary/grenzelhoft/fencer, //CC ADD - This might be a little busted cause of AP ports
		/datum/advclass/mercenary/gronn,
		/datum/advclass/mercenary/gronn_heavy,
		/datum/advclass/mercenary/routier,
		/datum/advclass/mercenary/rumaclan,
		/datum/advclass/mercenary/rumaclan_sasu,
		/datum/advclass/mercenary/hangyaku,
		/datum/advclass/mercenary/chonin,
		/datum/advclass/mercenary/seonjang,
		///Caustic edit
		/datum/advclass/mercenary/shrine_priest,
		///Caustic edit end
		/datum/advclass/mercenary/shrine_guardian, //CC ADD
		/datum/advclass/mercenary/steppesman,
		/datum/advclass/mercenary/warscholar,
		/datum/advclass/mercenary/warscholar_pontifex,
		/datum/advclass/mercenary/warscholar_vizier,
		/datum/advclass/mercenary/blackoak,
		/datum/advclass/mercenary/blackoak_ranger,
		/datum/advclass/mercenary/blackoak_adept,
		/datum/advclass/mercenary/underdweller,
		/datum/advclass/mercenary/grudgebearer,
		/datum/advclass/mercenary/grudgebearer_soldier,
		/datum/advclass/mercenary/trollslayer,
		/datum/advclass/mercenary/lirvanmerc
	)
	has_subprefs = TRUE

/datum/job/roguetown/mercenary/Topic(href, list/href_list)
	var/client/C = usr.client
	if(!C)
		return
	var/datum/preferences/prefs = C.prefs
	if(!prefs)
		return
	if(!prefs.job_subprefs || !islist(prefs.job_subprefs))
		prefs.job_subprefs = list()
	if(!prefs.job_subprefs[title])
		prefs.job_subprefs[title] = list("favorite_advclass" = null)
	var/list/roleprefs = prefs.job_subprefs[title]

	if(href_list["class"])
		var/list/class_sel = list()
		for(var/ctag in advclass_cat_rolls)
			var/list/subsystem_ctag_list = SSrole_class_handler.sorted_class_categories[ctag]
			for(var/datum/advclass/advdatum in subsystem_ctag_list)
				class_sel[advdatum.name] = advdatum.type
		roleprefs["favorite_advclass"] = class_sel[tgui_input_list(usr, "What path do your talents follow?", "Subclass Select", class_sel)]
		update_subprefs_window(usr)
	if(href_list["subprefsreset"])
		prefs.job_subprefs[title] = list("favorite_advclass" = null)
		update_subprefs_window(usr)
	. = ..()

/datum/job/roguetown/mercenary/update_subprefs_window(mob/user)
	var/client/C = usr.client
	if(!C)
		return
	var/datum/preferences/prefs = C.prefs
	if(!prefs)
		return
	if(!prefs.job_subprefs || !islist(prefs.job_subprefs))
		prefs.job_subprefs = list()
	if(!prefs.job_subprefs[title])
		prefs.job_subprefs[title] = list("favorite_advclass" = null)
	var/list/roleprefs = prefs.job_subprefs[title]
	var/datum/advclass/favorite = roleprefs["favorite_advclass"]
	var/favorite_name = favorite ? favorite::name : "Choose"
	var/HTML = {"
		<i>You can choose a favorite subclass here. You'll automatically select this subclass on roundstart if possible.</i><br/><br/>
		<b>Selected class:</b> <a href="?src=[REF(src)];class=1">[favorite_name]</a>
		<center><a href="?src=[REF(src)];subprefsexit=1">EXIT</a>\t\t<a href="?src=[REF(src)];subprefsreset=1">RESET</a></center>
	"}
	// the fact that the window width/height will be different each time is the main reason this isn't all done in a parent proc on /datum/job
	var/datum/browser/popup = new(user, "[JOB_SUBPREFS_WINDOW_ID]", "<div align='center'>[title] Preferences</div>", 500, 250)
	popup.set_content(HTML)
	popup.open(FALSE)
	if(winexists(usr, "[JOB_SUBPREFS_WINDOW_ID]"))
		winset(usr, "[JOB_SUBPREFS_WINDOW_ID]", "focus=true")

/datum/job/roguetown/mercenary/after_spawn(mob/living/L, mob/M, latejoin = FALSE)
	..()
	if(L && ishuman(L))
		var/mob/living/carbon/human/H = L
		if(!H.mind)
			return

		// Get the mercenary statue from SSroguemachine
		var/obj/structure/roguemachine/talkstatue/mercenary/statue = SSroguemachine.mercenary_statue
		if(!statue && SSroguemachine.mercenary_statues.len)
			statue = SSroguemachine.mercenary_statues[1]
		if(statue)
			// Send a message with a clickable link to register remotely
			to_chat(M, span_boldnotice("I sense a mercenary statue calling out to me..."))
			to_chat(M, span_notice("<a href='?src=[REF(statue)];register=[REF(H)]'>Touch the statue from afar</a> to register myself as available for contract."))

			// Store the registration request
			statue.pending_registrations[H.key] = H

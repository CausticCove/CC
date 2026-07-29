GLOBAL_LIST_EMPTY(billagerspawns)

GLOBAL_VAR_INIT(adventurer_hugbox_duration, 40 SECONDS)
GLOBAL_VAR_INIT(adventurer_hugbox_duration_still, 3 MINUTES)

/datum/job/roguetown/adventurer
	title = "Adventurer"
	flag = ADVENTURER
	department_flag = WANDERERS
	faction = "Station"
	total_positions = 20
	spawn_positions = 20

	tutorial = "Hero of nothing, a wanderer in foreign lands in search of fame and riches. Whatever led you to this fate is up to the wind to decide, and you've never fancied yourself for much other than the thrill. Some day your pride is going to catch up to you, and you're going to find out why most men don't end up in the annals of history."
	class_categories = TRUE
	townie_contract_gate_exempt = TRUE

	outfit = null
	outfit_female = null

	display_order = JDO_ADVENTURER
	selection_color = JCOLOR_WANDERER
	show_in_credits = FALSE
	min_pq = 0
	max_pq = null

	advclass_cat_rolls = list(CTAG_ADVENTURER = 20)
	PQ_boost_divider = 10

	announce_latejoin = FALSE
	wanderer_examine = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = TRUE
	same_job_respawn_delay = 1 MINUTES

	cmode_music = 'sound/music/cmode/adventurer/combat_outlander2.ogg'

	job_subclasses = list(
		/datum/advclass/cleric,
		/datum/advclass/cleric/paladin,
		/datum/advclass/cleric/cantor,
		/datum/advclass/cleric/missionary,
		/datum/advclass/sfighter,
		/datum/advclass/sfighter/duelist,
		/datum/advclass/sfighter/mhunter,
		/datum/advclass/sfighter/barbarian,
		/datum/advclass/sfighter/ironclad,
		/datum/advclass/rogue,
		/datum/advclass/rogue/thief,
		/datum/advclass/rogue/bard,
		/datum/advclass/rogue/swashbuckler,
		/datum/advclass/rogue/antiquarian,
		/datum/advclass/mystic,
		/datum/advclass/mystic/resilientsoul,
		/datum/advclass/mystic/holyblade,
		/datum/advclass/mage,
		/datum/advclass/mage/spellsinger,
		/datum/advclass/mage/spellblade,
		/datum/advclass/mage/spellfist,
		/datum/advclass/ranger,
		/datum/advclass/ranger/wayfarer,
		/datum/advclass/ranger/bombadier,
		/datum/advclass/ranger/bwanderer,
		/datum/advclass/noble,
		/datum/advclass/noble/knighte,
		/datum/advclass/noble/squire,
		/datum/advclass/foreigner,
		/datum/advclass/foreigner/yoruku,
		/datum/advclass/foreigner/repentant,
		/datum/advclass/foreigner/refugee,
		/datum/advclass/foreigner/slaver,
		///Caustic edit
		/datum/advclass/mage/spellthief,
		/datum/advclass/rogue/buccaneer,
		///Caustic edit end
		/datum/advclass/foreigner/shepherd,
		/datum/advclass/foreigner/fencerguy,
		/datum/advclass/foreigner/bronzeclad,
		/datum/advclass/foreigner/lesserblackoak,
		//CC edit
		/datum/advclass/foreigner/otava_maid,
		//CC edit end
	)
	has_subprefs = TRUE

/datum/job/roguetown/adventurer/Topic(href, list/href_list)
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

	if(href_list["subprefsreset"])
		prefs.job_subprefs[title] = list("favorite_advclass" = null)
		update_subprefs_window(usr)
	. = ..()

/datum/job/roguetown/adventurer/update_subprefs_window(mob/user)
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

/datum/status_effect/advclass_selection
	id = "advclass_selection"
	duration = -1
	tick_interval = 2 SECONDS
	alert_type = null

/datum/status_effect/advclass_selection/on_apply()
	. = ..()
	owner.Stun(5 SECONDS)

/datum/status_effect/advclass_selection/tick()
	var/mob/living/carbon/human/H = owner
	if(!istype(H) || !H.advsetup)
		qdel(src)
		return
	H.Stun(5 SECONDS)

/datum/status_effect/advclass_selection/on_remove()
	if(owner)
		owner.SetStun(0)

/mob/living/carbon/human/proc/set_advsetup(new_value)
	if(advsetup == new_value)
		return
	advsetup = new_value
	if(advsetup)
		apply_status_effect(/datum/status_effect/advclass_selection)
	else
		remove_status_effect(/datum/status_effect/advclass_selection)

/mob/living/carbon/human/proc/adv_hugboxing_start()
	to_chat(src, span_warning("I will be in danger once I start moving."))
	status_flags |= GODMODE
	ADD_TRAIT(src, TRAIT_PACIFISM, HUGBOX_TRAIT)
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(adv_hugboxing_moved))
	//Lies, it goes away even if you don't move after enough time
	if(GLOB.adventurer_hugbox_duration_still)
		addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_end)), GLOB.adventurer_hugbox_duration_still)

/mob/living/carbon/human/proc/adv_hugboxing_moved()
	UnregisterSignal(src, COMSIG_MOVABLE_MOVED)
	to_chat(src, span_danger("I have [DisplayTimeText(GLOB.adventurer_hugbox_duration)] to begone!"))
	addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_end)), GLOB.adventurer_hugbox_duration)

/mob/living/carbon/human/proc/adv_hugboxing_end()
	if(QDELETED(src))
		return
	//hugbox already ended
	if(!(status_flags & GODMODE))
		return
	status_flags &= ~GODMODE
	REMOVE_TRAIT(src, TRAIT_PACIFISM, HUGBOX_TRAIT)
	to_chat(src, span_danger("My joy is gone! Danger surrounds me."))

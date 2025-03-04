GLOBAL_LIST_EMPTY(billagerspawns)

GLOBAL_VAR_INIT(adventurer_hugbox_duration, 40 SECONDS)
GLOBAL_VAR_INIT(adventurer_hugbox_duration_still, 3 MINUTES)

/datum/job/roguetown/adventurer
	title = "Adventurer"
	flag = ADVENTURER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	allowed_races = RACES_ALL_KINDSPLUS
	tutorial = "Hero of nothing, or some things perhaps. You are the Lifeblood of this Adventurer-City. No matter whom or what it is you serve; The Dream-Hold has respected those who fight the darkness since as long as any can remember."


	outfit = null
	outfit_female = null

	display_order = JDO_ADVENTURER
	show_in_credits = TRUE
	min_pq = 0
	max_pq = null

	advclass_cat_rolls = list(CTAG_ADVENTURER = 30)
	PQ_boost_divider = 10

	give_bank_account = TRUE
	wanderer_examine = FALSE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = TRUE

/datum/job/roguetown/adventurer/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

		if(GLOB.adventurer_hugbox_duration)
			///FOR SOME RETARDED FUCKING REASON THIS REFUSED TO WORK WITHOUT A FUCKING TIMER IT JUST FUCKED SHIT UP
			addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_start)), 1)

/mob/living/carbon/human/proc/adv_hugboxing_start()
	to_chat(src, span_warning("I will be in danger once I start moving."))
	status_flags |= GODMODE
	ADD_TRAIT(src, TRAIT_PACIFISM, TRAIT_GENERIC)
	ADD_TRAIT(src, HUGBOX_TRAIT, TRAIT_GENERIC)
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
	REMOVE_TRAIT(src, TRAIT_PACIFISM, TRAIT_GENERIC)
	REMOVE_TRAIT(src, HUGBOX_TRAIT, TRAIT_GENERIC)
	to_chat(src, span_danger("My joy is gone! Danger surrounds me."))

/datum/job/roguetown/towner
	title = "Towner"
	flag = TOWNER
	department_flag = UNAFFILIATED
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	allowed_races = RACES_ALL_KINDSPLUS
	tutorial = "You've lived in this shithole for effectively all your life. You are not an explorer, nor exactly a warrior in many cases. You're just some average poor bastard who thinks they'll be something someday."
	advclass_cat_rolls = list(CTAG_TOWNER = 20)
	outfit = null
	outfit_female = null
	bypass_lastclass = TRUE
	banned_leprosy = FALSE
	display_order = JDO_TOWNER
	give_bank_account = TRUE
	min_pq = -20
	max_pq = null
	wanderer_examine = FALSE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	same_job_respawn_delay = 0


/datum/job/roguetown/towner/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/*
/datum/job/roguetown/adventurer/villager/New()
	. = ..()
	for(var/X in GLOB.peasant_positions)
		peopleiknow += X
		peopleknowme += X
	for(var/X in GLOB.yeoman_positions)
		peopleiknow += X
	for(var/X in GLOB.church_positions)
		peopleiknow += X
	for(var/X in GLOB.garrison_positions)
		peopleiknow += X
	for(var/X in GLOB.noble_positions)
		peopleiknow += X*/

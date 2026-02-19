/datum/job/artisan
	title = "Artisan"
	tutorial = "You are a skilled craftsperson whose trade keeps Rivermist Hollow alive.."
	department_flag = TOWN
	faction = FACTION_TOWN
	total_positions = 8
	spawn_positions = 8
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_ARTISAN

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST

	selection_color = JCOLOR_TOWN
	advclass_cat_rolls = list(CAT_ARTISAN = 20)

	give_bank_account = 5
	job_subclasses = list(
		/datum/job/advclass/artisan/blacksmith,
		/datum/job/advclass/artisan/carpenter,
		/datum/job/advclass/artisan/mason,
		/datum/job/advclass/artisan/tailor
	)

/datum/job/adventurer_druid
	title = "Adventurer Druid"
	tutorial = "Druids channel the elemental forces of nature and share a deep kinship with animals. Mastery of Wild Shape allows them to transform into beasts from all over the Realms. \
	ALLOWED PATRONS: Silvanus, Mielikki, Malar, Talos, Umberlee. \
	ALIGNED WITH NATURE, THEIR PATRONS ARE THOSE REPRESENTING LIFE, WILDERNESS, AND PRIMAL FORCES."
	department_flag = ADVENTURERS
	faction = FACTION_NEUTRAL
	total_positions = 20
	spawn_positions = 20
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_ADVENTURER_DRUID

	allowed_patrons = list(
		/datum/patron/faerun/neutral_gods/Silvanus,

		/datum/patron/faerun/good_gods/Mielikki,

		/datum/patron/faerun/evil_gods/Malar,
		/datum/patron/faerun/evil_gods/Talos,
		/datum/patron/faerun/evil_gods/Umberlee
	)


	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	advclass_cat_rolls = list(CAT_ADVENTURER_DRUID = 50)

	selection_color = JCOLOR_ADVENTURERS
	scales = TRUE

	give_bank_account = TRUE
	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC, EXP_TYPE_MAGICK)

	magic_user = TRUE
	spell_points = 30
	attunements_max = 10
	attunements_min = 5

	job_subclasses = list(
		/datum/job/advclass/combat/adventurer_druid/circle_land,
		/datum/job/advclass/combat/adventurer_druid/circle_moon,
		/datum/job/advclass/combat/adventurer_druid/troll_skin,
	)

/datum/job/adventurer_druid/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	to_chat(spawned, "<br><font color='#855b14'><span class='bold'>If I wanted to make mammons by selling my services, or completing quests, the Adventurers Guild would be a good place to start.</span></font><br>")
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_cleric()
		devotion.grant_to(spawned)

/datum/job/adventurer_druid/set_spawn_and_total_positions(count)
	// Calculate the new spawn positions
	var/new_spawn = adventurer_slot_formula(count)

	// Sync everything
	spawn_positions = new_spawn
	total_positions_so_far = new_spawn
	total_positions = new_spawn

	return spawn_positions

/datum/job/adventurer_druid/get_total_positions()
	var/slots = adventurer_slot_formula(get_total_town_members())

	if(slots <= total_positions_so_far)
		slots = total_positions_so_far
	else
		total_positions_so_far = slots

	return slots

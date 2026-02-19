/datum/job/adventurer_paladin
	title = "Adventurer Paladin"
	tutorial = "A promise made so deeply that it becomes divine in itself flows through a paladin, burning bright enough to inspire allies and smite foes. \
	ALLOWED PATRONS: Helm, Bahamut, Tyr, Torm, Lathander, Ilmater, Selune, Sune, Garl Glittergold, Mielikki, Deneir, Oghma.\
	BOUND BY OATHS, THEY MAY ONLY FOLLOW GODS WHO EMBODY LAW, JUSTICE, OR RIGHTEOUS BATTLE."
	department_flag = ADVENTURERS
	faction = FACTION_NEUTRAL
	total_positions = 20
	spawn_positions = 20
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_ADVENTURER_PALADIN

	allowed_patrons = list(
		/datum/patron/faerun/good_gods/Garl_Glittergold,
		/datum/patron/faerun/good_gods/Sune,
		/datum/patron/faerun/good_gods/Mielikki,
		/datum/patron/faerun/good_gods/Deneir,
		/datum/patron/faerun/neutral_gods/Oghma,
		/datum/patron/faerun/neutral_gods/Helm,
		/datum/patron/faerun/neutral_gods/Tempus,
		/datum/patron/faerun/neutral_gods/Mystra,
		/datum/patron/faerun/good_gods/Bahamut,
		/datum/patron/faerun/good_gods/Tyr,
		/datum/patron/faerun/good_gods/Torm,
		/datum/patron/faerun/good_gods/Lathander,
		/datum/patron/faerun/good_gods/Ilmater,
		/datum/patron/faerun/good_gods/Selune,
		/datum/patron/faerun/good_gods/Sune,
	)

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	advclass_cat_rolls = list(CAT_ADVENTURER_PALADIN = 50)

	selection_color = JCOLOR_ADVENTURERS
	scales = TRUE

	give_bank_account = TRUE
	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC)

	magic_user = TRUE
	spell_points = 20
	attunements_max = 10
	attunements_min = 5

	job_subclasses = list(
		/datum/job/advclass/combat/adventurer_paladin/immortal,
		/datum/job/advclass/combat/adventurer_paladin/conquest,
		/datum/job/advclass/combat/adventurer_paladin/crown,
		/datum/job/advclass/combat/adventurer_paladin/devotion,
		/datum/job/advclass/combat/adventurer_paladin/vengeance,
	)

/datum/job/adventurer_paladin/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	to_chat(spawned, "<br><font color='#855b14'><span class='bold'>If I wanted to make mammons by selling my services, or completing quests, the Adventurers Guild would be a good place to start.</span></font><br>")
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_templar()
		devotion.grant_to(spawned)

/datum/job/adventurer_paladin/set_spawn_and_total_positions(count)
	// Calculate the new spawn positions
	var/new_spawn = adventurer_slot_formula(count)

	// Sync everything
	spawn_positions = new_spawn
	total_positions_so_far = new_spawn
	total_positions = new_spawn

	return spawn_positions

/datum/job/adventurer_paladin/get_total_positions()
	var/slots = adventurer_slot_formula(get_total_town_members())

	if(slots <= total_positions_so_far)
		slots = total_positions_so_far
	else
		total_positions_so_far = slots

	return slots

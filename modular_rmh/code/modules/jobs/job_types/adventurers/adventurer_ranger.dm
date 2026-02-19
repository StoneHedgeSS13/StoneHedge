/datum/job/adventurer_ranger
	title = "Adventurer Ranger"
	tutorial = "Rangers are unrivalled scouts and trackers, honing a deep connection with nature in order to hunt their favoured prey."
	department_flag = ADVENTURERS
	faction = FACTION_NEUTRAL
	total_positions = 20
	spawn_positions = 20
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_ADVENTURER_RANGER

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	advclass_cat_rolls = list(CAT_ADVENTURER_RANGER = 50)

	selection_color = JCOLOR_ADVENTURERS
	scales = TRUE

	give_bank_account = TRUE
	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_COMBAT, EXP_TYPE_RANGER)

	magic_user = TRUE
	spell_points = 20
	attunements_max = 10
	attunements_min = 5

	job_subclasses = list(
		/datum/job/advclass/combat/adventurer_ranger/beastmaster,
		/datum/job/advclass/combat/adventurer_ranger/borderland_rider,
		/datum/job/advclass/combat/adventurer_ranger/dwarf_ranger,
		/datum/job/advclass/combat/adventurer_ranger/elf_caravan,
		/datum/job/advclass/combat/adventurer_ranger/elven_outrider,
		/datum/job/advclass/combat/adventurer_ranger/monster_hunter,
		/datum/job/advclass/combat/adventurer_ranger/ranger_hunter,
		/datum/job/advclass/combat/adventurer_ranger/steppe_wayfarer,
		/datum/job/advclass/combat/adventurer_ranger/steppesman,
		/datum/job/advclass/combat/adventurer_ranger/swampstalker,
		/datum/job/advclass/combat/adventurer_ranger/tabaxi_raider,
	)

/datum/job/adventurer_ranger/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	to_chat(spawned, "<br><font color='#855b14'><span class='bold'>If I wanted to make mammons by selling my services, or completing quests, the Adventurers Guild would be a good place to start.</span></font><br>")

/datum/job/adventurer_ranger/set_spawn_and_total_positions(count)
	// Calculate the new spawn positions
	var/new_spawn = adventurer_slot_formula(count)

	// Sync everything
	spawn_positions = new_spawn
	total_positions_so_far = new_spawn
	total_positions = new_spawn

	return spawn_positions

/datum/job/adventurer_ranger/get_total_positions()
	var/slots = adventurer_slot_formula(get_total_town_members())

	if(slots <= total_positions_so_far)
		slots = total_positions_so_far
	else
		total_positions_so_far = slots

	return slots

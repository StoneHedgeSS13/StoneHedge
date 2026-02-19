/datum/job/adventurer_fighter
	title = "Adventurer Fighter"
	tutorial = "Fighters have mastered the art of combat, wielding weapons with unmatched skill and wearing armour like a second skin."
	department_flag = ADVENTURERS
	faction = FACTION_NEUTRAL
	total_positions = 20
	spawn_positions = 20
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_ADVENTURER_FIGHTER

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	advclass_cat_rolls = list(CAT_ADVENTURER_FIGHTER = 50)

	selection_color = JCOLOR_ADVENTURERS
	scales = TRUE

	give_bank_account = TRUE
	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_COMBAT)

	job_subclasses = list(
		/datum/job/advclass/combat/adventurer_fighter/abyssal,
		/datum/job/advclass/combat/adventurer_fighter/amnian_merc,
		/datum/job/advclass/combat/adventurer_fighter/black_swordsman,
		/datum/job/advclass/combat/adventurer_fighter/boltslinger,
		/datum/job/advclass/combat/adventurer_fighter/bombardier_tinkerer,
		/datum/job/advclass/combat/adventurer_fighter/calishite_emir,
		/datum/job/advclass/combat/adventurer_fighter/calishite_mercenary,
		/datum/job/advclass/combat/adventurer_fighter/disgraced,
		/datum/job/advclass/combat/adventurer_fighter/dragoon,
		/datum/job/advclass/combat/adventurer_fighter/eldritch_knight,
		/datum/job/advclass/combat/adventurer_fighter/elven_blademaster,
		/datum/job/advclass/combat/adventurer_fighter/enforcer,
		/datum/job/advclass/combat/adventurer_fighter/fallen_hand,
		/datum/job/advclass/combat/adventurer_fighter/fallen_lord,
		/datum/job/advclass/combat/adventurer_fighter/lancer,
		/datum/job/advclass/combat/adventurer_fighter/hedgeknight,
		/datum/job/advclass/combat/adventurer_fighter/housecarl,
		/datum/job/advclass/combat/adventurer_fighter/longbeard,
		/datum/job/advclass/combat/adventurer_fighter/qualinesti,
		/datum/job/advclass/combat/adventurer_fighter/sellsword_hireling,
		/datum/job/advclass/combat/adventurer_fighter/sembian_count,
		/datum/job/advclass/combat/adventurer_fighter/sembian_merc,
		/datum/job/advclass/combat/adventurer_fighter/sembian_spearman,
		/datum/job/advclass/combat/adventurer_fighter/underdweller,
		/datum/job/advclass/combat/adventurer_fighter/verderer,
		/datum/job/advclass/combat/adventurer_fighter/warrior,
		/datum/job/advclass/combat/adventurer_fighter/winged_rescuer,
	)

/datum/job/adventurer_fighter/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	to_chat(spawned, "<br><font color='#855b14'><span class='bold'>If I wanted to make mammons by selling my services, or completing quests, the Adventurers Guild would be a good place to start.</span></font><br>")

/datum/job/adventurer_fighter/set_spawn_and_total_positions(count)
	// Calculate the new spawn positions
	var/new_spawn = adventurer_slot_formula(count)

	// Sync everything
	spawn_positions = new_spawn
	total_positions_so_far = new_spawn
	total_positions = new_spawn

	return spawn_positions

/datum/job/adventurer_fighter/get_total_positions()
	var/slots = adventurer_slot_formula(get_total_town_members())

	if(slots <= total_positions_so_far)
		slots = total_positions_so_far
	else
		total_positions_so_far = slots

	return slots

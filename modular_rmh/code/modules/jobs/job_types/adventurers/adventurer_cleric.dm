/datum/job/adventurer_cleric
	title = "Adventurer Cleric"
	tutorial = "Clerics are representatives of the gods they worship, wielding potent divine magic for good or ill. \
	ALLOWED PATRONS: Garl Glittergold, Helm, Mystra, Oghma, Tempus, Tymora, Silvanus, Jergal, Bahamut, Corellon Larethian, \
	Eilistraee, Ilmater, Lathander, Mielikki, Moradin, Selune, Tyr, Yondalla, Sune, Sharess, Torm, Milil, Deneir, \
	Mask, Vlaakith, Lolth, Shar, Gruumsh, Laduguer, Talos, Tiamat, Malar, Maglubiyet, Umberlee, Loviatar, Asmodeus. \
	DRAWS DIVINE POWER FROM AN ACTUAL DEITY OF ALL ALIGNMENTS AND DOMAINS."
	department_flag = ADVENTURERS
	faction = FACTION_NEUTRAL
	total_positions = 20
	spawn_positions = 20
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_ADVENTURER_CLERIC

	allowed_patrons = list(
		/datum/patron/faerun/good_gods/Garl_Glittergold,
		/datum/patron/faerun/neutral_gods/Helm,
		/datum/patron/faerun/neutral_gods/Mystra,
		/datum/patron/faerun/neutral_gods/Oghma,
		/datum/patron/faerun/neutral_gods/Tempus,
		/datum/patron/faerun/neutral_gods/Tymora,
		/datum/patron/faerun/neutral_gods/Silvanus,
		/datum/patron/faerun/neutral_gods/Jergal,

		/datum/patron/faerun/good_gods/Bahamut,
		/datum/patron/faerun/good_gods/Corellon,
		/datum/patron/faerun/good_gods/Eilistraee,
		/datum/patron/faerun/good_gods/Ilmater,
		/datum/patron/faerun/good_gods/Lathander,
		/datum/patron/faerun/good_gods/Mielikki,
		/datum/patron/faerun/good_gods/Moradin,
		/datum/patron/faerun/good_gods/Selune,
		/datum/patron/faerun/good_gods/Tyr,
		/datum/patron/faerun/good_gods/Yondalla,
		/datum/patron/faerun/good_gods/Sune,
		/datum/patron/faerun/good_gods/Sharess,
		/datum/patron/faerun/good_gods/Torm,
		/datum/patron/faerun/good_gods/Milil,
		/datum/patron/faerun/good_gods/Deneir,

		/datum/patron/faerun/evil_gods/Mask,
		/datum/patron/faerun/evil_gods/Vlaakith,
		/datum/patron/faerun/evil_gods/Lolth,
		/datum/patron/faerun/evil_gods/Shar,
		/datum/patron/faerun/evil_gods/Gruumsh,
		/datum/patron/faerun/evil_gods/Laduguer,
		/datum/patron/faerun/evil_gods/Talos,
		/datum/patron/faerun/evil_gods/Tiamat,
		/datum/patron/faerun/evil_gods/Malar,
		/datum/patron/faerun/evil_gods/Maglubiyet,
		/datum/patron/faerun/evil_gods/Umberlee,
		/datum/patron/faerun/evil_gods/Loviatar,
		/datum/patron/faerun/evil_gods/Asmodeus
	)

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	advclass_cat_rolls = list(CAT_ADVENTURER_CLERIC = 50)

	selection_color = JCOLOR_ADVENTURERS
	scales = TRUE

	give_bank_account = TRUE
	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_COMBAT, EXP_TYPE_CLERIC, EXP_TYPE_MEDICAL)

	magic_user = TRUE
	spell_points = 30
	attunements_max = 10
	attunements_min = 5

	job_subclasses = list(
		/datum/job/advclass/combat/adventurer_cleric/death_domain,
		/datum/job/advclass/combat/adventurer_cleric/ironmaiden,
		/datum/job/advclass/combat/adventurer_cleric/life_domain,
		/datum/job/advclass/combat/adventurer_cleric/light_domain,
		/datum/job/advclass/combat/adventurer_cleric/war_domain,
	)

/datum/job/adventurer_cleric/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	to_chat(spawned, "<br><font color='#855b14'><span class='bold'>If I wanted to make mammons by selling my services, or completing quests, the Adventurers Guild would be a good place to start.</span></font><br>")
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_cleric()
		devotion.grant_to(spawned)

/datum/job/adventurer_cleric/set_spawn_and_total_positions(count)
	// Calculate the new spawn positions
	var/new_spawn = adventurer_slot_formula(count)

	// Sync everything
	spawn_positions = new_spawn
	total_positions_so_far = new_spawn
	total_positions = new_spawn

	return spawn_positions

/datum/job/adventurer_cleric/get_total_positions()
	var/slots = adventurer_slot_formula(get_total_town_members())

	if(slots <= total_positions_so_far)
		slots = total_positions_so_far
	else
		total_positions_so_far = slots

	return slots

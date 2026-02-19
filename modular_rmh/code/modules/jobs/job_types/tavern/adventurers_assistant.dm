/datum/job/adventurers_assistant
	title = "Adventurers Guildmaster Assistant"
	tutorial = "You serve as the trusted assistant to the Guildmaster of the Blue Sage. \
	Your duties include welcoming new adventurers, explaining guild rules, \
	helping organize parties, and handling minor tasks within the Drunken Dwarf. \
	You often accompany newcomers on their first assignments and keep the guild running smoothly."
	department_flag = TAVERN
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_ADVENTURERS_ASSISTANT

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	selection_color = JCOLOR_TAVERN
	advclass_cat_rolls = list(CAT_AHEAD = 20)

	outfit = /datum/outfit/guildmaster_assistant

	give_bank_account = 20
	exp_types_granted = list(EXP_TYPE_MERCENARY)

	jobstats = list(
		STATKEY_SPD = 1,
		STATKEY_END = 1
	)

	skills = list(
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/craft/cooking = 3,
		/datum/skill/labor/butchering = 1,
		/datum/skill/misc/medicine = 1,
		/datum/skill/labor/farming = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/misc/stealing = 3,
		/datum/skill/labor/mathematics = 1,
	)

/datum/outfit/guildmaster_assistant
	name = "Adventurers Guildmaster Assistant"
	head = null
	mask = null
	neck = null
	cloak = null
	armor = /obj/item/clothing/armor/leather/vest/colored/black
	shirt = /obj/item/clothing/shirt/undershirt/colored/uncolored
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/uncolored
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/keyring/adventurers_guild
	beltl = /obj/item/storage/belt/pouch/coins/poor
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/recipe_book/cooking = 1)

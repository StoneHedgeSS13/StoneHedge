/datum/job/matron
	title = "Matron"
	tutorial = "You are the Matron of the Drunken Dwarf’s hall — the quiet authority behind its lively atmosphere. \
	You watch over the staff, ensure their safety, keep disputes from boiling over, \
	and guard the tavern’s secrets and unspoken rules. You do not serve tables unless you choose to, \
	and few dare test your patience more than once."
	department_flag = TAVERN
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_MATRON

	allowed_sexes = list(FEMALE)
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST

	selection_color = JCOLOR_TAVERN

	outfit = /datum/outfit/matron
	give_bank_account = 35
	can_have_apprentices = TRUE

	spells = list(
		/datum/action/cooldown/spell/undirected/hag_call
	)

	exp_type = list(EXP_TYPE_LIVING, EXP_TYPE_ADVENTURER, EXP_TYPE_THIEF)
	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_THIEF)
	exp_requirements = list(
		EXP_TYPE_LIVING = 1200,
		EXP_TYPE_ADVENTURER = 300,
		EXP_TYPE_THIEF = 300
	)

	skills = list(
		/datum/skill/misc/sewing = 3,
		/datum/skill/misc/sneaking = 4,
		/datum/skill/misc/stealing = 4,
		/datum/skill/misc/lockpicking = 4,
		/datum/skill/craft/traps = 2,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/athletics = 2,
		/datum/skill/craft/cooking = 4,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/reading = 3,
		/datum/skill/combat/knives = 5,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/wrestling = 3,
	)

	jobstats = list(
		STATKEY_STR = -1,
		STATKEY_INT =  2,
		STATKEY_PER =  1,
		STATKEY_SPD =  2
	)

	traits = list(
		TRAIT_THIEVESGUILD,
		TRAIT_OLDPARTY,
		TRAIT_EARGRAB,
		TRAIT_KITTEN_MOM,
		TRAIT_GOODLOVER,
		TRAIT_BEAUTIFUL,
		TRAIT_EMPATH,
		TRAIT_RECOGNIZE_ADDICTS
	)

	languages = list(/datum/language/thievescant)

/datum/outfit/matron
	name = "Matron"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/matron
	armor = null
	shirt = /obj/item/clothing/shirt/leo_robe
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/cloth/lady
	beltl = /obj/item/storage/belt/pouch/coins/rich
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/weapon/knife/dagger/steel = 1,
		/obj/item/key/matron = 1
	)

/datum/job/town_scholar_apprentice
	title = "Town Scholar Apprentice"
	tutorial = "You are newly initiated into the disciplined life of study. \
	You may incline toward books, medicine, or mechanism."
	department_flag = SCHOLARS
	faction = FACTION_TOWN
	total_positions = 5
	spawn_positions = 5
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_LIBRARIAN

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT)

	selection_color = JCOLOR_SCHOLARS
	advclass_cat_rolls = list(CAT_ARCHIVISTAP = 20)

	job_subclasses = list(
		/datum/job/advclass/town_scholar_apprentice/librarian,
		/datum/job/advclass/town_scholar_apprentice/artificer,
		/datum/job/advclass/town_scholar_apprentice/physician_apprentice,
	)

	give_bank_account = 40
	exp_types_granted = list(EXP_TYPE_MAGICK, EXP_TYPE_LIVING)
	exp_type = list(EXP_TYPE_LIVING)
	exp_requirements = list(EXP_TYPE_LIVING = 250)

//SUBCLASSES

/datum/job/advclass/town_scholar_apprentice/librarian
	title = "Librarian"
	tutorial = "A quiet keeper of knowledge. You tend the town’s library, sell books, and preserve local history."
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/town_scholar_apprentice/librarian
	category_tags = list(CAT_ARCHIVISTAP)

	jobstats = list(
		STATKEY_INT = 3,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/misc/reading = 6,
		/datum/skill/craft/alchemy = 3,
		/datum/skill/magic/arcane = 3,
		/datum/skill/labor/mathematics = 5
	)

	magic_user = TRUE
	spell_points = 15
	spells = list(
		/datum/action/cooldown/spell/undirected/learn,
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/summon_parchment,
		/datum/action/cooldown/spell/undirected/conjure_item/summon_parchment/scroll,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
	)

	languages = list(
		/datum/language/elvish,
		/datum/language/dwarvish,
		/datum/language/zalad,
		/datum/language/celestial,
		/datum/language/hellspeak,
		/datum/language/oldpsydonic,
		/datum/language/orcish
	)

/datum/outfit/town_scholar/librarian
	name = "Librarian"
	head = null
	mask = /obj/item/clothing/face/spectacles
	neck = null
	cloak = null
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = null
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltr = /obj/item/storage/belt/pouch/coins/mid
	beltl = /obj/item/storage/keyring/archivist
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/textbook = 1,
		/obj/item/natural/feather = 1,
		/obj/item/book/granter/spellbook/apprentice,
		)

/datum/outfit/town_scholar_apprentice/librarian/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/undershirt/formal
		pants = /obj/item/clothing/pants/tights/colored/black
		shoes = /obj/item/clothing/shoes/boots
	else
		shirt = /obj/item/clothing/shirt/undershirt/blouse
		pants = /obj/item/clothing/pants/skirt/pencil
		shoes = /obj/item/clothing/shoes/heels

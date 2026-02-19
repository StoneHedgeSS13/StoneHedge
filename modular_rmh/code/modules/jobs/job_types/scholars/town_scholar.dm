/datum/job/town_scholar
	title = "Town Scholar"
	tutorial = "You are an educated scholar of the town. \
	Your studies may be devoted to the archives, exploring distant ruins, precise medicine, or ingenious mechanisms."
	department_flag = SCHOLARS
	faction = FACTION_TOWN
	total_positions = 4
	spawn_positions = 4
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_LIBRARIAN

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	selection_color = JCOLOR_SCHOLARS
	advclass_cat_rolls = list(CAT_ARCHIVIST = 20)

	job_subclasses = list(
		/datum/job/advclass/town_scholar/explorer,
		/datum/job/advclass/town_scholar/archivist,
		/datum/job/advclass/town_scholar/artificer,
		/datum/job/advclass/town_scholar/town_physician,
	)

	give_bank_account = 80
	exp_types_granted = list(EXP_TYPE_MAGICK, EXP_TYPE_LIVING)
	exp_type = list(EXP_TYPE_LIVING)
	exp_requirements = list(EXP_TYPE_LIVING = 250)

//SUBCLASSES

/datum/job/advclass/town_scholar/explorer
	title = "Explorer"
	tutorial = "An adventurous scholar. You venture beyond town to study ancient ruins, recover artifacts."
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/town_scholar/explorer
	category_tags = list(CAT_ARCHIVIST)

	jobstats = list(
		STATKEY_STR = 4,
		STATKEY_INT = 3,
		STATKEY_CON = 1,
		STATKEY_SPD = 2
	)

	skills = list(
		/datum/skill/misc/reading = 4,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/swimming = 2,
		/datum/skill/magic/arcane = 2,
		/datum/skill/labor/mathematics = 3,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/whipsflails = 2,
		/datum/skill/combat/firearms = 3,
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

/datum/outfit/town_scholar/explorer
	name = "Explorer"
	head = /obj/item/clothing/head/explorer
	mask = /obj/item/clothing/face/spectacles
	neck = null
	cloak = null
	armor = null
	shirt = /obj/item/clothing/armor/gambeson/explorer
	wrists = null
	gloves = /obj/item/clothing/gloves/fingerless
	pants = /obj/item/clothing/pants/trou/leather/explorer
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/adventurer
	beltr = /obj/item/storage/belt/pouch/coins/mid
	beltl = /obj/item/storage/keyring/archivist
	ring = null
	l_hand = /obj/item/weapon/whip
	r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/pistol

	backpack_contents = list(
		/obj/item/textbook = 1,
		/obj/item/natural/feather = 1,
		/obj/item/book/granter/spellbook/apprentice,
		/obj/item/storage/belt/pouch/bullets,
		/obj/item/reagent_containers/glass/bottle/aflask,
		)

/datum/outfit/town_scholar/explorer/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

// ─────────────────────────────

/datum/job/advclass/town_scholar/archivist
	title = "Archivist"
	tutorial = "A dedicated keeper of rare texts and artifacts. You catalog, research, and occasionally unlock magical secrets."
	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/town_scholar/archivist
	category_tags = list(CAT_ARCHIVIST)

	jobstats = list(
		STATKEY_INT = 4,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/misc/reading = 6,
		/datum/skill/craft/alchemy = 3,
		/datum/skill/magic/arcane = 4,
		/datum/skill/labor/mathematics = 5
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

	traits = list(
		TRAIT_TUTELAGE,
		)

	magic_user = TRUE
	spell_points = 20
	spells = list(
		/datum/action/cooldown/spell/undirected/learn,
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/summon_parchment,
		/datum/action/cooldown/spell/undirected/conjure_item/summon_parchment/scroll,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
	)

/datum/outfit/town_scholar/archivist
	name = "Archivist"
	head = null
	mask = /obj/item/clothing/face/spectacles
	neck = null
	cloak = /obj/item/clothing/cloak/cape/archivist
	armor = /obj/item/clothing/shirt/robe/archivist
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/boots
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

/datum/outfit/town_scholar/archivist/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/tunic/colored/black
		pants = /obj/item/clothing/pants/tights/colored/black
	else
		shirt = /obj/item/clothing/shirt/undershirt/lowcut/colored/black

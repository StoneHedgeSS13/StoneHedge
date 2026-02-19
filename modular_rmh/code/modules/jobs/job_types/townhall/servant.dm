/datum/job/servant
	title = "Town Hall Servant"
	tutorial = "You serve within the Town Hall and noble residences of Rivermist Hollow. \
	You clean, cook, carry, attend, and obey. \
	Your duties and treatment depend entirely on your station within the household."
	department_flag = TOWNHALL
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_SERVANT
	faction = FACTION_TOWN
	total_positions = 4
	spawn_positions = 4
	give_bank_account = 60
	can_have_apprentices = FALSE

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = RACES_PLAYER_ALL
	selection_color = JCOLOR_TOWNHALL

	advclass_cat_rolls = list(CAT_SERVANT = 20)

	job_subclasses = list(
		/datum/job/advclass/servant/butler,
		/datum/job/advclass/servant/maid,
		/datum/job/advclass/servant/concubine,
	)

// ─────────────────────────────
// BUTLER
// ─────────────────────────────

/datum/job/advclass/servant/butler
	title = "Butler"
	tutorial = "You oversee servants, schedules, keys, and etiquette. \
	You are trusted with private spaces and sensitive information, \
	and your word carries weight within the household."

	outfit =/datum/outfit/servant/butler
	category_tags = list(CAT_SERVANT)
	allowed_sexes = list(MALE)

	jobstats = list(
		STATKEY_INT = 3,
		STATKEY_PER = 2,
		STATKEY_LCK = 1
	)

	skills = list(
	    /datum/skill/combat/swords = 2,	//Alfred, is this you?
		/datum/skill/combat/wrestling = 1,
		/datum/skill/combat/unarmed = 1,
	    /datum/skill/combat/firearms = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/craft/masonry = 2,
		/datum/skill/craft/carpentry = 2,
		/datum/skill/craft/engineering = 1,

		/datum/skill/misc/reading = 4,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/sneaking = 3,
		/datum/skill/misc/stealing = 2,
		/datum/skill/labor/mathematics = 2,

		/datum/skill/labor/butchering = 3,
		/datum/skill/craft/cooking = 3,
	)

	traits = list(
		TRAIT_ROYALSERVANT,
		TRAIT_TUTELAGE
	)


/datum/outfit/servant/butler
	name = "Butler"
	head = null
	mask = null
	neck = null
	cloak = null
	armor = /obj/item/clothing/shirt/clothvest/colored/townhall
	shirt = /obj/item/clothing/shirt/undershirt/formal
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/trou/formal
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/suspenders
	beltr = /obj/item/storage/keyring/rmh_servant
	beltl = /obj/item/storage/belt/pouch/coins/poor
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/recipe_book/cooking = 1
	)

// ─────────────────────────────
// MAID
// ─────────────────────────────

/datum/job/advclass/servant/maid
	title = "Maid"
	tutorial = "You attend private chambers, clothing, and personal routines. \
	You move quickly, quietly, and are expected to be discreet at all times."

	outfit =/datum/outfit/servant/maid
	category_tags = list(CAT_SERVANT)
	allowed_sexes = list(FEMALE)

	jobstats = list(
		STATKEY_SPD = 3,
		STATKEY_PER = 2
	)

	skills = list(
		/datum/skill/misc/sewing = 4,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/sneaking = 3,
		/datum/skill/misc/stealing = 2,
		/datum/skill/labor/butchering = 2,
		/datum/skill/craft/cooking = 4,
	)

	traits = list(
		TRAIT_ROYALSERVANT
	)


/datum/outfit/servant/maid
	name = "Maid"
	head = /obj/item/clothing/head/maidband
	mask = null
	neck = /obj/item/clothing/neck/slave_collar/female
	cloak = /obj/item/clothing/cloak/apron/maid
	armor = null
	shirt = /obj/item/clothing/shirt/dress/maid/servant
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/heels
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/cloth_belt
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/storage/keyring/rmh_servant
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/recipe_book/cooking = 1
	)

// ─────────────────────────────
// CONCUBINE
// ─────────────────────────────

/datum/job/advclass/servant/concubine
	title = "Concubine"
	tutorial = "You are kept for pleasure, companionship, and emotional indulgence. \
	Your influence comes from favor rather than authority, \
	and your security depends on how desirable and agreeable you remain."

	outfit =/datum/outfit/servant/concubine
	category_tags = list(CAT_SERVANT)

	jobstats = list(
		STATKEY_LCK = 3,
		STATKEY_PER = 2,
		STATKEY_INT = 1
	)

	skills = list(
		/datum/skill/misc/sneaking = 3,
		/datum/skill/misc/stealing = 3,
		/datum/skill/misc/reading = 2
	)

	traits = list(
		TRAIT_DECEIVING_MEEKNESS,
		TRAIT_EMPATH
	)

/datum/outfit/servant/concubine
	name = "Concubine"
	head = null
	mask = null
	neck = /obj/item/clothing/neck/slave_collar/female
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/dress/maid/servant
	wrists = null
	gloves = null
	pants = null
	shoes = null
	backr = null
	backl = null
	belt = null
	beltr = null
	beltl = null
	ring = null
	l_hand = null
	r_hand = null

/datum/outfit/servant/concubine/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		pants = /obj/item/clothing/pants/trou/leathertights
		shoes = /obj/item/clothing/shoes/nobleboot/thighboots
		belt = /obj/item/storage/belt/leather/plaquegold
		beltr = /obj/item/storage/belt/pouch/coins/rich
		beltl = /obj/item/storage/keyring/rmh_servant
	else
		mask = /obj/item/clothing/face/exoticsilkmask
		shirt = /obj/item/clothing/shirt/exoticsilkbra
		wrists = /obj/item/clothing/wrists/goldbracelet
		shoes = /obj/item/clothing/shoes/anklets
		belt = /obj/item/storage/belt/leather/exoticsilkbelt
		beltr = /obj/item/storage/belt/pouch/coins/rich
		beltl = /obj/item/storage/keyring/rmh_servant

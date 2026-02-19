/datum/job/innkeep
	title = "Innkeep"
	tutorial = "You run the Drunken Dwarf — tavern, inn, and the public face of the Blue Sage Guild. \
	You serve drinks, rent rooms, keep guests comfortable, and act as the first point of contact \
	for adventurers, townsfolk, and travelers alike. A steady hand and a sharp ear keep both the ale and rumors flowing."
	department_flag = TAVERN
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_INNKEEP

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	selection_color = JCOLOR_TAVERN

	outfit = /datum/outfit/innkeep

	give_bank_account = 100
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 1,
		STATKEY_CON = 1
	)

	skills = list(
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/misc/reading = 2,
		/datum/skill/craft/cooking = 3,
		/datum/skill/misc/medicine = 1,
		/datum/skill/combat/swords = 2,
		/datum/skill/labor/mathematics = 2
	)

	traits = list(
		TRAIT_BOOZE_SLIDER,
		TRAIT_EXTEROCEPTION,
		TRAIT_RECOGNIZE_ADDICTS
	)

	exp_type = list(EXP_TYPE_LIVING)

	exp_requirements = list(
		EXP_TYPE_LIVING = 300
	)

/datum/outfit/innkeep
	name = "Innkeep"
	head = null
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/mid
	cloak = /obj/item/clothing/cloak/apron/waist
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = /obj/item/clothing/shoes/shortboots
	backr = null
	backl = null
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/keyring/innkeep
	beltr = /obj/item/reagent_containers/glass/bottle/beer/blackgoat
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/recipe_book/cooking,
		/obj/item/bottle_kit
	)

/datum/outfit/innkeep/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/shortshirt/colored/random
		pants = /obj/item/clothing/pants/tights/colored/random
	else
		armor = /obj/item/clothing/shirt/dress

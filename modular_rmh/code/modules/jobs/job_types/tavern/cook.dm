/datum/job/cook
	title = "Inn Cook"
	tutorial = "The heart of the Drunken Dwarf’s kitchen. \
	You prepare hot meals, fresh bread, and hearty fare for adventurers and guests, \
	working closely with the innkeep to keep morale high and stomachs full. \
	Long hours and sharp knives are part of the trade — but a well-fed guild is a loyal one."
	department_flag = TAVERN
	faction = FACTION_TOWN
	total_positions = 2
	spawn_positions = 2
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_COOK

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	selection_color = JCOLOR_TAVERN

	outfit = /datum/outfit/cook

	give_bank_account = 20
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_END = 1,
		STATKEY_INT = 1,
		STATKEY_CON = 1,
	)

	skills = list(
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/craft/cooking = 4,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/sewing = 1,
		/datum/skill/labor/butchering = 3,
		/datum/skill/labor/taming = 1,
		/datum/skill/labor/farming = 1
	)

	traits = list(
		TRAIT_EXTEROCEPTION
	)

/datum/outfit/cook
	name = "Cook"
	head = /obj/item/clothing/head/cookhat
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/poor
	cloak = /obj/item/clothing/cloak/apron/cook
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = null
	backl = null
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/weapon/knife/villager
	beltl = /obj/item/key/tavern
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/recipe_book/cooking = 1
	)

/datum/outfit/cook/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/shortshirt/colored/random
		pants = /obj/item/clothing/pants/tights/colored/random
	else
		armor = /obj/item/clothing/armor/corset
		shirt = /obj/item/clothing/shirt/undershirt/lowcut
		pants = /obj/item/clothing/pants/skirt/colored/red

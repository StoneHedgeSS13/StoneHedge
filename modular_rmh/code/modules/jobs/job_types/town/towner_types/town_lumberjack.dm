/datum/job/advclass/towner/lumberjack
	title = "Lumberjack"
	tutorial = "You're a lumberjack, ensure the settlement has wood."
	total_positions = 5
	spawn_positions = 5

	outfit = /datum/outfit/towner/lumberjack
	category_tags = list(CAT_TOWNER)
	give_bank_account = 6

	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 2,
		STATKEY_CON = 2,
	)

	skills = list(
		/datum/skill/combat/knives = 1,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/misc/reading = 1,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/climbing = 1,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/athletics = 1,
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/labor/lumberjacking = 4,
		/datum/skill/craft/carpentry = 2
	)

/datum/outfit/towner/lumberjack
	name = "Lumberjack"
	head = /obj/item/clothing/head/hatfur
	mask = null
	neck = null
	cloak = null
	armor = /obj/item/clothing/armor/leather/vest
	shirt = /obj/item/clothing/shirt/undershirt/colored/random
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/axe/iron
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/flint = 1,
		/obj/item/weapon/knife/villager = 1
	)

/datum/job/advclass/artisan_apprentice/carpenter
	title = "Carpenter Apprentice"
	tutorial = "You carry timber, measure beams, and learn to cut straight — eventually."

	outfit = /datum/outfit/artisan_apprentice/carpenter
	category_tags = list(CAT_ARTISANAP)

	give_bank_account = 3
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 1,
		STATKEY_CON = 1,
		STATKEY_SPD = -1,
	)

	skills = list(
		/datum/skill/craft/carpentry = 3,
		/datum/skill/craft/crafting = 2,
		/datum/skill/labor/lumberjacking = 2,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/climbing = 1,
		/datum/skill/misc/reading = 1,
	)

/datum/outfit/artisan_apprentice/carpenter
	name = "Carpenter Apprentice"
	head = null
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = /obj/item/clothing/shirt/undershirt/colored/random
	wrists = /obj/item/storage/keyring/guild_artisan
	gloves = null
	pants = /obj/item/clothing/pants/trou
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = /obj/item/weapon/axe/iron
	backl = /obj/item/storage/backpack/backpack
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/weapon/hammer/steel
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/flint = 1,
		/obj/item/weapon/knife/villager = 1,
		/obj/item/recipe_book/carpentry = 1,
	)

/datum/job/advclass/artisan_apprentice/mason
	title = "Mason Apprentice"
	tutorial = "You haul stone, mix mortar, and learn where to strike — and where not to."

	outfit = /datum/outfit/artisan_apprentice/mason
	category_tags = list(CAT_ARTISANAP)

	give_bank_account = 3
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 1,
		STATKEY_INT = 1,
		STATKEY_SPD = -1,
	)

	skills = list(
		/datum/skill/craft/masonry = 3,
		/datum/skill/craft/crafting = 2,
		/datum/skill/labor/mining = 2,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/climbing = 1,
		/datum/skill/misc/reading = 1,
	)

/datum/outfit/artisan_apprentice/mason
	name = "Mason Apprentice"
	head = null
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/poor
	cloak = /obj/item/clothing/cloak/apron/waist/colored/brown
	armor = null
	shirt = /obj/item/clothing/shirt/undershirt/colored/random
	wrists = /obj/item/storage/keyring/guild_artisan
	gloves = null
	pants = /obj/item/clothing/pants/trou
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = null
	backl = /obj/item/storage/backpack/backpack
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/hammer
	beltr = /obj/item/weapon/chisel
	ring = null
	l_hand = null
	r_hand = null

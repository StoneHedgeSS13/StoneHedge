/datum/job/advclass/artisan/mason
	title = "Mason"
	tutorial = "Stone remembers every chisel strike, and you are the one who gives it purpose."

	apprentice_name = "Mason Apprentice"
	can_have_apprentices = TRUE

	outfit = /datum/outfit/mason
	category_tags = list(CAT_ARTISAN)

	give_bank_account = 8
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_INT = 2,
		STATKEY_END = 1,
		STATKEY_CON = 1,
		STATKEY_SPD = -1,
	)

	skills = list(
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/labor/mining = 3,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/craft/crafting = 3,
		/datum/skill/craft/masonry = 4,
		/datum/skill/craft/engineering = 1,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 1,
	)

	traits = list(
		TRAIT_TUTELAGE,
		)

/datum/outfit/mason
	name = "Mason"
	head = /obj/item/clothing/head/hatfur
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/mid
	cloak = /obj/item/clothing/cloak/apron/waist/colored/brown
	armor = /obj/item/clothing/armor/leather/vest
	shirt = /obj/item/clothing/shirt/undershirt/colored/random
	wrists = /obj/item/storage/keyring/guild_artisan
	gloves = null
	pants = /obj/item/clothing/pants/trou
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = null
	backl = /obj/item/storage/backpack/backpack
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/hammer
	beltr = /obj/item/weapon/chisel
	ring = /obj/item/clothing/ring/silver/makers_guild
	l_hand = null
	r_hand = null

/datum/outfit/mason/pre_equip(mob/living/carbon/human/H)
	..()
	head = pick(/obj/item/clothing/head/hatfur, /obj/item/clothing/head/hatblu)
	shirt = pick(/obj/item/clothing/shirt/undershirt/colored/random, /obj/item/clothing/shirt/tunic/colored/random)

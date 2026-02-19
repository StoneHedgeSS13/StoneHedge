/datum/job/advclass/artisan/carpenter
	title = "Carpenter"
	tutorial = "From forest timber to finished beam, you shape the bones of the town."

	apprentice_name = "Carpenter Apprentice"
	can_have_apprentices = TRUE

	outfit = /datum/outfit/carpenter
	category_tags = list(CAT_ARTISAN)

	give_bank_account = 8
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 1,
		STATKEY_INT = 1,
		STATKEY_CON = 1,
		STATKEY_SPD = -1,
	)

	skills = list(
		/datum/skill/misc/medicine = 1,
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/craft/crafting = 3,
		/datum/skill/craft/cooking = 1,
		/datum/skill/craft/carpentry = 5,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/sewing = 1,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/labor/lumberjacking = 3,
	)

	traits = list(
		TRAIT_TUTELAGE,
		)

/datum/outfit/carpenter
	name = "Carpenter"
	head = null
	mask = null
	neck = /obj/item/clothing/neck/coif
	cloak = null
	armor = /obj/item/clothing/armor/gambeson/light/striped
	shirt = /obj/item/clothing/shirt/undershirt/colored/random
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = null
	pants = /obj/item/clothing/pants/trou
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/weapon/axe/iron
	backl = /obj/item/storage/backpack/backpack
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/belt/pouch/coins/mid
	beltl = /obj/item/weapon/hammer/steel
	ring = /obj/item/clothing/ring/silver/makers_guild
	l_hand = /obj/item/storage/keyring/guild_artisan
	r_hand = null

	backpack_contents = list(
		/obj/item/flint = 1,
		/obj/item/weapon/knife/villager = 1,
		/obj/item/recipe_book/carpentry = 1,
	)

/datum/outfit/carpenter/pre_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()
	head = pick(
		/obj/item/clothing/head/hatfur,
		/obj/item/clothing/head/hatblu,
		/obj/item/clothing/head/brimmed,
	)

/datum/job/advclass/artisan_apprentice/blacksmith
	title = "Smithy Apprentice"
	tutorial = "You pump bellows, haul iron, and learn how heat and hammer shape steel."

	outfit = /datum/outfit/artisan_apprentice/blacksmith
	category_tags = list(CAT_ARTISANAP)

	give_bank_account = 5
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 1,
		STATKEY_SPD = -1,
	)

	skills = list(
		/datum/skill/craft/blacksmithing = 2,
		/datum/skill/craft/smelting = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/misc/athletics = 2,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/misc/reading = 1,
	)

	traits = list(
		TRAIT_MALUMFIRE,
	)

/datum/outfit/artisan_apprentice/blacksmith
	name = "Smithy Apprentice"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/apron/brown
	armor = null
	shirt = null
	wrists = /obj/item/storage/keyring/guild_artisan
	gloves = null
	pants = /obj/item/clothing/pants/trou
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = null
	backl = /obj/item/weapon/hammer/sledgehammer
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/belt/pouch/coins/poor
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/recipe_book/blacksmithing = 1,
	)

/datum/outfit/artisan_apprentice/blacksmith/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == FEMALE)
		armor = /obj/item/clothing/shirt/dress/gen/colored/random

/datum/job/advclass/combat/adventurer_fighter/fallen_lord
	title = "Fallen Lord"
	f_title = "Fallen Lady"
	tutorial = "Once the mighty ruler, your hold fell. Stripped of crown but not command, you now wander foreign lands in search of refuge, \
	vengeance, or a chance to reclaim what was lost."

	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE
	outfit = /datum/outfit/adventurer_fighter/fallen_lord
	total_positions = 1

	skills = list(
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/crossbows = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/combat/swords = 4,
		/datum/skill/combat/knives = 3,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/climbing = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 4,
		/datum/skill/misc/riding = 3,
		/datum/skill/craft/cooking = 1,
	)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_INT = 3,
		STATKEY_END = 3,
		STATKEY_SPD = 1,
		STATKEY_PER = 2,
		STATKEY_LCK = 5,
	)

	traits = list(
		TRAIT_NOBLE,
		TRAIT_HEAVYARMOR,
	)

/datum/outfit/adventurer_fighter/fallen_lord
	name = "Fallen Lord"
	head = /obj/item/clothing/head/helmet
	mask = null
	neck = /obj/item/clothing/neck/chaincoif
	cloak = /obj/item/clothing/cloak/heartfelt
	armor = /obj/item/clothing/armor/medium/surcoat/heartfelt
	shirt = /obj/item/clothing/shirt/undershirt
	wrists = null
	gloves = /obj/item/clothing/gloves/leather/black
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = null
	backl = null
	belt = /obj/item/storage/belt/leather/black/adventurers_subclasses
	beltr = /obj/item/storage/belt/pouch/coins/rich
	beltl = /obj/item/weapon/sword/long
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/scomstone = 1)

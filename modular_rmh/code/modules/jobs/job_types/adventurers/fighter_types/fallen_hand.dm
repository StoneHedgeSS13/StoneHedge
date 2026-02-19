/datum/job/advclass/combat/adventurer_fighter/fallen_hand
	title = "Fallen Hand"
	tutorial = "As the Lord’s Hand, you governed coin, contracts, and quiet threats alike. \
	With your hold in ruins, you now serve in exile — guarding secrets, managing survival, and deciding how far loyalty truly goes."

	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE
	outfit = /datum/outfit/adventurer_fighter/fallen_hand
	total_positions = 1

	skills = list(
		/datum/skill/combat/axesmaces = 1,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/knives = 3,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/craft/cooking = 1,
		/datum/skill/labor/mathematics = 3,
	)

	jobstats = list(
		STATKEY_STR = 3,
		STATKEY_PER = 2,
		STATKEY_INT = 3,
	)

	traits = list(
		TRAIT_SEEPRICES,
		TRAIT_HEAVYARMOR,
	)

/datum/outfit/adventurer_fighter/fallen_hand
	name = "Fallen Hnad"
	head = null
	mask = /obj/item/clothing/face/spectacles/golden
	neck = /obj/item/clothing/neck/chaincoif
	cloak = null
	armor = /obj/item/clothing/armor/medium/surcoat/heartfelt
	shirt = /obj/item/clothing/shirt/undershirt
	wrists = null
	gloves = /obj/item/clothing/gloves/leather/black
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel/heartfelt
	backl = null
	belt = /obj/item/storage/belt/leather/black/adventurers_subclasses
	beltl = /obj/item/weapon/sword/decorated
	beltr = /obj/item/storage/belt/pouch/coins/rich
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/scomstone = 1)

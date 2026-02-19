/datum/job/advclass/combat/adventurer_fighter/housecarl
	title = "Housecarl"
	tutorial = "Once sworn to guard the lords of a Sword Coast \
	hold or a merchant prince in Waterdeep, you now travel as a freelance protector. \
	From escorting caravans along the High Road to standing watch in crowded city streets, \
	your skill with sword, shield, and polearm is sought wherever coin can be earned."

	outfit = /datum/outfit/adventurer_fighter/housecarl
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 2,
		STATKEY_END = 2,
		STATKEY_PER = 1,
		STATKEY_INT = -1,
		STATKEY_SPD = -2,
	)

	skills = list(
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/swords = 2,
		/datum/skill/combat/shields = 3,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/medicine = 2,
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
	)

/datum/outfit/adventurer_fighter/housecarl
	name = "Housecarl"
	head = /obj/item/clothing/head/helmet/nasal
	mask = null
	neck = /obj/item/clothing/neck/highcollier/iron
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
	armor = /obj/item/clothing/armor/chainmail/hauberk/iron
	shirt = /obj/item/clothing/armor/gambeson
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather/black
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/weapon/polearm/halberd/bardiche/woodcutter
	backl = /obj/item/weapon/shield/wood
	belt = /obj/item/storage/belt/leather/black/adventurers_subclasses
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/weapon/sword/short/iron
	ring = null
	l_hand = null
	r_hand = null

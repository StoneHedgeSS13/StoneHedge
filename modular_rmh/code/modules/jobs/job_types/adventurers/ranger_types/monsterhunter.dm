/datum/job/advclass/combat/adventurer_ranger/monster_hunter
	title = "Monster Hunter"
	tutorial = "A vigilant hunter of the unnatural, armed with silver and skill to purge evil from the realms of Faerûn."

	outfit = /datum/outfit/adventurer_ranger/monster_hunter
	category_tags = list(CAT_ADVENTURER_RANGER)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/misc/sewing = 2,
		/datum/skill/misc/medicine = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/misc/reading = 3,
		/datum/skill/combat/swords = 4,
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/crossbows = 3,
		/datum/skill/combat/whipsflails = 4,
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/craft/cooking = 1,
	)

	jobstats = list(
		STATKEY_INT = 1,
		STATKEY_STR = 1,
		STATKEY_PER = 2,
		STATKEY_CON = 2,
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_STEELHEARTED,
	)

/datum/outfit/adventurer_ranger/monster_hunter
	name = "Monster Hunter"
	head = /obj/item/clothing/head/helmet/leather/inquisitor
	mask = null
	neck = /obj/item/clothing/neck/chaincoif
	cloak = /obj/item/clothing/cloak/cape/puritan
	armor = /obj/item/clothing/armor/leather/splint
	shirt = /obj/item/clothing/shirt/undershirt/puritan
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/angle
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/boots
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/weapon/sword/rapier/silver
	beltr = /obj/item/weapon/whip/silver
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/storage/belt/pouch/coins/mid = 1)

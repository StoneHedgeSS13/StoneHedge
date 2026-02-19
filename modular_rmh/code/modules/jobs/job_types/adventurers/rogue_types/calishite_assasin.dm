/datum/job/advclass/combat/adventurer_rogue/calishite_assasin
	title = "Calishite"
	tutorial = "A Calishite assassin trained in stealth and close-quarters murder, you sell death with a steady hand and no questions asked."

	outfit = /datum/outfit/adventurer_rogue/calishite_assasin
	category_tags = list(CAT_ADVENTURER_ROGUE)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/combat/knives = 4,
		/datum/skill/combat/swords = 2,
		/datum/skill/combat/crossbows = 2,
		/datum/skill/combat/bows = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/sneaking = 4,
		/datum/skill/misc/stealing = 2,
		/datum/skill/misc/lockpicking = 3,
		/datum/skill/craft/traps = 1,
	)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_SPD = 2,
		STATKEY_END = 1,
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_STEELHEARTED,
	)

	languages = list(/datum/language/zalad)

/datum/outfit/adventurer_rogue/calishite_assasin
	name = "Calishite Assasin"
	head = /obj/item/clothing/neck/keffiyeh/colored/red
	mask = null
	neck = null
	cloak = null
	armor = /obj/item/clothing/armor/leather/splint
	shirt = /obj/item/clothing/shirt/undershirt/colored/red
	wrists = null
	gloves = /obj/item/clothing/gloves/angle
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/shalal
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/shalal/adventurers_subclasses
	beltl = null
	beltr = /obj/item/weapon/knife/dagger/steel/special
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/lockpick = 1
	)

/datum/job/advclass/combat/adventurer_rogue/treasurehunter
	title = "Treasure Hunter"
	tutorial = "A tomb delver who robs the dead and survives by cunning, grit, and a strong stomach."

	outfit = /datum/outfit/adventurer_rogue/treasurehunter
	category_tags = list(CAT_ADVENTURER_ROGUE)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/misc/medicine = 1,
		/datum/skill/combat/whipsflails = 3,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/craft/crafting = 1,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 5,
		/datum/skill/misc/sewing = 1,
		/datum/skill/misc/lockpicking = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 1,
	)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_PER = 2,
		STATKEY_INT = 1,
		STATKEY_END = 2,
		STATKEY_SPD = 1,
		STATKEY_LCK = -1,
	)

	traits = list(
		TRAIT_DEADNOSE,
		TRAIT_DODGEEXPERT,
		TRAIT_GRAVEROBBER,
	)

/datum/outfit/adventurer_rogue/treasurehunter
	name = "Treasure Hunter"
	head = /obj/item/clothing/head/explorer
	mask = null
	neck = /obj/item/storage/belt/pouch
	cloak = /obj/item/clothing/cloak/raincloak/colored/mortus
	armor = /obj/item/clothing/armor/gambeson/explorer
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	wrists = null
	gloves = /obj/item/clothing/gloves/fingerless
	pants = /obj/item/clothing/pants/trou/leather/explorer
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/weapon/shovel
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/weapon/whip // You know why.
	beltr = /obj/item/flashlight/flare/torch/lantern
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/weapon/pick = 1,
		/obj/item/weapon/knife/dagger = 1,
		/obj/item/lockpickring/mundane = 1
	)

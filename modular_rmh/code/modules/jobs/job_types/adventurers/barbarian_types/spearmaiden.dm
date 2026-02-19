/datum/job/advclass/combat/adventurer_barbarian/spearmaiden
	title = "Spearmaiden"
	tutorial = "A proud and formidable Spearmaiden from the remote isles, \
	you were raised among fierce women who hunted, trained, and fought in the wilds."

	allowed_sexes = list(FEMALE)
	outfit = /datum/outfit/adventurer_barbarian/spearmaiden
	category_tags = list(CAT_ADVENTURER_BARBARIAN)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_INT = -1,
		STATKEY_END = 2,
		STATKEY_CON = 1,
		STATKEY_SPD = 1
	)

	skills = list(
		/datum/skill/combat/polearms = 3,
		/datum/skill/combat/bows = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/reading = 4,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/medicine = 3,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/riding = 2,
		/datum/skill/misc/sewing = 2,
		/datum/skill/misc/athletics = 2,
		/datum/skill/craft/cooking = 1,
		/datum/skill/craft/tanning = 1
	)

	traits = list(
		TRAIT_STEELHEARTED,
		TRAIT_DEADNOSE,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_NOPAINSTUN
	)

/datum/outfit/adventurer_barbarian/spearmaiden
	name = "Spearmaiden"
	head = null
	mask = null
	neck = /obj/item/ammo_holder/dartpouch/poisondarts
	cloak = null
	armor = /obj/item/clothing/armor/amazon_chainkini
	shirt = null
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/gladiator
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/short
	backl = /obj/item/weapon/polearm/spear
	belt = /obj/item/storage/belt/leather/rope/adventurers_subclasses
	beltl = /obj/item/gun/ballistic/revolver/grenadelauncher/blowgun
	beltr = /obj/item/ammo_holder/quiver/arrows
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

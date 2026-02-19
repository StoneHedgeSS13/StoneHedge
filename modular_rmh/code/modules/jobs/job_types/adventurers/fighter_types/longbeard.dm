/datum/job/advclass/combat/adventurer_fighter/longbeard
	title = "Longbeard"
	tutorial = "An elder dwarf warrior, hammer in hand, a steadfast enforcer of tradition and justice."

	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	allowed_races = list(SPEC_ID_DWARF, SPEC_ID_DUERGAR)

	outfit = /datum/outfit/adventurer_fighter/longbeard
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/combat/axesmaces = 4,
		/datum/skill/combat/polearms = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/craft/blacksmithing = 2,
		/datum/skill/craft/armorsmithing = 2,
		/datum/skill/craft/weaponsmithing = 2,
		/datum/skill/misc/reading = 2,
	)

	jobstats = list(
		STATKEY_STR = 2, // Same stat spread as lancer/swordmaster, but no -1 speed at the cost of 1 point of endurance. A very powerful dwarf indeed
		STATKEY_CON = 2,
		STATKEY_END = 1,
	)

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_STEELHEARTED, // Nothing fazes a longbeard
	)

/datum/outfit/adventurer_fighter/longbeard
	name = "Longbeard"
	head = /obj/item/clothing/head/rare/dwarfplate
	mask = null
	neck = /obj/item/clothing/neck/chaincoif
	cloak = null
	armor = /obj/item/clothing/armor/rare/dwarfplate
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/boots/rare/dwarfplate
	backr = /obj/item/weapon/mace/goden/steel/warhammer
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/storage/belt/pouch/coins/mid
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

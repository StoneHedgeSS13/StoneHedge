/datum/job/advclass/combat/adventurer_barbarian/rat_wildman
	title = "Rat Wildman"
	tutorial = "Abandoned at birth and raised in the sewers by rats, \
	you learned to fight, scavenge, and survive by any means necessary. \
	Your instincts are sharp, your body is tough, and your bite is deadly. The rats are you friends."

	outfit = /datum/outfit/adventurer_barbarian/rat_wildman
	category_tags = list(CAT_ADVENTURER_BARBARIAN)
	give_bank_account = TRUE
	total_positions = 2
	faction = FACTION_RATS

	jobstats = list(
		STATKEY_STR = 3,
		STATKEY_END = 2,
		STATKEY_CON = 2,
		STATKEY_INT = -3
	)

	skills = list(
		/datum/skill/combat/wrestling = 4,
		/datum/skill/combat/knives = 4,
		/datum/skill/combat/unarmed = 5,
		/datum/skill/craft/crafting = 2,
		/datum/skill/labor/farming = 2,
		/datum/skill/labor/fishing = 2,
		/datum/skill/labor/mathematics = 1,
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/reading = 1,
		/datum/skill/labor/taming = 4
	)

	traits = list(
		TRAIT_DARKVISION,
		TRAIT_DEADNOSE,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_NOPAINSTUN,
		TRAIT_STEELHEARTED,
		TRAIT_STRONGBITE,
		TRAIT_NASTY_EATER
	)

	spells = list(
		/datum/action/cooldown/spell/conjure/rous
	)

/datum/outfit/adventurer_barbarian/rat_wildman
	name = "Rat Wildman"
	head = null
	mask = /obj/item/clothing/face/shepherd
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
	armor = /obj/item/clothing/armor/leather/advanced
	shirt = null
	wrists = /obj/item/rope/chain
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/boots/leather/advanced
	backr = null
	backl = null
	belt = /obj/item/storage/belt/leather/rope/adventurers_subclasses
	beltl = null
	beltr = /obj/item/weapon/knife/hunting
	ring = null
	l_hand = null
	r_hand = null

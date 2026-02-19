/datum/job/advclass/combat/adventurer_cleric/ironmaiden
	title = "Iron Maiden"
	tutorial = "Trained in both battlefield medicine and heavy armor, \
	you travel across the Sword Coast offering aid to those in need. \
	Whether stabilizing wounded adventurers or defending caravans, \
	your skill with scalpel and armor ensures that life is preserved wherever you go."

	allowed_sexes = list(FEMALE)
	outfit = /datum/outfit/adventurer_cleric/ironmaiden
	category_tags = list(CAT_ADVENTURER_CLERIC)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 2,
		STATKEY_INT = 2
	)

	skills = list(
		/datum/skill/combat/knives = 1,
		/datum/skill/misc/medicine = 4,
		/datum/skill/misc/sewing = 3,
		/datum/skill/misc/reading = 3, // Using the higher value (3) since there were two entries with different values
		/datum/skill/combat/wrestling = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/craft/alchemy = 2,
		/datum/skill/labor/mathematics = 3
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_HEAVYARMOR,
		TRAIT_DEADNOSE,
		TRAIT_STEELHEARTED,
		TRAIT_HOLY,
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/healing/greater,
		/datum/action/cooldown/spell/attach_bodypart,
		/datum/action/cooldown/spell/diagnose/holy,
		/datum/action/cooldown/spell/cure_rot,
		/datum/action/cooldown/spell/revive,
		/datum/action/cooldown/spell/essence/healing_spring,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/undirected/blade_ward,
	)


/datum/outfit/adventurer_cleric/ironmaiden
	name = "Iron Maiden"
	head = /obj/item/clothing/head/helmet/sallet
	mask = /obj/item/clothing/face/facemask/steel
	neck = /obj/item/clothing/neck/gorget
	cloak = null
	armor = /obj/item/clothing/armor/plate/full
	shirt = /obj/item/clothing/armor/chainmail
	wrists = /obj/item/clothing/wrists/bracers
	gloves = /obj/item/clothing/gloves/plate
	pants = /obj/item/clothing/pants/platelegs
	shoes = /obj/item/clothing/shoes/boots/armor
	backl = /obj/item/storage/backpack/satchel
	backr = /obj/item/storage/backpack/satchel/surgbag
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltr = /obj/item/weapon/knife/dagger/steel
	beltl = /obj/item/weapon/knife/cleaver
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor = 1
	)

/datum/outfit/adventurer_cleric/ironmaiden/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

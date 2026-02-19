/datum/job/advclass/combat/adventurer_fighter/elven_blademaster
	title = "Elven Blademaster"
	tutorial = "Honed in the courts of Evereska, you are a master of blade and agility. \
    With your people scattered or gone, you now roam the wider realms, \
    lending your skill to those in need—or seeking new challenges worthy of your craft."
	allowed_races = RACES_PLAYER_ELF_ALL

	outfit = /datum/outfit/adventurer_fighter/elven_blademaster
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/swords = 4,
		/datum/skill/combat/bows = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 2,
	)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_SPD = 1,
	)

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_DUALWIELDER,
		TRAIT_STEELHEARTED,
	)

/datum/outfit/adventurer_fighter/elven_blademaster
	name = "Elven Blademaster"
	head = /obj/item/clothing/head/rare/elfplate/welfplate
	mask = null
	neck = /obj/item/clothing/neck/chaincoif
	cloak = null
	armor = /obj/item/clothing/armor/rare/elfplate/welfplate
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	wrists = null
	gloves = /obj/item/clothing/gloves/rare/elfplate/welfplate
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/boots/rare/elfplate/welfplate
	backr = /obj/item/weapon/sword/long/greatsword/elfgsword
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = null
	beltl = /obj/item/storage/belt/pouch/coins/mid
	ring = null
	l_hand = null
	r_hand = null

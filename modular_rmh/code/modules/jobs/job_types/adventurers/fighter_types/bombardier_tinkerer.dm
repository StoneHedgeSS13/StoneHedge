/datum/job/advclass/combat/adventurer_fighter/bombardier_tinkerer
	title = "Bombardier Tinkerer"
	tutorial = "Tinkerers that like to blow things up."

	allowed_races = list(SPEC_ID_DWARF, SPEC_ID_DUERGAR, SPEC_ID_GNOME, SPEC_ID_GNOME_D)
	outfit = /datum/outfit/adventurer_fighter/bombardier_tinkerer
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 1,
	)

	skills = list(
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/labor/mining = 1,
		/datum/skill/craft/engineering = 5,
		/datum/skill/craft/bombs = 4,
		/datum/skill/craft/smelting = 1,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/craft/crafting = 3,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/climbing = 1,
		/datum/skill/misc/athletics = 1,
		/datum/skill/misc/reading = 2,
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
	)

/datum/outfit/adventurer_fighter/bombardier_tinkerer
	name = "Bombardier Tinkerer"
	head = /obj/item/clothing/head/helmet/kettle
	mask = /obj/item/clothing/face/goggles
	neck = null
	cloak = /obj/item/clothing/cloak/half/colored/brown
	armor = /obj/item/clothing/armor/chainmail/iron
	shirt = /obj/item/clothing/armor/gambeson/light
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = null
	pants = /obj/item/clothing/pants/trou
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = null
	backl = /obj/item/storage/backpack/backpack
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/weapon/pick
	beltr = /obj/item/weapon/hammer/iron
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/explosive/bottle = 3, /obj/item/flint = 1)

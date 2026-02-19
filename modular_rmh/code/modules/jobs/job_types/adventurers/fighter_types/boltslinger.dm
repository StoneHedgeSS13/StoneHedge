/datum/job/advclass/combat/adventurer_fighter/boltslinger
	title = "Boltslinger"
	tutorial = "A mercenary who has honed the deadly art of crossbows across the Sword Coast, \
	the Boltmaster strikes from afar with precision, claiming coin and leaving corpses in their wake."

	outfit = /datum/outfit/adventurer_fighter/boltslinger
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_PER = 2,
		STATKEY_END = 1,
		STATKEY_STR = 1
	)

	skills = list(
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/polearms = 1,
		/datum/skill/combat/crossbows = 3,
		/datum/skill/craft/tanning = 1,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/riding = 3,
		/datum/skill/misc/sewing = 3,
		/datum/skill/misc/medicine = 2,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/athletics = 3
	)

	traits = list(
		TRAIT_MEDIUMARMOR
	)

/datum/job/advclass/combat/adventurer_fighter/boltslinger/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

/datum/outfit/adventurer_fighter/boltslinger
	name = "Boltslinger"
	head = /obj/item/clothing/head/helmet/sallet
	mask = null
	neck = /obj/item/clothing/neck/chaincoif
	cloak = /obj/item/clothing/cloak/half
	armor = /obj/item/clothing/armor/cuirass
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	wrists = null
	gloves = /obj/item/clothing/gloves/angle
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/ammo_holder/quiver/bolts
	beltr = /obj/item/weapon/sword/iron
	ring = null
	l_hand = null
	r_hand = null
	scabbards = list(/obj/item/weapon/scabbard/sword)

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/weapon/knife/hunting = 1
	)

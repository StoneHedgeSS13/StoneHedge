/datum/job/advclass/combat/adventurer_fighter/sembian_merc
	title = "Sembian Mercenary"
	tutorial = "A claymore-wielding mercenary from the nation of Sembia, \
	fleeing internal strife, they sell their sword to the highest bidder, \
	leading cohorts of trained retainers into battle across the Sword Coast."

	outfit = /datum/outfit/adventurer_fighter/sembian_merc
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_END = 2,
		STATKEY_CON = 2,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 3
	)

	traits = list(
		TRAIT_HEAVYARMOR
	)

/datum/outfit/adventurer_fighter/sembian_merc
	name = "Sembian Mercenary"
	head = /obj/item/clothing/head/helmet/gallowglass
	mask = null
	neck = /obj/item/clothing/neck/chaincoif/iron
	cloak = /obj/item/clothing/shirt/undershirt/sash/colored/sembian
	armor = /obj/item/clothing/armor/chainmail/iron
	shirt = /obj/item/clothing/armor/gambeson/light/striped
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/skirt/patkilt/colored/sembian
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/weapon/sword/long/greatsword/claymore
	belt = /obj/item/storage/belt/leather/black/adventurers_subclasses
	beltl = /obj/item/weapon/mace/cudgel
	beltr = /obj/item/storage/belt/pouch/coins/poor
	ring = null
	l_hand = null
	r_hand = null

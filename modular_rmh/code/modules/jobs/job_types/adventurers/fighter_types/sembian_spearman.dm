/datum/job/advclass/combat/adventurer_fighter/sembian_spearman
	title = "Sembian Spearman"
	f_title = "Sembian Spearwoman"
	tutorial = "Once a soldier from the borderlands of Sembia, \
	you have taken to the road as a sellsword. Skilled with spear and bow, you strike quickly and move with purpose, \
	guarding caravans or harrying foes wherever coin—or honor—calls you."

	outfit = /datum/outfit/adventurer_fighter/sembian_spearman
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_SPD = 2,
		STATKEY_END = 1,
		STATKEY_STR = 1
	)

	skills = list(
		/datum/skill/combat/polearms = 3,
		/datum/skill/combat/bows = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 3
	)

	traits = list(
		TRAIT_MEDIUMARMOR
	)

/datum/outfit/adventurer_fighter/sembian_spearman
	name = "Sembian Spearman"
	head = /obj/item/clothing/head/roguehood/colored/black
	mask = null
	neck = /obj/item/clothing/neck/gorget
	cloak = /obj/item/clothing/shirt/undershirt/sash/colored/sembian
	armor = /obj/item/clothing/armor/chainmail/iron
	shirt = /obj/item/clothing/armor/gambeson/light/striped
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/skirt/patkilt/colored/sembian
	shoes = /obj/item/clothing/shoes/boots/leather
	backl = /obj/item/weapon/polearm/spear
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	belt = /obj/item/storage/belt/leather/black/adventurers_subclasses
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/ammo_holder/quiver/arrows
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/weapon/knife/villager = 1)

/datum/job/advclass/combat/adventurer_ranger/tabaxi_raider
	title = "Tabaxi Desert Raider"
	tutorial = "Hailing from the sun-baked dunes near Chult’s western fringe, \
	you are a Tabaxi raider. Swift of foot and sharp of eye, you and your kin live by the bow and sabre, \
	striking where settlements and caravans are weakest, and vanishing before retaliation can find you."

	allowed_races = list(SPEC_ID_RAKSHARI)
	outfit = /datum/outfit/adventurer_ranger/tabaxi_raider
	category_tags = list(CAT_ADVENTURER_RANGER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_PER = 2,
		STATKEY_SPD = 1,
		STATKEY_END = 1
	)

	skills = list(
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/crossbows = 2,
		/datum/skill/combat/bows = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/riding = 3,
		/datum/skill/labor/taming = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/climbing = 1,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/craft/traps = 1
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_STEELHEARTED
	)

/datum/outfit/adventurer_ranger/tabaxi_raider
	name = "Tabaxi Desert Raider"
	head = /obj/item/clothing/neck/keffiyeh/colored/uncolored
	mask = null
	neck = null
	cloak = null
	armor = /obj/item/clothing/armor/leather/splint
	shirt = /obj/item/clothing/shirt/undershirt/colored/uncolored
	wrists = /obj/item/rope/chain //Seems fitting for slavers
	gloves = /obj/item/clothing/gloves/angle
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/ridingboots
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/short
	belt = /obj/item/storage/belt/leather/shalal/adventurers_subclasses
	beltl = /obj/item/ammo_holder/quiver/arrows
	beltr = /obj/item/weapon/sword/sabre
	ring = null
	l_hand = null
	r_hand = null

	scabbards = list(/obj/item/weapon/scabbard/sword)
	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/weapon/knife/dagger = 1
	)

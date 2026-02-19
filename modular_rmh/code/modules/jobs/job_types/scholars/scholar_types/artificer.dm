/datum/job/advclass/town_scholar/artificer
	title = "Artificer"
	tutorial = "You are a learned craftsperson of mechanisms and materials. \
	Gears, pulleys, constructs, and clever devices answer to your hand."

	apprentice_name = "Artificer Apprentice"
	can_have_apprentices = TRUE

	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/town_scholar/artificer
	category_tags = list(CAT_ARCHIVIST)

	give_bank_account = 8
	job_bitflag = BITFLAG_CONSTRUCTOR

	exp_type = list(EXP_TYPE_LIVING)
	exp_requirements = list(EXP_TYPE_LIVING = 600)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_INT = 2,
		STATKEY_END = 1,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/craft/masonry = 3,
		/datum/skill/craft/crafting = 4,
		/datum/skill/craft/engineering = 4,
		/datum/skill/misc/lockpicking = 3,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/athletics = 2,
		/datum/skill/labor/mining = 2,
		/datum/skill/craft/smelting = 4,
		/datum/skill/misc/reading = 2,
		/datum/skill/labor/mathematics = 2,
		/datum/skill/craft/bombs = 3,
	)

	traits = list(
		TRAIT_TUTELAGE,
		)

/datum/outfit/town_scholar/artificer
	name = "Artificer"
	head = /obj/item/clothing/head/articap
	mask = /obj/item/clothing/face/goggles
	neck = null
	cloak = null
	armor = /obj/item/clothing/armor/leather/jacket/artijacket
	shirt = /obj/item/clothing/shirt/undershirt/artificer
	wrists = /obj/item/storage/keyring/guild_artisan
	gloves = null
	pants = /obj/item/clothing/pants/trou/artipants
	shoes = /obj/item/clothing/shoes/simpleshoes/buckle
	backr = null
	backl = /obj/item/storage/backpack/backpack/artibackpack
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/belt/pouch/coins/mid
	beltl = /obj/item/weapon/mace/cane/bronze
	ring = /obj/item/clothing/ring/silver/makers_guild
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/weapon/hammer/steel = 1,
		/obj/item/flashlight/flare/torch/lantern = 1,
		/obj/item/weapon/knife/villager = 1,
		/obj/item/weapon/chisel = 1,
	)

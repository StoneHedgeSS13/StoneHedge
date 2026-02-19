/datum/job/advclass/towner/miner
	title = "Miner"
	tutorial = "In the hills near Rivermist Hollow, \
	you work the patient labor of stone and earth. \
	Salt, iron, and useful rock are your livelihood, \
	and you know the land well enough to hear when it shifts or settles. \
	It is honest work, often shared with a mug of ale at day’s end, \
	and the town relies on what you bring up from below."
	total_positions = 5
	spawn_positions = 5

	outfit = /datum/outfit/towner/miner
	category_tags = list(CAT_TOWNER)
	give_bank_account = 6

	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_INT = -2,
		STATKEY_END = 2,
		STATKEY_CON = 1,
		STATKEY_LCK = 1
	)

	skills = list(
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/labor/mining = 4,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/craft/traps = 1,
		/datum/skill/craft/engineering = 2,
		/datum/skill/craft/blacksmithing = 1,
		/datum/skill/craft/smelting = 2,
		/datum/skill/misc/reading = 1
	)

/datum/outfit/towner/miner
	name = "Miner"
	head = /obj/item/clothing/head/helmet/leather/minershelm
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/poor
	cloak = null
	armor = /obj/item/clothing/armor/gambeson/light/striped
	shirt = /obj/item/clothing/shirt/undershirt/colored/random
	wrists = /obj/item/storage/keyring/guild_artisan
	gloves = null
	pants = /obj/item/clothing/pants/trou
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/weapon/shovel
	backl = /obj/item/storage/backpack/backpack
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/pick
	beltr = /obj/item/flashlight/flare/torch/lantern
	ring = /obj/item/clothing/ring/silver/makers_guild
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/flint = 1,
		/obj/item/weapon/knife/villager = 1,
	)

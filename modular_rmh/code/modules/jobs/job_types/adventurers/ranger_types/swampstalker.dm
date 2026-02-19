/datum/job/advclass/combat/adventurer_ranger/swampstalker
	title = "Swampstalker"
	tutorial = "Hardened in the fetid marshes of the Mere of Dead Men and the shadowed bogs of the Moonshae Isles, \
	these half-orc hunters live off the land, stalking both beast and foe. \
	Skilled in axes, ambush, and survival, they serve as mercenaries, guides, or enforcers for those daring enough to tread the swamps of Faerûn."

	allowed_races = list(SPEC_ID_HALF_ORC)
	outfit = /datum/outfit/adventurer_ranger/swampstalker
	category_tags = list(CAT_ADVENTURER_RANGER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_CON = 3,
		STATKEY_SPD = 1,
		STATKEY_END = 2,
		STATKEY_INT = -2
	)

	skills = list(
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/sneaking = 4,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/craft/crafting = 1,
		/datum/skill/craft/tanning = 1,
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/labor/butchering = 2,
		/datum/skill/misc/medicine = 1,
		/datum/skill/craft/traps = 3,
		/datum/skill/labor/taming = 1,
		/datum/skill/labor/lumberjacking = 3
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_DEADNOSE,
		TRAIT_NASTY_EATER,
		TRAIT_STEELHEARTED
	)

/datum/outfit/adventurer_ranger/swampstalker
	name = "Swampstalker"
	head = /obj/item/clothing/head/helmet/kettle
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
	armor = /obj/item/clothing/armor/leather/hide
	shirt = /obj/item/clothing/shirt/tunic/colored/green
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/weapon/polearm/halberd/bardiche/woodcutter
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/weapon/knife/villager
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1)

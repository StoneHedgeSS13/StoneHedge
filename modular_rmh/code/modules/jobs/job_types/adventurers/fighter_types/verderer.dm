/datum/job/advclass/combat/adventurer_fighter/verderer
	title = "Verderer"
	tutorial = "Once a verderer sworn to guard the forest marches of the Western Heartlands, \
	you were trained to wield the halberd against beasts, brigands, and invading armies alike. \
	Now you sell your reach, strength, and battlefield control to whoever can afford it."

	outfit = /datum/outfit/adventurer_fighter/verderer
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_STR = 2
	)

	skills = list(
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/shields = 1,
		/datum/skill/combat/polearms = 3,
		/datum/skill/combat/bows = 2,
		/datum/skill/craft/tanning = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/riding = 2,
		/datum/skill/misc/sewing = 2,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/athletics = 3
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_HEAVYARMOR
	)

/datum/outfit/adventurer_fighter/verderer
	name = "Verderer"
	head = /obj/item/clothing/head/helmet/leather/advanced
	mask = null
	neck = /obj/item/clothing/neck/chaincoif
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
	armor = /obj/item/clothing/armor/cuirass/iron/rust
	shirt = /obj/item/clothing/shirt/tribalrag
	wrists = /obj/item/clothing/wrists/bracers/leather/advanced
	gloves = /obj/item/clothing/gloves/plate/rust
	pants = /obj/item/clothing/pants/platelegs/rust
	shoes = /obj/item/clothing/shoes/boots/armor/light/rust
	backr = /obj/item/weapon/polearm/halberd/bardiche
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/flashlight/flare/torch/lantern/copper
	beltr = /obj/item/reagent_containers/glass/bottle/waterskin
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/needle = 1
	)

/datum/job/advclass/towner/hunter
	title = "Hunter"
	f_title = "Huntress"
	tutorial = "The wetlands and woodlands near Rivermist Hollow are rich with game, \
	if you know where to look and when to tread lightly. \
	You track deer, boar, and smaller beasts, supplying meat, hides, and bone to the town."
	total_positions = 5
	spawn_positions = 5

	outfit = /datum/outfit/towner/hunter
	category_tags = list(CAT_TOWNER)
	give_bank_account = 15

	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_PER = 3
	)

	skills = list(
		/datum/skill/craft/crafting = 2,
		/datum/skill/craft/tanning = 3,
		/datum/skill/combat/bows = 3,
		/datum/skill/combat/crossbows = 2,
		/datum/skill/combat/knives = 2,
		/datum/skill/craft/cooking = 1,
		/datum/skill/labor/butchering = 2,
		/datum/skill/labor/taming = 3,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/craft/traps = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/reading = 1
	)

	traits = list(
		TRAIT_FORAGER
	)

/datum/outfit/towner/hunter
	name = "Hunter"
	head = /obj/item/clothing/head/brimmed
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/poor
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
	armor = null
	shirt = /obj/item/clothing/shirt/shortshirt/colored/random
	wrists = null
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/ammo_holder/quiver/arrows
	beltr = /obj/item/storage/meatbag
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/flint = 1,
		/obj/item/bait = 1,
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/flashlight/flare/torch/lantern = 1
	)

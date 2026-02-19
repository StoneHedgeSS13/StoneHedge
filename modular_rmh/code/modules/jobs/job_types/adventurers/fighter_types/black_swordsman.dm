/datum/job/advclass/combat/adventurer_fighter/black_swordsman
	title = "Black Swordsman"
	tutorial = "A lone blade against the world, hardened by strife and blood. \
	You survive because you fight, because you endure, because giving up is never an option."

	allowed_sexes = list(MALE)
	outfit = /datum/outfit/adventurer_fighter/black_swordsman
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE
	total_positions = 1

	skills = list(
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/swords = 5,
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/combat/whipsflails = 2,
		/datum/skill/combat/polearms = 2,
		/datum/skill/combat/bows = 1,
		/datum/skill/combat/crossbows = 1,
		/datum/skill/combat/shields = 2,
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/reading = 1,
	)

	jobstats = list(
		STATKEY_STR = 15,
		STATKEY_END = 3,
		STATKEY_CON = 3,
		STATKEY_INT = -2,
	)

	traits = list(
		TRAIT_STEELHEARTED,
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
		TRAIT_STRONGBITE,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_NOPAINSTUN,
	)

/datum/outfit/adventurer_fighter/black_swordsman
	name = "Black Swordsman"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/cape/colored/brown
	armor = /obj/item/clothing/armor/plate/iron
	shirt = /obj/item/clothing/armor/leather/vest/colored/black
	wrists = /obj/item/clothing/wrists/wrappings/common
	gloves = null
	pants = /obj/item/clothing/pants/trou/leather/advanced
	shoes = /obj/item/clothing/shoes/boots/leather/advanced
	backr = /obj/item/storage/backpack/satchel/black
	backl = null
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = null
	beltr = null
	ring = null
	l_hand = null
	r_hand = /obj/item/weapon/sword/long/greatsword/gutsclaymore

	backpack_contents = list(
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/flashlight/flare/torch/lantern = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1
	)

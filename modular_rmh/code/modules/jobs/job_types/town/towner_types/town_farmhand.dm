/datum/job/advclass/towner/farmhand
	title = "Farmhand"
	tutorial = "You live by the turning of seasons and the moods of the soil. \
	The fields of Rivermist Hollow answer to steady hands and patient care, \
	and you know when to plant, when to rest, and when to harvest. \
	Your work feeds the town, keeps markets full, and brings comfort in lean years. \
	It's a peaceful life."
	total_positions = 5
	spawn_positions = 5

	outfit = /datum/outfit/towner/farmhand
	category_tags = list(CAT_TOWNER)

	give_bank_account = 20

	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_INT = -1
	)

	skills = list(
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/polearms = 2,
		/datum/skill/combat/whipsflails = 1,
		/datum/skill/craft/crafting = 2,
		/datum/skill/misc/sewing = 1,
		/datum/skill/labor/farming = 4,
		/datum/skill/labor/taming = 5,
		/datum/skill/misc/reading = 1,
		/datum/skill/craft/cooking = 1,
		/datum/skill/craft/carpentry = 1,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/craft/tanning = 2,
		/datum/skill/misc/riding = 1,
		/datum/skill/labor/butchering = 4
	)

	traits = list(
		TRAIT_DEADNOSE,
		TRAIT_SEEDKNOW
	)

/datum/outfit/towner/farmhand
	name = "Farmhand"
	head = null
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/poor
	cloak = null
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = null
	backl = /obj/item/storage/backpack/satchel/cloth
	belt = /obj/item/storage/belt/leather/rope
	beltl = /obj/item/key/soilson
	beltr = /obj/item/weapon/knife/villager
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/recipe_book/cooking = 1,
		/obj/item/bottle_kit = 1,
		/obj/item/recipe_book/agriculture = 1
	)

/datum/outfit/towner/farmhand/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		head = /obj/item/clothing/head/strawhat
		armor = /obj/item/clothing/armor/gambeson/light/striped
		shirt = /obj/item/clothing/shirt/undershirt/colored/random
		pants = /obj/item/clothing/pants/tights/colored/random
	else
		head = /obj/item/clothing/head/armingcap
		armor = /obj/item/clothing/shirt/dress/gen/colored/random
		shirt = /obj/item/clothing/shirt/undershirt

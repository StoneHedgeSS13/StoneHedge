/datum/job/advclass/town_scholar_apprentice/physician_apprentice
	title = "Physician’s Apprentice"
	tutorial = "You are apprenticed to the Town Physician. \
	You assist with cleaning tools, preparing simple remedies, \
	and keeping the clinic and barber’s bench in order. \
	You shave heads, trim beards, fetch herbs, and hold lamps during treatment. \
	You are learning the basics of medicine, hygiene, and careful work with blade and needle."

	total_positions = 2
	spawn_positions = 2

	outfit = /datum/outfit/town_scholar_apprentice/physician_apprentice
	category_tags = list(CAT_ARCHIVISTAP)

	give_bank_account = 20

	jobstats = list(
		STATKEY_INT = 1,
		STATKEY_PER = 1,
	)

	skills = list(
		/datum/skill/craft/alchemy = 2,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/sewing = 1,
		/datum/skill/labor/farming = 2,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/athletics = 1,
		/datum/skill/misc/sneaking = 1,
		/datum/skill/combat/knives = 1,
		/datum/skill/combat/unarmed = 1
	)

	traits = list(
		TRAIT_FORAGER,
		TRAIT_EMPATH,
	)

/datum/outfit/town_scholar_apprentice/physician_apprentice
	name = "Physician’s Apprentice"
	head = /obj/item/clothing/head/physician
	mask = /obj/item/clothing/face/physician
	neck = /obj/item/clothing/neck/physician
	cloak = null
	armor = /obj/item/clothing/shirt/robe/physician
	shirt = null
	wrists = null
	gloves = /obj/item/clothing/gloves/leather
	pants = null
	shoes = null
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/storage/backpack/satchel/surgbag
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/keyring/clinic
	beltl = /obj/item/storage/fancy/ifak
	ring = /obj/item/clothing/ring/feldsher_ring
	l_hand = /obj/item/storage/belt/pouch/coins/mid
	r_hand = null

/datum/outfit/town_scholar_apprentice/physician_apprentice/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/undershirt/courtphysician
		pants = /obj/item/clothing/pants/trou/leather/courtphysician
		shoes = /obj/item/clothing/shoes/courtphysician
	else
		shirt = /obj/item/clothing/shirt/undershirt/courtphysician/female
		pants = /obj/item/clothing/pants/skirt/courtphysician
		shoes = /obj/item/clothing/shoes/heels/courtphysician/female

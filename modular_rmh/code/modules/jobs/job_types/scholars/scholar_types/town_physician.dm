/datum/job/advclass/town_scholar/town_physician
	title = "Town Physician"
	tutorial = "You are the town’s physician. \
	You cut hair, shave beards, and keep tools clean to prevent sickness. \
	You brew simple medicines, dress wounds, set bones, and stitch what can be saved. \
	You work with herbs, steel, and steady hands, guided by experience rather than superstition. \
	Your work is quiet, constant, and often thankless — but the town is healthier for it."

	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/town_scholar/town_physician
	category_tags = list(CAT_ARCHIVIST)

	trainable_skills = list(/datum/skill/craft/alchemy)
	max_apprentices = 2
	apprentice_name = "Town Physician Apprentice"
	can_have_apprentices = TRUE

	give_bank_account = 100
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_INT = 4,
		STATKEY_PER = 1,
		STATKEY_STR = -1,
		STATKEY_CON = -1,
	)

	skills = list(
		/datum/skill/craft/alchemy = 5,
		/datum/skill/misc/medicine = 5,
		/datum/skill/misc/reading = 5,
		/datum/skill/misc/sewing = 3,
		/datum/skill/labor/mathematics = 3,
		/datum/skill/labor/farming = 3,
		/datum/skill/craft/crafting = 2,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/combat/unarmed = 1
	)

	traits = list(
		TRAIT_FORAGER,
		TRAIT_LEGENDARY_ALCHEMIST,
		TRAIT_EMPATH,
		TRAIT_STEELHEARTED,
		TRAIT_DEADNOSE,
		TRAIT_TUTELAGE,
	)

	spells = list(
		/datum/action/cooldown/spell/diagnose,
	)

/datum/outfit/town_scholar/town_physician
	name = "Town Physician"
	head = null
	mask = /obj/item/clothing/face/courtphysician
	neck = /obj/item/storage/belt/pouch/coins/mid
	cloak = null
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = null
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/storage/backpack/satchel/surgbag
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/keyring/clinic
	beltl = /obj/item/storage/fancy/ifak
	ring = /obj/item/clothing/ring/feldsher_ring
	l_hand = /obj/item/clothing/gloves/leather/thaumgloves
	r_hand = null

/datum/outfit/town_scholar/town_physician/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		head = /obj/item/clothing/head/courtphysician
		armor = /obj/item/clothing/armor/leather/courtphysician
		shirt = /obj/item/clothing/shirt/undershirt/courtphysician
		gloves = /obj/item/clothing/gloves/leather/courtphysician
		pants = /obj/item/clothing/pants/trou/leather/courtphysician
		shoes = /obj/item/clothing/shoes/courtphysician
	else
		head = /obj/item/clothing/head/courtphysician/female
		armor = /obj/item/clothing/armor/leather/courtphysician/female
		shirt = /obj/item/clothing/shirt/undershirt/courtphysician/female
		gloves = /obj/item/clothing/gloves/leather/courtphysician/female
		pants = /obj/item/clothing/pants/skirt/courtphysician
		shoes = /obj/item/clothing/shoes/heels/courtphysician/female

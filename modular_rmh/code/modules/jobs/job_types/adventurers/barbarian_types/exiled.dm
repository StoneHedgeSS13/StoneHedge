/datum/job/advclass/combat/adventurer_barbarian/exiled
	title = "Exiled Warrior"
	tutorial = "A barbarian - you're a brute, and you're a long way from home. \
	You took more of a liking to the blade than your elders wanted - in truth, they did not have to even deliberate to banish you. \
	You will drown in ale, and your enemies in blood."

	allowed_races = list(SPEC_ID_HALF_ORC)
	outfit = /datum/outfit/adventurer_barbarian/exiled
	category_tags = list(CAT_ADVENTURER_BARBARIAN)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 2,
		STATKEY_CON = 2,
		STATKEY_SPD = -1,
		STATKEY_INT = 3
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
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/misc/medicine = 2,
		/datum/skill/craft/traps = 3
	)

	traits = list(
		TRAIT_STEELHEARTED,
		TRAIT_DEADNOSE,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_NOPAINSTUN,
		TRAIT_DUALWIELDER
	)

	voicepack_m = /datum/voicepack/male/warrior

/datum/job/advclass/combat/adventurer_barbarian/exiled/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(spawned.gender == MALE && spawned.dna?.species)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/warrior()

/datum/outfit/adventurer_barbarian/exiled
	name = "Exiled Warrior"
	head = /obj/item/clothing/head/helmet/leather
	mask = null
	neck = /obj/item/clothing/neck/coif
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
	armor = /obj/item/clothing/shirt/undershirt/easttats/exiled
	shirt = null
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather/advanced
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/weapon/axe/iron
	beltr = /obj/item/weapon/axe/iron
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1)

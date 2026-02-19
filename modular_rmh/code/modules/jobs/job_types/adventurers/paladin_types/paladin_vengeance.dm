/datum/job/advclass/combat/adventurer_paladin/vengeance
	title = "Oath Of Vengeance "
	tutorial = "You have set aside even your own purity to right wrongs and deliver justice to those who have committed the most grievous sins."

	outfit = /datum/outfit/adventurer_paladin/vengeance
	category_tags = list(CAT_ADVENTURER_PALADIN)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/shields = 3,
		/datum/skill/misc/climbing = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 3,
		/datum/skill/magic/holy = 2,
		/datum/skill/craft/cooking = 1,
		/datum/skill/labor/mathematics = 3,
	)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_PER = 2,
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_SPD = -2,
		STATKEY_LCK = 1,
	)

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_NOBLE,
		TRAIT_STEELHEARTED,
		TRAIT_HOLY,
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/essence/silence,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/sacred_flame,
		/datum/action/cooldown/spell/undirected/divine_strike,
	)

/datum/job/advclass/combat/adventurer_paladin/vengeance/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.grant_language(/datum/language/celestial)

	if(spawned.dna?.species.id == SPEC_ID_HUMEN)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/knight()

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_templar()
		devotion.grant_to(spawned)

/datum/outfit/adventurer_paladin/vengeance
	name = "Oath Of Vengeance"
	head = /obj/item/clothing/head/helmet/heavy/ordinatorhelm
	mask = null
	neck = /obj/item/clothing/neck/gorget
	cloak = /obj/item/clothing/cloak/ordinatorcape
	armor = /obj/item/clothing/armor/plate/fluted/ornate/ordinator
	shirt = /obj/item/clothing/armor/gambeson/heavy/inq
	wrists = null
	gloves = /obj/item/clothing/gloves/leather/otavan
	pants = /obj/item/clothing/pants/platelegs
	shoes = /obj/item/clothing/shoes/otavan/inqboots
	backr = /obj/item/storage/backpack/satchel/otavan
	backl = /obj/item/weapon/sword/long/judgement
	belt = /obj/item/storage/belt/leather/steel/adventurers_subclasses
	beltl = /obj/item/storage/belt/pouch/coins/mid
	beltr = null
	ring = /obj/item/clothing/ring/signet/silver
	l_hand = null
	r_hand = null

/datum/outfit/adventurer_paladin/vengeance/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

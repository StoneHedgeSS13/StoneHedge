/datum/job/waterdeep_merchant
	title = "Waterdeep Guild Merchant"
	tutorial = "You are a licensed merchant of the Waterdeep Trading Guild, operating in Rivermist Hollow. \
	You manage trade deliveries, warehouses, and financial dealings on behalf of Waterdeep Merchant's Guild. \
	Guild loans are legal and enforceable — unpaid debts may result in seizure, punishment, or contract restitution. \
	Formality is required. Mercy is optional. Profit is mandatory."
	department_flag = TRADERS
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_WATERDEEP_MERCHANT

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	outfit = /datum/outfit/waterdeep_merchant
	selection_color = JCOLOR_TRADERS

	give_bank_account = 300
	exp_type = list(EXP_TYPE_LIVING, EXP_TYPE_MERCHANT_COMPANY)
	exp_types_granted = list(EXP_TYPE_MERCHANT_COMPANY)
	exp_requirements = list(
		EXP_TYPE_LIVING = 800,
		EXP_TYPE_MERCHANT_COMPANY = 500,
	)

	jobstats = list(
		STATKEY_INT = 2,
		STATKEY_PER = 1,
		STATKEY_STR = -1
	)

	skills = list(
		/datum/skill/combat/swords = 2,
		/datum/skill/combat/knives = 1,
		/datum/skill/misc/reading = 6,
		/datum/skill/misc/sneaking = 1,
		/datum/skill/misc/stealing = 5,
		/datum/skill/misc/lockpicking = 2,
		/datum/skill/misc/riding = 2,
		/datum/skill/labor/mathematics = 6
	)

	traits = list(
		TRAIT_SEEPRICES,
		TRAIT_NOBLE
	)

/datum/outfit/waterdeep_merchant
	name = "Waterdeep Guild Merchant"
	head = /obj/item/clothing/head/chaperon/colored/greyscale/silk/random
	mask = null
	neck = /obj/item/clothing/neck/mercator
	cloak = null
	armor = /obj/item/clothing/shirt/robe/merchant
	shirt = /obj/item/clothing/shirt/tunic/noblecoat
	wrists = /obj/item/storage/keyring/waterdeep_guild
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/plaquegold
	beltr = /obj/item/weapon/mace/cane/merchant
	beltl = /obj/item/weapon/scabbard/sword/noble
	ring = /obj/item/clothing/ring/gold/guild_mercator
	l_hand = /obj/item/weapon/sword/rapier
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/veryrich = 1,
		/obj/item/merctoken = 1
	)

/datum/outfit/waterdeep_merchant/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		pants = /obj/item/clothing/pants/tights/colored/white

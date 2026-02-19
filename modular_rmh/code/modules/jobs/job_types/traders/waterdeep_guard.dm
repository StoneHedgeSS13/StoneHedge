/datum/job/waterdeep_guild_guard
	title = "Waterdeep Guild Guard"
	tutorial = "You are a hired guard of the Waterdeep Trading Guild. \
	Your duty is to protect guild representatives, guild property, and guild facilities.\
	Threats to guild coin, contracts, or personnel are to be deterred swiftly and decisively."
	department_flag = TRADERS
	faction = FACTION_TOWN
	total_positions = 3
	spawn_positions = 3
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_WATERDEEP_GUARD

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	outfit = /datum/outfit/waterdeep_guild_guard
	selection_color = JCOLOR_TRADERS

	give_bank_account = 100
	exp_type = list(EXP_TYPE_LIVING)
	exp_types_granted = list(EXP_TYPE_COMBAT, EXP_TYPE_MERCHANT_COMPANY)
	exp_requirements = list(
		EXP_TYPE_LIVING = 300
	)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_END = 2,
		STATKEY_CON = 2
	)

	skills = list(
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/shields = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/reading = 1
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_HEAVYARMOR,
		TRAIT_KNOWBANDITS
	)


/datum/job/waterdeep_guild_guard/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/proc/haltyell

// OUTFIT

/datum/outfit/waterdeep_guild_guard
	name = "Waterdeep Guild Guard"
	head = /obj/item/clothing/head/roguetown/helmet/guildguard
	mask = null
	neck = /obj/item/clothing/neck/gorget
	cloak = /obj/item/clothing/cloak/guildguard
	armor = /obj/item/clothing/suit/roguetown/armor/guildguard
	shirt = /obj/item/clothing/armor/gambeson
	wrists = /obj/item/storage/keyring/waterdeep_guild
	gloves = /obj/item/clothing/gloves/leather/advanced
	pants = /obj/item/clothing/pants/trou/leather/splint
	shoes = /obj/item/clothing/shoes/boots/leather/advanced
	backr = /obj/item/storage/backpack/satchel/black
	backl = null
	belt = /obj/item/storage/belt/leather/steel
	beltr = /obj/item/weapon/scabbard/sword
	beltl = /obj/item/weapon/mace/stunmace
	ring = null
	l_hand = null
	r_hand = /obj/item/weapon/sword/sabre

	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/stronghealthpot,
		/obj/item/flashlight/flare/torch/lantern,
		/obj/item/storage/belt/pouch/coins/mid,
		/obj/item/rope/chain,
	)

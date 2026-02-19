/datum/job/watch_sergeant
	title = "Town Watch Sergeant"
	tutorial = "You are a Sergeant of the Town Watch of Rivermist Hollow. \
	You lead patrols, enforce discipline among the watchmen, and act as the Captain’s right hand in the streets. \
	You are responsible for training recruits, responding to disturbances, and ensuring the Captain’s orders are followed. \
	While you do not command the Watch, you are its backbone."
	department_flag = TOWNWATCH
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_WATCH_SERGEANT
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	selection_color = JCOLOR_TOWNWATCH

	outfit = /datum/outfit/watch_sergeant

	give_bank_account = 55

	exp_type = list(EXP_TYPE_LIVING)
	exp_types_granted = list(EXP_TYPE_GARRISON, EXP_TYPE_COMBAT)
	exp_requirements = list(
		EXP_TYPE_LIVING = 450
	)

	job_bitflag = BITFLAG_GARRISON

	jobstats = list(
		STATKEY_STR = 3,
		STATKEY_PER = 2,
		STATKEY_INT = 1,
		STATKEY_CON = 3,
		STATKEY_END = 3,
		STATKEY_SPD = 2
	)

	skills = list(
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/shields = 3,
		/datum/skill/combat/wrestling = 4,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/combat/polearms = 3,
		/datum/skill/combat/bows = 3,
		/datum/skill/combat/crossbows = 3,
		/datum/skill/combat/firearms = 3,

		/datum/skill/misc/athletics = 4,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/reading = 2
	)

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
		TRAIT_KNOWBANDITS,
		TRAIT_RECOGNIZED,
		TRAIT_BREADY
	)

/datum/outfit/watch_sergeant
	name = "Town Watch Sergeant"
	head = /obj/item/clothing/head/helmet/kettle/slit/atarms/town_watch
	mask = null
	neck = /obj/item/clothing/neck/gorget
	cloak = /obj/item/clothing/cloak/half/guard
	armor = /obj/item/clothing/armor/cuirass
	shirt = /obj/item/clothing/armor/gambeson/heavy/colored/town_watch
	wrists = /obj/item/clothing/wrists/bracers/jackchain
	gloves = /obj/item/clothing/gloves/chain/iron
	pants = /obj/item/clothing/pants/chainlegs/iron
	shoes = /obj/item/clothing/shoes/boots/armor/light
	backr = /obj/item/storage/backpack/satchel/black
	backl = /obj/item/weapon/shield/heater
	belt = /obj/item/storage/belt/leather/town_watch
	beltr = /obj/item/weapon/scabbard/sword
	beltl = /obj/item/weapon/mace/stunmace
	ring = /obj/item/clothing/ring/slave_control
	l_hand = /obj/item/weapon/sword/sabre
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/bullets,
		/obj/item/reagent_containers/glass/bottle/aflask,
		/obj/item/gun/ballistic/revolver/grenadelauncher/pistol,
		/obj/item/clothing/neck/slave_collar,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot,
		/obj/item/flashlight/flare/torch/lantern,
	)

/datum/job/watch_sergeant/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/proc/haltyell

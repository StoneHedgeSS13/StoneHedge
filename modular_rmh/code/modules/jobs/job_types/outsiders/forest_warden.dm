/datum/job/forest_warden
	title = "Forest Warden"
	tutorial = "Raised among trees and mist, you know the forests and swamps around Rivermist Hollow better than any map. \
	Appointed by the Council, you lead the Forest Rangers in guarding the wild borders, guiding travelers, and keeping old dangers in check."
	department_flag = OUTSIDERS
	faction = FACTION_NEUTRAL
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_FOREST_WARDEN

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST

	selection_color = JCOLOR_OUTSIDERS
	outfit = /datum/outfit/forest_warden
	give_bank_account = 45

	exp_type = list(EXP_TYPE_GARRISON)
	exp_types_granted = list(EXP_TYPE_GARRISON, EXP_TYPE_COMBAT, EXP_TYPE_LEADERSHIP)
	exp_requirements = list(
		EXP_TYPE_GARRISON = 900
	)

	outfit = /datum/outfit/forest_warden
	spells = list(/datum/action/cooldown/spell/undirected/list_target/convert_role/forest_ranger)

	job_bitflag = BITFLAG_GARRISON

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_PER = 1,
		STATKEY_INT = 1,
		STATKEY_END = 3,
		STATKEY_SPD = 1
	)

	skills = list(
		/datum/skill/combat/axesmaces = 4,
		/datum/skill/combat/bows = 4,
		/datum/skill/combat/crossbows = 2,
		/datum/skill/combat/wrestling = 4,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/knives = 3,
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 4,
		/datum/skill/misc/reading = 2,
		/datum/skill/misc/riding = 3,
		/datum/skill/craft/crafting = 2,
		/datum/skill/labor/lumberjacking = 1,
		/datum/skill/craft/carpentry = 1,
		/datum/skill/misc/sewing = 1,
		/datum/skill/craft/tanning = 2
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_HEAVYARMOR,
		TRAIT_NOBLE,
		TRAIT_FORAGER,
		TRAIT_SEEDKNOW,
		TRAIT_OLDPARTY,
		TRAIT_DEADNOSE,
		TRAIT_BESTIALSENSE,
	)

/datum/job/forest_warden/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.update_sight()
	spawned.verbs |= /mob/proc/haltyell

/datum/outfit/forest_warden
	name = "Forest Warden"
	head = /obj/item/clothing/head/helmet/visored/warden
	mask = null
	neck = /obj/item/clothing/neck/bevor
	cloak = /obj/item/clothing/cloak/wardencloak
	armor = /obj/item/clothing/armor/plate
	shirt = /obj/item/clothing/armor/chainmail
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/platelegs
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/weapon/polearm/halberd/bardiche/warcutter
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/fgarrison
	beltl = /obj/item/weapon/axe/iron
	beltr = /obj/item/storage/belt/pouch/coins/mid
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/rope/chain = 1,
		/obj/item/signal_horn = 1
	)

//CONVERSION
/datum/action/cooldown/spell/undirected/list_target/convert_role/forest_ranger
	name = "Recruit Forest Ranger"

	new_role = "Forest Rangers Recruit"
	recruitment_faction = "Forest Rangers"
	recruitment_message = "Join the Forest Rangers, %RECRUIT!"
	accept_message = "I swear to protect the forest!"

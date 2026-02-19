/datum/job/heart_priest
	title = "Heart Priest"
	f_title = "Heart Priestess"
	tutorial = "You serve Sune Firehair, Lady of Love and Beauty. \
	Where hearts ache and spirits falter, you restore warmth and desire. \
	This chapel is a place of healing, art, and emotional refuge."
	department_flag = CHAPEL
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_HEART_PRIEST

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST

	outfit = /datum/outfit/heart_priest
	selection_color = JCOLOR_CHAPEL

	give_bank_account = 100

	exp_type = list(EXP_TYPE_CHURCH)
	exp_types_granted = list(EXP_TYPE_CHURCH, EXP_TYPE_CLERIC)
	exp_requirements = list(EXP_TYPE_CHURCH = 700)

	allowed_patrons = list(/datum/patron/faerun/good_gods/Sune)
	jobstats = list(
		STATKEY_PER = 1,
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_END = 2,
		STATKEY_SPD = 2,
		STATKEY_LCK = 3
	)

	skills = list(
		/datum/skill/magic/holy = 4,
		/datum/skill/misc/reading = 4,
		/datum/skill/misc/medicine = 3,
		/datum/skill/misc/music = 4,
		/datum/skill/misc/athletics = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/whipsflails = 2,
		/datum/skill/misc/sewing = 3,
	)

	traits = list(
		TRAIT_HOLY,
		TRAIT_ALLURE,
		TRAIT_GOODLOVER,
		TRAIT_BEAUTIFUL,
		TRAIT_SECRET_OFFICIANT,
		TRAIT_EMPATH
	)

	languages = list(/datum/language/celestial)

	magic_user = TRUE
	spell_points = 30

	spells = list(/datum/action/cooldown/spell/undirected/list_target/convert_role/chapel_acolyte,
		/datum/action/cooldown/spell/undirected/call_bird/priest,
		/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/healing/greater,
		/datum/action/cooldown/spell/revive,
		/datum/action/cooldown/spell/attach_bodypart,
		/datum/action/cooldown/spell/diagnose/holy,
		/datum/action/cooldown/spell/cure_rot,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/toxic_cleanse,
		/datum/action/cooldown/spell/essence/healing_spring,
		/datum/action/cooldown/spell/essence/neutralize,
		/datum/action/cooldown/spell/essence/purify_water,
		/datum/action/cooldown/spell/instill_perfection,
		/datum/action/cooldown/spell/undirected/message,
		/datum/action/cooldown/spell/undirected/list_target/encode_thoughts,
		/datum/action/cooldown/spell/undirected/feather_falling,
		/datum/action/cooldown/spell/undirected/longstrider,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/undirected/locate_dead,
		/datum/action/cooldown/spell/sacred_flame,
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,
	)

/datum/job/heart_priest/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/living/carbon/human/proc/churchannouncement

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_priest()
		devotion.grant_to(spawned)

//OUTFIT

/datum/outfit/heart_priest
	name = "Heart Priest"
	head = /obj/item/clothing/head/flowercrown/rosa
	mask = null
	neck = /obj/item/clothing/neck/psycross/silver/sune
	cloak = /obj/item/clothing/cloak/half/colored/red
	armor = null
	shirt = /obj/item/clothing/shirt/toga
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/toga_sandals
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/cloth/heart_priest
	beltr = /obj/item/storage/belt/pouch/coins/rich
	beltl = /obj/item/storage/keyring/town_chapel
	ring = /obj/item/clothing/ring/gold/rontz
	l_hand = null
	r_hand = /obj/item/weapon/polearm/woodstaff/aries

	backpack_contents = list(
		/obj/item/needle/blessed = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 2,
		/obj/item/reagent_containers/glass/bottle/beer/emberwine = 1,
		/obj/item/reagent_containers/glass/bottle/alchemical/blessedwater = 1,
	)

/datum/outfit/heart_priest/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

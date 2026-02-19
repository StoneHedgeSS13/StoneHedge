/datum/job/guild_wizard_apprentice
	title = "Guild Wizard Apprentice"
	tutorial = "You are learning the Arcyne Arts. Study hard, assist your mentors, and practice your magic to become a fully fledged guild wizard."
	department_flag = SCHOLARS
	faction = FACTION_TOWN
	total_positions = 4
	spawn_positions = 4
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_GUILD_WIZARD_APPRENTICE

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT)

	outfit = /datum/outfit/guild_wizard_apprentice
	selection_color = JCOLOR_SCHOLARS

	give_bank_account = 20
	exp_types_granted = list(EXP_TYPE_MAGICK, EXP_TYPE_ADVENTURER)

	jobstats = list(
		STATKEY_INT = 1,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/magic/arcane = 1,
		/datum/skill/misc/reading = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/athletics = 1,
		/datum/skill/combat/polearms = 2
	)

	magic_user = TRUE
	spell_points = 15
	attunements_max = 5
	attunements_min = 1
	spells = list(
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
	)

/datum/outfit/guild_wizard_apprentice
	name = "Apprentice Wizard"
	head = null
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/shortboots
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/magebag/apprentice
	beltl = /obj/item/storage/keyring/master_wizard
	ring = null
	l_hand = null
	r_hand = /obj/item/weapon/polearm/woodstaff

	backpack_contents = list(
		/obj/item/book/granter/spellbook/apprentice = 1,
		/obj/item/chalk = 1,
		/obj/item/storage/belt/pouch/coins/mid,
	)

/datum/outfit/guild_wizard_apprentice/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/outfit/guild_wizard_apprentice/post_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	var/static/list/selectablehat = list(
		"Mage hood" = /obj/item/clothing/head/roguehood/colored/mage,
		"None" = null,
	)
	equipped_human.select_equippable(equipped_human, selectablehat, message = "Choose your hat of choice", title = "APPRENTICE")

	var/static/list/selectablerobe = list(
		"Mage robes" = /obj/item/clothing/shirt/robe/colored/mage,
		"Mage robes Alt" = /obj/item/clothing/shirt/robe/skyrim_mage,
		"Tunic" = /obj/item/clothing/shirt/tunic,
		"Lowcut tunic" = /obj/item/clothing/shirt/undershirt/lowcut,
		"Silk dress" = /obj/item/clothing/shirt/dress/silkdress/colored/random,
	)
	equipped_human.select_equippable(equipped_human, selectablerobe, message = "Choose your attire of choice", title = "APPRENTICE")

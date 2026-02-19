/datum/job/guild_master_wizard
	title = "Guild Master Wizard"
	tutorial = "The leader of the wizard's guild. You oversee the magical affairs of the town, guide the younger wizards, and handle the most complex arcane matters."
	department_flag = SCHOLARS
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_GUILD_WIZARD_MASTER

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	outfit = /datum/outfit/guild_master_wizard
	selection_color = JCOLOR_SCHOLARS

	apprentice_name = "Guild Wizard Apprentice"
	can_have_apprentices = TRUE

	give_bank_account = 120
	exp_types_granted = list(EXP_TYPE_MAGICK, EXP_TYPE_ADVENTURER, EXP_TYPE_NOBLE)

	jobstats = list(
		STATKEY_STR = -2,
		STATKEY_INT = 5,
		STATKEY_CON = -1,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/magic/arcane = 6,
		/datum/skill/misc/reading = 6,
		/datum/skill/craft/alchemy = 4,
		/datum/skill/labor/mathematics = 4,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/wrestling = 2
	)

	traits = list(
		TRAIT_TUTELAGE,
		TRAIT_SEEPRICES,
		TRAIT_OLDPARTY,
	)

	magic_user = TRUE
	spell_points = 70
	attunements_max = 20
	attunements_min = 10
	spells = list(
		/datum/action/cooldown/spell/aoe/knock,
		/datum/action/cooldown/spell/undirected/jaunt/ethereal_jaunt,
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/projectile/fireball,
		/datum/action/cooldown/spell/undirected/shapeshift/cat,				//HARRY POTTAH?!!!
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,
	)

/datum/job/guild_master_wizard/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(spawned.gender == MALE && spawned.dna?.species  && spawned.dna.species.id != SPEC_ID_MEDICATOR)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/wizard()

/datum/outfit/guild_master_wizard
	name = "Master Wizard"
	head = null
	mask = null
	neck = /obj/item/clothing/neck/mana_star
	cloak = /obj/item/clothing/cloak/black_cloak
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/shortboots
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/plaquegold
	beltr = /obj/item/storage/magebag/apprentice
	beltl = /obj/item/storage/keyring/master_wizard
	ring = /obj/item/clothing/ring/gold
	l_hand = null
	r_hand = /obj/item/weapon/polearm/woodstaff

	backpack_contents = list(
		/obj/item/scrying = 1,
		/obj/item/chalk = 1,
		/obj/item/reagent_containers/glass/bottle/killersice = 1,
		/obj/item/book/granter/spellbook/master = 1,
		/obj/item/weapon/knife/dagger/silver/arcyne = 1,
		/obj/item/storage/belt/pouch/coins/rich
	)

/datum/outfit/guild_master_wizard/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/outfit/guild_master_wizard/post_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	var/static/list/selectablehat = list(
		"Witch hat" = /obj/item/clothing/head/wizhat/witch,
		"Mage hood" = /obj/item/clothing/head/roguehood/colored/mage,
		"Generic Wizard hat" = /obj/item/clothing/head/wizhat/gen,
		"Black hood" = /obj/item/clothing/head/roguehood/colored/black,
	)
	equipped_human.select_equippable(equipped_human, selectablehat, message = "Choose your hat of choice", title = "MASTER WIZARD")

	var/static/list/selectablerobe = list(
		"Black robes" = /obj/item/clothing/shirt/robe/colored/black,
		"Mage robes" = /obj/item/clothing/shirt/robe/colored/mage,
		"Courtmage Robes" = /obj/item/clothing/shirt/robe/colored/courtmage,
		"Wizard robes" = /obj/item/clothing/shirt/robe/wizard,
	)
	equipped_human.select_equippable(equipped_human, selectablerobe, message = "Choose your robe of choice", title = "MASTER WIZARD")

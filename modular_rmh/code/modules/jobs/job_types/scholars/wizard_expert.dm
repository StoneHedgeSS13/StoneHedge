/datum/job/guild_wizard
	title = "Guild Wizard"
	tutorial = "A trained member of the wizard's guild."
	department_flag = SCHOLARS
	faction = FACTION_TOWN
	total_positions = 2
	spawn_positions = 2
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_GUILD_WIZARD_EXPERT

	allowed_races = ALL_RACES_LIST
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)

	selection_color = JCOLOR_SCHOLARS

	advclass_cat_rolls = list(CAT_GUILDWIZARD = 20)

	job_subclasses = list(
		/datum/job/advclass/guild_wizard/expert,
		/datum/job/advclass/guild_wizard/adept,
	)

	give_bank_account = 60
	exp_types_granted = list(EXP_TYPE_MAGICK, EXP_TYPE_ADVENTURER)

//SUBCLASSES

/datum/job/advclass/guild_wizard/expert
	title = "Guild Wizard Expert"
	tutorial = "A senior wizard in the guild. You can lead apprentices, conduct research, and manage complex arcane projects."

	outfit = /datum/outfit/guild_wizard/expert
	category_tags = list(CAT_GUILDWIZARD)

	apprentice_name = "Guild Wizard Apprentice"
	can_have_apprentices = TRUE

	magic_user = TRUE
	spell_points = 40
	attunements_max = 15
	attunements_min = 10

	spells = list(
		/datum/action/cooldown/spell/aoe/knock,
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/projectile/fireball,
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,
	)

	jobstats = list(
		STATKEY_INT = 4,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/magic/arcane = 5,
		/datum/skill/misc/reading = 5,
		/datum/skill/craft/alchemy = 3,
		/datum/skill/labor/mathematics = 3
	)

	traits = list(
		TRAIT_TUTELAGE,
		TRAIT_SEEPRICES,
	)

/datum/outfit/guild_wizard/expert
	name = "Expert Wizard"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/cape/archivist
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/shortboots
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltr = /obj/item/storage/magebag/apprentice
	beltl = /obj/item/storage/keyring/master_wizard
	ring = null
	l_hand = null
	r_hand = /obj/item/weapon/polearm/woodstaff

	backpack_contents = list(
		/obj/item/scrying = 1,
		/obj/item/chalk = 1,
		/obj/item/reagent_containers/glass/bottle/killersice = 1,
		/obj/item/book/granter/spellbook/expert = 1,
		/obj/item/weapon/knife/dagger/silver/arcyne = 1,
		/obj/item/storage/belt/pouch/coins/mid,
	)

/datum/outfit/guild_wizard/expert/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/outfit/guild_wizard/expert/post_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	var/static/list/selectablehat = list(
		"Witch hat" = /obj/item/clothing/head/wizhat/witch,
		"Mage hood" = /obj/item/clothing/head/roguehood/colored/mage,
		"Generic Wizard hat" = /obj/item/clothing/head/wizhat/gen,
		"Black hood" = /obj/item/clothing/head/roguehood/colored/black,
		"None" = null,
	)
	equipped_human.select_equippable(equipped_human, selectablehat, message = "Choose your hat of choice", title = "WIZARD")

	var/static/list/selectablerobe = list(
		"Black robes" = /obj/item/clothing/shirt/robe/colored/black,
		"Mage robes" = /obj/item/clothing/shirt/robe/colored/mage,
		"Mage robes Alt" = /obj/item/clothing/shirt/robe/skyrim_mage,
		"Wizard robes" = /obj/item/clothing/shirt/robe/wizard,
		"Tunic" = /obj/item/clothing/shirt/tunic,
		"Lowcut tunic" = /obj/item/clothing/shirt/undershirt/lowcut,
		"Silk dress" = /obj/item/clothing/shirt/dress/silkdress/colored/random,
	)
	equipped_human.select_equippable(equipped_human, selectablerobe, message = "Choose your attire of choice", title = "WIZARD")


// ─────────────────────────────

/datum/job/advclass/guild_wizard/adept
	title = "Guild Wizard Adept"
	tutorial = "You have completed your basic training. You are proficient in the arcane, learning to manage guild tasks."

	outfit = /datum/outfit/guild_wizard/adept
	category_tags = list(CAT_GUILDWIZARD)

	magic_user = TRUE
	spell_points = 30
	attunements_max = 15
	attunements_min = 5

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/projectile/fireball,
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,
	)

	jobstats = list(
		STATKEY_INT = 2,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/magic/arcane = 3,
		/datum/skill/misc/reading = 4,
		/datum/skill/craft/alchemy = 2,
		/datum/skill/labor/mathematics = 2
	)

/datum/outfit/guild_wizard/adept
	name = "Adept Wizard"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/cape/colored/wizard
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/shortboots
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltr = /obj/item/storage/magebag/apprentice
	beltl = /obj/item/storage/keyring/master_wizard
	ring = null
	l_hand = null
	r_hand = /obj/item/weapon/polearm/woodstaff

	backpack_contents = list(
		/obj/item/scrying = 1,
		/obj/item/chalk = 1,
		/obj/item/reagent_containers/glass/bottle/killersice = 1,
		/obj/item/book/granter/spellbook/adept = 1,
		/obj/item/weapon/knife/dagger/silver/arcyne = 1,
		/obj/item/storage/belt/pouch/coins/mid,
	)

/datum/outfit/guild_wizard/adept/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/outfit/guild_wizard/adept/post_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	var/static/list/selectablehat = list(
		"Witch hat" = /obj/item/clothing/head/wizhat/witch,
		"Mage hood" = /obj/item/clothing/head/roguehood/colored/mage,
		"Generic Wizard hat" = /obj/item/clothing/head/wizhat/gen,
		"Black hood" = /obj/item/clothing/head/roguehood/colored/black,
		"None" = null,
	)
	equipped_human.select_equippable(equipped_human, selectablehat, message = "Choose your hat of choice", title = "WIZARD")

	var/static/list/selectablerobe = list(
		"Black robes" = /obj/item/clothing/shirt/robe/colored/black,
		"Mage robes" = /obj/item/clothing/shirt/robe/colored/mage,
		"Mage robes Alt" = /obj/item/clothing/shirt/robe/skyrim_mage,
		"Wizard robes" = /obj/item/clothing/shirt/robe/wizard,
		"Tunic" = /obj/item/clothing/shirt/tunic,
		"Lowcut tunic" = /obj/item/clothing/shirt/undershirt/lowcut,
		"Silk dress" = /obj/item/clothing/shirt/dress/silkdress/colored/random,
	)
	equipped_human.select_equippable(equipped_human, selectablerobe, message = "Choose your attire of choice", title = "WIZARD")

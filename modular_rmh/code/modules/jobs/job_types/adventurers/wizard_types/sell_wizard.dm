/datum/job/advclass/combat/adventurer_wizard/sell_wizard
	title = "Sellwizard"
	tutorial = "Once a noble trained in the arcane arts in Waterdeep, \
	you lost your fortune and now offer your magical skills to those who can pay. \
	Adept in spellcraft and versed in courtly knowledge, you can hold your own in combat while ensuring your employer’s goals are met."
	give_bank_account = TRUE

	outfit = /datum/outfit/adventurer_wizard/sell_wizard
	category_tags = list(CAT_ADVENTURER_WIZARD)

	jobstats = list(
		STATKEY_END = 1,
		STATKEY_INT = 3,
		STATKEY_CON = -1,
		STATKEY_PER = -1,
		STATKEY_STR = -2,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/combat/knives = 1,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/magic/arcane = 3,
		/datum/skill/combat/polearms = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/climbing = 1,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/reading = 4
	)

	traits = list(
		TRAIT_NOBLE
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,
	)

/datum/outfit/adventurer_wizard/sell_wizard
	name = "Sellwizard"
	head = null
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/poor //broke
	cloak = null
	armor = null
	shirt = /obj/item/clothing/armor/gambeson
	wrists = null
	gloves = /obj/item/clothing/gloves/leather
	pants = null
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/weapon/polearm/woodstaff/quarterstaff/iron
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltr = /obj/item/storage/magebag/poor
	beltl = /obj/item/weapon/knife/dagger/steel/special //remnant from when they were a noble
	ring = /obj/item/clothing/ring/silver
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/book/granter/spellbook/adept = 1,
		/obj/item/chalk = 1,
		/obj/item/reagent_containers/glass/bottle/manapot = 1
	)

/datum/outfit/adventurer_wizard/sell_wizard/post_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(visuals_only)
		return

	// Hat selection (visual equipment)
	var/static/list/selectablehat = list(
		"Witch hat" = /obj/item/clothing/head/wizhat/witch,
		"Random Wizard hat" = /obj/item/clothing/head/wizhat/random,
		"Mage hood" = /obj/item/clothing/head/roguehood/colored/mage,
		"Generic Wizard hat" = /obj/item/clothing/head/wizhat/gen,
		"Black hood" = /obj/item/clothing/head/roguehood/colored/black,
	)
	equipped_human.select_equippable(equipped_human, selectablehat, message = "Choose your hat of choice", title = "WIZARD")

	// Robe selection (visual equipment)
	var/static/list/selectablerobe = list(
		"Black robes" = /obj/item/clothing/shirt/robe/colored/black,
		"Mage robes" = /obj/item/clothing/shirt/robe/colored/mage,
	)
	equipped_human.select_equippable(equipped_human, selectablerobe, message = "Choose your robe of choice", title = "WIZARD")

/datum/outfit/adventurer_wizard/sell_wizard/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

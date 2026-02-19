/datum/job/advclass/combat/adventurer_wizard/evocation_wizard
	title = "Evocation Wizard"
	tutorial = "You are known as an evoker - striding unharmed through the unfettered chaos you call."

	give_bank_account = TRUE
	outfit = /datum/outfit/adventurer_wizard/evocation_wizard
	category_tags = list(CAT_ADVENTURER_WIZARD)

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/projectile/fireball,
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,,
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

/datum/outfit/adventurer_wizard/evocation_wizard
	name = "Evocation Wizard"
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
	belt = /obj/item/storage/belt/leather/plaquesilver/adventurers_subclasses
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

/datum/outfit/adventurer_wizard/evocation_wizard/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/outfit/adventurer_wizard/evocation_wizard/post_equip(mob/living/carbon/human/equipped_human, visuals_only)
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

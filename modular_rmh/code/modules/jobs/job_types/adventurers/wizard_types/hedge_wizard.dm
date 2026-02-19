/datum/job/advclass/combat/adventurer_wizard/hedge_wizard
	title = "Hedge Wizard"
	tutorial = "Once a prodigy of the arcane academies, you were cast out for defying tradition and pursuing forbidden experiments. \
	You now roam the world, wielding improvised magic and hidden knowledge. Show them the power they refused to recognize."

	give_bank_account = TRUE
	outfit = /datum/outfit/adventurer_wizard/hedge_wizard
	category_tags = list(CAT_ADVENTURER_WIZARD)
	total_positions = 2

	jobstats = list(
		STATKEY_INT = 4, // Base for non-old characters
		STATKEY_END = 1
	)

	skills = list(
		/datum/skill/combat/polearms = 3,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/misc/reading = 5,
		/datum/skill/craft/alchemy = 4,
		/datum/skill/magic/arcane = 4 // Base value, adjusted for age in after_spawn
	)

	traits = list(
		TRAIT_STEELHEARTED,
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,
	)

/datum/outfit/adventurer_wizard/hedge_wizard
	name = "Hedge Wizard"
	head = null
	mask = null
	neck = /obj/item/clothing/neck/mana_star
	cloak = null
	armor = null
	shirt = /obj/item/clothing/armor/gambeson/heavy
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/rope/adventurers_subclasses
	beltl = /obj/item/reagent_containers/glass/bottle/manapot
	beltr = /obj/item/storage/magebag/apprentice
	ring = null
	l_hand = null
	r_hand = /obj/item/weapon/polearm/woodstaff/quarterstaff/steel

	backpack_contents = list(
		/obj/item/book/granter/spellbook/adept = 1,
		/obj/item/chalk = 1,
		/obj/item/rope/chain = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/weapon/knife/dagger/silver/arcyne = 1
	)

/datum/outfit/adventurer_wizard/hedge_wizard/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)
	if(equipped_human.age == AGE_OLD)
		head = /obj/item/clothing/head/wizhat
		backl = /obj/item/storage/backpack/backpack

/datum/outfit/adventurer_wizard/hedge_wizard/post_equip(mob/living/carbon/human/H, visuals_only = FALSE)
	. = ..()
	var/static/list/selectablehat = list(
		"Witch hat" = /obj/item/clothing/head/wizhat/witch,
		"Random Wizard hat" = /obj/item/clothing/head/wizhat/random,
		"Mage hood" = /obj/item/clothing/head/roguehood/colored/mage,
		"Generic Wizard hat" = /obj/item/clothing/head/wizhat/gen,
		"Black hood" = /obj/item/clothing/head/roguehood/colored/black,
	)
	H.select_equippable(H, selectablehat, message = "Choose your hat of choice", title = "HEDGE WIZARD")

	var/static/list/selectablerobe = list(
		"Black robes" = /obj/item/clothing/shirt/robe/colored/black,
		"Mage robes" = /obj/item/clothing/shirt/robe/colored/mage,
	)
	H.select_equippable(H, selectablerobe, message = "Choose your robe of choice", title = "HEDGE WIZARD")

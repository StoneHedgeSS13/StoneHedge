/datum/job/advclass/combat/adventurer_warlock/the_fiend
	title = "The Fiend"
	tutorial = "You have pledged your soul to the Hells or Abyss in return for a deadly arsenal of fiendish arcana."

	give_bank_account = TRUE
	outfit = /datum/outfit/adventurer_warlock/the_fiend
	category_tags = list(CAT_ADVENTURER_WARLOCK)

	skills = list(
		/datum/skill/magic/arcane = 3,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/sewing = 1,
		/datum/skill/misc/athletics = 1,
		/datum/skill/combat/knives = 1
	)

	jobstats = list(
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_END = -1,
		STATKEY_STR = -1
	)

	traits = list(
		TRAIT_STEELHEARTED,
	)

	spells = list(
		/datum/action/cooldown/spell/cone/staggered/eldritch_blast,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/toxic_cleanse,
		/datum/action/cooldown/spell/essence/silence,
		/datum/action/cooldown/spell/essence/neutralize,
		/datum/action/cooldown/spell/projectile/fire_flare,
		/datum/action/cooldown/spell/projectile/fireball,
		/datum/action/cooldown/spell/essence/flame_jet,
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,
	)


/datum/outfit/adventurer_warlock/the_fiend
	name = "The Fiend"
	head = /obj/item/clothing/head/crown/circlet/vision
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/half/duelcape/townhall
	armor = /obj/item/clothing/shirt/robe/colored/red
	shirt = /obj/item/clothing/shirt/tunic/colored/red
	wrists = null
	gloves = /obj/item/clothing/gloves/essence_gauntlet
	pants = null
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = null
	backl = /obj/item/storage/backpack/satchel/black
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltr = /obj/item/reagent_containers/glass/bottle/manapot
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor = 1,
	)

/datum/outfit/adventurer_warlock/the_fiend/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

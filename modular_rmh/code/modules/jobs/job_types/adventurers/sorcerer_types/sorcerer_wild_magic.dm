/datum/job/advclass/combat/adventurer_sorcerer/wild_magic
	title = "Wild Magic Sorcerer"
	f_title = "Wild Magic Sorceress"
	tutorial = "Your powers come from ancient forces of chaos. They churn within you - waiting to burst free at any time."

	give_bank_account = TRUE
	outfit = /datum/outfit/adventurer_sorcerer/wild_magic
	category_tags = list(CAT_ADVENTURER_SORCERER)

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,
	)

	skills = list(
		/datum/skill/misc/reading = 2,
		/datum/skill/magic/arcane = 4,
		/datum/skill/combat/polearms = 2,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/medicine = 1,
		/datum/skill/craft/alchemy = 2,
	)

	jobstats = list(
		STATKEY_INT = 2,
		STATKEY_CON = 1,
		STATKEY_END = -1,
		STATKEY_SPD = -1,
	)

	traits = list(
		TRAIT_WILDMAGIC
	)

/datum/outfit/adventurer_sorcerer/wild_magic
	name = "Wild Magic Sorcerer"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/cape/colored/random
	armor = /obj/item/clothing/shirt/robe/colored/random
	shirt = /obj/item/clothing/shirt/tunic/colored/random
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = /obj/item/clothing/shoes/shortboots
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/storage/magebag/apprentice
	beltr = /obj/item/reagent_containers/glass/bottle/manapot
	ring = null
	l_hand = null
	r_hand = /obj/item/weapon/polearm/woodstaff

	backpack_contents = list(
		/obj/item/chalk = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
	)

/datum/outfit/adventurer_sorcerer/wild_magic/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

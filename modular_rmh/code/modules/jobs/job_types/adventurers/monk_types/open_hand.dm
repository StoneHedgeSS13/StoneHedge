/datum/job/advclass/combat/adventurer_monk/open_hand
	title = "Open Hand"
	tutorial = "You specialise in unarmed combat, \
	using your hands and your control of ki to heal or inflict grievous hurt."

	outfit = /datum/outfit/adventurer_monk/open_hand
	category_tags = list(CAT_ADVENTURER_MONK)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/misc/reading = 3,
		/datum/skill/combat/unarmed = 6,
		/datum/skill/combat/wrestling = 5,
		/datum/skill/combat/polearms = 3,
		/datum/skill/combat/swords = 3,
		/datum/skill/misc/sewing = 2,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/athletics = 4,
	)

	jobstats = list(
		STATKEY_STR = 3,
		STATKEY_CON = 3,
		STATKEY_END = 3,
		STATKEY_PER = 2,
		STATKEY_SPD = 2,
	)

	traits = list(
		TRAIT_BREADY,
		TRAIT_DODGEEXPERT,
		TRAIT_STEELHEARTED,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_NUTCRACKER,
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/longstrider,
		/datum/action/cooldown/spell/undirected/feather_falling,
		/datum/action/cooldown/spell/healing
	)

/datum/outfit/adventurer_monk/open_hand
	name = "Open Hand"

	head = /obj/item/clothing/head/roguehood/colored/brown
	mask = null
	neck = /obj/item/clothing/cloak/templar/undivided
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
	armor = /obj/item/clothing/shirt/robe/colored/plain
	shirt = null
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/bandages/pugilist
	pants = null
	shoes = /obj/item/clothing/shoes/shortboots
	backr = /obj/item/weapon/polearm/woodstaff
	backl = /obj/item/storage/backpack/backpack
	belt = /obj/item/storage/belt/leather/rope/adventurers_subclasses
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/flashlight/flare/torch/lantern = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1
	)

/datum/outfit/adventurer_monk/open_hand/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

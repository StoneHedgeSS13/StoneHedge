/datum/job/advclass/combat/adventurer_monk/drunk_master
	title = "Drunk Master"
	tutorial = "With the unpredictable lurches of a tippler, you hiccup your way through battle, \
	frustrating foes with carefully executed movements concealed beneath a façade of incompetence."

	outfit = /datum/outfit/adventurer_monk/drunk_master
	category_tags = list(CAT_ADVENTURER_MONK)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/misc/reading = 3,
		/datum/skill/combat/unarmed = 6,
		/datum/skill/combat/wrestling = 5,
		/datum/skill/combat/polearms = 2,
		/datum/skill/combat/swords = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/athletics = 4,
		/datum/skill/misc/music = 2,
	)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_PER = 1,
		STATKEY_SPD = 1,
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_STEELHEARTED,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_NOPAINSTUN,
		TRAIT_NOSEGRAB,
		TRAIT_NUTCRACKER,
		TRAIT_DRUNKMASTER

	)

	spells = list(
		/datum/action/cooldown/spell/undirected/longstrider,
		/datum/action/cooldown/spell/undirected/feather_falling,
	)

/datum/outfit/adventurer_monk/drunk_master
	name = "Drunk Master"

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
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
		/obj/item/reagent_containers/glass/bottle/beer = 2,
	)

/datum/outfit/adventurer_monk/drunk_master/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

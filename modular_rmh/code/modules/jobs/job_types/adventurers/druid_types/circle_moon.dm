/datum/job/advclass/combat/adventurer_druid/circle_moon
	title = "Circle of Moon Druid"
	tutorial = "Your form is mutable as the mercurial moon, letting you shift your form into massive beasts and even primal elementals."

	outfit = /datum/outfit/adventurer_druid/circle_moon
	category_tags = list(CAT_ADVENTURER_DRUID)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_END = 2,
		STATKEY_END = 1,
	)

	skills = list(
		/datum/skill/magic/druidic = 4,
		/datum/skill/labor/farming = 3,
		/datum/skill/labor/taming = 2,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/athletics = 1,
		/datum/skill/combat/polearms = 2,
		/datum/skill/combat/knives = 1
	)

	traits = list(
		TRAIT_SEEDKNOW,
		TRAIT_FORAGER,
		TRAIT_DEADNOSE,
		TRAIT_BESTIALSENSE,
	)

	spells = list(
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/essence/toxic_cleanse,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/beast_tame,
		/datum/action/cooldown/spell/undirected/touch/entangler,
		/datum/action/cooldown/spell/undirected/jaunt/bush_jaunt,
		/datum/action/cooldown/spell/undirected/conjure_item/briar_claw,
		/datum/action/cooldown/spell/undirected/call_bird,
		/datum/action/cooldown/spell/undirected/beast_sense,
		/datum/action/cooldown/spell/undirected/shapeshift/crow,
		/datum/action/cooldown/spell/undirected/shapeshift/cat,
		/datum/action/cooldown/spell/undirected/shapeshift/fox,
		/datum/action/cooldown/spell/undirected/shapeshift/mole,
		/datum/action/cooldown/spell/undirected/shapeshift/raccoon,
		/datum/action/cooldown/spell/undirected/shapeshift/saiga,
		/datum/action/cooldown/spell/undirected/shapeshift/smallrat,
		/datum/action/cooldown/spell/undirected/shapeshift/spider,
		/datum/action/cooldown/spell/undirected/shapeshift/wolf,
		/datum/action/cooldown/spell/undirected/shapeshift/direbear,
	)

/datum/outfit/adventurer_druid/circle_moon
	name = "Circle of Moon Druid"
	head = null
	mask = null
	neck = null
	cloak = null
	armor = /obj/item/clothing/armor/leather/advanced/druid
	shirt = /obj/item/clothing/armor/leather/vest
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = null
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/sandals
	backr = /obj/item/storage/backpack/satchel/cloth
	backl = /obj/item/weapon/polearm/woodstaff
	belt = /obj/item/storage/belt/leather/rope/adventurers_subclasses
	beltl = /obj/item/weapon/knife/stone
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

/datum/outfit/adventurer_druid/circle_moon/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/job/advclass/combat/adventurer_druid/circle_moon/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.update_sight()

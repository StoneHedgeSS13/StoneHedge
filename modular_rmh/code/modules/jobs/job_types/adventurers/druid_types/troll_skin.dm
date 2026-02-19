/datum/job/advclass/combat/adventurer_druid/troll_skin
	title = "Trollskin Druid"
	tutorial = "A druid who learned forbidden rites to wear the flesh of trolls, embracing regeneration and monstrous strength."

	outfit = /datum/outfit/adventurer_druid/troll_skin
	category_tags = list(CAT_ADVENTURER_DRUID)
	give_bank_account = TRUE
	total_positions = 2

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 1,
		STATKEY_INT = -1
	)

	skills = list(
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/knives = 1,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/misc/athletics = 2,
		/datum/skill/magic/holy = 3,
		/datum/skill/labor/taming = 4,
		/datum/skill/craft/tanning = 2,
		/datum/skill/misc/riding = 1,
		/datum/skill/labor/butchering = 2,
		/datum/skill/labor/farming = 3,
		/datum/skill/craft/crafting = 1,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/sewing = 1,
		/datum/skill/misc/swimming = 2
	)

	traits = list(
		TRAIT_SEEDKNOW,
		TRAIT_FORAGER,
		TRAIT_DEADNOSE,
		TRAIT_BESTIALSENSE,
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/entangler,
		/datum/action/cooldown/spell/conjure/garden_fae,
		/datum/action/cooldown/spell/conjure/kneestingers,
		/datum/action/cooldown/spell/undirected/jaunt/bush_jaunt,
		/datum/action/cooldown/spell/undirected/bless_crops,
		/datum/action/cooldown/spell/undirected/conjure_item/briar_claw,
		/datum/action/cooldown/spell/projectile/falcon_disrupt,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/undirected/shapeshift/troll_form,
		/datum/action/cooldown/spell/undirected/troll_shape,
	)


/datum/outfit/adventurer_druid/troll_skin
	name = "Trollskin Druid"
	head = null
	mask = /obj/item/clothing/face/druid
	neck = null
	cloak = null
	armor = /obj/item/clothing/shirt/robe/dendor
	shirt = /obj/item/clothing/armor/leather/vest
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = null
	pants = null
	shoes = null
	backr = null
	backl = /obj/item/weapon/mace/goden/shillelagh
	belt = /obj/item/storage/belt/leather/rope/adventurers_subclasses
	beltl = /obj/item/weapon/knife/stone
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

/datum/outfit/adventurer_druid/troll_skin/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/job/advclass/combat/adventurer_druid/troll_skin/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.update_sight()

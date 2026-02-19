/datum/job/advclass/combat/adventurer_druid/circle_land
	title = "Circle of Land Druid"
	tutorial = "You channel the natural arcana flowing through the earth and creatures atop it to cast powerful druidic magic"

	outfit = /datum/outfit/adventurer_druid/circle_land
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
		/datum/action/cooldown/spell/healing/greater,
		/datum/action/cooldown/spell/essence/toxic_cleanse,
		/datum/action/cooldown/spell/essence/purify_water,
		/datum/action/cooldown/spell/essence/neutralize,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/beast_tame,
		/datum/action/cooldown/spell/undirected/touch/entangler,
		/datum/action/cooldown/spell/aoe/on_turf/circle/flower_field,
		/datum/action/cooldown/spell/conjure/garden_fae,
		/datum/action/cooldown/spell/conjure/kneestingers,
		/datum/action/cooldown/spell/undirected/jaunt/bush_jaunt,
		/datum/action/cooldown/spell/undirected/bless_crops,
		/datum/action/cooldown/spell/undirected/conjure_item/briar_claw,
		/datum/action/cooldown/spell/undirected/call_bird,
		/datum/action/cooldown/spell/undirected/beast_sense,
		/datum/action/cooldown/spell/transfrom_tree,
		/datum/action/cooldown/spell/aoe/lightning_lure,
		/datum/action/cooldown/spell/projectile/lightning,
	)

/datum/outfit/adventurer_druid/circle_land
	name = "Circle of Land Druid"
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

/datum/outfit/adventurer_druid/circle_land/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/job/advclass/combat/adventurer_druid/circle_land/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.update_sight()
	var/shapes = list("Crow", "Cat", "Fox", "Mole", "Raccoon", "Saiga", "Smallrat", "Spider", "Wolf", "Direbear")
	var/shape_choice = browser_input_list(spawned, "CHOOSE YOUR WILD SHAPE.", "WHO ARE YOU", shapes)

	switch(shape_choice)
		if("Crow")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/shapeshift/crow)
		if("Cat")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/shapeshift/cat)
		if("Fox")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/shapeshift/fox)
		if("Mole")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/shapeshift/mole)
		if("Raccoon")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/shapeshift/raccoon)
		if("Saiga")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/shapeshift/saiga)
		if("Smallrat")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/shapeshift/smallrat)
		if("Spider")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/shapeshift/spider)
		if("Wolf")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/shapeshift/wolf)
		if("Direbear")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/shapeshift/direbear)

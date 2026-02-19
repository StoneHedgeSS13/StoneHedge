/datum/job/grove_druid
	title = "Grove Druid"
	tutorial = "You are a sworn guardian of the sacred grove near Rivermist Hollow. Through Silvanus and the Old Faith, you tend living things, keep the balance of nature, and ward the wilds from corruption. \
	ALLOWED PATRONS: Silvanus, Mielikki, Malar, Talos, Umberlee. \
	ALIGNED WITH NATURE, THEIR PATRONS ARE THOSE REPRESENTING LIFE, WILDERNESS, AND PRIMAL FORCES."
	department_flag = OUTSIDERS
	faction = FACTION_NEUTRAL
	total_positions = 3
	spawn_positions = 3
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_GROVE_DRUID

	allowed_patrons = list(
		/datum/patron/faerun/neutral_gods/Silvanus,

		/datum/patron/faerun/good_gods/Mielikki,

		/datum/patron/faerun/evil_gods/Malar,
		/datum/patron/faerun/evil_gods/Talos,
		/datum/patron/faerun/evil_gods/Umberlee
	)

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST

	selection_color = JCOLOR_OUTSIDERS
	outfit = /datum/outfit/grove_druid

	exp_types_granted = list(EXP_TYPE_MAGICK)

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

	magic_user = TRUE
	spell_points = 20
	attunements_max = 5
	attunements_min = 1

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

/datum/job/grove_druid/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_cleric()
		devotion.grant_to(spawned)

/datum/outfit/grove_druid
	name = "Grove Druid"
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
	belt = /obj/item/storage/belt/leather/rope
	beltl = /obj/item/weapon/knife/stone
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

/datum/outfit/grove_druid/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/job/grove_druid/after_spawn(mob/living/carbon/human/spawned, client/player_client)
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

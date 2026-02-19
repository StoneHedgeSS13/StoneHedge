/datum/job/forest_ranger
	title = "Forest Ranger"
	tutorial = "You serve beyond the town walls, patrolling forests, swamps, and river paths under the Forest Warden’s command. \
	Your duty is simple: guide travelers, watch the borders, and deal with threats before they reach Rivermist Hollow."
	department_flag = OUTSIDERS
	faction = FACTION_NEUTRAL
	total_positions = 4
	spawn_positions = 4
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_FOREST_RANGER

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST

	selection_color = JCOLOR_OUTSIDERS
	advclass_cat_rolls = list(CAT_FOREST_RANGER = 20)
	give_bank_account = 30
	job_bitflag = BITFLAG_GARRISON

	exp_type = list(EXP_TYPE_GARRISON)
	exp_types_granted = list(EXP_TYPE_GARRISON, EXP_TYPE_COMBAT)
	exp_requirements = list(
		EXP_TYPE_GARRISON = 600
	)

	job_subclasses = list(
		/datum/job/advclass/forest_ranger/pathfinder,
		/datum/job/advclass/forest_ranger/scout,
		/datum/job/advclass/forest_ranger/vanguard,
	)

/datum/job/forest_ranger/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/proc/haltyell

/datum/job/advclass/forest_ranger
	exp_types_granted = list(EXP_TYPE_GARRISON, EXP_TYPE_COMBAT)

//SUBCLASSES

/datum/job/advclass/forest_ranger/pathfinder
	title = "Forest Pathfinder"
	tutorial = "You are the first into rough ground and the last to retreat. \
	With shield and steel, you hold trails, river crossings, and dangerous paths so others may pass safely."

	outfit = /datum/outfit/forest_ranger/pathfinder
	category_tags = list(CAT_FOREST_RANGER)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_END = 3,
		STATKEY_CON = 3,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/riding = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/labor/lumberjacking = 1,
		/datum/skill/craft/carpentry = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/craft/tanning = 1,
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/combat/whipsflails = 3,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/shields = 3,
		/datum/skill/combat/bows = 1,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 3
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_FORAGER,
		TRAIT_KNOWBANDITS,
		TRAIT_SEEDKNOW,
		TRAIT_FORAGER,
		TRAIT_DEADNOSE,
		TRAIT_BESTIALSENSE,
	)

/datum/outfit/forest_ranger/pathfinder
	name = "Forest Pathfinder"
	head = null
	mask = null
	neck = /obj/item/clothing/neck/gorget
	cloak = /obj/item/clothing/cloak/forrestercloak
	armor = /obj/item/clothing/armor/leather/advanced/forrester
	shirt = /obj/item/clothing/armor/chainmail/hauberk/iron
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/weapon/shield/heater
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/fgarrison
	beltl = /obj/item/weapon/flail/militia
	beltr = /obj/item/weapon/axe/iron
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/rope/chain = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/signal_horn = 1,
	)

/datum/job/advclass/forest_ranger/pathfinder/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.update_sight()
	var/skulls = list("Normal skull", "Small skull")
	var/skull_choice = browser_input_list(spawned, "WHAT IS YOUR SKULL SIZE?.", "THINK", skulls)

	switch(skull_choice)
		if("Normal skull")
			spawned.put_in_hands(new /obj/item/clothing/head/helmet/medium/decorated/skullmet(get_turf(spawned)), TRUE)
		if("Small skull")
			spawned.put_in_hands(new /obj/item/clothing/head/helmet/medium/decorated/rousskullmet(get_turf(spawned)), TRUE)

// ─────────────────────────────

/datum/job/advclass/forest_ranger/scout
	title = "Forest Scout"
	tutorial = "Light on your feet and sharp of eye, you range ahead of the patrol. \
	You spot trouble early, guide allies through safe paths, and strike from afar when needed."

	outfit = /datum/outfit/forest_ranger/scout
	category_tags = list(CAT_FOREST_RANGER)

	jobstats = list(
		STATKEY_STR = -3,
		STATKEY_END = 1,
		STATKEY_PER = 3,
		STATKEY_SPD = 3
	)

	skills = list(
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/riding = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/labor/lumberjacking = 1,
		/datum/skill/craft/carpentry = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/craft/tanning = 1,
		/datum/skill/combat/bows = 3,
		/datum/skill/combat/crossbows = 3,
		/datum/skill/combat/knives = 3,
		/datum/skill/combat/axesmaces = 1,
		/datum/skill/combat/wrestling = 1
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_SEEDKNOW,
		TRAIT_FORAGER,
		TRAIT_KNOWBANDITS,
		TRAIT_DEADNOSE,
		TRAIT_BESTIALSENSE,
	)

/datum/outfit/forest_ranger/scout
	name = "Forest Scout"
	head = null
	mask = null
	neck = /obj/item/clothing/neck/highcollier
	cloak = /obj/item/clothing/cloak/forrestercloak
	armor = /obj/item/clothing/armor/leather/advanced/forrester
	shirt = /obj/item/clothing/armor/gambeson
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/long
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/fgarrison
	beltl = /obj/item/weapon/knife/cleaver/combat
	beltr = /obj/item/ammo_holder/quiver/arrows
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/rope/chain = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/signal_horn = 1,
	)

/datum/job/advclass/forest_ranger/scout/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.update_sight()
	var/skulls = list("Normal skull", "Small skull")
	var/skull_choice = browser_input_list(spawned, "WHAT IS YOUR SKULL SIZE?.", "THINK", skulls)

	switch(skull_choice)
		if("Normal skull")
			spawned.put_in_hands(new /obj/item/clothing/head/helmet/medium/decorated/skullmet(get_turf(spawned)), TRUE)
		if("Small skull")
			spawned.put_in_hands(new /obj/item/clothing/head/helmet/medium/decorated/rousskullmet(get_turf(spawned)), TRUE)


// ─────────────────────────────

/datum/job/advclass/forest_ranger/vanguard
	title = "Forest Vanguard"
	tutorial = "When danger cannot be avoided, you meet it head-on. \
	You break ambushes, protect your fellows in close fights, and drive threats back."

	outfit = /datum/outfit/forest_ranger/vanguard
	category_tags = list(CAT_FOREST_RANGER)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 2,
		STATKEY_END = 2,
		STATKEY_SPD = 1
	)

	skills = list(
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/riding = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/labor/lumberjacking = 1,
		/datum/skill/craft/carpentry = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/craft/tanning = 1,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/axesmaces = 3
	)

	traits = list(
		TRAIT_DUALWIELDER,
		TRAIT_MEDIUMARMOR,
		TRAIT_IGNOREDAMAGESLOWDOWN,
		TRAIT_FORAGER,
		TRAIT_SEEDKNOW,
		TRAIT_KNOWBANDITS,
		TRAIT_DEADNOSE,
		TRAIT_BESTIALSENSE,
	)

/datum/outfit/forest_ranger/vanguard
	name = "Forest Vanguard"
	head = null
	mask = null
	neck = /obj/item/clothing/neck/gorget
	cloak = /obj/item/clothing/cloak/forrestercloak
	armor = /obj/item/clothing/armor/leather/advanced/forrester
	shirt = /obj/item/clothing/armor/chainmail/hauberk/iron
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/weapon/polearm/halberd/bardiche/woodcutter
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/fgarrison
	beltl = /obj/item/weapon/mace/steel/morningstar
	beltr = /obj/item/weapon/axe/iron
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/rope/chain = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/signal_horn = 1
	)

/datum/job/advclass/forest_ranger/vanguard/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.update_sight()
	var/skulls = list("Normal skull", "Small skull")
	var/skull_choice = browser_input_list(spawned, "WHAT IS YOUR SKULL SIZE?.", "THINK", skulls)

	switch(skull_choice)
		if("Normal skull")
			spawned.put_in_hands(new /obj/item/clothing/head/helmet/medium/decorated/skullmet(get_turf(spawned)), TRUE)
		if("Small skull")
			spawned.put_in_hands(new /obj/item/clothing/head/helmet/medium/decorated/rousskullmet(get_turf(spawned)), TRUE)

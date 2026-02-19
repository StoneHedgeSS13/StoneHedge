/datum/job/towner
	title = "Towner"
	tutorial = "You are a resident of Rivermist Hollow. \
	You live, work, gossip, trade, and survive. The town’s laws protect you, but also bind you. \
	Your wealth and reputation shape how others treat you far more than any official title."
	department_flag = TOWN
	faction = FACTION_TOWN
	total_positions = 25
	spawn_positions = 25
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_TOWNER

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST

	selection_color = JCOLOR_TOWN
	advclass_cat_rolls = list(CAT_TOWNER = 20)

	give_bank_account = 5

	job_subclasses = list(
		/datum/job/advclass/towner/commoner,
		/datum/job/advclass/towner/burgess,
		/datum/job/advclass/towner/patrician,
		/datum/job/advclass/towner/town_mouth,
		/datum/job/advclass/towner/bard,
		/datum/job/advclass/towner/jester,
		/datum/job/advclass/towner/miner,
		/datum/job/advclass/towner/lumberjack,
		/datum/job/advclass/towner/farmhand,
		/datum/job/advclass/towner/hunter,
		/datum/job/advclass/towner/fisher,

	)

//SUBCLASSES

/datum/job/advclass/towner/commoner
	title = "Commoner"
	tutorial = "You are one of the many faces of Rivermist Hollow. \
	You scrape by on labor, favors, and stubborn survival."

	outfit = /datum/outfit/towner/commoner
	category_tags = list(CAT_TOWNER)
	give_bank_account = 5

	jobstats = list(
		STATKEY_CON = 1,
		STATKEY_SPD = 1
	)

	skills = list(
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/sneaking = 1,
		/datum/skill/misc/stealing = 1,
		/datum/skill/labor/mathematics = 1
	)

	traits = list(
		TRAIT_DEADNOSE,
	)

/datum/outfit/towner/commoner
	name = "Commoner"
	head = null
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = /obj/item/storage/backpack/satchel/cloth
	backl = null
	belt = /obj/item/storage/belt/leather/rope
	beltl = /obj/item/storage/belt/pouch/coins/poor
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

/datum/outfit/towner/commoner/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/undershirt/colored/random
		pants = /obj/item/clothing/pants/tights/colored/random
	else
		shirt = /obj/item/clothing/shirt/dress/gen/colored/random

// ─────────────────────────────

/datum/job/advclass/towner/burgess
	title = "Burgess"
	tutorial = "You are comfortably established — a property holder, trader, or respected townsman. \
	You understand contracts, favors, and civic duty."

	outfit = /datum/outfit/towner/burgess
	category_tags = list(CAT_TOWNER)
	give_bank_account = 25

	jobstats = list(
		STATKEY_INT = 1,
		STATKEY_PER = 1
	)

	skills = list(
		/datum/skill/misc/reading = 2,
		/datum/skill/labor/mathematics = 3,
		/datum/skill/misc/sneaking = 1,
		/datum/skill/misc/athletics = 1
	)

	traits = list(
		TRAIT_SEEPRICES
	)

/datum/outfit/towner/burgess
	name = "Burgess"
	head = null
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/belt/pouch/coins/mid
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

/datum/outfit/towner/burgess/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/tunic/colored/random
		pants = /obj/item/clothing/pants/tights/colored/random
	else
		shirt = /obj/item/clothing/shirt/dress/hw_dress

// ─────────────────────────────

/datum/job/advclass/towner/patrician
	title = "Patrician"
	tutorial = "Your family helped build Rivermist Hollow — or at least paid for it. \
	You command wealth, respect, and quiet influence."

	outfit = /datum/outfit/towner/patrician
	category_tags = list(CAT_TOWNER)

	give_bank_account = 60
	noble_income = 16
	job_bitflag = BITFLAG_ROYALTY

	jobstats = list(
		STATKEY_INT = 1,
		STATKEY_SPD = 1,
		STATKEY_CON = 1
	)

	skills = list(
		/datum/skill/misc/reading = 2,
		/datum/skill/labor/mathematics = 3,
		/datum/skill/misc/riding = 2,
		/datum/skill/misc/athletics = 2,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/combat/bows = 2,
	)

	traits = list(
		TRAIT_NOBLE
	)

/datum/job/advclass/towner/patrician/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/prev_real_name = spawned.real_name
	var/prev_name = spawned.name
	var/honorary = "Lord"
	if(spawned.pronouns == SHE_HER)
		honorary = "Lady"
	spawned.real_name = "[honorary] [prev_real_name]"
	spawned.name = "[honorary] [prev_name]"

	var/static/list/selectable = list( \
		"Dagger" = /obj/item/weapon/knife/dagger/silver, \
		"Rapier" = /obj/item/weapon/sword/rapier/dec, \
		"Cane Blade" = /obj/item/weapon/sword/rapier/caneblade, \
		)
	var/choice = spawned.select_equippable(spawned, selectable, time_limit = 1 MINUTES, message = "Choose your weapon", title = "NOBLE")
	if(!choice)
		return
	switch(choice)
		if("Dagger")
			spawned.clamped_adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			var/scabbard = new /obj/item/weapon/scabbard/knife/noble()
			if(!spawned.equip_to_appropriate_slot(scabbard))
				qdel(scabbard)
		if("Rapier")
			spawned.clamped_adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			var/scabbard = new /obj/item/weapon/scabbard/sword/noble()
			if(!spawned.equip_to_appropriate_slot(scabbard))
				qdel(scabbard)
		if("Cane Blade")
			spawned.clamped_adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			var/scabbard = new /obj/item/weapon/scabbard/cane()
			if(!spawned.equip_to_appropriate_slot(scabbard))
				qdel(scabbard)


/datum/outfit/towner/patrician
	name = "Patrician"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/armor/gambeson/sophisticated_coat/colored/random
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/belt/pouch/coins/veryrich
	beltr = null
	ring = /obj/item/clothing/ring/silver
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/wine = 1,
		/obj/item/reagent_containers/glass/cup/silver = 1
	)

/datum/outfit/towner/patrician/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		head = /obj/item/clothing/head/fancyhat
		armor = /obj/item/clothing/armor/gambeson/sophisticated_jacket
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		pants = /obj/item/clothing/pants/tights/colored/random
	else
		shirt = pick(/obj/item/clothing/shirt/dress/gown,
			/obj/item/clothing/shirt/dress/gown/summergown,
			/obj/item/clothing/shirt/dress/gown/wintergown,
			/obj/item/clothing/shirt/dress/gown/fallgown,
			/obj/item/clothing/shirt/dress/silkdress/colored/random,
			)

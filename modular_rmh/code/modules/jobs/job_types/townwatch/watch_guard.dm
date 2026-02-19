/datum/job/watch_guard
	title = "Town Watch Guard"
	tutorial = "You are a member of the Town Watch. \
	You patrol streets, guard gates and buildings, respond to disturbances, \
	and uphold the laws of Rivermist Hollow."
	department_flag = TOWNWATCH
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_WATCH_GUARD
	faction = FACTION_TOWN
	total_positions = 8
	spawn_positions = 8

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	selection_color = JCOLOR_TOWNWATCH

	advclass_cat_rolls = list(CAT_WATCHMAN = 20)


	job_subclasses = list(
		/datum/job/advclass/watch_guard/bulwark,
		/datum/job/advclass/watch_guard/halberdier,
		/datum/job/advclass/watch_guard/sentinel,
	)

	give_bank_account = 30

	exp_type = list(EXP_TYPE_LIVING)
	exp_types_granted = list(EXP_TYPE_GARRISON, EXP_TYPE_COMBAT)
	exp_requirements = list(
		EXP_TYPE_LIVING = 300
	)

	job_bitflag = BITFLAG_GARRISON

/datum/job/watch_guard/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/proc/haltyell


////////////////////////////////////////
// ADVCLASS BASE – WATCH GUARD //
////////////////////////////////////////

/datum/job/advclass/watch_guard
	exp_types_granted = list(EXP_TYPE_GARRISON, EXP_TYPE_COMBAT)


//////////////////////////////////
// BULWARK //
//////////////////////////////////

/datum/job/advclass/watch_guard/bulwark
	title = "Town Watch Bulwark"
	tutorial = "You serve as the shield of the Town Watch. \
	Trained to hold chokepoints, endure riots, and protect others behind your guard, \
	you are the steady wall against chaos."

	outfit = /datum/outfit/watch_guard/bulwark
	category_tags = list(CAT_WATCHMAN)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_END = 3,
		STATKEY_CON = 3,
	)

	skills = list(
		/datum/skill/combat/axesmaces = 4,
		/datum/skill/combat/shields = 4,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 4,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 4,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/misc/reading = 1
	)

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
		TRAIT_KNOWBANDITS
	)
/datum/job/advclass/watch_guard/bulwark/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/weapons = list("Sword", "Axe")
	var/weapon_choice = browser_input_list(spawned, "CHOOSE YOUR WEAPON.", "TAKE UP ARMS", weapons)

	switch(weapon_choice)
		if("Sword")
			spawned.put_in_hands(new /obj/item/weapon/sword/arming(get_turf(spawned)), TRUE)
			spawned.put_in_hands(new /obj/item/weapon/scabbard/sword(get_turf(spawned)), TRUE)
		if("Axe")
			spawned.put_in_hands(new /obj/item/weapon/axe/steel(get_turf(spawned)), TRUE)


/datum/outfit/watch_guard/bulwark
	name = "Town Watch Bulwark"
	head = /obj/item/clothing/head/helmet/townwatch/gatemaster/bulwark
	mask = null
	neck = /obj/item/clothing/neck/gorget
	cloak = /obj/item/clothing/cloak/half/guard
	armor = /obj/item/clothing/armor/leather/jacket/gatemaster_jacket/armored/bulwark
	shirt = /obj/item/clothing/armor/gambeson/heavy/colored/town_watch
	wrists = /obj/item/clothing/wrists/bracers/jackchain
	gloves = /obj/item/clothing/gloves/chain
	pants = /obj/item/clothing/pants/chainlegs
	shoes = /obj/item/clothing/shoes/boots/armor/light
	backr = /obj/item/storage/backpack/satchel/black
	backl = /obj/item/weapon/shield/heater
	belt = /obj/item/storage/belt/leather/town_watch
	beltr = null
	beltl = /obj/item/weapon/mace/stunmace
	ring = /obj/item/clothing/ring/slave_control
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/clothing/neck/slave_collar,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot,
		/obj/item/flashlight/flare/torch/lantern,
	)

//////////////////////////////////
// HALBERDIER //
//////////////////////////////////

/datum/job/advclass/watch_guard/halberdier
	title = "Town Watch Halberdier"
	tutorial = "You wield long weapons to control space and repel attackers. \
	Deadly in formation, \
	you are essential at gates, bridges, and narrow streets."

	outfit = /datum/outfit/watch_guard/halberdier
	category_tags = list(CAT_WATCHMAN)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_END = 2,
		STATKEY_CON = 2,
	)

	skills = list(
		/datum/skill/combat/polearms = 4,
		/datum/skill/combat/swords = 2,
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 4,
		/datum/skill/misc/reading = 1
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_KNOWBANDITS
	)


/datum/outfit/watch_guard/halberdier
	name = "Town Watch Halberdier"
	head = /obj/item/clothing/head/helmet/bascinet
	mask = null
	neck = /obj/item/clothing/neck/chaincoif
	cloak = /obj/item/clothing/cloak/half/guard
	armor = /obj/item/clothing/armor/cuirass
	shirt = /obj/item/clothing/armor/gambeson/colored/town_watch
	wrists = /obj/item/clothing/wrists/bracers/jackchain
	gloves = /obj/item/clothing/gloves/chain
	pants = /obj/item/clothing/pants/trou/leather/splint
	shoes = /obj/item/clothing/shoes/boots/armor/light
	backr = /obj/item/storage/backpack/satchel/black
	backl = null
	belt = /obj/item/storage/belt/leather/town_watch
	beltr = null
	beltl = /obj/item/weapon/mace/stunmace
	ring = /obj/item/clothing/ring/slave_control
	l_hand = null
	r_hand = /obj/item/weapon/polearm/halberd

	backpack_contents = list(
		/obj/item/clothing/neck/slave_collar,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot,
		/obj/item/flashlight/flare/torch/lantern,
	)

//////////////////////////////
// SENTINEL //
//////////////////////////////

/datum/job/advclass/watch_guard/sentinel
	title = "Town Watch Sentinel"
	tutorial = "You are trained to watch from above. \
	From walls, towers, and rooftops, you provide overwatch, \
	early warning, and ranged suppression during unrest or attacks."

	outfit = /datum/outfit/watch_guard/sentinel
	category_tags = list(CAT_WATCHMAN)

	jobstats = list(
		STATKEY_PER = 2,
		STATKEY_END = 1,
		STATKEY_SPD = 2
	)

	skills = list(
		/datum/skill/combat/bows = 3,
		/datum/skill/combat/crossbows = 3,
		/datum/skill/combat/firearms = 3,
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/swords = 1,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/misc/reading = 1
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_KNOWBANDITS
	)

/datum/job/advclass/watch_guard/sentinel/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/weapons = list("Longbow", "Crossbow")
	var/weapon_choice = browser_input_list(spawned, "CHOOSE YOUR WEAPON.", "TAKE UP ARMS", weapons)

	switch(weapon_choice)
		if("Longbow")
			spawned.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/long(get_turf(spawned)), TRUE)
			spawned.put_in_hands(new /obj/item/ammo_holder/quiver/arrows(get_turf(spawned)), TRUE)
		if("Crossbow")
			spawned.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(get_turf(spawned)), TRUE)
			spawned.put_in_hands(new /obj/item/ammo_holder/quiver/bolts(get_turf(spawned)), TRUE)

/datum/outfit/watch_guard/sentinel
	name = "Town Watch Sentinel"
	head = /obj/item/clothing/head/helmet/kettle
	mask = null
	neck = /obj/item/clothing/neck/coif/cloth
	cloak = /obj/item/clothing/cloak/half/guard
	armor = /obj/item/clothing/armor/brigandine/light
	shirt = /obj/item/clothing/armor/gambeson/colored/town_watch
	wrists = /obj/item/clothing/wrists/bracers/leather/advanced
	gloves = /obj/item/clothing/gloves/leather/advanced
	pants = /obj/item/clothing/pants/trou/leather/splint
	shoes = /obj/item/clothing/shoes/boots/leather/advanced
	backr = /obj/item/storage/backpack/satchel/black
	backl = null
	belt = /obj/item/storage/belt/leather/town_watch
	beltr = null
	beltl = /obj/item/weapon/mace/stunmace
	ring = /obj/item/clothing/ring/slave_control
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/clothing/neck/slave_collar,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot,
		/obj/item/flashlight/flare/torch/lantern,
	)

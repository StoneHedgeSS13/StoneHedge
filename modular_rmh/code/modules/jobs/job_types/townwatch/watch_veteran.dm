/datum/job/watch_veteran
	title = "Town Watch Veteran"
	tutorial = "You are a seasoned veteran of the Town Watch. \
	Years of patrols, riots, night watches, and close calls have hardened you. \
	You train new watchmen, steady patrols in dangerous moments, and serve as an example of discipline. \
	You are not in command — but when trouble starts, others look to you."
	department_flag = TOWNWATCH
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_WATCH_VETERAN
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1

	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	selection_color = JCOLOR_TOWNWATCH

	outfit = /datum/outfit/watch_veteran

	give_bank_account = 45

	exp_type = list(EXP_TYPE_LIVING)
	exp_types_granted = list(EXP_TYPE_GARRISON, EXP_TYPE_COMBAT)
	exp_requirements = list(
		EXP_TYPE_LIVING = 500
	)

	job_bitflag = BITFLAG_GARRISON

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 2,
		STATKEY_END = 2,
		STATKEY_PER = 1,
		STATKEY_INT = 1,
		STATKEY_SPD = 1
	)

	skills = list(
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/shields = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/combat/polearms = 3,
		/datum/skill/combat/bows = 2,
		/datum/skill/combat/crossbows = 2,

		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/reading = 1
	)

	traits = list(
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
		TRAIT_STEELHEARTED,
		TRAIT_KNOWBANDITS,
		TRAIT_RECOGNIZED,
		TRAIT_TUTELAGE,
		TRAIT_OLDPARTY
	)

/datum/outfit/watch_veteran
	name = "Town Watch Veteran"
	head = /obj/item/clothing/head/helmet/townbarbute
	mask = null
	neck = /obj/item/clothing/neck/gorget
	cloak = /obj/item/clothing/cloak/half/guard
	armor = /obj/item/clothing/armor/plate/iron
	shirt = /obj/item/clothing/armor/gambeson/heavy/colored/town_watch
	wrists = /obj/item/clothing/wrists/bracers/jackchain
	gloves = /obj/item/clothing/gloves/chain/iron
	pants = /obj/item/clothing/pants/chainlegs/iron
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

/datum/job/watch_veteran/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/weapons = list("Sword + Shield", "Sword + Longbow", "Sword + Crossbow", "Zweihander", "Halberd")
	var/weapon_choice = browser_input_list(spawned, "CHOOSE YOUR WEAPON.", "TAKE UP ARMS", weapons)

	switch(weapon_choice)
		if("Sword + Shield")
			spawned.put_in_hands(new /obj/item/weapon/sword/arming(get_turf(spawned)), TRUE)
			spawned.put_in_hands(new /obj/item/weapon/scabbard/sword(get_turf(spawned)), TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/weapon/shield/heater, ITEM_SLOT_BACK_L, TRUE)
		if("Sword + Bow")
			spawned.put_in_hands(new /obj/item/weapon/sword/arming(get_turf(spawned)), TRUE)
			spawned.put_in_hands(new /obj/item/weapon/scabbard/sword(get_turf(spawned)), TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/ammo_holder/quiver/arrows, ITEM_SLOT_BELT_L, TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/long, ITEM_SLOT_BACK_L, TRUE)
		if("Sword + Bow")
			spawned.put_in_hands(new /obj/item/weapon/sword/arming(get_turf(spawned)), TRUE)
			spawned.put_in_hands(new /obj/item/weapon/scabbard/sword(get_turf(spawned)), TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow, ITEM_SLOT_BACK_L, TRUE)
			spawned.equip_to_slot_or_del(new /obj/item/ammo_holder/quiver/bolts, ITEM_SLOT_BELT_L, TRUE)
		if("Zweihander")
			spawned.put_in_hands(new /obj/item/weapon/sword/long/greatsword/zwei(get_turf(spawned)), TRUE)
		if("Halberd")
			spawned.put_in_hands(new /obj/item/weapon/polearm/halberd(get_turf(spawned)), TRUE)


/datum/job/watch_veteran/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/proc/haltyell

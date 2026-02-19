/datum/job/councilor
	title = "Councilor"
	f_title = "Councilwoman"
	var/council_title = "Councilor"
	tutorial = "You are the Burgmeister’s appointed Councilor. \
	While the Burgmeister speaks for Rivermist Hollow, you ensure that their decisions are recorded, enforced, and understood. \
	You advise policy, mediate disputes, and oversee the machinery of town governance."
	department_flag = TOWNHALL
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_COUNCILOR
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	selection_color = JCOLOR_TOWNHALL

	spells = list(/datum/action/cooldown/spell/undirected/list_target/convert_role/town_watch,
					/datum/action/cooldown/spell/undirected/list_target/convert_role/servant)

	give_bank_account = 250
	noble_income = 18

	advclass_cat_rolls = list(CAT_COUNCILOR = 20)

	exp_type = list(EXP_TYPE_NOBLE, EXP_TYPE_LIVING)
	exp_types_granted = list(EXP_TYPE_NOBLE)
	exp_requirements = list(
		EXP_TYPE_LIVING = 600,
		EXP_TYPE_NOBLE = 300
	)

	job_subclasses = list(
		/datum/job/advclass/councilor/adjutant,
		/datum/job/advclass/councilor/clerk,
		/datum/job/advclass/councilor/advisor,
		/datum/job/advclass/councilor/spymaster,
	)


/datum/job/councilor/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/living/carbon/human/proc/councilor_announcement

// ─────────────────────────────
// SUBCLASSES
// ─────────────────────────────
/datum/job/advclass/councilor
	exp_types_granted = list(EXP_TYPE_NOBLE)


/datum/job/advclass/councilor/adjutant
	title = "Adjutant"
	tutorial = "You once enforced law on the streets of Rivermist Hollow. \
	Now you serve beside the Burgmeister as an enforcer of order through administration rather than patrol. \
	You advise on security, discipline, and the practical limits of authority, ensuring that decrees can be upheld without chaos."

	outfit = /datum/outfit/councilor/adjutant
	category_tags = list(CAT_COUNCILOR)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_CON = 2,
		STATKEY_PER = 3,
		STATKEY_INT = 2,
		STATKEY_END = 2
	)

	skills = list(
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/swords = 3,
	    /datum/skill/combat/axesmaces = 3,
		/datum/skill/combat/shields = 3,
	    /datum/skill/combat/bows = 3,
	    /datum/skill/combat/crossbows = 3,
		/datum/skill/combat/firearms = 3,

		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/swimming = 2,

		/datum/skill/labor/mathematics = 2
	)

	traits = list(
		TRAIT_BREADY,
		TRAIT_NOSEGRAB
	)


/datum/job/advclass/councilor/adjutant/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/static/list/selectable = list( \
		"Dagger" = /obj/item/weapon/knife/dagger/silver, \
		"Rapier" = /obj/item/weapon/sword/rapier/dec, \
		"Cane Blade" = /obj/item/weapon/sword/rapier/caneblade, \
		)
	var/choice = spawned.select_equippable(spawned, selectable, time_limit = 1 MINUTES, message = "Choose your weapon", title = "COUNCILOR")
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

/datum/outfit/councilor/adjutant
	name = "Councilor Adjutant"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/half/duelcape/townhall
	armor = /obj/item/clothing/suit/roguetown/armor/leather/adjutant
	shirt = null
	wrists = null
	gloves = /obj/item/clothing/gloves/leather/duelgloves/townhall
	pants = /obj/item/clothing/pants/trou/leather/advanced/colored/duelpants/townhall
	shoes = /obj/item/clothing/shoes/nobleboot/duelboots/townhall
	backr = /obj/item/storage/backpack/satchel/black
	backl = null
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltr = /obj/item/storage/belt/pouch/coins/rich
	beltl = /obj/item/storage/keyring/rmh_councilor
	ring = /obj/item/clothing/ring/slave_control
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/clothing/neck/slave_collar
	)

// ─────────────────────────────

/datum/job/advclass/councilor/clerk
	title = "Clerk"
	tutorial = "You are the keeper of records, taxes, decrees, and civic correspondence. \
	As Clerk to the Burgmeister, you ensure that Rivermist Hollow runs on ink, seal, and ledger. \
	Your authority is quiet but absolute — a decision not written may as well never have existed."

	outfit = /datum/outfit/councilor/clerk
	category_tags = list(CAT_COUNCILOR)

	jobstats = list(
		STATKEY_INT = 4,
		STATKEY_PER = 3,
		STATKEY_LCK = 1
	)

	skills = list(
		/datum/skill/misc/reading = 5,
		/datum/skill/labor/mathematics = 4,

		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/lockpicking = 2,

		/datum/skill/combat/unarmed = 1
	)

	traits = list(
		TRAIT_SEEPRICES,
		TRAIT_TUTELAGE
	)

/datum/outfit/councilor/clerk
	name = "Councilor Clerk"
	head = /obj/item/clothing/head/stewardtophat
	mask = /obj/item/clothing/face/spectacles
	neck = null
	cloak = /obj/item/clothing/cloak/cape/puritan/townhall
	armor = /obj/item/clothing/armor/gambeson/steward/townhall
	shirt = null
	pants = null
	wrists = null
	gloves = null
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel/black
	backl = null
	belt = /obj/item/storage/belt/leather/plaquegold
	beltr = /obj/item/storage/belt/pouch/coins/rich
	beltl = /obj/item/storage/keyring/rmh_councilor
	ring = /obj/item/clothing/ring/slave_control
	l_hand = /obj/item/weapon/mace/cane/noble
	r_hand = null

	backpack_contents = list(
		/obj/item/clothing/neck/slave_collar
	)

/datum/outfit/councilor/clerk/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		pants = /obj/item/clothing/pants/tights/colored/black
	else
		shirt = /obj/item/clothing/shirt/dress/stewarddress/townhall


// ─────────────────────────────

/datum/job/advclass/councilor/advisor
	title = "Advisor"
	tutorial = "You serve as the Burgmeister’s counselor, strategist, and interpreter of consequence. \
	You weigh guild pressure, public unrest, and expectations before decisions are ever announced. \
	Though you hold no elected mandate, your counsel shapes the fate of Rivermist Hollow."

	outfit = /datum/outfit/councilor/advisor
	category_tags = list(CAT_COUNCILOR)


	jobstats = list(
		STATKEY_INT = 4,
		STATKEY_PER = 3,
		STATKEY_LCK = 2
	)

	skills = list(
		/datum/skill/misc/reading = 5,
		/datum/skill/labor/mathematics = 3,

		/datum/skill/misc/medicine = 3,
		/datum/skill/misc/lockpicking = 3,

		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2
	)

	traits = list(
		TRAIT_EMPATH,
		TRAIT_DECEIVING_MEEKNESS
	)

/datum/outfit/councilor/advisor
	name = "Advisor Councilor"
	head = /obj/item/clothing/head/chaperon/colored/greyscale/townhall
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/cape/colored/townhall
	armor = /obj/item/clothing/suit/roguetown/armor/councillor
	shirt = /obj/item/clothing/shirt/undershirt/fancy
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel/black
	backl = null
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltr = /obj/item/storage/belt/pouch/coins/rich
	beltl = /obj/item/storage/keyring/rmh_councilor
	ring = /obj/item/clothing/ring/slave_control
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/clothing/neck/slave_collar
	)


// ─────────────────────────────

/datum/job/advclass/councilor/spymaster
	title = "Spymaster Councilor"
	tutorial = "You are the keeper of secrets, informants, and quiet truths. \
	From tavern whispers to sealed correspondence, nothing of importance moves in Rivermist Hollow without your notice. \
	You advise the Burgmeister not with speeches, but with leverage — knowing who lies, who plots, and who can be turned."

	outfit = /datum/outfit/councilor/spymaster
	category_tags = list(CAT_COUNCILOR)

	jobstats = list(
		STATKEY_INT = 4,
		STATKEY_PER = 4,
		STATKEY_LCK = 2,
		STATKEY_STR = -1
	)

	skills = list(
		/datum/skill/misc/reading = 5,
		/datum/skill/misc/sneaking = 3,
		/datum/skill/misc/stealing = 3,
		/datum/skill/misc/lockpicking = 3,
		/datum/skill/misc/athletics = 2,

		/datum/skill/misc/medicine = 2,
		/datum/skill/labor/mathematics = 2,

		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/knives = 2
	)

	traits = list(
		TRAIT_DECEIVING_MEEKNESS,
		TRAIT_EMPATH,
		TRAIT_LIGHT_STEP,
		TRAIT_THIEVESGUILD,
	)

	languages = list(/datum/language/thievescant)

/datum/outfit/councilor/spymaster
	name = "Spymaster Councilor"
	head = /obj/item/clothing/head/chaperon/colored/greyscale/townhall
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak/colored/mortus
	armor = /obj/item/clothing/armor/leather/splint
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/storage/backpack/satchel/black
	backl = null
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltr = /obj/item/storage/belt/pouch/coins/rich
	beltl = /obj/item/storage/keyring/rmh_councilor
	ring = /obj/item/clothing/ring/slave_control
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/clothing/neck/slave_collar,
		/obj/item/lockpick = 1,
		/obj/item/weapon/knife/dagger/steel = 1,
		/obj/item/clothing/face/shepherd/rag = 1,
	)

//ANNOUNCEMENT SYSTEM

/mob/living/carbon/human/proc/councilor_announcement()
	set name = "Announcement"
	set category = "Councilor"
	if(stat)
		return

	var/static/last_announcement_time = 0

	if(world.time < last_announcement_time + 1 MINUTES)
		var/time_left = round((last_announcement_time + 1 MINUTES - world.time) / 10)
		to_chat(src, "<span class='warning'>You must wait [time_left] more seconds before making another announcement.</span>")
		return

	var/inputty = input("Make an announcement", "RIVERMIST HOLLOW") as text|null
	if(inputty)
		var/area/A = get_area(src)
		if(!(istype(A, /area/indoors/town/rmh/town_hall) || istype(A, /area/outdoors/town)))
			to_chat(src, "<span class='warning'>I need to do this from the Town Hall or the Town Square.</span>")
			return FALSE

		priority_announce(
			"[inputty]",
			title = "[src.real_name], the Councilor of Rivermist Hollow",
			sound = 'sound/misc/bell.ogg'
		)

		src.log_talk(
			"[TIMETOTEXT4LOGS] [inputty]",
			LOG_SAY,
			tag = "Councilor announcement"
		)

		last_announcement_time = world.time

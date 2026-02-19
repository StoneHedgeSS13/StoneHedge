GLOBAL_VAR(burgmeistersurname)
GLOBAL_LIST_EMPTY(burgmeister_titles)

/datum/job/burgmeister
	title = "Burgmeister"
	f_title = "Burgmeisterin"
	var/ruler_title = "Burgmeister"
	tutorial = "In the Duskmar Duchy, while lords and ladies rule from afar, the daily governance of Rivermist Hollow falls to you, the Burgmeister. \
		Chosen not by blood but by the will of the townsfolk, you embody merit, authority, and trust within the community. \
		You oversee taxes, crafts, and public order, settling disputes and enforcing the laws of the Council of Lords and Ladies. \
		Though greater powers loom above you, it is your hand that keeps the town running."
	department_flag = TOWNHALL
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_BURGMEISTER
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_races = ALL_RACES_LIST
	give_bank_account = 500
	selection_color = JCOLOR_TOWNHALL
	can_have_apprentices = FALSE

	spells = list(/datum/action/cooldown/spell/undirected/list_target/convert_role/town_watch,
					/datum/action/cooldown/spell/undirected/list_target/convert_role/servant)

	advclass_cat_rolls = list(CAT_BURGMESITER = 20)

	exp_type = list(EXP_TYPE_NOBLE, EXP_TYPE_LIVING, EXP_TYPE_LEADERSHIP)
	exp_types_granted = list(EXP_TYPE_NOBLE, EXP_TYPE_LEADERSHIP)
	exp_requirements = list(
		EXP_TYPE_LIVING = 1200,
		EXP_TYPE_NOBLE = 900,
		EXP_TYPE_LEADERSHIP = 300
	)

	job_subclasses = list(
		/datum/job/advclass/burgmeister/marshall,
		/datum/job/advclass/burgmeister/elected,
		/datum/job/advclass/burgmeister/patrician,
		/datum/job/advclass/burgmeister/scholar
	)

	mind_traits = list(
		TRAIT_KNOW_KEEP_DOORS
	)

/datum/job/burgmeister/get_informed_title(mob/mob, change_title = FALSE, new_title)
	if(change_title)
		ruler_title = new_title
		return "[ruler_title]"
	else
		return "[ruler_title]"

/datum/job/burgmeister/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	SSticker.rulermob = spawned
	var/mob/living/carbon/human/H = spawned
	addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, lord_color_choice)), 7 SECONDS)
	ruler_title = "Burgmeister"
	to_chat(world, "<b>[span_notice(span_big("[H.real_name] is [ruler_title] of [SSmapping.config.map_name]."))]</b>")
	to_chat(world, "<br>")
	spawned.verbs |= /mob/living/carbon/human/proc/burgmeister_announcement

/datum/outfit/burgmeister/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		pants = /obj/item/clothing/pants/tights/colored/black
		shirt = /obj/item/clothing/shirt/undershirt/fancy
	else
		shirt = /obj/item/clothing/shirt/dress/silkdress/colored/black

//SUBCLASSES

/datum/job/advclass/burgmeister
	exp_types_granted = list(EXP_TYPE_NOBLE)

/datum/job/advclass/burgmeister/marshall
	title = "Ex-Guard Captain"
	tutorial = "You once led the city watch and now act as Burgmeister. Your experience in combat and leadership makes you authoritative and respected in town affairs."

	outfit = /datum/outfit/burgmeister/marshall
	category_tags = list(CAT_BURGMESITER)

	jobstats = list(
	    STATKEY_STR = 3,
	    STATKEY_END = 3,
	    STATKEY_CON = 2,
	    STATKEY_PER = 2,
	    STATKEY_SPD = 2,
	    STATKEY_INT = 1,
	    STATKEY_LCK = 1
	)

	skills = list(
	    /datum/skill/combat/swords = 3,
	    /datum/skill/combat/axesmaces = 3,
	    /datum/skill/combat/shields = 3,
	    /datum/skill/combat/bows = 3,
	    /datum/skill/combat/crossbows = 3,
	    /datum/skill/combat/firearms = 3,
	    /datum/skill/combat/wrestling = 3,
	    /datum/skill/misc/athletics = 3,
	    /datum/skill/misc/sneaking = 1,
	    /datum/skill/misc/reading = 2,
	    /datum/skill/misc/climbing = 2,
	    /datum/skill/misc/swimming = 2
	)

	traits = list(
	    TRAIT_HEAVYARMOR,
	    TRAIT_MEDIUMARMOR,
	    TRAIT_BLINDFIGHTING,
	    TRAIT_DODGEEXPERT,
	    TRAIT_BREADY,
	    TRAIT_EMPATH,
	    TRAIT_OLDPARTY
	)

/datum/job/advclass/burgmeister/marshall/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/static/list/selectable = list( \
		"Dagger" = /obj/item/weapon/knife/dagger/silver, \
		"Rapier" = /obj/item/weapon/sword/rapier/dec, \
		"Cane Blade" = /obj/item/weapon/sword/rapier/caneblade, \
		)
	var/choice = spawned.select_equippable(spawned, selectable, time_limit = 1 MINUTES, message = "Choose your weapon", title = "BURGMEISTER")
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

/datum/outfit/burgmeister/marshall
	name = "Burgmeister Marshall"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/ordinatorcape/townhall
	armor = /obj/item/clothing/suit/roguetown/armor/leather/marshall
	shirt = /obj/item/clothing/shirt/undershirt/fancy
	wrists = null
	gloves = /obj/item/clothing/gloves/leather/duelgloves/townhall
	pants = /obj/item/clothing/pants/trou/leather/advanced/colored/duelpants/townhall
	shoes = /obj/item/clothing/shoes/nobleboot/duelboots/townhall
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/plaquegold
	beltr = /obj/item/storage/belt/pouch/coins/veryrich
	beltl = /obj/item/storage/keyring/rmh_burgmeister
	ring = /obj/item/clothing/ring/slave_control/master
	l_hand = /obj/item/weapon/lordscepter
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/bullets,
		/obj/item/reagent_containers/glass/bottle/aflask,
		/obj/item/gun/ballistic/revolver/grenadelauncher/pistol,
		/obj/item/clothing/neck/slave_collar,
	)

// ─────────────────────────────

/datum/job/advclass/burgmeister/elected
	title = "Elected Burgmeister"
	tutorial = "You were chosen by the townsfolk to serve as Burgmeister. Your social skills, perception, and wisdom allow you to maintain order and ensure the town prospers."

	outfit = /datum/outfit/burgmeister/elected
	category_tags = list(CAT_BURGMESITER)

	jobstats = list(
	    STATKEY_INT = 3,
	    STATKEY_PER = 3,
	    STATKEY_LCK = 2,
	    STATKEY_END = 1,
	    STATKEY_STR = 1,
	    STATKEY_SPD = 2
	)

	skills = list(
	    /datum/skill/misc/reading = 3,
	    /datum/skill/misc/athletics = 1,
	    /datum/skill/misc/riding = 1,
	    /datum/skill/misc/climbing = 1,
	    /datum/skill/misc/sneaking = 1
	)

	traits = list(
	    TRAIT_EMPATH,
	    TRAIT_EXTEROCEPTION,
	    TRAIT_TUTELAGE,
	    TRAIT_BETTER_SLEEP
	)

/datum/job/advclass/burgmeister/elected/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/static/list/selectable = list( \
		"Dagger" = /obj/item/weapon/knife/dagger/silver, \
		"Rapier" = /obj/item/weapon/sword/rapier/dec, \
		"Cane Blade" = /obj/item/weapon/sword/rapier/caneblade, \
		)
	var/choice = spawned.select_equippable(spawned, selectable, time_limit = 1 MINUTES, message = "Choose your weapon", title = "BURGMEISTER")
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

/datum/outfit/burgmeister/elected
	name = "Elected Burgmeister"
	head = /obj/item/clothing/head/fancyhat
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	armor = /obj/item/clothing/suit/roguetown/armor/leather/burgmeister
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/plaquegold
	beltr = /obj/item/storage/belt/pouch/coins/veryrich
	beltl = /obj/item/storage/keyring/rmh_burgmeister
	ring = /obj/item/clothing/ring/slave_control/master
	l_hand = /obj/item/weapon/lordscepter
	r_hand = null

	backpack_contents = list(
		/obj/item/clothing/neck/slave_collar
	)

/datum/outfit/burgmeister/elected/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		pants = /obj/item/clothing/pants/tights/colored/black
	else
		shirt = /obj/item/clothing/shirt/dress/silkdress/colored/black

// ─────────────────────────────

/datum/job/advclass/burgmeister/patrician
	title = "Patrician"
	tutorial = "You are a wealthy Burgmeister whose influence comes from gold and heritage. Your resources and connections make you untouchable and influential."

	outfit = /datum/outfit/burgmeister/patrician
	category_tags = list(CAT_BURGMESITER)
	give_bank_account = 2000

	jobstats = list(
	    STATKEY_LCK = 4,
	    STATKEY_INT = 3,
	    STATKEY_PER = 2,
	    STATKEY_END = 1,
	    STATKEY_STR = 1,
	    STATKEY_SPD = 1
	)

	skills = list(
	    /datum/skill/misc/reading = 3,
	    /datum/skill/misc/athletics = 1,
	    /datum/skill/craft/crafting = 2,
	    /datum/skill/misc/sneaking = 1
	)

	traits = list(
	    TRAIT_NOBLE,
	    TRAIT_BETTER_SLEEP,
	    TRAIT_EXTEROCEPTION
	)

/datum/job/advclass/burgmeister/patrician/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/static/list/selectable = list( \
		"Dagger" = /obj/item/weapon/knife/dagger/silver, \
		"Rapier" = /obj/item/weapon/sword/rapier/dec, \
		"Cane Blade" = /obj/item/weapon/sword/rapier/caneblade, \
		)
	var/choice = spawned.select_equippable(spawned, selectable, time_limit = 1 MINUTES, message = "Choose your weapon", title = "BURGMEISTER")
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

/datum/outfit/burgmeister/patrician
	name = "Patrician Burgmeister"
	head = /obj/item/clothing/head/crown/circlet
	mask = null
	neck = null
	cloak = null
	armor = null
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/plaquegold
	beltr = /obj/item/storage/belt/pouch/coins/veryrich
	beltl = /obj/item/storage/keyring/rmh_burgmeister
	ring = /obj/item/clothing/ring/slave_control/master
	l_hand = /obj/item/weapon/mace/cane/noble
	r_hand = /obj/item/weapon/lordscepter

	backpack_contents = list(
		/obj/item/clothing/neck/slave_collar
	)

/datum/outfit/burgmeister/patrician/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/tunic/noblecoat
		pants = /obj/item/clothing/pants/tights/colored/white
		cloak = /obj/item/clothing/cloak/lordcloak
	else
		shirt = /obj/item/clothing/shirt/dress/royal
		cloak = /obj/item/clothing/cloak/lordcloak/ladycloak

// ─────────────────────────────

/datum/job/advclass/burgmeister/scholar
	title = "Scholar-Administrator"
	tutorial = "You are a Burgmeister who governs with knowledge and wisdom. Your intelligence and insight ensure the town is managed efficiently and the laws are fair."

	outfit = /datum/outfit/burgmeister/scholar
	category_tags = list(CAT_BURGMESITER)

	jobstats = list(
	    STATKEY_INT = 4,
	    STATKEY_PER = 3,
	    STATKEY_CON = 2,
	    STATKEY_END = 1,
	    STATKEY_STR = 1,
	    STATKEY_SPD = 1,
	    STATKEY_LCK = 2
	)

	skills = list(
	    /datum/skill/misc/reading = 4,
	    /datum/skill/misc/athletics = 1,
	    /datum/skill/labor/mathematics = 3,
	    /datum/skill/misc/sneaking = 1
	)

	traits = list(
	    TRAIT_EMPATH,
	    TRAIT_EXTEROCEPTION,
	    TRAIT_TUTELAGE,
	    TRAIT_BETTER_SLEEP
	)

/datum/outfit/burgmeister/scholar
	name = "Scholar-Administrator Burgmeister"
	head = /obj/item/clothing/head/roguehood/colored/townhall
	mask = /obj/item/clothing/face/spectacles
	neck = null
	cloak = /obj/item/clothing/cloak/cape/puritan/townhall
	armor = /obj/item/clothing/suit/roguetown/armor/leather/magos
	shirt = /obj/item/clothing/shirt/tunic/colored/black
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/plaquegold
	beltr = /obj/item/storage/belt/pouch/coins/veryrich
	beltl = /obj/item/storage/keyring/rmh_burgmeister
	ring = /obj/item/clothing/ring/slave_control/master
	l_hand = /obj/item/weapon/lordscepter
	r_hand = null

	backpack_contents = list(
		/obj/item/clothing/neck/slave_collar
	)

//EX-LORD SYSTEM

/datum/job/exburgmeister //just used to change the lords title
	title = "Ex-Burgmeister"
	department_flag = TOWN
	faction = FACTION_TOWN
	total_positions = 0
	spawn_positions = 0
	display_order = JDO_LORD

/proc/give_burgmeister_surname(mob/living/carbon/human/family_guy, preserve_original = FALSE)
	if(!GLOB.burgmeistersurname)
		return
	if(preserve_original)
		family_guy.fully_replace_character_name(family_guy.real_name, family_guy.real_name + " " + GLOB.burgmeistersurname)
		return family_guy.real_name
	var/list/chopped_name = splittext(family_guy.real_name, " ")
	if(length(chopped_name) > 1)
		family_guy.fully_replace_character_name(family_guy.real_name, chopped_name[1] + " " + GLOB.burgmeistersurname)
	else
		family_guy.fully_replace_character_name(family_guy.real_name, family_guy.real_name + " " + GLOB.burgmeistersurname)
	return family_guy.real_name

//ANNOUNCEMENT SYSTEM

/mob/living/carbon/human/proc/burgmeister_announcement()
	set name = "Announcement"
	set category = "Burgmeister"
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
			title = "[src.real_name], the Burgmeister of Rivermist Hollow",
			sound = 'sound/misc/bell.ogg'
		)

		src.log_talk(
			"[TIMETOTEXT4LOGS] [inputty]",
			LOG_SAY,
			tag = "Burgmeister announcement"
		)

		last_announcement_time = world.time

//RECRUIT SERVANT
/datum/action/cooldown/spell/undirected/list_target/convert_role/servant
	name = "Recruit Servant"
	button_icon_state = "recruit_servant"

	new_role = "Servant"
	recruitment_faction = "Servants"
	recruitment_message = "Join the Town Hall servants, %RECRUIT!"
	accept_message = "I serve the Burgmeister!"
	refuse_message = "I refuse."

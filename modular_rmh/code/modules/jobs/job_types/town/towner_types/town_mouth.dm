/datum/job/advclass/towner/town_mouth
	title = "Town Mouth"
	tutorial = "You are the appointed voice of civic authority. \
	Laws, news, and public warnings are spoken through you."
	total_positions = 2
	spawn_positions = 2

	outfit = /datum/outfit/towner/town_mouth
	category_tags = list(CAT_TOWNER)
	give_bank_account = 20

	jobstats = list(
		STATKEY_INT = 2,
		STATKEY_PER = 3,
		STATKEY_STR = -1
	)

	skills = list(
		/datum/skill/misc/reading = 5,
		/datum/skill/labor/mathematics = 3,
		/datum/skill/misc/music = 3,
		/datum/skill/misc/athletics = 1,
		/datum/skill/misc/riding = 2,
		/datum/skill/combat/unarmed = 1,
	)

/datum/job/advclass/towner/town_mouth/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/living/carbon/human/proc/town_mouth_announcement

/datum/outfit/towner/town_mouth
	name = "Town Mouth"
	head = /obj/item/clothing/head/veiled/loudmouth
	mask = null
	neck = null
	cloak = null
	armor = /obj/item/clothing/shirt/dress/silkdress/loudmouth
	shirt = /obj/item/clothing/shirt/undershirt/colored/red
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/red
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltr = /obj/item/storage/belt/pouch/coins/mid
	beltl = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/paper/scroll = 1,
		/obj/item/natural/feather = 1,
		)

//ANNOUNCEMENT SYSTEM

/mob/living/carbon/human/proc/town_mouth_announcement()
	set name = "Announcement"
	set category = "Town Mouth"
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
			title = "[src.real_name], the Town Mouth",
			sound = 'sound/misc/bell.ogg'
		)

		src.log_talk(
			"[TIMETOTEXT4LOGS] [inputty]",
			LOG_SAY,
			tag = "Town Mouth announcement"
		)

		last_announcement_time = world.time

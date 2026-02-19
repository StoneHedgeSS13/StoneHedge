/datum/job/advclass/combat/adventurer_fighter/calishite_emir
	title = "Calishite Trade-Emir"
	f_title = "Calishite Trade-Amirah"
	tutorial = "A Calishite emir and merchant-prince, traveling Faerûn on guild business."

	outfit = /datum/outfit/adventurer_fighter/calishite_emir
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE
	total_positions = 1

	jobstats = list(
		STATKEY_INT = 1,
		STATKEY_END = 2
	)

	skills = list(
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/riding = 4,
		/datum/skill/misc/reading = 4,
		/datum/skill/misc/music = 1,
		/datum/skill/misc/athletics = 2,
		/datum/skill/craft/cooking = 2,
		/datum/skill/combat/crossbows = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/labor/mathematics = 3
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_NOBLE,
		TRAIT_FOREIGNER
	)

	languages = list(/datum/language/zalad)

/datum/job/advclass/combat/adventurer_fighter/calishite_emir/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/prev_real_name = spawned.real_name
	var/prev_name = spawned.name
	var/honorary = "Emir"
	if(spawned.pronouns == SHE_HER)
		honorary = "Amirah"
	spawned.real_name = "[honorary] [prev_real_name]"
	spawned.name = "[honorary] [prev_name]"

/datum/outfit/adventurer_fighter/calishite_emir
	name = "Calishite Trade-Emir"
	head = /obj/item/clothing/head/crown/circlet
	mask = null
	neck = /obj/item/clothing/neck/shalal/emir
	cloak = /obj/item/clothing/cloak/raincloak/colored/purple
	armor = /obj/item/clothing/armor/gambeson/arming
	shirt = /obj/item/clothing/shirt/tunic/colored/purple
	wrists = null
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/shalal
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/shalal/adventurers_subclasses
	beltl = /obj/item/weapon/scabbard/sword/royal
	beltr = /obj/item/flashlight/flare/torch/lantern
	ring = /obj/item/clothing/ring/gold/guild_mercator
	l_hand = /obj/item/weapon/sword/sabre/shalal
	r_hand = null

	backpack_contents = list(/obj/item/storage/belt/pouch/coins/veryrich = 1)

/datum/outfit/adventurer_fighter/calishite_emir/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == FEMALE)
		shirt = /obj/item/clothing/shirt/dress/silkdress/colored/black

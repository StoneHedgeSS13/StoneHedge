/datum/job/advclass/artisan_apprentice/tailor
	title = "Tailor Apprentice"
	f_title = "Seamstress Apprentice"
	tutorial = "You mend seams, cut patterns, and learn patience one stitch at a time."

	outfit = /datum/outfit/artisan_apprentice/tailor
	category_tags = list(CAT_ARTISANAP)

	give_bank_account = 6
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_INT = 1,
		STATKEY_SPD = 1,
		STATKEY_PER = 1,
		STATKEY_STR = -1
	)

	skills = list(
		/datum/skill/misc/sewing = 2,
		/datum/skill/craft/tanning = 1,
		/datum/skill/craft/crafting = 2,
		/datum/skill/combat/knives = 1,
		/datum/skill/misc/sneaking = 1,
		/datum/skill/misc/reading = 1,
		/datum/skill/labor/mathematics = 1,
	)

/datum/outfit/artisan_apprentice/tailor
	name = "Tailor"
	head = null
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/poor
	cloak = null
	armor = null
	shirt = null
	wrists = /obj/item/storage/keyring/guild_artisan
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/weapon/knife/scissors
	beltl = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/needle = 1,
		/obj/item/natural/bundle/cloth/full = 1,
		/obj/item/natural/bundle/fibers/full = 1,
		/obj/item/dye_pack/luxury = 1,
		/obj/item/recipe_book/sewing_leather = 1,
		/obj/item/weapon/knife/villager = 1
	)

/datum/outfit/artisan_apprentice/tailor/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/undershirt
		pants = /obj/item/clothing/pants/tights/colored/red
	else
		armor = /obj/item/clothing/armor/corset
		shirt = /obj/item/clothing/shirt/undershirt
		pants = /obj/item/clothing/pants/skirt/colored/red

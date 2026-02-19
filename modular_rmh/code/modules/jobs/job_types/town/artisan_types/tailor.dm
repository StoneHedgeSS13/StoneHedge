/datum/job/advclass/artisan/tailor
	title = "Tailor"
	f_title = "Seamstress"
	tutorial = "Cloth, linen, silk, and leather pass through your hands each day."

	apprentice_name = "Tailor Apprentice"
	can_have_apprentices = TRUE

	outfit = /datum/outfit/tailor
	category_tags = list(CAT_ARTISAN)

	give_bank_account = 25
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_INT = 2,
		STATKEY_SPD = 1,
		STATKEY_PER = 1,
		STATKEY_STR = -1
	)

	skills = list(
		/datum/skill/misc/sewing = 3,
		/datum/skill/craft/tanning = 2,
		/datum/skill/craft/crafting = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/labor/taming = 3,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/craft/carpentry = 1,
		/datum/skill/misc/stealing = 1,
		/datum/skill/labor/mathematics = 2
	)

	traits = list(
		TRAIT_TUTELAGE,
		TRAIT_SEEPRICES,
	)

/datum/outfit/tailor
	name = "Tailor"
	head = /obj/item/clothing/head/courtierhat
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/mid
	cloak = null
	armor = null
	shirt = null
	wrists = /obj/item/storage/keyring/guild_artisan
	gloves = null
	pants = null
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/weapon/knife/scissors
	beltl = null
	ring = /obj/item/clothing/ring/silver/makers_guild
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

/datum/outfit/tailor/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		cloak = /obj/item/clothing/cloak/raincloak/furcloak
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		pants = /obj/item/clothing/pants/tights/colored/red
	else
		cloak = /obj/item/clothing/cloak/raincloak/furcloak
		armor = /obj/item/clothing/armor/corset
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		pants = /obj/item/clothing/pants/skirt/colored/red

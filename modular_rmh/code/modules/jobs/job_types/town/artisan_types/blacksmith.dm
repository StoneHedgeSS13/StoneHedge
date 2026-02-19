/datum/job/advclass/artisan/blacksmith
	title = "Blacksmith"
	tutorial = "Steel is your craft, whether shaped for war, work, or protection."

	apprentice_name = "Smithy Apprentice"
	can_have_apprentices = TRUE

	outfit = /datum/outfit/blacksmith
	category_tags = list(CAT_ARTISAN)

	give_bank_account = 30
	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 2,
		STATKEY_SPD = -1,
	)

	skills = list(
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/craft/crafting = 3,
		/datum/skill/craft/blacksmithing = 4,
		/datum/skill/craft/armorsmithing = 3,
		/datum/skill/craft/weaponsmithing = 3,
		/datum/skill/craft/smelting = 3,
		/datum/skill/craft/engineering = 3,
		/datum/skill/craft/traps = 2,
		/datum/skill/misc/reading = 2,
		/datum/skill/labor/mathematics = 2,
	)

	traits = list(
		TRAIT_TUTELAGE,
		TRAIT_MALUMFIRE,
		TRAIT_SEEPRICES,
	)

/datum/outfit/blacksmith
	name = "Blacksmith"
	head = /obj/item/clothing/head/hatfur
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/apron/brown
	armor = null
	shirt = null
	wrists = /obj/item/storage/keyring/guild_artisan
	gloves = null
	pants = /obj/item/clothing/pants/trou
	shoes = null
	backr = null
	backl = /obj/item/weapon/hammer/sledgehammer
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/belt/pouch/coins/mid
	beltr = null
	ring = /obj/item/clothing/ring/silver/makers_guild
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/recipe_book/blacksmithing = 1,
	)

/datum/outfit/blacksmith/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(prob(50))
		head = /obj/item/clothing/head/hatblu
	if(equipped_human.gender == MALE)
		shoes = /obj/item/clothing/shoes/boots/leather
	else
		armor = /obj/item/clothing/shirt/dress/gen/colored/random
		shoes = /obj/item/clothing/shoes/shortboots

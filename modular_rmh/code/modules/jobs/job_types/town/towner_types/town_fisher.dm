/datum/job/advclass/towner/fisher
	title = "Fisher"
	tutorial = "Rivers and marshwaters sustain Rivermist Hollow, \
	and you know their currents, shallows, and quiet eddies. \
	With net, line, or trap, you bring in fish enough for tables and trade alike."
	total_positions = 5
	spawn_positions = 5

	allowed_races = RACES_PLAYER_ALL

	outfit = /datum/outfit/towner/fisher
	category_tags = list(CAT_TOWNER)
	give_bank_account = 8

	job_bitflag = BITFLAG_CONSTRUCTOR

	jobstats = list(
		STATKEY_CON = 2,
		STATKEY_PER = 1
	)

	skills = list(
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/swimming = 3,
		/datum/skill/craft/cooking = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/misc/sewing = 1,
		/datum/skill/labor/fishing = 4,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/reading = 1
	)

	traits = list(
		TRAIT_DEADNOSE,
	)

/datum/outfit/towner/fisher
	name = "Fisher"
	head = /obj/item/clothing/head/fisherhat
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/poor
	cloak = null
	armor = /obj/item/clothing/armor/gambeson/light/striped
	shirt = null
	wrists = null
	gloves = null
	pants = null
	shoes = null
	backr = /obj/item/fishingrod/fisher
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/flint
	beltr = /obj/item/cooking/pan
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/weapon/shovel/small = 1,
		/obj/item/natural/worms = 1
	)

/datum/outfit/towner/fisher/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		pants = /obj/item/clothing/pants/tights/colored/random
		shirt = /obj/item/clothing/shirt/shortshirt/colored/random
		shoes = /obj/item/clothing/shoes/boots/leather
		backpack_contents += list(
			/obj/item/weapon/knife/villager = 1,
			/obj/item/recipe_book/survival = 1
		)
	else
		shirt = /obj/item/clothing/shirt/dress/gen/colored/random
		shoes = /obj/item/clothing/shoes/boots/leather
		backpack_contents += list(
			/obj/item/weapon/knife/hunting = 1
		)

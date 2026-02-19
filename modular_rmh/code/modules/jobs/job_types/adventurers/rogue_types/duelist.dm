/datum/job/advclass/combat/adventurer_rogue/duelist
	title = "Duelist"
	tutorial = "A nimble duelist from Waterdeep, wielding rapier and wit with deadly grace."

	outfit = /datum/outfit/adventurer_rogue/duelist
	category_tags = list(CAT_ADVENTURER_ROGUE)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_END = 2,
		STATKEY_SPD = 2,
		STATKEY_PER = 2,
		STATKEY_STR = -1
	)

	skills = list(
		/datum/skill/combat/swords = 4,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/sneaking = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/medicine = 1,
		/datum/skill/craft/crafting = 1,
		/datum/skill/craft/cooking = 3
	)

	traits = list(
		TRAIT_DODGEEXPERT
	)

/datum/outfit/adventurer_rogue/duelist
	name = "Duelist"
	head = /obj/item/clothing/head/leather/duelhat
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/half/duelcape
	armor = /obj/item/clothing/armor/leather/jacket/leathercoat/duelcoat
	shirt = /obj/item/clothing/shirt/undershirt
	wrists = null
	gloves = /obj/item/clothing/gloves/leather/duelgloves
	pants = /obj/item/clothing/pants/trou/leather/advanced/colored/duelpants
	shoes = /obj/item/clothing/shoes/nobleboot/duelboots
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = null
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/storage/belt/pouch/coins/mid = 1)
	scabbards = list(/obj/item/weapon/scabbard/sword)

/datum/outfit/adventurer_rogue/duelist/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	var/rando = rand(1,6)
	switch(rando)
		if(1 to 2)
			beltl = /obj/item/weapon/sword/rapier
		if(3 to 4)
			beltl = /obj/item/weapon/sword/rapier/silver //Correct, They have a chance to receive a silver rapier, due to them being from Valoria.
		if(5 to 6)
			beltl = /obj/item/weapon/sword/rapier/dec

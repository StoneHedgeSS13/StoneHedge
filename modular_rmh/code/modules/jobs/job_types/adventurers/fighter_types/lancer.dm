/datum/job/advclass/combat/adventurer_fighter/lancer
	title = "Lancer"
	tutorial = "A seasoned sellsword from Calimshan, you left your homeland to escape the debts of old contracts and bloodshed. With your polearm by your side, you can face down any foe."

	allowed_races = list(SPEC_ID_HUMEN)
	allowed_sexes = list(MALE)

	outfit = /datum/outfit/adventurer_fighter/lancer
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/polearms = 4,
		/datum/skill/misc/climbing = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 2,
	)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_END = 2,
		STATKEY_CON = 2,
		STATKEY_SPD = -1,
	)

	traits = list(
		TRAIT_HEAVYARMOR,
	)

	languages = list(/datum/language/zalad)

/datum/outfit/adventurer_fighter/lancer
	name = "Lancer"
	head = /obj/item/clothing/head/rare/zaladplate
	mask = null
	neck = /obj/item/clothing/neck/chaincoif
	cloak = null
	armor = /obj/item/clothing/armor/rare/zaladplate
	shirt = null
	wrists = /obj/item/clothing/wrists/bracers
	gloves = /obj/item/clothing/gloves/rare/zaladplate
	pants = /obj/item/clothing/pants/tights/colored/black
	shoes = /obj/item/clothing/shoes/boots/rare/zaladplate
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/storage/belt/pouch/coins/mid
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

/datum/outfit/adventurer_fighter/lancer/pre_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()
	var/randy = rand(1,5)
	switch(randy)
		if(1 to 2)
			backr = /obj/item/weapon/polearm/halberd/bardiche
		if(3 to 4)
			backr = /obj/item/weapon/polearm/eaglebeak
		if(5)
			backr = /obj/item/weapon/polearm/spear/billhook

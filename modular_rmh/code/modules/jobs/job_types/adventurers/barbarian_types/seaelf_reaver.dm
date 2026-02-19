/datum/job/advclass/combat/adventurer_barbarian/seaelf_reaver
	title = "Sea Elf Reaver"
	tutorial = "You were raised to fear the sea — and to make offerings so it fears you back. \
	A reaver of the Sea Elves, you raid spilling blood so the waves spare your ship."

	allowed_races = RACES_PLAYER_ELF
	outfit = /datum/outfit/adventurer_barbarian/seaelf_reaver
	category_tags = list(CAT_ADVENTURER_BARBARIAN)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_END = 1,
		STATKEY_CON = 2,
		STATKEY_SPD = 1
	)

	skills = list(
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/shields = 3,
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 2,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/swords = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/combat/axesmaces = 2,
	)

	traits = list(
		TRAIT_STEELHEARTED,
		TRAIT_DEADNOSE,
	)

/datum/outfit/adventurer_barbarian/seaelf_reaver
	name = "Sea Elf Reaver"
	head = /obj/item/clothing/head/helmet/nasal
	mask = null
	neck = /obj/item/clothing/neck/highcollier/iron
	cloak = null
	armor = /obj/item/clothing/armor/chainmail/iron
	shirt = null
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots
	backr = null
	backl = /obj/item/weapon/shield/wood
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = null
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

/datum/outfit/adventurer_barbarian/seaelf_reaver/pre_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()
	var/weapontype = pickweight(list("Bow" = 2, "Axe" = 2, "Claymore" = 1))

	switch(weapontype)
		if("Bow")
			head = /obj/item/clothing/head/roguehood/colored/black
			beltl = /obj/item/ammo_holder/quiver/arrows // womp womp, guess bow users cant have coins
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/long
			beltr = /obj/item/weapon/sword/iron
		if("Axe")
			head = /obj/item/clothing/head/helmet/nasal
			backr = /obj/item/weapon/polearm/halberd/bardiche/woodcutter
			beltr = /obj/item/storage/belt/pouch/coins/poor
			beltl = /obj/item/weapon/sword/iron
		if("Claymore")
			head = /obj/item/clothing/head/helmet/nasal
			backr = /obj/item/weapon/sword/long/greatsword/claymore/iron
			beltl = /obj/item/weapon/axe/iron
			beltr = /obj/item/storage/belt/pouch/coins/poor

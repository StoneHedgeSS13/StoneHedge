/datum/job/advclass/combat/adventurer_ranger/elf_caravan
	title = "Elf Caravan Guard"
	tutorial = "Elven guardians of the caravans guards, these Rangers patrol forests and wildlands, \
	protecting travelers and goods with unmatched skill and vigilance."

	allowed_races = RACES_PLAYER_ELF_ALL
	outfit = /datum/outfit/adventurer_ranger/elf_caravan
	category_tags = list(CAT_ADVENTURER_RANGER)
	give_bank_account = TRUE

	// Base stats
	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 2,
		STATKEY_SPD = 1
	)

	// Base skills
	skills = list(
		/datum/skill/combat/knives = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/medicine = 1,
		/datum/skill/craft/crafting = 1,
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_DODGEEXPERT,
	)

/datum/job/advclass/combat/adventurer_ranger/elf_caravan/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/static/list/selectableweapon = list( \
		"Spear" = /obj/item/weapon/polearm/spear, \
		"Regal Elven Club" = /obj/item/weapon/mace/elvenclub/steel \
		)
	var/choice = spawned.select_equippable(player_client, selectableweapon, message = "Choose Your Weapon", title = "Black Oak's Guardian")
	if(!choice)
		return
	switch(choice)
		if("Spear")
			spawned.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		if("Regal Elven Club")
			spawned.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)

/datum/outfit/adventurer_ranger/elf_caravan
	name = "Elf Caravan Guard"
	head = /obj/item/clothing/head/helmet/sallet/elven
	mask = null
	neck = /obj/item/clothing/neck/chaincoif
	cloak = /obj/item/clothing/cloak/half/colored/red
	armor = /obj/item/clothing/armor/cuirass/rare/elven
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	wrists = null
	gloves = /obj/item/clothing/gloves/angle
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/black/adventurers_subclasses
	beltl = /obj/item/weapon/knife/dagger/steel/special
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor
	)

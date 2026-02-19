/datum/job/advclass/combat/adventurer_fighter/sellsword_hireling
	title = "Sellsword Hireling"
	tutorial = "New to the mercenary life, you’ve only just begun selling your blade. \
	With more nerve than reputation, you take small contracts along the roads and caravans of Faerûn, \
	hoping coin, scars, and survival will one day make your name worth remembering."

	outfit = /datum/outfit/adventurer_fighter/sellsword_hireling
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE
	allowed_ages = list(AGE_ADULT)

	skills = list(
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/combat/swords = 2,
		/datum/skill/combat/axesmaces = 1,
		/datum/skill/combat/polearms = 1,
		/datum/skill/combat/knives = 1,
		/datum/skill/combat/bows = 1,
		/datum/skill/combat/shields = 1,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/riding = 1,
		/datum/skill/misc/reading = 1
	)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_END = 1,
		STATKEY_CON = 1,
		STATKEY_SPD = 1
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_STEELHEARTED,
	)


// ------------------------------------------------------------

/datum/outfit/adventurer_fighter/sellsword_hireling
	name = "Sellsword Hireling"
	head = /obj/item/clothing/head/helmet/sallet/iron
	mask = null
	neck = /obj/item/clothing/neck/highcollier/iron
	cloak = /obj/item/clothing/cloak/raincloak/colored/green
	armor = /obj/item/clothing/armor/leather/heavy
	shirt = /obj/item/clothing/armor/chainmail/hauberk/iron
	wrists = null
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = null
	backl = null
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = null
	beltr = null
	ring = null
	l_hand = null
	r_hand = /obj/item/flashlight/flare/torch/prelit

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor = 1,
	)

// ------------------------------------------------------------

/datum/outfit/adventurer_fighter/sellsword_hireling/post_equip(mob/living/carbon/human/H)
	. = ..()

	var/list/selectableweapon = list(
		"Sword" = /obj/item/weapon/sword/iron,
		"Longsword" = /obj/item/weapon/sword/long,
		"Axe" = /obj/item/weapon/axe/iron,
		"Mace" = /obj/item/weapon/mace/spiked,
		"Spear" = /obj/item/weapon/polearm/spear,
	)

	var/weaponchoice = H.select_equippable(H, selectableweapon, message = "Choose Your Martial Training", title = "Sellsword")

	if(!weaponchoice)
		return

	var/grant_shield = TRUE
	var/shield_path = null

	switch(weaponchoice)
		if("Sword", "Longsword")
			H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Axe", "Mace")
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Spear")
			H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)

	if(grant_shield == TRUE)
		shield_path = /obj/item/weapon/shield/wood
		var/obj/item/shield = new shield_path()
		if(!H.equip_to_appropriate_slot(shield))
			qdel(shield)
	else if(ispath(grant_shield))
		var/obj/item/shield = new grant_shield()
		if(!H.equip_to_appropriate_slot(shield))
			qdel(shield)

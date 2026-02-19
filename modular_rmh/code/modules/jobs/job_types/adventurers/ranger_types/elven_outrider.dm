/datum/job/advclass/combat/adventurer_ranger/elven_outrider
	title = "Elven Outrider"
	tutorial = "An elven outrider tasked with scouting distant roads, fighting from saddle, bow, and spear alike."
	allowed_races = RACES_PLAYER_ELF_ALL

	outfit = /datum/outfit/adventurer_ranger/elven_outrider
	category_tags = list(CAT_ADVENTURER_RANGER)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/polearms = 3,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/riding = 5,
		/datum/skill/combat/bows = 4,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/reading = 2,
	)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_PER = 2,
		STATKEY_SPD = 1,
	)

	traits = list(
		TRAIT_MEDIUMARMOR
	)

/datum/outfit/adventurer_ranger/elven_outrider
	name = "Elven Outrider"
	head = /obj/item/clothing/head/helmet/leather
	mask = null
	neck = /obj/item/clothing/neck/chaincoif
	cloak = null
	armor = /obj/item/clothing/armor/chainmail/hauberk
	shirt = /obj/item/clothing/shirt/undershirt/colored/random
	wrists = null
	gloves = /obj/item/clothing/gloves/angle
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/ridingboots
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/long
	backl = /obj/item/weapon/polearm/spear
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/ammo_holder/quiver/arrows
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

/datum/job/advclass/combat/adventurer_ranger/elven_outrider/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.update_sight()
	var/mounts = list("White Female", "White Male", "Black Female", "Black Male", "Brown Female", "Brown Male")
	var/mount_choice = browser_input_list(spawned, "CHOOSE YOUR MOUNT.", "YOUR HORSE", mounts)

	switch(mount_choice)
		if("White Female")
			spawned.add_spell(/datum/action/cooldown/spell/conjure/summon_horse)
		if("White Male")
			spawned.add_spell(/datum/action/cooldown/spell/conjure/summon_horse/male)
		if("Black Female")
			spawned.add_spell(/datum/action/cooldown/spell/conjure/summon_horse/black)
		if("Black Male")
			spawned.add_spell(/datum/action/cooldown/spell/conjure/summon_horse/black_male)
		if("Brown Female")
			spawned.add_spell(/datum/action/cooldown/spell/conjure/summon_horse/brown)
		if("Brown Male")
			spawned.add_spell(/datum/action/cooldown/spell/conjure/summon_horse/brown_male)

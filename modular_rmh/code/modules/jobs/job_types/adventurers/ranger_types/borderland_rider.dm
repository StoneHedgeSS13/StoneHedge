/datum/job/advclass/combat/adventurer_ranger/borderland_rider
	title = "Borderland Rider"
	tutorial = "A wandering Tiefling rider and beast master, swift of foot and deadly with whip and sword across the wilds."

	allowed_races = list(SPEC_ID_TIEFLING)
	outfit = /datum/outfit/adventurer_ranger/borderland_rider
	category_tags = list(CAT_ADVENTURER_RANGER)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/swords = 4,
		/datum/skill/combat/whipsflails = 2, // Makes sense enough for an animal tamer
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/riding = 5,
		/datum/skill/labor/taming = 4, // How did they not have this skill before?!
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/sneaking = 3,
		/datum/skill/misc/stealing = 4,
		/datum/skill/misc/lockpicking = 1,
		/datum/skill/misc/reading = 2,
		/datum/skill/misc/music = 2,
	)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_SPD = 2,
		STATKEY_END = 2,
	)

	traits = list(
		TRAIT_DODGEEXPERT,
	)

/datum/outfit/adventurer_ranger/borderland_rider
	name = "Borderland Rider"
	head = /obj/item/clothing/head/bardhat
	mask = /obj/item/alch/herb/rosa
	neck = /obj/item/clothing/neck/chaincoif
	cloak = /obj/item/clothing/cloak/half/colored/red
	armor = /obj/item/clothing/armor/leather/vest
	shirt = /obj/item/clothing/shirt/undershirt
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = /obj/item/clothing/shoes/boots
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/weapon/sword/rapier
	beltr = /obj/item/weapon/whip
	ring = null
	l_hand = null
	r_hand = null

/datum/job/advclass/combat/adventurer_ranger/borderland_rider/after_spawn(mob/living/carbon/human/spawned, client/player_client)
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

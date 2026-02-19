/datum/job/advclass/combat/adventurer_ranger/beastmaster
	title = "Beast Master"
	tutorial = "You foster an intelligent bond with a powerful beast that can aid you in and out of combat."

	outfit = /datum/outfit/adventurer_ranger/beastmaster
	category_tags = list(CAT_ADVENTURER_RANGER)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/combat/knives = 3,
		/datum/skill/combat/bows = 3,
		/datum/skill/craft/tanning = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/craft/crafting = 2,
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 4,
		/datum/skill/labor/taming = 2,
		/datum/skill/misc/sewing = 3,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/craft/traps = 1,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/medicine = 2,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/reading = 1,
	)

	jobstats = list(
		STATKEY_PER = 2,
		STATKEY_END = 1,
		STATKEY_SPD = 1,
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_DODGEEXPERT,
		TRAIT_SEEDKNOW,
		TRAIT_FORAGER,
		TRAIT_DEADNOSE,
		TRAIT_BESTIALSENSE,
	)

/datum/outfit/adventurer_ranger/beastmaster
	name = "Beast Master"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak/colored/green
	armor = /obj/item/clothing/armor/leather/hide
	shirt = /obj/item/clothing/shirt/undershirt
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltr = /obj/item/flashlight/flare/torch/lantern
	beltl = /obj/item/ammo_holder/quiver/arrows
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/bait = 1,
		/obj/item/weapon/knife/hunting = 1,
	)

/datum/outfit/adventurer_ranger/beastmaster/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/job/advclass/combat/adventurer_ranger/beastmaster/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.update_sight()
	var/companions = list("Direbear", "Crow", "Wolf", "Spider")
	var/companion_choice = browser_input_list(spawned, "CHOOSE YOUR COMPANION.", "WHO IS YOUR FRIEND", companions)

	switch(companion_choice)
		if("Direbear")
			spawned.add_spell(/datum/action/cooldown/spell/conjure/companion_direbear)
		if("Crow")
			spawned.add_spell(/datum/action/cooldown/spell/conjure/companion_crow)
		if("Wolf")
			spawned.add_spell(/datum/action/cooldown/spell/conjure/companion_wolf)
		if("Spider")
			spawned.add_spell(/datum/action/cooldown/spell/conjure/companion_spider)

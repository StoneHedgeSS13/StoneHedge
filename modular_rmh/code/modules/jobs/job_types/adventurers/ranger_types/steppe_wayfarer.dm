/datum/job/advclass/combat/adventurer_ranger/steppe_wayfarer
	title = "Steppe Wayfarer"
	tutorial = "A wandering herder from the eastern grasslands, bound to your mounts and the old migration roads."

	outfit = /datum/outfit/adventurer_ranger/steppe_wayfarer
	category_tags = list(CAT_ADVENTURER_RANGER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_PER = 2,
		STATKEY_END = 2,
	)

	skills = list(
		/datum/skill/craft/crafting = 2,
		/datum/skill/craft/tanning = 3,
		/datum/skill/combat/bows = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/craft/cooking = 1,
		/datum/skill/labor/butchering = 2,
		/datum/skill/labor/taming = 4,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/craft/traps = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/riding = 4,
	)

	traits = list(TRAIT_FORAGER)

/datum/outfit/adventurer_ranger/steppe_wayfarer
	name = "Steppe Wayfarer"
	head = /obj/item/clothing/head/papakha
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/poor
	cloak = /obj/item/clothing/cloak/volfmantle
	armor = /obj/item/clothing/armor/leather/hide/steppe
	shirt = /obj/item/clothing/armor/gambeson/light/steppe
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = null
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/short
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltr = /obj/item/ammo_holder/quiver/arrows
	beltl = /obj/item/storage/meatbag
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/bait = 1, /obj/item/weapon/knife/hunting = 1, /obj/item/tent_kit = 1)

/datum/job/advclass/combat/adventurer_ranger/steppe_wayfarer/after_spawn(mob/living/carbon/human/spawned, client/player_client)
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

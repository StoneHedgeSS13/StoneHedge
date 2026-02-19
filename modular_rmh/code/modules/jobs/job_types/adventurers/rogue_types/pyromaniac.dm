/datum/job/advclass/combat/adventurer_rogue/pyromaniac
	title = "Pyromaniac"
	tutorial = "A notorious arsonist and demolition expert, you wield fire and explosives as your personal signature. \
	Your vendettas burn hotter than your bombs, and chaos is your calling card. \
	Just remember, fire is indiscriminate - don't get burned by your own creations!"

	outfit = /datum/outfit/adventurer_rogue/pyromaniac
	category_tags = list(CAT_ADVENTURER_ROGUE)
	give_bank_account = TRUE
	total_positions = 2

	jobstats = list(
		STATKEY_END = 3,
		STATKEY_CON = 3,
		STATKEY_INT = 3
	)

	skills = list(
		/datum/skill/combat/bows = 2,
		/datum/skill/combat/crossbows = 2,
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/athletics = 4,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/reading = 2,
		/datum/skill/craft/traps = 4,
		/datum/skill/craft/alchemy = 4,
		/datum/skill/craft/crafting = 2,
		/datum/skill/craft/engineering = 3,
		/datum/skill/labor/farming = 1,
		/datum/skill/craft/bombs = 4
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_FORAGER
	)

/datum/job/advclass/combat/adventurer_rogue/pyromaniac/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/static/list/selectableweapon = list(
		"Bow" = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/short,
		"Crossbow" = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow,
	)
	var/weaponschoice = spawned.select_equippable(player_client, selectableweapon, message = "Choose Your Weapon of choice", title = "PYROMANIAC")
	if(!weaponschoice)
		return

	switch(weaponschoice)
		if("Bow")
			var/obj/item/ammo_holder/quiver/arrows/pyro/P = new(get_turf(spawned))
			spawned.equip_to_appropriate_slot(P)
			to_chat(spawned, span_info("You are able to make more bow ammunitions with iron, blast powder and some planks."))
		if("Crossbow")
			var/obj/item/ammo_holder/quiver/bolts/pyro/P = new(get_turf(spawned))
			spawned.equip_to_appropriate_slot(P)
			to_chat(spawned, span_info("You are able to make more crossbow ammunitions with iron, blast powder and some planks."))

/datum/outfit/adventurer_rogue/pyromaniac
	name = "Pyromaniac"
	head = /obj/item/clothing/head/roguehood/colored/red
	mask = /obj/item/clothing/face/facemask
	neck = /obj/item/clothing/neck/chaincoif/iron
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored
	armor = null
	shirt = /obj/item/clothing/armor/chainmail
	wrists = null
	gloves = /obj/item/clothing/gloves/plate
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/armor
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/black/adventurers_subclasses
	beltl = null
	beltr = null
	ring = null
	r_hand = /obj/item/explosive/bottle
	l_hand = /obj/item/explosive/bottle

	backpack_contents = list(
		/obj/item/explosive/bottle = 2,
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/rope/chain = 1,
		/obj/item/flint = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1,
	)

/datum/job/advclass/combat/adventurer_barbarian/berserker
	title = "Berserker"
	tutorial = "Violence is both a means and an end. \
	You follow a path of untrammelled fury, slick with blood, as you thrill in the chaos of battle, heedless of your own well-being."

	outfit = /datum/outfit/adventurer_barbarian/berserker
	category_tags = list(CAT_ADVENTURER_BARBARIAN)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 3,
		STATKEY_PER = -1,
		STATKEY_END = 1,
		STATKEY_CON = 2,
		STATKEY_INT = -1,
		STATKEY_SPD = 1
	)

	skills = list(
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/swords = 3,
		/datum/skill/craft/tanning = 2,
		/datum/skill/misc/swimming = 4,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/athletics = 4,
		/datum/skill/craft/cooking = 1,
		/datum/skill/labor/butchering = 1,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/sneaking = 3
	)

	traits = list(
		TRAIT_STEELHEARTED,
		TRAIT_STRONGBITE,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_NOPAINSTUN,
		TRAIT_DUALWIELDER,
		TRAIT_DEADNOSE,
	)

	spells = list(
		/datum/action/cooldown/spell/undirected/barbrage
	)

/datum/job/advclass/combat/adventurer_barbarian/berserker/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/static/list/selectableweapon = list(
		"MY BARE HANDS!!!" = /obj/item/weapon/knife/dagger/steel,
		"Great Axe" = /obj/item/weapon/greataxe/steel,
		"Mace" = /obj/item/weapon/mace/goden/steel,
		"Sword" = /obj/item/weapon/sword/arming
	)

	var/choice = spawned.select_equippable(player_client, selectableweapon, message = "Choose Your Specialisation", title = "BERSERKER")
	if(!choice)
		return

	switch(choice)
		if("MY BARE HANDS!!!")
			spawned.adjust_skillrank(/datum/skill/combat/unarmed, 2)
			spawned.adjust_skillrank(/datum/skill/combat/knives, 4)
		if("Great Axe")
			spawned.clamped_adjust_skillrank(/datum/skill/combat/axesmaces, 4, 4, TRUE)
		if("Mace")
			spawned.clamped_adjust_skillrank(/datum/skill/combat/axesmaces, 4, 4, TRUE)
		if("Sword")
			spawned.clamped_adjust_skillrank(/datum/skill/combat/swords, 4, 4, TRUE)

/datum/outfit/adventurer_barbarian/berserker
	name = "Berserker"
	head = /obj/item/clothing/head/helmet/horned
	mask = /obj/item/clothing/face/skullmask
	neck = /obj/item/clothing/neck/chaincoif/iron
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
	armor = /obj/item/clothing/armor/leather/hide
	shirt = null
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather/advanced
	pants = /obj/item/clothing/pants/trou/leather/advanced
	shoes = /obj/item/clothing/shoes/boots/leather/advanced
	backr = /obj/item/storage/backpack/satchel
	backl = null
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = null
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/weapon/knife/hunting = 1,
		/obj/item/flashlight/flare/torch/lantern = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1,
		/obj/item/rope/chain = 1,
		/obj/item/weapon/scabbard/knife = 1,
		/obj/item/reagent_containers/glass/bottle/stronghealthpot = 1
	)

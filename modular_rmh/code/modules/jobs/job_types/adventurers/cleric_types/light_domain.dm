/datum/job/advclass/combat/adventurer_cleric/light_domain
	title = "Light Domain"
	tutorial = "Gods of primordial flame bathe you in resplendent light, providing magics to dispel darkness and immolate enemies."

	outfit = /datum/outfit/adventurer_cleric/light_domain
	category_tags = list(CAT_ADVENTURER_CLERIC)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_INT = 1,
		STATKEY_CON = 1,
		STATKEY_END = 2,
		STATKEY_SPD = -1,
	)

	skills = list(
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 3,
		/datum/skill/magic/holy = 3,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/sewing = 1,
		/datum/skill/misc/medicine = 1,
		/datum/skill/labor/mathematics = 2,
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_STEELHEARTED,
		TRAIT_HOLY,
	)

	languages = list(/datum/language/celestial)

	spells = list(
		/datum/action/cooldown/spell/undirected/touch/orison,
		/datum/action/cooldown/spell/healing,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/sacred_flame,
		/datum/action/cooldown/spell/undirected/divine_strike,
		/datum/action/cooldown/spell/essence/purify_water,
		/datum/action/cooldown/spell/essence/neutralize,
		/datum/action/cooldown/spell/undirected/conjure_item/light,
	)

/datum/job/advclass/combat/adventurer_cleric/light_domain/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	var/static/list/selectable = list( \
		"Silver Rungu" = /obj/item/weapon/mace/rungu/silver, \
		"Silver Sengese" = /obj/item/weapon/sword/scimitar/sengese/silver \
	)
	var/choice = spawned.select_equippable(player_client, selectable, message = "What is your weapon of choice?")
	if(!choice)
		return

	switch(choice)
		if("Silver Rungu")
			spawned.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		if("Silver Sengese")
			spawned.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)

	var/holder = spawned.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_cleric()
		devotion.grant_to(spawned)


/datum/outfit/adventurer_cleric/light_domain
	name = "Light Domain"
	head = /obj/item/clothing/head/helmet/ironpot/lakkariancap
	mask = null
	neck = /obj/item/clothing/neck/chaincoif/iron
	cloak = /obj/item/clothing/cloak/tabard/crusader
	armor = /obj/item/clothing/armor/gambeson/heavy/lakkarijupon
	shirt = /obj/item/clothing/shirt/undershirt/fancy
	wrists = null
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = null
	beltr = null
	ring = null
	l_hand = null
	r_hand = /obj/item/flashlight/flare/torch/prelit

	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1, /obj/item/reagent_containers/food/snacks/hardtack = 1)

/datum/outfit/adventurer_cleric/light_domain/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

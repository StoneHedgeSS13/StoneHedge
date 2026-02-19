/datum/job/advclass/combat/adventurer_warlock/the_hexblade
	title = "The Hexblade"
	tutorial = "You have made your pact with a mysterious entity from the Shadowfell - \
	a force that manifests in sentient magic weapons carved from the stuff of shadow."

	give_bank_account = TRUE
	outfit = /datum/outfit/adventurer_warlock/the_hexblade
	category_tags = list(CAT_ADVENTURER_WARLOCK)

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
		/datum/skill/misc/reading = 1,
		/datum/skill/magic/arcane = 1
	)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 1,
		STATKEY_END = 1,
		STATKEY_SPD = 1
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_STEELHEARTED,
	)

	spells = list(
		/datum/action/cooldown/spell/cone/staggered/eldritch_blast,
		/datum/action/cooldown/spell/status/guidance,
		/datum/action/cooldown/spell/essence/silence,
		/datum/action/cooldown/spell/essence/neutralize,
		/datum/action/cooldown/spell/status/infestation,
		/datum/action/cooldown/spell/mimicry,
		/datum/action/cooldown/spell/find_flaw,
		/datum/action/cooldown/spell/enchantment/green_flame,
		/datum/action/cooldown/spell/enrapture,
		/datum/action/cooldown/spell/forced_orgasm,
	)

// ------------------------------------------------------------

/datum/job/advclass/combat/adventurer_warlock/the_hexblade/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	var/boundweapons = list("Spear", "Rapier", "Arming Sword", "Longsword", "Greatsword", "Axe", "Greataxe", "Mace", "Flail", "Greatflail")
	var/boundweapon_choice = browser_input_list(spawned, "CHOOSE YOUR WEAPON.", "WHAT DID YOU BIND", boundweapons)

	switch(boundweapon_choice)
		if("Spear")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/conjure_spear)
			spawned.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		if("Rapier")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/conjure_rapier)
			spawned.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Arming Sword")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/conjure_armingsword)
			spawned.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Longsword")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/conjure_longsword)
			spawned.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Greatsword")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/conjure_greatsword)
			spawned.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Axe")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/conjure_axe)
			spawned.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Greataxe")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/conjure_greataxe)
			spawned.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Mace")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/conjure_mace)
			spawned.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Flail")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/conjure_flail)
			spawned.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		if("Greatflail")
			spawned.add_spell(/datum/action/cooldown/spell/undirected/conjure_item/conjure_greatflail)
			spawned.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)


// ------------------------------------------------------------

/datum/outfit/adventurer_warlock/the_hexblade
	name = "The Hexblade"
	head = /obj/item/clothing/head/roguehood/colored/black
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/half/shadowcloak
	armor = /obj/item/clothing/armor/medium/scale
	shirt = /obj/item/clothing/shirt/tunic/colored/black
	wrists = /obj/item/clothing/wrists/bracers/iron
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/armor/light
	backr = null
	backl = /obj/item/storage/backpack/satchel/black
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltr = /obj/item/reagent_containers/glass/bottle/manapot
	beltl = null
	beltr = null
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/poor = 1,
	)

/datum/outfit/adventurer_warlock/the_hexblade/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

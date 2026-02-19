/datum/job/advclass/combat/adventurer_bard/college_lore
	title = "College of Lore"
	tutorial = "You pursue beauty and truth, collecting knowledge from scholarly tomes to peasants' tales, \
	and use your gifts to hold both audiences and enemies spellbound."

	outfit = /datum/outfit/adventurer_bard/college_lore
	category_tags = list(CAT_ADVENTURER_BARD)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_PER = 1,
		STATKEY_SPD = 2,
		STATKEY_STR = -1
	)

	skills = list(
		/datum/skill/combat/knives = 1,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 2,
		/datum/skill/misc/riding = 3,
		/datum/skill/misc/sewing = 1,
		/datum/skill/misc/reading = 3,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/sneaking = 3,
		/datum/skill/misc/stealing = 1,
		/datum/skill/misc/lockpicking = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/music = 4,
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_BARDIC_TRAINING,
	)

	spells = list(
		/datum/action/cooldown/spell/vicious_mockery,
		/datum/action/cooldown/spell/bardic_inspiration,
	)

/datum/job/advclass/combat/adventurer_bard/college_lore/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.select_equippable(player_client, list(
		"Harp" = /obj/item/instrument/harp,
		"Lute" = /obj/item/instrument/lute,
		"Accordion" = /obj/item/instrument/accord,
		"Guitar" = /obj/item/instrument/guitar,
		"Flute" = /obj/item/instrument/flute,
		"Drum" = /obj/item/instrument/drum,
		"Hurdy-Gurdy" = /obj/item/instrument/hurdygurdy,
		"Viola" = /obj/item/instrument/viola
		),
		message = "Choose your instrument.",
		title = "BARD"
	)
	spawned.inspiration = new /datum/inspiration(spawned)

/datum/outfit/adventurer_bard/college_lore
	name = "College of Lore"
	head = /obj/item/clothing/head/bardhat
	mask = null
	neck = /obj/item/storage/belt/pouch/coins/poor
	cloak = /obj/item/clothing/cloak/raincloak/colored/blue
	armor = /obj/item/clothing/armor/leather/vest
	shirt = /obj/item/clothing/shirt/tunic/noblecoat
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = /obj/item/clothing/shoes/boots
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/storage/belt/pouch/coins/poor
	beltr = /obj/item/weapon/knife/dagger/steel/special
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/flint)
	scabbards = list(/obj/item/weapon/scabbard/knife)

/datum/outfit/adventurer_bard/college_lore/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)
	if(prob(30))
		gloves = /obj/item/clothing/gloves/fingerless

	cloak = /obj/item/clothing/cloak/raincloak/colored/blue
	if(prob(50))
		cloak = /obj/item/clothing/cloak/raincloak/colored/red

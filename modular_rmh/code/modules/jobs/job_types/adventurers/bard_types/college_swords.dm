/datum/job/advclass/combat/adventurer_bard/college_swords
	title = "College Of Swords"
	tutorial = "A highly trained and skilled warrior, you use your prowess with words and weapons to fight and entertain in equal measure."

	outfit = /datum/outfit/adventurer_bard/college_swords
	category_tags = list(CAT_ADVENTURER_BARD)
	give_bank_account = TRUE

	spells = list(
		/datum/action/cooldown/spell/vicious_mockery,
		/datum/action/cooldown/spell/bardic_inspiration,
	)

	jobstats = list(
		STATKEY_PER = 1,
		STATKEY_SPD = 2,
		STATKEY_END = -1
	)

	skills = list(
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/misc/music = 4,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/sewing = 2,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/climbing = 3,
		/datum/skill/craft/crafting = 1,
		/datum/skill/craft/cooking = 4,
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_BARDIC_TRAINING
	)

/datum/job/advclass/combat/adventurer_bard/college_swords/after_spawn(mob/living/carbon/human/spawned, client/player_client)
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

/datum/outfit/adventurer_bard/college_swords
	name = "College Of Swords"
	head = /obj/item/clothing/head/bardhat
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/cape
	armor = /obj/item/clothing/armor/leather/jacket
	shirt = /obj/item/clothing/shirt/tunic/noblecoat
	wrists = null
	gloves = /obj/item/clothing/gloves/fingerless
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = /obj/item/clothing/shoes/boots
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltr = /obj/item/weapon/knife/dagger/steel/special
	beltl = /obj/item/weapon/sword/rapier
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1)

/datum/outfit/adventurer_bard/college_swords/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	equipped_human.mana_pool?.set_intrinsic_recharge(MANA_ALL_LEYLINES)

/datum/outfit/adventurer_bard/college_swords/post_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	var/obj/item/clothing/cloak/cape/C = equipped_human.get_item_by_slot(ITEM_SLOT_CLOAK)
	if(C)
		C.color = CLOTHING_MUSTARD_YELLOW

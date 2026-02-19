/datum/job/advclass/combat/adventurer_rogue/royal_outcast
	title = "Royal Outcast"
	tutorial = "Once a member of the royal family, you were cast out by betrayal or misfortune. \
	You now walk in the shadows, your noble training shaping a deadly precision in knife, sword, and crossbow. \
	Will you reclaim your birthright, or craft a new destiny from the ashes?"

	outfit = /datum/outfit/adventurer_rogue/royal_outcast
	category_tags = list(CAT_ADVENTURER_ROGUE)
	give_bank_account = TRUE
	total_positions = 2

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_PER = 1,
		STATKEY_CON = 1,
		STATKEY_SPD = 2,
		STATKEY_LCK = 1
	)

	skills = list(
		/datum/skill/combat/axesmaces = 1,
		/datum/skill/combat/bows = 2,
		/datum/skill/combat/crossbows = 3,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/knives = 4,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 5,
		/datum/skill/misc/athletics = 4,
		/datum/skill/misc/sneaking = 4,
		/datum/skill/misc/stealing = 4,
		/datum/skill/misc/lockpicking = 4,
		/datum/skill/misc/riding = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/sewing = 1,
		/datum/skill/craft/crafting = 1,
		/datum/skill/labor/mathematics = 3
	)

	mind_traits = list(
		TRAIT_KNOW_KEEP_DOORS
	)
	traits = list(
		TRAIT_BEAUTIFUL,
		TRAIT_DODGEEXPERT,
		TRAIT_LIGHT_STEP,
		TRAIT_NOBLE,
	)

/datum/outfit/adventurer_rogue/royal_outcast
	name = "Royal Outcast"
	head = /obj/item/clothing/head/crown/circlet
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak
	armor = /obj/item/clothing/armor/leather/advanced
	shirt = null
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/trou/leather/advanced
	shoes = /obj/item/clothing/shoes/nobleboot
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltr = /obj/item/weapon/sword
	beltl = /obj/item/ammo_holder/quiver/bolts
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/reagent_containers/glass/cup/golden = 3,
		/obj/item/reagent_containers/glass/bottle/killersice = 1,
		/obj/item/weapon/knife/dagger/steel/special = 1,
		/obj/item/lockpickring/mundane = 1,
	)

/datum/outfit/adventurer_rogue/royal_outcast/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	if(equipped_human.gender == MALE)
		shirt = /obj/item/clothing/shirt/dress/royal/prince
	if(equipped_human.gender == FEMALE)
		shirt = /obj/item/clothing/shirt/dress/royal/princess

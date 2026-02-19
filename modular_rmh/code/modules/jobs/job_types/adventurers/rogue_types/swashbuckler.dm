/datum/job/advclass/combat/adventurer_rogue/swashbuckler
	title = "Swashbuckler"
	tutorial = "Woe the Bitch Queen! You awake, dazed from a true festivity of revelry and feasting. \
	The last thing you remember? Your mateys dumping you over the side of the boat as a joke. \
	Now on some Gods-forsaken rock, Umberlee will present you with booty and fun, no doubt."

	outfit = /datum/outfit/adventurer_rogue/swashbuckler
	category_tags = list(CAT_ADVENTURER_ROGUE)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/combat/swords = 4,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/labor/fishing = 3,
		/datum/skill/misc/swimming = 4,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/sneaking = 3,
		/datum/skill/misc/stealing = 3,
		/datum/skill/misc/sewing = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 1,
		/datum/skill/craft/traps = 2,
	)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_PER = 1,
		STATKEY_CON = 1,
		STATKEY_END = 3,
		STATKEY_SPD = 2,
	)

	traits = list(
		TRAIT_DODGEEXPERT,
	)

/datum/outfit/adventurer_rogue/swashbuckler
	name = "Swashbuckler"
	head = /obj/item/clothing/head/helmet/leather/headscarf
	mask = null
	neck = null
	cloak = null
	armor = /obj/item/clothing/armor/leather/jacket/sea
	shirt = null
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/tights/sailor
	shoes = /obj/item/clothing/shoes/boots
	backl = /obj/item/storage/backpack/satchel
	backr = /obj/item/fishingrod/fisher
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/weapon/sword/sabre/cutlass
	beltr = /obj/item/weapon/knife/dagger
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/natural/worms/leech = 2,
		/obj/item/storage/belt/pouch/coins/mid = 1
	)

/datum/outfit/folkhero/swashbuckler/pre_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()
	shirt = pick(/obj/item/clothing/shirt/undershirt/sailor, /obj/item/clothing/shirt/undershirt/sailor/red)

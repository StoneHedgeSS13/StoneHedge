/datum/job/advclass/combat/adventurer_rogue/corsair
	title = "Corsair"
	tutorial = "Once privateers sailing along the Sword Coast, \
	these mariners turned mercenaries use cutlasses and cunning to survive the seas and plunder the wealthy, \
	thriving where law and tide falter."

	outfit = /datum/outfit/adventurer_rogue/corsair
	category_tags = list(CAT_ADVENTURER_ROGUE)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_END = 2,
		STATKEY_SPD = 2

	)

	skills = list(
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/labor/fishing = 3,
		/datum/skill/misc/swimming = 4,
		/datum/skill/misc/climbing = 5,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/misc/lockpicking = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/reading = 1,
		/datum/skill/craft/cooking = 3
	)

	traits = list(
		TRAIT_DODGEEXPERT
	)

/datum/outfit/adventurer_rogue/corsair
	name = "Corsair"
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
	backr = /obj/item/fishingrod/fisher
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/weapon/sword/sabre/cutlass
	beltr = /obj/item/weapon/knife/dagger
	ring = null
	l_hand = null
	r_hand = null
	scabbards = list(/obj/item/weapon/scabbard/sword, /obj/item/weapon/scabbard/knife)

	backpack_contents = list(
		/obj/item/natural/worms/leech = 2,
		/obj/item/storage/belt/pouch/coins/mid = 1
	)

/datum/outfit/adventurer_rogue/corsair/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	shirt = pick(/obj/item/clothing/shirt/undershirt/sailor, /obj/item/clothing/shirt/undershirt/sailor/red)

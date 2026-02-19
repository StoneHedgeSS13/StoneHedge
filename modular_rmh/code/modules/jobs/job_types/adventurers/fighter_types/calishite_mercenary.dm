/datum/job/advclass/combat/adventurer_fighter/calishite_mercenary
	title = "Calishite Mercenary"
	tutorial = "A hardened sellsword from the deserts of Calimshan, you learned early that steel and nerve matter more than honor. \
	Whether guarding caravans out of Calimport or fighting in border wars along the Calim Desert, \
	you proved your worth in blood and coin."

	outfit = /datum/outfit/adventurer_fighter/calishite_mercenary
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 2,
		STATKEY_PER = 1
	)

	skills = list(
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/sneaking = 3,
		/datum/skill/misc/lockpicking = 1,
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/bows = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/polearms = 1,
		/datum/skill/combat/whipsflails = 1,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/combat/shields = 1,
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_HEAVYARMOR,
		TRAIT_DUALWIELDER
	)

/datum/outfit/adventurer_fighter/calishite_mercenary
	name = "Calishite Mercenary"
	name = "Sample Outfit"
	head = /obj/item/clothing/head/helmet/sallet/zalad
	mask = null
	neck = /obj/item/clothing/neck/keffiyeh/colored/red
	cloak = null
	armor = /obj/item/clothing/armor/brigandine/coatplates
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	wrists = null
	gloves = /obj/item/clothing/gloves/angle
	pants = /obj/item/clothing/pants/tights/colored/red
	shoes = /obj/item/clothing/shoes/shalal
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/shalal/adventurers_subclasses
	beltr = /obj/item/weapon/sword/long/rider
	beltl = /obj/item/flashlight/flare/torch/lantern
	ring = null
	l_hand = null
	r_hand = null

	scabbards = list(/obj/item/weapon/scabbard/sword)
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1)

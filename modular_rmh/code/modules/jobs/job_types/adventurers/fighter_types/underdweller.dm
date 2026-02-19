/datum/job/advclass/combat/adventurer_fighter/underdweller
	title = "Underdweller"
	tutorial = "A hardened mercenary of the Underdark, you have survived the tunnels beneath Faerûn where sunlight never reaches. \
	You take contracts others fear—clearing forgotten mines, guarding caravan routes below the world, \
	and fighting horrors that crawl in the dark."

	allowed_races = list(SPEC_ID_DWARF, SPEC_ID_DUERGAR, SPEC_ID_DROW, SPEC_ID_HALF_DROW, SPEC_ID_GNOME, SPEC_ID_GNOME_D, SPEC_ID_KOBOLD)

	outfit = /datum/outfit/adventurer_fighter/underdweller
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE

	jobstats = list(
		STATKEY_LCK = 1,
		STATKEY_END = 2,
		STATKEY_STR = 1,
		STATKEY_INT = 1
	)

	skills = list(
		/datum/skill/labor/mining = 3,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/knives = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/craft/engineering = 1,
		/datum/skill/misc/lockpicking = 2,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/medicine = 1,
		/datum/skill/misc/sewing = 1,
		/datum/skill/misc/athletics = 3
	)

	traits = list(
		TRAIT_MEDIUMARMOR
	)

/datum/job/advclass/combat/adventurer_fighter/underdweller/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()

	// Species-specific adjustments
	if(spawned.dna?.species?.id == SPEC_ID_DWARF)
		// Dwarf-specific skill adjustments
		spawned.adjust_skillrank(/datum/skill/combat/axesmaces, 3)
		spawned.adjust_skillrank(/datum/skill/combat/shields, 2)
		spawned.adjust_skillrank(/datum/skill/craft/bombs, 4) // Dwarves get to make bombs.
	else
		// Non-dwarf skill adjustment
		spawned.adjust_skillrank(/datum/skill/combat/swords, 3)

/datum/outfit/adventurer_fighter/underdweller
	name = "Underdweller"
	head = null
	mask = null
	neck = /obj/item/clothing/neck/chaincoif/iron
	cloak = null
	armor = /obj/item/clothing/armor/cuirass/iron
	shirt = null
	wrists = null
	gloves = null
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/armor/light
	backr = null
	backl = /obj/item/storage/backpack/backpack
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = null
	beltr = /obj/item/weapon/knife/hunting
	ring = null
	l_hand = null
	r_hand = null

	scabbards = list(/obj/item/weapon/scabbard/knife)
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1)

/datum/outfit/adventurer_fighter/underdweller/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	var/shirt_type = pickweight(list(
		/obj/item/clothing/armor/chainmail/iron = 1, // iron maille
		/obj/item/clothing/armor/gambeson = 4, // gambeson
		/obj/item/clothing/armor/gambeson/light = 4, // light gambeson
		/obj/item/clothing/shirt/undershirt/sailor/red = 1 // sailor shirt
	))
	shirt = shirt_type

	// Species-specific equipment (visual equipment)
	if(equipped_human.dna?.species?.id == SPEC_ID_DWARF)
		head = /obj/item/clothing/head/helmet/leather/minershelm
		backr = /obj/item/weapon/shield/wood
		beltl = /obj/item/weapon/axe/paxe // Dorfs get a pick as their primary weapon and axes/maces to use it
	else
		// No miner's helm for Delves or kobolds as they have nitevision now.
		head = /obj/item/clothing/head/helmet/leather // similar to the miner helm, except not as cool of course
		beltl = /obj/item/weapon/sword/sabre // Dark elves get a sabre as their primary weapon and swords skill, who woulda thought

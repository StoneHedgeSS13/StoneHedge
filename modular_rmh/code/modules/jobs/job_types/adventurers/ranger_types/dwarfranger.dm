/datum/job/advclass/combat/adventurer_ranger/dwarf_ranger
	title = "Dwarf Ranger"
	tutorial = "Dwarven rangers are scouts, hunters, and wardens of the wild marches beyond the clanholds. \
	They patrol mountain passes, track beasts that threaten trade routes, and map safe paths through untamed lands."

	allowed_races = list(SPEC_ID_DWARF, SPEC_ID_DUERGAR)
	outfit = /datum/outfit/adventurer_ranger/dwarf_ranger
	category_tags = list(CAT_ADVENTURER_RANGER)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/combat/swords = 3, // In line with basic combat classes
		/datum/skill/combat/wrestling = 1,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/craft/crafting = 2,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/climbing = 3,
		/datum/skill/combat/crossbows = 3,
		/datum/skill/craft/tanning = 2,
		/datum/skill/misc/sewing = 3,
		/datum/skill/misc/medicine = 2,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/reading = 2,
	)

	jobstats = list(
		STATKEY_PER = 3,
		STATKEY_SPD = 1, // Fast... for a dwarf
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
	)

/datum/outfit/adventurer_ranger/dwarf_ranger
	name = "Dwarf Ranger (Adventurer)"
	head = /obj/item/clothing/head/roguehood/colored/uncolored
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak/colored/brown
	armor = /obj/item/clothing/armor/chainmail/iron
	shirt = /obj/item/clothing/shirt/undershirt/colored/random
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = null
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltl = /obj/item/ammo_holder/quiver/bolts
	beltr = /obj/item/flashlight/flare/torch/lantern
	ring = null
	l_hand = null
	r_hand = /obj/item/weapon/sword/scimitar/falchion

	backpack_contents = list(
		/obj/item/bait = 1,
	)

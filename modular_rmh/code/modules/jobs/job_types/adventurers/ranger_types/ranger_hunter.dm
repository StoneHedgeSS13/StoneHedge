/datum/job/advclass/combat/adventurer_ranger/ranger_hunter
	title = "Ranger Hunter"
	tutorial = "You seek the most dangerous prey in Faerûn, from ancient dragons to massive hordes of undead, and excel at slaying them all."

	outfit = /datum/outfit/adventurer_ranger/ranger_hunter
	category_tags = list(CAT_ADVENTURER_RANGER)
	give_bank_account = TRUE

	skills = list(
		/datum/skill/combat/knives = 3,
		/datum/skill/combat/bows = 3,
		/datum/skill/craft/tanning = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/combat/wrestling = 1,
		/datum/skill/craft/crafting = 2,
		/datum/skill/misc/swimming = 3,
		/datum/skill/misc/climbing = 4,
		/datum/skill/labor/taming = 2,
		/datum/skill/misc/sewing = 3,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/craft/traps = 1,
		/datum/skill/misc/athletics = 2,
		/datum/skill/misc/medicine = 2,
		/datum/skill/craft/cooking = 1,
		/datum/skill/misc/reading = 1,
	)

	jobstats = list(
		STATKEY_END = 1,
		STATKEY_PER = 3,
		STATKEY_SPD = 3
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_SEEDKNOW,
		TRAIT_FORAGER,
		TRAIT_DEADNOSE,
		TRAIT_BESTIALSENSE,
	)

/datum/outfit/adventurer_ranger/ranger_hunter
	name = "Ranger Hunter"
	head = null
	mask = null
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak/colored/green
	armor = /obj/item/clothing/armor/leather/hide
	shirt = /obj/item/clothing/shirt/undershirt
	wrists = /obj/item/clothing/wrists/bracers/leather
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/long
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltr = /obj/item/flashlight/flare/torch/lantern
	beltl = /obj/item/ammo_holder/quiver/arrows
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/bait = 1,
		/obj/item/weapon/knife/hunting = 1,
	)

/datum/job/advclass/combat/adventurer_ranger/ranger_hunter/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.update_sight()

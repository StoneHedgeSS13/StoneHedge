/datum/job/advclass/combat/adventurer_monk/shadow
	title = "Shadow"
	tutorial = "You value the arts of stealth and subterfuge, bending the shadows to your will to strike without warning."

	category_tags = list(CAT_ADVENTURER_MONK)
	give_bank_account = TRUE
	outfit = /datum/outfit/adventurer_monk/shadow

	jobstats = list(
		STATKEY_END = 1,
		STATKEY_SPD = 2, //they're basically ninjas.
		STATKEY_STR = 1, //because they're mainly supposed to use blunt weapons.
		STATKET_INT = -1,
		STATKEY_PER = -1,
	)

	skills = list(
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 4,
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/sneaking = 3,
		/datum/skill/misc/climbing = 5,
		/datum/skill/misc/swimming = 1,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/sewing = 1,
		/datum/skill/misc/reading = 1,
		/datum/skill/labor/mathematics = 1,
		/datum/skill/misc/lockpicking = 2, //these guys free slaves, they probably know how to disarm traps and unlock things
		/datum/skill/misc/stealing = 2,
		/datum/skill/craft/crafting = 1,
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_MEDIUMARMOR, // so they can dodge wearing their mask, these guys dont actually spawn with medium armor, they have to EARN it.

	)

/datum/outfit/adventurer_monk/shadow
	name = "Shadow"
	head = /obj/item/clothing/head/helmet/leather/headscarf/colored/red
	mask = /obj/item/clothing/face/shellmask
	neck = /obj/item/clothing/neck/coif/cloth/colored/berryblue
	cloak = /obj/item/clothing/shirt/undershirt/sash/colored/white
	armor = /obj/item/clothing/shirt/clothvest/colored/red
	shirt = /obj/item/clothing/armor/gambeson/heavy/colored/dark
	wrists = /obj/item/clothing/wrists/gem/shellbracelet
	gloves = /obj/item/clothing/gloves/angle
	pants = /obj/item/clothing/pants/trou/shadowpants
	shoes = /obj/item/clothing/shoes/boots
	backr = null
	backl = null
	belt = /obj/item/storage/belt/leather/plaquesilver/adventurers_subclasses
	beltr = /obj/item/weapon/mace/rungu
	beltl = /obj/item/storage/belt/pouch //broke as hell!
	ring = null
	l_hand = null
	r_hand = null

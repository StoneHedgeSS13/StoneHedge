/datum/job/advclass/combat/adventurer_fighter/winged_rescuer
	title = "Winged Rescuer"
	tutorial = "You've seen countless battles and earned your fair share of riches from them. \
	Flying above the battlefield, you seek those who are injured and come to their aid, for a price."

	allowed_races = list(SPEC_ID_HARPY)
	outfit = /datum/outfit/adventurer_fighter/winged_rescuer
	category_tags = list(CAT_ADVENTURER_FIGHTER)
	give_bank_account = TRUE


	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_SPD = 3
	)

	skills = list(
		/datum/skill/combat/bows = 2,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/sewing = 2,
		/datum/skill/combat/unarmed = 2,
		/datum/skill/craft/tanning = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/climbing = 1,
		/datum/skill/misc/reading = 1,
		/datum/skill/misc/athletics = 3,
		/datum/skill/craft/alchemy = 3,
	)

	traits = list(
		TRAIT_DEADNOSE,
		TRAIT_STEELHEARTED
	)

/datum/outfit/adventurer_fighter/winged_rescuer
	name = "Winged Rescuer"
	head = /obj/item/clothing/head/roguehood/colored/red
	mask = /obj/item/clothing/face/shepherd/rag
	neck = null
	cloak = /obj/item/clothing/cloak/raincloak/colored/red
	armor = /obj/item/clothing/armor/leather
	shirt = /obj/item/clothing/armor/gambeson/light
	wrists = null
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	backr = null
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/adventurers_subclasses
	beltr = /obj/item/weapon/sword
	beltl = /obj/item/reagent_containers/glass/bottle/stronghealthpot
	ring = null
	l_hand = null
	r_hand = null

	backpack_contents = list(
		/obj/item/storage/belt/pouch/coins/mid = 1,
		/obj/item/reagent_containers/glass/bottle/healthpot = 3,
		/obj/item/weapon/knife/hunting = 1
	)

/datum/advclass/gambler
	name = "Gambler"
	tutorial = "You are a gambler. Everyone in your life has given up on you, and the stress of losing it all over and over has taken its toll on your body. All you have left to your name are some cards, dice and whatever is in this bottle. At least you're still in Baotha's good graces, whether you reciprocate such feelings or not..."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/gambler
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/gambler
	allowed_patrons = list(/datum/patron/inhumen/sacrifice, /datum/patron/divine/onder)

/datum/outfit/job/roguetown/adventurer/gambler/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		armor = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		backl = /obj/item/storage/backpack/rogue/satchel
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/clothing/mask/cigarette/rollie/cannabis
		beltl = /obj/item/flint
		backpack_contents = list(/obj/item/storage/pill_bottle/dice = 1, /obj/item/toy/cards/deck = 1, /obj/item/reagent_containers/glass/bottle/rogue/wine = 1)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE) //Climbing into windows to steal drugs or booze.
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 1, TRUE) //Breaking into the houses of anyone who ever loved them.
		H.change_stat("intelligence", -2)
		H.change_stat("constitution", 1)
		H.change_stat("strength", 1)
		H.change_stat("fortune", 2)
		if(H.patron.type == /datum/patron/divine/onder)
			ADD_TRAIT(H, TRAIT_CRACKHEAD, TRAIT_GENERIC)

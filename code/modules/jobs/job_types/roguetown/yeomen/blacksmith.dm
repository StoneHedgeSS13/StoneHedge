/datum/job/roguetown/blacksmith
	title = "Blacksmith"
	flag = BLACKSMITH
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_ALL_KINDSPLUS

	tutorial = "You've studied for many decades under quite a number of master smiths. Whether it's cookware or tools of war, you're unmatched at the art of bending metal to your will."

	outfit = /datum/outfit/job/roguetown/blacksmith
	display_order = JDO_BLACKSMITH
	give_bank_account = 400
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/blacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/hatfur
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE) //its hammer time
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 2, TRUE)
	if(H.pronouns == SHE_HER)
		pants = /obj/item/clothing/under/roguetown/trou
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		cloak = /obj/item/clothing/cloak/apron/blacksmith
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/roguekey/blacksmith
	else
		pants = /obj/item/clothing/under/roguetown/trou
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/roguekey/blacksmith
		cloak = /obj/item/clothing/cloak/apron/blacksmith

	H.change_stat("strength", 3)
	H.change_stat("intelligence", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)

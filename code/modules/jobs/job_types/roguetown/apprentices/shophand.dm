/datum/job/roguetown/shophand
	title = "Shophand"
	flag = SHOPHAND
	department_flag = APPRENTICES
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_ALL_KINDSPLUS
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)

	tutorial = "You are part of the most prestigious merchant guild, and have been granted the honor of serving one of the revered merchant princes. If you work diligently enough, perhaps one day they'll teach you how to make royalty of you yet."

	outfit = /datum/outfit/job/roguetown/shophand
	display_order = JDO_SHOPHAND
	give_bank_account = TRUE
	min_pq = -10
	max_pq = null

	cmode_music = 'sound/music/combat2.ogg'

/datum/outfit/job/roguetown/shophand/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, "[type]")
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltl = /obj/item/storage/keyring/merchant
		backr = /obj/item/storage/backpack/rogue/satchel
	if(H.gender == FEMALE)
		pants = /obj/item/clothing/under/roguetown/tights/stockings/random
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/blue
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltl = /obj/item/storage/keyring/merchant
		backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, rand(1,2), TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, rand(1,2), TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, rand(1,2), TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/mathematics, rand(2,3), TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, rand(1,2), TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
		H.change_stat("fortune", 2)

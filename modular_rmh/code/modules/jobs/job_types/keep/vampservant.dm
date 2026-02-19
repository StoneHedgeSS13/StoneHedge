/datum/job/roguetown/vampire/vampservant
	title = "Vampire Servant"
	flag = VAMPSERVANT
	department_flag = VAMPIRE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	//antag_job = TRUE
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	show_in_credits = FALSE		//Stops Scom from announcing their arrival.
	tutorial = "You don't really remember how you got here, but your present reality is grim: you serve the Vampire Lord and his underlings; not much better than cattle. Follow their oders, and don't draw anyone's ire."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/vampservant
	display_order = JDO_VAMPSERVANT
	//min_pq = 5
	max_pq = null

/datum/outfit/job/roguetown/vampservant/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		pants = /obj/item/clothing/pants/tights/colored/black
		shirt = /obj/item/clothing/shirt/undershirt
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		backl = /obj/item/storage/backpack/satchel
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/keyring/servant
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		armor = /obj/item/clothing/armor/leather/vest/black
	else
		head = /obj/item/clothing/head/armingcap
		armor = /obj/item/clothing/shirt/dress/gen/black
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		pants = pick(/obj/item/clothing/pants/tights/colored/black, /obj/item/clothing/pants/tights)
		cloak = /obj/item/clothing/cloak/apron/waist
		backl = /obj/item/storage/backpack/satchel
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/keyring/servant
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	if(H.age == AGE_MIDDLEAGED)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.change_stat("speed", 1)
	H.change_stat("intelligence", 1)
	H.change_stat("perception", 2)
	ADD_TRAIT(H, TRAIT_CICERONE, TRAIT_GENERIC)

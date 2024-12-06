/datum/advclass/woodcutter
	name = "Woodcutter"
	tutorial = "You are a strong Lumberjack, armed with an axe, you can gather wood \
	either for yourself, or for others. You are a novice carpenter too, so you can bend wood into some items you need, and chop it efficiently."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/woodcutter
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/woodcutter/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 5, TRUE) // AXE MEN! GIVE ME SPLINTERS!
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/lumberjacking, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 2, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	head = /obj/item/clothing/head/roguetown/roguehood
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltr = /obj/item/rogueweapon/stoneaxe/woodcut
	beltl = /obj/item/rogueweapon/huntingknife
	backpack_contents = list(/obj/item/flint = 1)
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen
	if(H.gender == MALE)
		armor = /obj/item/clothing/suit/roguetown/armor/workervest
		pants = /obj/item/clothing/under/roguetown/trou
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	H.change_stat("strength", 3)
	H.change_stat("constitution", 1)
	H.change_stat("perception", 1)

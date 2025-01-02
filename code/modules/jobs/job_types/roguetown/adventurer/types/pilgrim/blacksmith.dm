/datum/advclass/blacksmith
	name = "Blacksmith"
	tutorial = "A skilled blacksmith, able to forge capable weapons for warriors; \
	only after building a forge for themselves of course."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/blacksmith

	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/blacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather

	beltr = /obj/item/rogueweapon/hammer
	beltl = /obj/item/rogueweapon/tongs

	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/roguetown/leather
	cloak = /obj/item/clothing/cloak/apron/blacksmith
	mouth = /obj/item/rogueweapon/huntingknife
	pants = /obj/item/clothing/under/roguetown/trou

	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/flint = 1, /obj/item/rogueore/coal=1, /obj/item/rogueore/iron=1)

	if(H.gender == MALE)

		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	else

		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE) //hammer time
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE) // okish fists now(used to be four when the last note was written lmao)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 4, TRUE)//Foxen was here. UwU
		H.change_stat("strength", 3)
		H.change_stat("endurance", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("constitution", 2)
		H.change_stat("speed", -1)
		H.change_stat("fortune", 1)

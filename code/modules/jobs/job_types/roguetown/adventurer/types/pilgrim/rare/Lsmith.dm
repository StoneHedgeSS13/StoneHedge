//dwarf master smith

/datum/advclass/masterblacksmith
	name = "Master Blacksmith"
	tutorial = "A master blacksmith, able to forge steel like dough, and gold like clay. \
	create masterful weapons and armor, be a legend among those who interest in your mighty forge"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/masterblacksmith

	maximum_possible_slots = 1
	pickprob = 5

	category_tags = list(CTAG_DISABLED)

/datum/outfit/job/roguetown/adventurer/masterblacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/hammer
	beltl = /obj/item/rogueweapon/tongs
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	mouth = /obj/item/rogueweapon/huntingknife

	gloves = /obj/item/clothing/gloves/roguetown/leather
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	pants = /obj/item/clothing/under/roguetown/trou
	cloak = /obj/item/clothing/cloak/apron/blacksmith

	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(/obj/item/flint = 1, /obj/item/rogueore/coal=2, /obj/item/rogueore/iron=2, /obj/item/rogueore/silver=1)

	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	if(H.age == AGE_OLD)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)		//Legendary
		H.mind.adjust_skillrank(/datum/skill/craft/smelting, 1, TRUE)			//Legendary
	H.change_stat("strength", 2)
	H.change_stat("speed", -1)
	H.change_stat("fortune", 2)

	if(H.gender == MALE)	//Male clothing stuff
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	else					//Female clothing stuff
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		shoes = /obj/item/clothing/shoes/roguetown/shortboots

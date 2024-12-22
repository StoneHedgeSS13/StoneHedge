/datum/advclass/cheesemaker
	name = "Cheesemaker"
	tutorial = "Cheese cheese cheese! You have a rare wheel of cheese and know how to make more of the rare delicacy \
	As very skilled cook you come with some ingredients to make food and feed the masses. \
	cook up some quisine with food gathered from the local flora and fauna."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/cheesemaker

	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/cheesemaker/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	mouth = /obj/item/rogueweapon/huntingknife
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/tights/random
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	cloak = /obj/item/clothing/cloak/apron
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backl = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltr = /obj/item/cooking/pan
	beltl = /obj/item/flint
	backpack_contents = list(/obj/item/reagent_containers/powder/salt = 1,/obj/item/reagent_containers/food/snacks/rogue/cheese=1,/obj/item/reagent_containers/food/snacks/rogue/cheddar=1)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 4) // Cheese diet.

/datum/advclass/cheesemaker/boost_by_plus_power(plus_factor, mob/living/carbon/human/H)
	// ha ha yeah, fuck you cheesemaker playin retards!
	return


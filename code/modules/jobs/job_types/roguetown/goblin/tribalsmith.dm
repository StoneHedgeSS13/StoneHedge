/datum/job/roguetown/tribalsmith
	title = "Tribal Smith"
	flag = TRIBALSMITH
	department_flag = TRIBAL
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	tutorial = "Tribal smith responsible for forging weapons, armor, and tools for the tribe."
	display_order = JDO_TRIBALSMITH
	outfit = /datum/outfit/job/roguetown/tribalsmith
	min_pq = 0
	max_pq = null
	cmode_music = 'sound/music/combat_gronn.ogg'

/datum/outfit/job/roguetown/tribalsmith/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list(
		"Weaponsmith", //Weapons
		"Armorsmith", //Armor
		)

	var/classchoice = input("Choose your specialization", "Available styles") as anything in classes


	switch(classchoice)

		if("Weaponsmith")
			H.set_blindness(0)
			ADD_TRAIT(H, TRAIT_WEAPONSMITH, TRAIT_GENERIC)

		if("Armorsmith")
			H.set_blindness(0)
			ADD_TRAIT(H, TRAIT_ARMORSMITH, TRAIT_GENERIC)

	shirt = /obj/item/clothing/suit/roguetown/shirt/tribalrag
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/psicross/talisman
	cloak = /obj/item/clothing/cloak/apron/blacksmith
	backl = /obj/item/storage/backpack/rogue/satchel
	shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
	backpack_contents = list(/obj/item/roguekey/tribe = 1)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NASTY_EATER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ARTIFICER, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 4, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -2)

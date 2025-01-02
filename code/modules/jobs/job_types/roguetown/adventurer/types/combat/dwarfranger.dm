/datum/advclass/dranger
	name = "Dwarven Ranger"
	tutorial = "Dwarfish rangers specialize in hunting with their trusty Arquebus, \
	living outside of society on mountaintops and caverns below. They explore the far corners of the creation. They \
	protect dwarfish settlements from wild beasts, selling their notes to the cartographers."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(/datum/species/dwarf/mountain)
	outfit = /datum/outfit/job/roguetown/adventurer/dranger
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_PERFECT_TRACKER)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/dranger/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	belt = /obj/item/storage/belt/rogue/leather
	backr = /obj/item/gun/ballistic/arquebus
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/stoneaxe/woodcut
	beltl = /obj/item/ammopouch/bullets
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1, /obj/item/powderflask =1,)
	if(prob(23))
		shoes = /obj/item/clothing/shoes/roguetown/boots
	if(prob(23))
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	cloak = /obj/item/clothing/cloak/raincloak/brown
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 4, TRUE) //THIS IS MAH BOOMSTICK!!
	H.change_stat("perception", 3) // Copied some stats from Ranger
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

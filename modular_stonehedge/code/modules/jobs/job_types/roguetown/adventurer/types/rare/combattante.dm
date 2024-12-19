/datum/advclass/combattante
	name = "Combattante" // Yeah, They're Duellist, not duelist, I don't know.
	tutorial = "Originating in Grenzelhoft but now known across the world, the Duellists from the Combattante Association handle duels in almost any capacity. Mostly observing for their own records, Combattantes also train others, or duel on people's behalf for pay. Other work sometimes comes to them, but it is not their speciality."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/roguetown/adventurer/combattante
	category_tags = list(CTAG_ADVENTURER)
	maximum_possible_slots = 2
	pickprob = 25

/datum/outfit/job/roguetown/adventurer/combattante/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 5, TRUE) //One-trick, rely mostly on their rapier.
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE) //All Mercs get this, why though?
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)	//All Mercs get this, why though?
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)	//All Mercs get this, why though?
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 2)
		H.change_stat("perception", 2)
		H.change_stat("speed", 3)
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/rogueweapon/sword/rapier/combattante
	backl = /obj/item/storage/backpack/rogue/satchel
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	head = /obj/item/clothing/head/roguetown/paddedcap/combattante
	armor = /obj/item/clothing/suit/roguetown/armor/combattante
	pants = /obj/item/clothing/under/roguetown/trou/leather/advanced/combattante
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot/combattante
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	cloak = /obj/item/clothing/cloak/combattante

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/parrying, /obj/item/storage/belt/rogue/pouch/coins/poor)

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)

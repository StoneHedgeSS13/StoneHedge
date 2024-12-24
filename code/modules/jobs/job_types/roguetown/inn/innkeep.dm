/datum/job/roguetown/barkeep
	title = "Innkeep"
	flag = INNKEEP
	department_flag = SYLVERDRAGONNE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_ALL_KINDSPLUS

	tutorial = "Likely an Ex-Adventurer wise enough to stop by the edge, settling down... Liquor Lodging and Lavish Baths, you are the life of the party and a rich bastard because of it. These days, you help the younger ones who get lost, or need some direction - between managing this establishment with the help of the other tavern-denizens such as the courtesans. Your room is directly above the bar, where you've left your armor and some gear you grew  fond of."
	outfit = /datum/outfit/job/roguetown/innkeep
	display_order = JDO_INNKEEP
	give_bank_account = 500
	min_pq = 5
	max_pq = null

/datum/outfit/job/roguetown/innkeep/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 6, TRUE) //these stats reflect that the tavernkeeper is a retired adventurer who can use that big ass sword displayed there normally.
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
		if(isseelie(H))
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strip)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)
	ADD_TRAIT(H, TRAIT_USEMAGIC, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DRUNK_HEALING, TRAIT_GENERIC)
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	backr = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/storage/keyring/innkeep
	id = /obj/item/scomstone
	if(H.gender == MALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		pants = /obj/item/clothing/under/roguetown/trou
		belt = /obj/item/storage/belt/rogue/leather
		cloak = /obj/item/clothing/cloak/apron/waist
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress
		belt = /obj/item/storage/belt/rogue/leather/rope
	H.change_stat("intelligence", 2)
	H.change_stat("strength", 3)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)

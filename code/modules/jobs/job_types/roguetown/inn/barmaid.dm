/datum/job/roguetown/barmaid
	title = "Barman"
	f_title = "Barmaid"
	flag = BARMAID
	department_flag = SYLVERDRAGONNE
	faction = "Station"
	total_positions = 3
	spawn_positions = 3

	allowed_races = RACES_ALL_KINDSPLUS

	tutorial = "You serve drinks and keep the inn running smoothly under the watchful eye of the Innkeep. While not as experienced as your boss, you've picked up a few tricks of the trade and know how to handle rowdy customers."
	outfit = /datum/outfit/job/roguetown/barmaid
	display_order = JDO_BARMAID
	give_bank_account = 200
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/barmaid/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
		if(isseelie(H))
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)

	ADD_TRAIT(H, TRAIT_DRUNK_HEALING, TRAIT_GENERIC)
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	neck = /obj/item/storage/belt/rogue/pouch/coins
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/scomstone

	if(H.gender == MALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		pants = /obj/item/clothing/under/roguetown/trou
		belt = /obj/item/storage/belt/rogue/leather
		cloak = /obj/item/clothing/cloak/apron/waist
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress
		belt = /obj/item/storage/belt/rogue/leather/rope

	H.change_stat("intelligence", 1)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)

/datum/job/roguetown/tailor
	title = "Tailor"
	flag = TAILOR
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_ALL_KINDSPLUS

	tutorial = "For years, you've honed your craft in the quiet hum of sewing rooms and bustling marketplaces. From mending humble garments to creating luxurious attire fit for royalty, your hands have become unmatched in the art of needle and thread."

	outfit = /datum/outfit/job/roguetown/tailor
	display_order = JDO_TAILOR
	give_bank_account = 300
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/tailor/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 4, TRUE)
		H.change_stat("intelligence", 2)
		H.change_stat("speed", 2)
		H.change_stat("perception", 3)
		if(isseelie(H))
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strip)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)
		neck = /obj/item/storage/belt/rogue/pouch/coins/rich
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		beltr = /obj/item/rogueweapon/huntingknife/scissors
		beltl = /obj/item/roguekey/tailor
		backl = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/natural/cloth = 2, /obj/item/natural/bundle/fibers/full = 1)
		id = /obj/item/scomstone
		ADD_TRAIT(H, TRAIT_TAILOR, TRAIT_GENERIC)
		if(H.pronouns == SHE_HER)
			armor = /obj/item/clothing/suit/roguetown/armor/armordress
			shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
			pants = /obj/item/clothing/under/roguetown/tights/random
			cloak = /obj/item/clothing/cloak/raincloak/furcloak
			belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		else
			armor = /obj/item/clothing/suit/roguetown/shirt/rags
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
			pants = /obj/item/clothing/under/roguetown/trou
			cloak = /obj/item/clothing/cloak/apron/waist/brown
			belt = /obj/item/storage/belt/rogue/leather

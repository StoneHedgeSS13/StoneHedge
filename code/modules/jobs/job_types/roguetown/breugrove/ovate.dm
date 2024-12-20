/datum/job/roguetown/ovate
	title = "Ovate"
	flag = OVATE
	department_flag = GROVE
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	selection_color = JCOLOR_GROVE
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = list(AGE_ADULT)
	tutorial = "As an Ovate of the Breuddwyd Grove, you are an apprentice studying both the druidic arts and martial disciplines. Under the guidance of both Druids and Hedge Knights, you learn to balance the sacred wisdom of nature with the practical needs of maintaining order. Your duties include assisting in rituals, learning herb-lore, practicing basic combat techniques, and helping patrol the town's quieter districts. While you don't yet possess the full powers of either a Druid or Hedge Knight, you represent the future of the Grove's traditions."
	display_order = JDO_OVATE
	selection_color = JCOLOR_GROVE
	outfit = /datum/outfit/job/roguetown/ovate
	give_bank_account = 200
	min_pq = 0
	max_pq = null

	spells = list(/obj/effect/proc_holder/spell/targeted/shapeshift)

/datum/outfit/job/roguetown/ovate
	name = "Ovate"
	jobtype = /datum/job/roguetown/ovate
	allowed_patrons = list(/datum/patron/divine/sylvarn)

/datum/outfit/job/roguetown/ovate/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	cloak = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	neck = /obj/item/clothing/neck/roguetown/psicross/dendor
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	shoes = /obj/item/clothing/shoes/roguetown/ridingboots
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/rogueweapon/sickle
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/minorhealthpot = 1,
		/obj/item/roguekey/grove = 1,
	)
	if(H.mind)
		assign_skills(H)
	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/outfit/job/roguetown/ovate/proc/assign_skills(mob/living/carbon/human/H)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
	H.change_stat("intelligence", 2)
	H.change_stat("endurance", 1)
	H.change_stat("perception", 1)

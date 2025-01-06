/datum/job/roguetown/hedgewarden
	title = "Hedge Warden"
	flag = HEDGEWARDEN
	department_flag = GROVE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_patrons = ALL_DIVINE_PATRONS
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "You are the leader of the Grove's Hedgeguard, combining the martial prowess of a warrior with the authority of a peacekeeper. While the Druids handle matters of nature and ritual, you and your Hedge Knights are the Grove's strong arm of justice - patrolling the forests and the Town's streets alike to maintain order. Your experience has earned you the respect of both the Grove's circle and the townsfolk, making you particularly effective at handling threats that would disturb both natural and civil law."
	display_order = JDO_HEDGEWARDEN
	selection_color = JCOLOR_GROVE

	outfit = /datum/outfit/job/roguetown/hedgewarden

	give_bank_account = 600
	min_pq = 15
	max_pq = null
	cmode_music = 'sound/music/combat_bog.ogg'

/datum/job/roguetown/hedgewarden/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/templar/dendor))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "Breuddwyd Grove Tabard ([index])"

/datum/outfit/job/roguetown/hedgewarden/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet/elfbarbutewings
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/templar/dendor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	neck = /obj/item/clothing/neck/roguetown/psicross/dendor/grove
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/chain
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather
	beltl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/mace/cudgel/thornlash
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/quiver/Parrows
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/signal_horn = 1, /obj/item/roguekey/grove = 1)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)

		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)

		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)

		H.change_stat("constitution", 5)
		H.change_stat("perception", 4)
		H.change_stat("endurance", 5)
		H.change_stat("speed", 3)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_VINE_WALKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_WILD_EATER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BLINDFIGHTING, TRAIT_GENERIC)

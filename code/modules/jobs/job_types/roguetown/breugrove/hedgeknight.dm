/datum/job/roguetown/hedgeknight
	title = "Hedge Knight"
	flag = HEDGEKNIGHT
	department_flag = GROVE
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	selection_color = JCOLOR_GROVE
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "You serve as a martial part of the Grove's Hedgeguard, patrolling the streets of the Town under the Breuddwyd Grove's authority. While your order began as forest rangers devoted to Sylvarn, the Hedge Knights now focus on keeping the peace within the town walls. Armed with stunmace and longbow, you enforce the Five Laws against troublemakers - whether they're rowdy adventurers, local miscreants, or dangerous creatures. Your tabard marks you as an officer of the Grove's justice. Remember: you're trusted to protect the townspeople and maintain order, so don't abuse your authority or abandon your post."
	display_order = JDO_HEDGEKNIGHT
	selection_color = JCOLOR_GROVE

	outfit = /datum/outfit/job/roguetown/hedgeknight

	give_bank_account = 400
	min_pq = 10
	max_pq = null
	cmode_music = 'sound/music/combat_bog.ogg'

/datum/job/roguetown/hedgeknight/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
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

/datum/outfit/job/roguetown/hedgeknight/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet/elfbarbutewings/Hedgeguard
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/foresterarmor
	cloak = /obj/item/clothing/cloak/templar/dendor
	neck = /obj/item/clothing/neck/roguetown/psicross/dendor/grove
	gloves = /obj/item/clothing/gloves/roguetown/forestergauntlets
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shoes = /obj/item/clothing/shoes/roguetown/boots/forestershoes
	beltl = /obj/item/quiver/arrows
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/mace/cudgel/thornlash
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1, /obj/item/signal_horn = 1, /obj/item/roguekey/grove = 1,)

	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)

		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)

		H.change_stat("constitution", 4)
		H.change_stat("perception", 3)
		H.change_stat("endurance", 4)
		H.change_stat("speed", 2)

	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_VINE_WALKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_WILD_EATER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BLINDFIGHTING, TRAIT_GENERIC)

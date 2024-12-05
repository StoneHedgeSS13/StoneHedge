/datum/job/roguetown/bogguardsman
	title = "Hedge Knight"
	flag = BOGGUARD
	department_flag = GARRISON
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	selection_color = JCOLOR_SOLDIER
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "The origins of your order are as ancient as the land upon which Stonehedge is built. The first Hedge Knights were rangers, once devoted to Sylvarn but finding that the wilderness was often harsh and lacking for justice. Hedge Knights these days are employed by the Adventurers' Guild to protect the town from violators of the Five Laws, whether they be adventurers, bandits, peasants, or night creatures. Do not abandon the town or abuse the powers and trust vested in you, or they will surely be taken away."
	display_order = JDO_TOWNGUARD
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/bogguardsman
	give_bank_account = 60
	min_pq = 15
	max_pq = null

	cmode_music = 'sound/music/combat_bog.ogg'

/datum/job/roguetown/bogguardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
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
			S.name = "Hedge Knight tabard ([index])"

/datum/outfit/job/roguetown/bogguardsman/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet/foresterhelmet
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/foresterarmor
	cloak = /obj/item/clothing/cloak/templar/dendor
	neck = /obj/item/clothing/neck/roguetown/bervor
	gloves = /obj/item/clothing/gloves/roguetown/forestergauntlets
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shoes = /obj/item/clothing/shoes/roguetown/boots/forestershoes
	beltl = /obj/item/quiver/arrows
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/mace/stunmace/hedgeknight
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	id = /obj/item/scomstone
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/silver = 1, /obj/item/signal_horn = 1)
	if(H.mind)
		assign_skills(H)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SHOCKIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BLINDFIGHTING, TRAIT_GENERIC)

/*Design philosophy: Protectors of Stonehedge, whose holy maces are the bane of any who violate the Guild's few laws.
While they are not as physically strong as more conventional warriors, they are swift and their endurance is second to none.*/
/datum/outfit/job/roguetown/bogguardsman/proc/assign_skills(mob/living/carbon/human/H)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 6, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 4, TRUE) //Hearthstone change.
	H.change_stat("perception", 2)
	H.change_stat("constitution", 4)
	H.change_stat("endurance", 4)
	H.change_stat("speed", 2)

/datum/job/roguetown/prisonerd
	title = "Public Servant"
	flag = PRISONERD
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 15
	spawn_positions = 15

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	tutorial = "Though the title 'public servant' may sound like you are not a slave, matter of fact you are. Stripped of your rights to even your own body, you must work to try to pay off your debt you made previously so you may reclaim your freedom."

	outfit = /datum/outfit/job/roguetown/prisonerd
	display_order = JDO_PRISONERD
	give_bank_account = 10
	min_pq = -14
	max_pq = null
	can_random = FALSE

	cmode_music = 'sound/music/combat_bum.ogg'
	advsetup = 1
	advclass_cat_rolls = list(CTAG_SERVANT = 100)

/datum/job/roguetown/prisonerd/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

// Public Servant class
/datum/advclass/basic
	name = "Public Servant"
	tutorial = "Though stripped of your rights, you must work to pay off your debts and reclaim your freedom."
	outfit = /datum/outfit/job/roguetown/prisonerd/servant
	category_tags = list(CTAG_SERVANT)
	pickprob = 100

	/datum/advclass/basic/equipme(mob/living/carbon/human/H)
		. = ..()
		if(!H)
			return FALSE
		H.equipOutfit(outfit)
		post_equip(H)
		H.advjob = name

/datum/outfit/job/roguetown/prisonerd/servant/pre_equip(mob/living/carbon/human/H)

/datum/outfit/job/roguetown/prisonerd/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/gorget/servant
	if(H.gender == FEMALE)
		pants = /obj/item/clothing/under/roguetown/tights/stockings
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/rags
		pants = /obj/item/clothing/under/roguetown/loincloth/brown
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/mining, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/music, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("fortune", 2)
		H.change_stat("strength", 1)
		H.change_stat("constitution", -1)
		ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_NASTY_EATER, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

/datum/job/roguetown/prisonerd/New()
	. = ..()
	new /datum/advclass/basic()

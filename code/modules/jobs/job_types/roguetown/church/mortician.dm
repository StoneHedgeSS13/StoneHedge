/datum/job/roguetown/undertaker
	title = "Gravesinger"
	flag = GRAVEDIGGER
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_patrons = ALL_DIVINE_PATRONS //gets set to necra on the outfit anyways lol
	tutorial = "The purpose of a Gravesinger, working on behalf of both the local temple and of the Adventurers' Guild, is two-fold. As a priest of Yamais, it is to be the shepard of spirits to their preferred destination, whether it be burial and reincarnation, or reanimated in their own body, restored and cured of decomposition. As an expert on the affairs of the dead, it is to assist Adventurers in locating missing or slain comrades and providing the testimony of the dead to the Hedgeknights. Additionally, you have some medical training and the tools to use them, along with the expectation that you should rescue the dying if you can."

	outfit = /datum/outfit/job/roguetown/undertaker
	display_order = JDO_GRAVEMAN
	give_bank_account = TRUE
	min_pq = 5
	max_pq = null

/datum/outfit/job/roguetown/undertaker
	allowed_patrons = list(/datum/patron/divine/yamais)

/datum/outfit/job/roguetown/undertaker/pre_equip(mob/living/carbon/human/H)//Updated to have medium armor, because they'll be at odds with Necromancers and likely be targeted by antags.
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/surghood
	mask = /obj/item/clothing/mask/rogue/skullmask
	neck = /obj/item/clothing/neck/roguetown/psicross/necra
	gloves = /obj/item/clothing/gloves/roguetown/plate
	cloak = /obj/item/clothing/cloak/templar/necra
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/surgrobe
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	pants = /obj/item/clothing/under/roguetown/platelegs
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	belt = /obj/item/storage/belt/rogue/leather/blackleather
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/silver =1, /obj/item/toy/cards/deck/tarot =1, /obj/item/scrying =1, /obj/item/storage/fancy/skit =1, /obj/item/reagent_containers/glass/alembic =1, /obj/item/roguekey/church = 1)
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/rogueweapon/shovel/small
	backr = /obj/item/rogueweapon/sickle/scythe
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 5, TRUE)//So that they can be extra menacing with their scythe.
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
		H.change_stat("intelligence", 1)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/stable)//Spare the dying
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/purge)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/cure_rot)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seance)
		H.grant_language(/datum/language_holder/abyssal)
		H.grant_language(/datum/language_holder/celestial)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SIXTHSENSE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEESPIRITS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.update_sight()
	H.cmode_music = 'sound/music/combat_clergy.ogg'
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

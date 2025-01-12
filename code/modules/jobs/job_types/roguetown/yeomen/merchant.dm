/datum/job/roguetown/merchant
	title = "Merchant Prince"
	flag = MERCHANT
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = JCOLOR_YEOMAN
	allowed_races = RACES_ALL_KINDSPLUS
	tutorial = "You have reached a high standing on the merchant guild's sultanate, and you were granted the title of Prince or princess. You may not be actual royalty, but anyone who dares not treat you like such may find an increase on taxes, or become subject to your prodigious arcane talents. Hire adventurers and mercenaries to protect you and bring you riches from the forsaken ruins that plague this place to grow your wealth."

	display_order = JDO_MERCHANT

	outfit = /datum/outfit/job/roguetown/merchant
	give_bank_account = 800
	min_pq = 1
	max_pq = null
	required = TRUE

	cmode_music = 'sound/music/combat2.ogg'

/datum/outfit/job/roguetown/merchant/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 5, TRUE) //stab those hoes
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/mathematics, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/projectile/magic_missile)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcewall)

	ADD_TRAIT(H, TRAIT_SEEPRICES, type)
	head = /obj/item/clothing/head/roguetown/chaperon
	neck = /obj/item/clothing/neck/roguetown/horus
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
	pants = /obj/item/clothing/under/roguetown/tights/sailor
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/keyring/merchant
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	id = /obj/item/clothing/ring/gold
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/silver/elvish/drow = 1)
	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather
		H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()
	else
		shoes = /obj/item/clothing/shoes/roguetown/gladiator
	H.change_stat("intelligence", 3)
	H.change_stat("perception", 4)
	if(isseelie(H))
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strip)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)

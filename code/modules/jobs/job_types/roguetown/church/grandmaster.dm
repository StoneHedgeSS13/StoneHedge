/datum/job/roguetown/grandmaster
	title = "Grandmaster"
	department_flag = CHURCHMEN
	faction = "Station"
	tutorial = "The Strongest. You have vowed and sworn your life to the Divine of this city. Interfaith politics or lordly politics have never interested you ever and todae marks your solem vigil over the land."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_patrons = ALL_CLERIC_PATRONS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/roguetown/grandmaster
	min_pq = 15
	max_pq = null
	total_positions = 1
	spawn_positions = 1
	display_order = JDO_TEMPLAR
	give_bank_account = TRUE

/datum/outfit/job/roguetown/grandmaster
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/job/roguetown/grandmaster/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
	wrists = /obj/item/clothing/neck/roguetown/psicross/astrata
	cloak = /obj/item/clothing/cloak/templar/psydon
	switch(H.patron.name)
		if("Elysius")
			wrists = /obj/item/clothing/neck/roguetown/psicross/astrata
			head = /obj/item/clothing/head/roguetown/helmet/heavy/astratahelm
			cloak = /obj/item/clothing/cloak/templar/astrata
		if("Sylvarn")
			wrists = /obj/item/clothing/neck/roguetown/psicross/dendor
			head = /obj/item/clothing/head/roguetown/helmet/heavy/dendorhelm
			cloak = /obj/item/clothing/cloak/templar/dendor
		if("Yamais")
			wrists = /obj/item/clothing/neck/roguetown/psicross/necra
			head = /obj/item/clothing/head/roguetown/helmet/heavy/necrahelm
			cloak = /obj/item/clothing/cloak/templar/necra
		if("Hermeir")
			wrists = /obj/item/clothing/neck/roguetown/psicross/pestra
			head = /obj/item/clothing/head/roguetown/helmet/heavy/pestrahelm
			cloak = /obj/item/clothing/cloak/templar/pestra
		if("Lune")
			wrists = /obj/item/clothing/neck/roguetown/psicross/noc
			head = /obj/item/clothing/head/roguetown/helmet/heavy/nochelm
			cloak = /obj/item/clothing/cloak/templar/noc
		if("Viiritri") //Eora content from Stonekeep
			head = /obj/item/clothing/head/roguetown/helmet/heavy/eorahelm
			wrists = /obj/item/clothing/neck/roguetown/psicross/eora
			cloak = /obj/item/clothing/cloak/templar/eora
		if("Minhur")
			head = /obj/item/clothing/head/roguetown/helmet/heavy/ravoxhelm
			wrists = /obj/item/clothing/neck/roguetown/psicross/ravox
			cloak = /obj/item/clothing/cloak/templar/ravox
		if("Onder")
			head = /obj/item/clothing/head/roguetown/helmet/heavy/xylixhelm
			wrists = /obj/item/clothing/neck/roguetown/psicross/xylix
			cloak = /obj/item/clothing/cloak/templar/xylix
		if("Svaeryog")
			head = /obj/item/clothing/head/roguetown/helmet/malumhelmet
			wrists = /obj/item/clothing/neck/roguetown/psicross/malum
			cloak = /obj/item/clothing/cloak/templar/malum
		if("Abyssia")
			head = /obj/item/clothing/head/roguetown/helmet/heavy/abyssorhelm
			wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor
			cloak = /obj/item/clothing/cloak/templar/abyssor
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/roguekey/church = 1)
	backr = /obj/item/rogueweapon/shield/tower/metal
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/rogueweapon/flail/sflail
	id = /obj/item/clothing/ring/silver
	gloves = /obj/item/clothing/gloves/roguetown/chain
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 5, TRUE) // Might be utterly disgusting. Good luck.
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE) // dont give them any ranged stuff. thats what churchlings/inquis/confessor do.
		H.change_stat("strength", 3)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)  // Guard Captain stats with no fortune, making them weaker due to a lack of crits.
		H.cmode_music = 'sound/music/combat_clergy.ogg'
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

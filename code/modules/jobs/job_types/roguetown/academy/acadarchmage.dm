/datum/job/roguetown/acadarchmage
	title = "Academy Archmage"
	flag = ACADARCHMAGE
	department_flag = ACADEMY
	selection_color = JCOLOR_ACADEMY
	faction = "Station"
	total_positions = 3
	spawn_positions = 3

	allowed_races = RACES_ALL_KINDSPLUS
	allowed_sexes = list(MALE, FEMALE)
	spells = list (
		/obj/effect/proc_holder/spell/invoked/projectile/fireball/greater,
		/obj/effect/proc_holder/spell/invoked/projectile/lightningbolt,
		/obj/effect/proc_holder/spell/invoked/torsion/arcane,
		/obj/effect/proc_holder/spell/aoe_turf/conjure/Wolf,
		/obj/effect/proc_holder/spell/invoked/projectile/fetch,
		/obj/effect/proc_holder/spell/targeted/touch/prestidigitation,
		/obj/effect/proc_holder/spell/targeted/forcewall,
		/obj/effect/proc_holder/spell/invoked/message)
	display_order = JDO_ACADARCHMAGE
	tutorial = "You are one of the Arch-Mages of Dreamkeep's Magick Academy; Ravenloft. Your priority is to teach the Apprentices of, and manage, the Academy. \
		It took you years to become so esteemed that you could become an Archmage at Ravenloft Academy of Magickal Arts. Your first responsibility is to the Academy. \
		Your authority over the Academy is final. Do not ruin your reputation by misusing your gifts or shirking your responsibilities."
	outfit = /datum/outfit/job/roguetown/acadarchmage
	whitelist_req = FALSE
	give_bank_account = 2500
	min_pq = 10
	max_pq = null
	cmode_music = 'sound/music/combat_bandit_mage.ogg'


/datum/outfit/job/roguetown/acadarchmage

/datum/outfit/job/roguetown/acadarchmage/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/talkstone
	cloak = /obj/item/clothing/suit/roguetown/shirt/robe/wizard
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	beltr = /obj/item/storage/keyring/mage
	id = /obj/item/clothing/ring/keystone/archkey
	l_hand = /obj/item/class_selector/acadarchmage
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/healthpot)
	H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
	ADD_TRAIT(H, TRAIT_ANTISCRYING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LEARNMAGIC, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
//		H.faction += "summoner" //can use this to enable summons to attack players. Probably better to keep the mobs for pve purposes for now.
	if(H.age == AGE_OLD)
		if(H.mind)
			H.change_stat("speed", -1)
			H.change_stat("intelligence", 1)
			H.change_stat("perception", 1)
			H.mind.adjust_spellpoints(2)
		if(ishumannorthern(H))
			H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()

	switch(H.patron?.type)
		if(/datum/patron/divine/hermeir)
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
		if(/datum/patron/divine/minhur, /datum/patron/inhumen/nyrnhe)
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, max((2 - H.mind.get_skill_level(/datum/skill/combat/knives)), 0), TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, max((2 - H.mind.get_skill_level(/datum/skill/combat/swords)), 0), TRUE)
		else
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 1, TRUE)

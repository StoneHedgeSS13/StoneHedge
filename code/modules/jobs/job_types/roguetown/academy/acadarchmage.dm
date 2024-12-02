/datum/job/roguetown/magician
	title = "Academy Archmage"
	flag = ACADARCHMAGE
	department_flag = ACADEMY
	selection_color = JCOLOR_ACADEMY
	faction = "Station"
	total_positions = 5
	spawn_positions = 5

	allowed_races = RACES_ALL_KINDSPLUS
	allowed_sexes = list(MALE, FEMALE)
	spells = list (
		/obj/effect/proc_holder/spell/invoked/projectile/fireball/greater,
		/obj/effect/proc_holder/spell/invoked/projectile/spitfire,
		/obj/effect/proc_holder/spell/invoked/projectile/lightningbolt,
		/obj/effect/proc_holder/spell/invoked/arcyne_storm,
		/obj/effect/proc_holder/spell/invoked/slowdown_spell_aoe,
		/obj/effect/proc_holder/spell/aoe_turf/conjure/Wolf,
		/obj/effect/proc_holder/spell/invoked/invisibility,
		/obj/effect/proc_holder/spell/invoked/projectile/fetch,
		/obj/effect/proc_holder/spell/targeted/touch/prestidigitation,
		/obj/effect/proc_holder/spell/targeted/forcewall,
		/obj/effect/proc_holder/spell/targeted/ethereal_jaunt,
		/obj/effect/proc_holder/spell/aoe_turf/rogue_knock)
	display_order = JDO_ACADARCHMAGE
	tutorial = "You are one of the Arch-Mages of Dreamkeep's Magick Academy; Ravenloft. Your priority is to teach the Apprentices of, and manage, the Academy\
		It took you years to become so esteemed that you could become an Archmage at Ravenloft Academy of Magickal Arts. Your first responsibility is to the Academy\
		Do not ruin your reputation by misusing your gifts or shirking your responsibilities."
	outfit = /datum/outfit/job/roguetown/acadarchmage
	whitelist_req = FALSE
	give_bank_account = 2500
	min_pq = 10
	max_pq = null

	cmode_music = 'sound/music/combat_bandit_mage.ogg'


//Outfit for the Archmage. Their cool stuff.

/datum/outfit/job/roguetown/acadarchmage

/datum/outfit/job/roguetown/acadarchmage/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/talkstone
	cloak = null
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	pants = /obj/item/clothing/under/roguetown/trou/plainpants
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltr = /obj/item/storage/keyring/mage
	id = /obj/item/roguekey/acadkeystone
	r_hand = /obj/item/rogueweapon/woodstaff
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/slimepotion/lovepotion,/obj/item/reagent_containers/glass/bottle/rogue/poison,/obj/item/reagent_containers/glass/bottle/rogue/healthpot)
	ADD_TRAIT(H, TRAIT_SEEPRICES, "[type]")
	ADD_TRAIT(H, TRAIT_USEMAGICITEM, "[type]")
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 6, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("constitution", -1)
		H.change_stat("intelligence", 4)
		H.mind.adjust_spellpoints(5)
		H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
//		H.faction += "summoner" //can use this to enable summons to attack players. Probably better to keep the mobs for pve purposes for now.
	if(H.age == AGE_OLD)
		if(H.mind)
			H.change_stat("speed", -1)
			H.change_stat("intelligence", 1)
			H.change_stat("perception", 1)
			H.mind.adjust_spellpoints(2)
		belt = /obj/item/storage/belt/rogue/leather/plaquegold
		cloak = null
		head = /obj/item/clothing/head/roguetown/wizhat
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/wizard
		if(ishumannorthern(H))
			H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()

	switch(H.patron?.type)
		if(/datum/patron/divine/pestra)
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
		else if(/datum/patron/divine/ravox || /datum/patron/inhumen/graggar) //raises the pick(1,2) weapon skills to 2 if they weren't there already
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, max((2 - H.mind.get_skill_level(/datum/skill/combat/knives)), 0), TRUE) //basically, (2 - current skill) is added to the total skill value.
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, max((2 - H.mind.get_skill_level(/datum/skill/combat/swords)), 0), TRUE)
		else
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 1, TRUE)
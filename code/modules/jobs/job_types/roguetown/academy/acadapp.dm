/datum/job/roguetown/acadapp
	title = "Academy Apprentice"
	flag = ACADAPP
	department_flag = ACADEMY
	selection_color = JCOLOR_ACADEMY
	faction = "Station"
	total_positions = 10
	spawn_positions = 10

	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = list(AGE_ADULT)

	tutorial = "You are one of the Apprentices of Dreamkeep's Magick Academy; Ravenloft. Your priority is to learn the magical arts and listen to the Mages and Archmages of the Academy. \
		Your first responsibility is to the Academy. Do not ruin your reputation by misusing your gifts or shirking your responsibilities."
	spells = list(
		/obj/effect/proc_holder/spell/invoked/projectile/spitfire,
		/obj/effect/proc_holder/spell/aoe_turf/conjure/Wolf,
		/obj/effect/proc_holder/spell/invoked/projectile/fetch,
		/obj/effect/proc_holder/spell/targeted/touch/prestidigitation,
		/obj/effect/proc_holder/spell/targeted/forcewall,
		/obj/effect/proc_holder/spell/invoked/message)
	outfit = /datum/outfit/job/roguetown/acadapp

	display_order = JDO_ACADAPP
	give_bank_account = TRUE

	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/acadapp/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	pants = /obj/item/clothing/under/roguetown/tights/black
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/keyring/mage
	shoes = /obj/item/clothing/shoes/roguetown/boots
	r_hand = /obj/item/rogueweapon/woodstaff
	id = /obj/item/clothing/ring/keystone
	backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_spellpoints(3)
		if(isseelie(H))
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strip)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)
	H.change_stat("strength", -1)
	H.change_stat("constitution", -1)
	H.change_stat("intelligence", 2)
	H.change_stat("perception", 1)
	ADD_TRAIT(H, TRAIT_LEARNMAGIC, TRAIT_GENERIC)

	H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)

/datum/advclass/paladin
	name = "Paladin"
	tutorial = "Paladins are holy warriors who have taken sacred vows to uphold justice and righteousness. Often, they were promised redemption for past sins if they crusaded in the name of the gods."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/paladin
	traits_applied = list(TRAIT_HEAVYARMOR)
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/combat_clergy.ogg'

/datum/outfit/job/roguetown/adventurer/paladin
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/job/roguetown/adventurer/paladin/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Paladin","Battle Master",)
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	var/weapons = list( //what did you primarily train with?
		"Swords",
		"Axes",
		"Maces",
		"Polearms"
	)

	var/weaponschoice = input("What did train with the most?", "Available weapons") as anything in weapons

	switch(weaponschoice)
		if("Swords")
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
			if(H.age == AGE_OLD)
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			if(classchoice == "Battle Master")
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			r_hand = /obj/item/rogueweapon/sword/long
			l_hand = /obj/item/rogueweapon/shield/tower/metal
		if("Axes")
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
			if(H.age == AGE_OLD)
				H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
			if(classchoice == "Battle Master")
				H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
			r_hand = /obj/item/rogueweapon/stoneaxe/battle
			l_hand = /obj/item/rogueweapon/shield/tower/metal
		if("Maces & Flails")
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
			if(H.age == AGE_OLD)
				H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
			if(classchoice == "Battle Master")
				H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
			r_hand = /obj/item/rogueweapon/mace
			l_hand = /obj/item/rogueweapon/shield/tower/metal
		if("Polearms")
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
			if(H.age == AGE_OLD)
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			if(classchoice == "Battle Master")
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			r_hand = /obj/item/rogueweapon/spear/billhook
			l_hand = /obj/item/rogueweapon/shield/tower/metal

	switch(classchoice)

		if("Paladin")
			to_chat(src, span_warning("Paladins are holy warriors who have taken sacred vows to uphold justice and righteousness. Often, they were promised redemption for past sins if they crusaded in the name of the gods."))
			H.set_blindness(0) // No introduction text due to there being no real difference in Paladin archetypes for now.
			to_chat(H, span_warning("You are a paladin."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 1, TRUE)
			H.change_stat("perception", 1)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2) // Classic paladin is smurter then the battle master.
			H.change_stat("intelligence", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/invoked/lesser_heal)
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
			neck = /obj/item/clothing/neck/roguetown/psicross/silver
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/hand
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltr = /obj/item/rogueweapon/huntingknife
			id = /obj/item/clothing/ring/silver
			cloak = /obj/item/clothing/cloak/tabard/crusader
			backr = /obj/item/rogueweapon/sword/long
			backl = /obj/item/storage/backpack/rogue/satchel
			switch(H.patron.name)
				if("Levishth")
					neck = /obj/item/clothing/neck/roguetown/psicross/skull
					cloak = /obj/item/clothing/cloak/tabard
				if("Yamais")
					wrists = /obj/item/clothing/neck/roguetown/psicross/necra
					cloak = /obj/item/clothing/cloak/templar/necra
				if("Hermeir")
					wrists = /obj/item/clothing/neck/roguetown/psicross/pestra
					cloak = /obj/item/clothing/cloak/templar/pestra
				if("Lune")
					wrists = /obj/item/clothing/neck/roguetown/psicross/noc
					cloak = /obj/item/clothing/cloak/templar/noc
				if("Viiritri") //Eora content from Stonekeep
					wrists = /obj/item/clothing/neck/roguetown/psicross/eora
					cloak = /obj/item/clothing/cloak/templar/eora
				if("Minhur")
					wrists = /obj/item/clothing/neck/roguetown/psicross/ravox
					cloak = /obj/item/clothing/cloak/templar/ravox
				if("Onder")
					wrists = /obj/item/clothing/neck/roguetown/psicross/xylix
					cloak = /obj/item/clothing/cloak/templar/xylix
				if("Svaeryog")
					wrists = /obj/item/clothing/neck/roguetown/psicross/malum
					cloak = /obj/item/clothing/cloak/templar/malum
				if("Abyssia")
					wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor
					cloak = /obj/item/clothing/cloak/templar/abyssor
		if("Battle Master")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a battle-master."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 1, TRUE)
			H.change_stat("perception", 1)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/invoked/lesser_heal)
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
			neck = /obj/item/clothing/neck/roguetown/psicross/silver
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/hand
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltr = /obj/item/rogueweapon/huntingknife
			id = /obj/item/clothing/ring/silver
			cloak = /obj/item/clothing/cloak/tabard/crusader
			switch(H.patron.name)
				if("Levishth")
					neck = /obj/item/clothing/neck/roguetown/psicross/skull
					cloak = /obj/item/clothing/cloak/tabard
				if("Yamais")
					wrists = /obj/item/clothing/neck/roguetown/psicross/necra
					cloak = /obj/item/clothing/cloak/templar/necra
				if("Hermeir")
					wrists = /obj/item/clothing/neck/roguetown/psicross/pestra
					cloak = /obj/item/clothing/cloak/templar/pestra
				if("Lune")
					wrists = /obj/item/clothing/neck/roguetown/psicross/noc
					cloak = /obj/item/clothing/cloak/templar/noc
				if("Viiritri") //Eora content from Stonekeep
					wrists = /obj/item/clothing/neck/roguetown/psicross/eora
					cloak = /obj/item/clothing/cloak/templar/eora
				if("Minhur")
					wrists = /obj/item/clothing/neck/roguetown/psicross/ravox
					cloak = /obj/item/clothing/cloak/templar/ravox
				if("Onder")
					wrists = /obj/item/clothing/neck/roguetown/psicross/xylix
					cloak = /obj/item/clothing/cloak/templar/xylix
				if("Svaeryog")
					wrists = /obj/item/clothing/neck/roguetown/psicross/malum
					cloak = /obj/item/clothing/cloak/templar/malum
				if("Abyssia")
					wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor
					cloak = /obj/item/clothing/cloak/templar/abyssor
			backl = /obj/item/storage/backpack/rogue/satchel

	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	if(H.dna.species.type == /datum/species/tieberian)
		cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	//Max devotion limit - Paladins are stronger but cannot pray to gain all abilities beyond t2
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	if(H.mind && H.patron?.type == /datum/patron/divine/jayx)
		H.mind.adjust_spellpoints(1)
		ADD_TRAIT(H, TRAIT_USEMAGIC, TRAIT_GENERIC) //can get magic from spellpoints but no more
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
		H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)

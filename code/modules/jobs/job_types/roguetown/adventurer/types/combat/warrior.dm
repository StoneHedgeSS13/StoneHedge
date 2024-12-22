//shield sword
/datum/advclass/sfighter
	name = "Fighter"
	tutorial = "Warriors are well balanced fighters, skilled in blades and capable of most other weapons. \
	they are an important member to most parties for their combat prowess, but not for much more"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/sfighter
	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_STEELHEARTED)

	category_tags = list(CTAG_ADVENTURER)


/datum/outfit/job/roguetown/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list(
		"Duelist",
		"Warrior",
		"Monster Hunter",
		"Knight-Errant",
		"Leper",
		"Combattante"
		//"Eldritch Knight", //give eldritch blast, that's it
		//"Champion", //higher crit rate
		//"Battle Master", //give three combat manuevers
		)
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	var/weapons = list( //what did you primarily train with?
		"Swords",
		"Axes",
		"Maces",
		"Polearms"
	)

	if((classchoice != "Leper") && (classchoice != "Combattante"))//lepers get big sword chungus. and duellist get rapier
		var/weaponschoice = input("What did train with the most?", "Available weapons") as anything in weapons

		switch(weaponschoice)
			if("Swords")
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
				if(H.age == AGE_OLD)
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
				r_hand = /obj/item/rogueweapon/sword/long
				if(classchoice == "Duelist")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					r_hand =  /obj/item/rogueweapon/sword/rapier
			if("Axes")
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
				if(H.age == AGE_OLD)
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
				r_hand = /obj/item/rogueweapon/stoneaxe/battle
				if(classchoice == "Duelist")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
			if("Maces")
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
				if(H.age == AGE_OLD)
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
				r_hand = /obj/item/rogueweapon/mace
				if(classchoice == "Duelist")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
			if("Polearms")
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
				if(H.age == AGE_OLD)
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
				r_hand = /obj/item/rogueweapon/spear/billhook
				if(classchoice == "Duelist")
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)

	switch(classchoice)

		if("Warrior")
			H.set_blindness(0)
			to_chat(H, span_warning("Warriors are well rounded fighters, experienced often in many theaters of warfare and battle they are capable of rising to any challenge that might greet them on the path."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 2, TRUE)	//Bit strong but Cleric and Barb get 1 so, let him have something nice.
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("perception", 1)
			H.change_stat("endurance", 2) // 8 stat points total as a low-skill martial role without magic. Compared to Pally with 7 points.
			H.change_stat("constitution", 2)
			H.change_stat("speed", 1)
			shoes = /obj/item/clothing/shoes/roguetown/boots
			gloves = /obj/item/clothing/gloves/roguetown/leather
			belt = /obj/item/storage/belt/rogue/leather
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			if(prob(70))
				armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			else if(prob(50))
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
			else
				armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
			if(prob(20))
				mask = /obj/item/clothing/mask/rogue/facemask
			else if(prob(60))
				head = /obj/item/clothing/head/roguetown/helmet/leather
			else if(prob(20))
				head = /obj/item/clothing/head/roguetown/helmet/skullcap
			else
				head = /obj/item/clothing/head/roguetown/helmet/kettle
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/shield/wood
			beltl = /obj/item/rogueweapon/huntingknife
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
		if("Monster Hunter")
			H.set_blindness(0)
			to_chat(H, span_warning("Monsters Hunters are typically contracted champions of the common folk dedicated to the slaying of both lesser vermin and greater beasts of the wilds."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE) //duh monster HUNTER
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 3, TRUE) //Hearthstone change.
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1) // Weaker endurance compared to a traditional warrior/soldier. Smarter due to study of rare magical beasts.
			H.change_stat("constitution", 2)
			H.change_stat("intelligence", 1)
			H.change_stat("perception", 1)
			shoes = /obj/item/clothing/shoes/roguetown/boots
			gloves = /obj/item/clothing/gloves/roguetown/leather
			belt = /obj/item/storage/belt/rogue/leather
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			if(prob(40))
				armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			else if(prob(60))
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
			else
				armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
			backl = /obj/item/storage/backpack/rogue/satchel
			beltl = /obj/item/rogueweapon/huntingknife
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
		if("Duelist")
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
			shoes = /obj/item/clothing/shoes/roguetown/shortboots
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			head = /obj/item/clothing/head/roguetown/bardhat
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
			gloves = /obj/item/clothing/gloves/roguetown/leather/angle
			belt = /obj/item/storage/belt/rogue/leather
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
			cloak = /obj/item/clothing/cloak/half
			backl = /obj/item/storage/backpack/rogue/satchel
			// beltl = /obj/item/rogueweapon/sword/rapier
			beltr = /obj/item/rogueweapon/shield/buckler
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/parrying)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) //they can already get to legendary weapon skill over martial styles so no heavy.
			ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
			H.change_stat("strength", 1)
			H.change_stat("perception", 1)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			H.change_stat("intelligence", 2)
			H.visible_message(span_info("I trained as a duelist, flair and precision is my weapon."))
		if("Knight-Errant")
			H.set_blindness(0)
			to_chat(H, span_warning("Once part of a noble family, you were cast away. A path closes, yet a thousand open up, brimming with the opportunity of new victories. When a warrior is gone, that will be his best and only bulwark."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
			//not as fast or perceptive but more bulky and enduring in general, i suppose, one less sum of stats than rest for making up to other advantages.
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2) //8 points like warrior.
			H.change_stat("constitution", 3)
			//has some good armor and more coins so spawns with no shield and knife etc
			gloves = /obj/item/clothing/gloves/roguetown/brigandinegauntlets
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			cloak = /obj/item/clothing/cloak/tabard
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			armor = /obj/item/clothing/suit/roguetown/armor/plate/noblecuirass
			shoes = /obj/item/clothing/shoes/roguetown/boots/armoriron
			belt = /obj/item/storage/belt/rogue/leather/black
			neck = /obj/item/storage/belt/rogue/pouch/coins/mid
			ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
			H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
		//leper, darkest dungeon based. Sick, blind and rotting away but has massive strength if he can land it.
		if("Leper")
			H.set_blindness(0)
			to_chat(H, span_warning("A noble, or a king of lands far away and now forgotten, broken and discarded. You roam the lands, strengthening your mind to find peace with your rotting husk, while taking punishments others can not."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 5, TRUE) //poetry
			//This is going to be crazy, horrible drawbacks, massive strength. Totally a bad idea.
			H.change_stat("strength", 4)
			H.change_stat("perception", -1) //you are going blind, but your mask will finish off the blindness for you.
			H.change_stat("constitution", 3)
			H.change_stat("endurance", 2)
			//You are not gonna be able to fight without your mask, keep it from breaking..
			mask = /obj/item/clothing/mask/rogue/facemask/leper/gold
			gloves = /obj/item/clothing/gloves/roguetown/leather/angle/leper
			pants = /obj/item/clothing/under/roguetown/trou/leather/advanced
			wrists = /obj/item/clothing/wrists/roguetown/wrappings
			cloak = /obj/item/clothing/cloak/cape
			head = /obj/item/clothing/head/roguetown/roguehood/white
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/webs
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/leper
			shoes = /obj/item/clothing/shoes/roguetown/gladiator
			belt = /obj/item/storage/belt/rogue/leather
			r_hand = /obj/item/rogueweapon/greatsword/brokensword
			ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			//leprosy
			if(!H.has_status_effect(STATUS_EFFECT_SPASMS))
				H.apply_status_effect(STATUS_EFFECT_SPASMS)
			if(!H.has_status_effect(STATUS_EFFECT_FAKE_VIRUS))
				H.apply_status_effect(STATUS_EFFECT_FAKE_VIRUS)
			H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
		//Duellist, Similar to duelists but not quite the same.
		if("Combattante")
			H.set_blindness(0)
			to_chat(H, span_warning("Originating in Grenzelhoft but now known across the world, the Combattante Association Duellists handle duels in almost any capacity. Mostly observing for their own records, Combattantes also train others, or duel on people's behalf for pay. Other mercenary work sometimes comes to them, but it is not their speciality."))
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 5, TRUE) //One-trick, rely mostly on their rapier.
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
			H.change_stat("strength", 1)
			H.change_stat("endurance", 2)
			H.change_stat("perception", 2)
			H.change_stat("speed", 3)
			belt = /obj/item/storage/belt/rogue/leather/black
			beltr = /obj/item/rogueweapon/sword/rapier/combattante
			backl = /obj/item/storage/backpack/rogue/satchel
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
			head = /obj/item/clothing/head/roguetown/paddedcap/combattante
			armor = /obj/item/clothing/suit/roguetown/armor/combattante
			pants = /obj/item/clothing/under/roguetown/trou/leather/advanced/combattante
			shoes = /obj/item/clothing/shoes/roguetown/nobleboot/combattante
			gloves = /obj/item/clothing/gloves/roguetown/leather/black
			cloak = /obj/item/clothing/cloak/combattante
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/parrying, /obj/item/storage/belt/rogue/pouch/coins/poor)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_BREADY, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
			REMOVE_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)


	H.give_fightingstyle(TRUE)

	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/secondwind)

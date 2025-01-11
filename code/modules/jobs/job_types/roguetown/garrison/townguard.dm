/datum/job/roguetown/guardsman
	title = "Watchman"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	selection_color = JCOLOR_SOLDIER
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "Responsible for the safety of the town and the enforcement of the Monarchies law, you are the vanguard of the city faced with punishing those who defy our Royal Line. Though you've many lords to obey, as both the Church and the Bailiff have great sway over your life - and Stone Hedge is far from normal to guard; given the dungeon labyrinth beneath it that makes it famous.."
	display_order = JDO_TOWNGUARD
	whitelist_req = FALSE
	advclass_cat_rolls = list(CTAG_WATCH = 20)
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	give_bank_account = 16
	min_pq = 10
	max_pq = null
	cmode_music = 'sound/music/combat_guard.ogg'

/datum/job/roguetown/guardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/job/roguetown/guardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "watchman tabard ([index])"

/datum/advclass/watchman/footsman //Strength class, starts with Sword/shield and medium armor training
	name = "Watch Footsman"
	tutorial = "Be it coin, honor or love for your home, you are ready to defend this town with your life. You will be the shield for the innocent, and the sword for the criminal."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/watchman/footsman
	category_tags = list(CTAG_WATCH)

/datum/outfit/job/roguetown/watchman/footsman/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 1, TRUE)

	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE)

	head = /obj/item/clothing/head/roguetown/helmet
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/stabard/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	shoes = /obj/item/clothing/shoes/roguetown/boots
	beltl = /obj/item/rogueweapon/sword
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/mace/cudgel
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/rogueweapon/shield/wood
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backpack_contents = list(/obj/item/storage/keyring/guard = 1, /obj/item/rope/chain = 1, /obj/item/signal_horn = 1)
	H.change_stat("strength", 3)
	H.change_stat("constitution", 3)
	H.change_stat("perception", 1)
	H.change_stat("endurance", 3)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SHIELDEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_FEINTMASTER, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell
	H.set_blindness(0)

/datum/advclass/watchman/militia //Spear, Sword and Light Armor.
	name = "Watch Militia"
	tutorial = "Fresh from boot camp, or perhaps simply by preference, you value the reach, versatility and simplicity of spears. Some consider you a vital part of the guard, some consider you cannon fodder. It is up to you to prove each side wrong or right"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/watchman/militia
	category_tags = list(CTAG_WATCH)

/datum/outfit/job/roguetown/watchman/militia/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 1, TRUE)

	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE)

	head = /obj/item/clothing/head/roguetown/helmet/leather/advanced
	pants = /obj/item/clothing/under/roguetown/trou/leather/advanced
	cloak = /obj/item/clothing/cloak/stabard/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	neck = /obj/item/clothing/neck/roguetown/gorget/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/advanced
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather/advanced
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/sword
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/advanced
	backr = /obj/item/storage/backpack/rogue/satchel/black
	gloves = /obj/item/clothing/gloves/roguetown/leather/advanced
	r_hand = /obj/item/rogueweapon/spear
	backpack_contents = list(/obj/item/storage/keyring/guard = 1, /obj/item/rope/chain = 1, /obj/item/signal_horn = 1)
	H.change_stat("strength", 2)
	H.change_stat("constitution", 2)
	H.change_stat("perception", 3)
	H.change_stat("endurance", 3)
	H.change_stat("speed", 3)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KICKUP, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SWIFTRUNNER, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell
	H.set_blindness(0)

/datum/advclass/watchman/watcher  //heavy armor, mace and shield
	name = "Watch Watcher" //Lol
	tutorial = "No nonsense. That's all you're here for. You're not taking no bratty rogue stabbing you, or drunken bastard punching you. Full plate, mace to the head, into the dungeon. If scoundrels don't fear your mere sight, your mace will deliver the message."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/watchman/watcher
	category_tags = list(CTAG_WATCH)

/datum/outfit/job/roguetown/watchman/watcher/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 1, TRUE)

	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE)

	head = /obj/item/clothing/head/roguetown/helmet/heavy/guard
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/stabard/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	neck = /obj/item/clothing/neck/roguetown/bervor
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates
	shoes = /obj/item/clothing/shoes/roguetown/armor/steel
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/mace/steel
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/rogueweapon/shield/tower
	gloves = /obj/item/clothing/gloves/roguetown/chain
	backpack_contents = list(/obj/item/storage/keyring/guard = 1, /obj/item/rope/chain = 1, /obj/item/signal_horn = 1)
	H.change_stat("strength", 2)
	H.change_stat("constitution", 4)
	H.change_stat("perception", 1)
	H.change_stat("endurance", 3)
	H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MARTIALEYE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SHIELDEXPERT, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell
	H.set_blindness(0)


/datum/advclass/watchman/sentinel  //Medium Armor/Dodge Expert, Bow skills
	name = "Watch Sentinel"
	tutorial = "Close combat was never your forte, but that doesn't mean you can't be an invaluable asset for the town's defense. You will put an end to a chase before it even happens."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/watchman/sentinel
	category_tags = list(CTAG_WATCH)

/datum/outfit/job/roguetown/watchman/sentinel/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 5, TRUE)

	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE)

	head = /obj/item/clothing/head/roguetown/helmet/kettle
	pants = /obj/item/clothing/under/roguetown/brayette
	cloak = /obj/item/clothing/cloak/stabard/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	neck = /obj/item/clothing/neck/roguetown/gorget/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/advanced
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather/advanced
	beltl = /obj/item/flashlight/flare/torch/lantern
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/quiver/arrows
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/advanced
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	backr = /obj/item/storage/backpack/rogue/satchel/black
	gloves = /obj/item/clothing/gloves/roguetown/leather/advanced
	backpack_contents = list(/obj/item/storage/keyring/guard = 1, /obj/item/rope/chain = 1, /obj/item/signal_horn = 1)
	H.change_stat("perception", 5)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 3)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KICKUP, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SWIFTRUNNER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOFALLDAMAGE1, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell
	H.set_blindness(0)

/datum/advclass/watchman/vigilante //dusters and knife. Good at wrestling
	name = "Watch Vigilante"
	tutorial = "Incorregible. That's a word you've heard a lot. You've always been scrapping and brawling for one reason or another, but the warden once saw potential on you. Although training has never suited you, you have been given a chance to put your fists to good use, and even get paid for it."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/watchman/vigilante
	category_tags = list(CTAG_WATCH)

/datum/outfit/job/roguetown/watchman/vigilante/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 1, TRUE)

	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE)

	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/stabard/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	neck = /obj/item/clothing/wrists/roguetown/bracers
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather/advanced
	beltl =  /obj/item/rogueweapon/huntingknife/idagger/steel
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/duster
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	backr = /obj/item/storage/backpack/rogue/satchel/black
	gloves = /obj/item/clothing/shoes/roguetown/boots/armor/leather
	backpack_contents = list(/obj/item/storage/keyring/guard = 1, /obj/item/rope/chain = 1, /obj/item/signal_horn = 1)
	H.change_stat("strength", 3)
	H.change_stat("constitution", 3)
	H.change_stat("perception", 2)
	H.change_stat("endurance", 3)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_STRONG_GRABBER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BLINDFIGHTING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell
	H.set_blindness(0)

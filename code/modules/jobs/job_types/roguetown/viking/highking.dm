
/datum/job/roguetown/highking
	title = "Dwarf Artificer"
	f_title = "Dwarf Artificer"
	flag = HIGHKING
	department_flag = VIKING
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(/datum/species/dwarf/mountain)
	show_in_credits = FALSE		//Stops Scom from announcing their arrival.
	spells = list(/obj/effect/proc_holder/spell/self/convertrole/viking, /obj/effect/proc_holder/spell/invoked/mending5e, /obj/effect/proc_holder/spell/self/forgedwarf_shout, /obj/effect/proc_holder/spell/self/forgedwarf_ignite)
	tutorial = "Hailing from a Dwarf Fortress, you are one of the Artificers who came to occupy this Forge-Chapel of Svaeryog for many years, now. You and your fellow Artificers rule this slice of the underdark in relative safety; free to craft and venture forth however you please. Through your connection to Svaeryogh, you can command the gates and forges of your domain."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/highking

	display_order = JDO_HIGHKING
	min_pq = 10
	max_pq = null
	cmode_music = 'sound/music/combat_viking.ogg'

/datum/outfit/job/roguetown/highking/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/dwarfhelm
	backr = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/stoneaxe/battle
	r_hand = /obj/item/rogueweapon/pick/steel
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	pants = /obj/item/clothing/under/roguetown/platelegs
	gloves = /obj/item/clothing/gloves/roguetown/dwarfgauntlets
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	armor = /obj/item/clothing/suit/roguetown/armor/plate/dwarffull
	shoes = /obj/item/clothing/shoes/roguetown/boots/dwarfboots
	cloak = /obj/item/clothing/cloak/templar/malum
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ARTIFICER, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE) // Chieftess gets nearly same skills as guard.
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2 , TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3 , TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 2, TRUE)

		H.change_stat("strength", 3) //Less strength than royal guard. Same as Captain
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", 5)	//They will likely have the entire town fighting them.
		H.change_stat("endurance", 5)

/obj/effect/proc_holder/spell/self/convertrole/viking
	name = "Recruit Clanshield"
	new_role = "Dwarf Clanshield"
	recruitment_faction = "Viking"
	recruitment_message = "Serve the clan, %RECRUIT!"
	accept_message = "FOR SVAERYOG!"
	refuse_message = "I refuse."

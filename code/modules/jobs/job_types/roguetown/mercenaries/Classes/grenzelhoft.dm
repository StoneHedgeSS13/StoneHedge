/datum/advclass/mercenary/grenzelhoft
	name = "Rossevellian"
	tutorial = "Experts, Professionals, Expensive. Those are the first words that come to mind when the emperiate Rossevellian mercenary guild is mentioned. While you may work for coin like any common sellsword, maintaining the prestige of the guild will be of utmost priority."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/mercenary/grenzelhoft
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 6
	cmode_music = 'sound/music/combat_grenzelhoft.ogg'

/datum/outfit/job/roguetown/mercenary/grenzelhoft/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Doppelsoldner","Halberdier")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Doppelsoldner")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Doppelsoldner of Rossevell, a swordsman experienced with long-length blades."))
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 1, TRUE)	//Won't be using normally with Zwiehander but useful.
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE) //builders
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE) // builders
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE) //builders
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)		//Trust me, they'll need it due to stamina drain on their base-sword.
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 1, TRUE) //Hearthstone change.
			H.change_stat("strength", 3)	//Should give minimum required stats to use Zweihander
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 2)
			H.change_stat("perception", 1)
			H.change_stat("speed", -1)		//They get heavy armor now + sword option; so lower speed.
			r_hand = /obj/item/rogueweapon/greatsword/zwei
		if("Halberdier")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Halberdier from Rossevell, a skilled user of poleamrs and axes. Though you prefer them combined.."))
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 1, TRUE) //Hearthstone change.
			H.change_stat("strength", 2)	//Less strength then sword-role but more speed; trade-off.
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 2)
			H.change_stat("perception", 1)
			r_hand = /obj/item/rogueweapon/halberd


	//General gear regardless of class.
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/flashlight/flare/torch
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/shirt/grenzelhoft
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/grenzelhoft
	pants = /obj/item/clothing/under/roguetown/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	gloves = /obj/item/clothing/gloves/roguetown/grenzelgloves

	backpack_contents = list(/obj/item/roguekey/mercenary)
	H.grant_language(/datum/language/grenzelhoftian)

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

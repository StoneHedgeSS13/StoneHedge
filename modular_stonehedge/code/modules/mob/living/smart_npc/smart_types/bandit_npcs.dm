//bandit npcs
/mob/living/carbon/human/species/human/smart_npc/bandit
	friendlyfactions = list("Bandits") //only cool with themselves
	dodgetime = 20
	aggromessages = list(
		"I'll cut you like the walkin' coin purse you are.",
		"Start beggin.",
		"Drop your shit and crawl away.",
		"Must you make this difficult?",
		"Your coin or your life!",
		"Who knew brigandin' could be so profitable.",
		"I shoulda brought my cudgel...",
		"You ain' taking us out."
	)

/mob/living/carbon/human/species/human/smart_npc/bandit/Initialize()
	//not sure if those will load right
	race = pick(/datum/species/human, /datum/species/halforc, /datum/species/elf/dark, /datum/species/elf, /datum/species/dwarf, /datum/species/goblin/, /datum/species/lupian)
	. = ..()

/mob/living/carbon/human/species/human/smart_npc/bandit/ambush
	del_on_deaggro = TRUE

/mob/living/carbon/human/species/human/smart_npc/bandit/after_creation()
	..()
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC) //necessary cause they dont path around those shit and die.
	equipOutfit(new /datum/outfit/job/roguetown/human/species/human/smart_npc/bandit)
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	if(organ_eyes)
		organ_eyes.eye_color = pick("27becc", "35cc27", "000000")
	update_hair()
	update_body()

/mob/living/carbon/human/species/human/smart_npc/bandit/handle_combat()
	if(mode == AI_HUNT)
		if(prob(10) && target)
			emote("rage")
	. = ..()

/datum/outfit/job/roguetown/human/species/human/smart_npc/bandit/pre_equip(mob/living/carbon/human/H)
	if(prob(50))
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather //leather bracers
	else
		wrists = /obj/item/clothing/wrists/roguetown/vambraces //iron bracers
	if(prob(50))
		cloak = /obj/item/clothing/cloak/hidecloak //hide cloak
	if(prob(50))
		gloves = /obj/item/clothing/gloves/roguetown/leather //leather gloves
	else
		gloves = /obj/item/clothing/gloves/roguetown/leather/angle //heavy leather gloves
	if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/hide //hide armor
		if(H.gender == FEMALE)
			if(prob(50))
				pants = /obj/item/clothing/suit/roguetown/armor/leather/hide/bikini
			else
				pants = /obj/item/clothing/suit/roguetown/armor/leather/hide/bikini/bra
	else
		armor = /obj/item/clothing/suit/roguetown/armor/plate/ironarmor //iron chestplate
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron //iron chainmail
		if(H.gender == FEMALE)
			if(prob(50))
				pants = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/bikini
			else
				pants = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/bikini/bra
	else
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail //steel chainmail
		if(H.gender == FEMALE)
			if(prob(50))
				pants = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
			else
				pants = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini/bra
	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/trou/leather //leather pants
		if(H.gender == FEMALE)
			pants = /obj/item/clothing/under/roguetown/trou/leather/skirt
	else
		pants = /obj/item/clothing/under/roguetown/chainlegs/iron //iron chain leggings
		if(H.gender == FEMALE)
			if(prob(50))
				pants = /obj/item/clothing/under/roguetown/chainlegs/iron/fishnet
			else
				pants = /obj/item/clothing/under/roguetown/chainlegs/iron/skirt
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/helmet/bascinet //bascinet helmet
	else
		head = /obj/item/clothing/head/roguetown/sackhood //sack hood.
	if(prob(50))
		shoes = /obj/item/clothing/shoes/roguetown/boots/armoriron //iron armor boots
	else
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather //leather boots

	r_hand = pick(/obj/item/rogueweapon/sword, /obj/item/rogueweapon/huntingknife/cleaver, /obj/item/rogueweapon/mace, /obj/item/rogueweapon/stoneaxe/battle, /obj/item/rogueweapon/sword/falchion)
	H.STASPD = 12
	H.STAPER = 8
	H.STACON = 12
	H.STAEND = 12
	H.STAINT = 12
	H.STASTR = rand(12,15)
	if(prob(30))
		neck = /obj/item/clothing/neck/roguetown/chaincoif
		H.eye_color = pick("27becc", "35cc27", "000000")
	H.hair_color = pick ("4f4f4f", "61310f", "faf6b9")
	H.facial_hair_color = H.hair_color
	//im not gonna ass with making them race named.
	if(H.gender == MALE)
		H.name = pick( world.file2list("strings/rt/names/human/humnorm.txt") )
		H.real_name = H.name
	else
		H.name = pick( world.file2list("strings/rt/names/human/humnorf.txt") )
		H.real_name = H.name

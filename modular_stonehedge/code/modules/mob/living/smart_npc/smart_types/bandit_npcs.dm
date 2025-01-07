//bandit npcs
/mob/living/carbon/human/species/human/smart_npc/bandit
	faction = list("bandits") //only cool with themselves
	friendlyfactions = list("bandits", "rogueanimal", "saiga", "chickens", "goats", "cows", "turtles", "rats", "crabs", "horse") //dont need to attack everything probably
	dodgetime = 18
	seeksfuck = TRUE
	erpable = TRUE
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
	//white skin possible races cause their shit dont really randomize...
	race = pick(/datum/species/human/northern, /datum/species/elf/wood, /datum/species/dwarf/mountain)
	. = ..()

/mob/living/carbon/human/species/human/smart_npc/bandit/after_creation()
	..()
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/human/species/human/smart_npc/bandit)

/mob/living/carbon/human/species/human/smart_npc/bandit/handle_combat()
	if(mode == AI_HUNT)
		if(prob(10) && target)
			emote("rage")
	. = ..()

/datum/outfit/job/roguetown/human/species/human/smart_npc/bandit/pre_equip(mob/living/carbon/human/H)
	if(prob(50)) //no free decaps
		neck = /obj/item/clothing/neck/roguetown/gorget
	else
		neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(prob(85)) //normal bois
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
					armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/bikini
				else
					armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/bikini/bra
		else
			armor = /obj/item/clothing/suit/roguetown/armor/plate/ironarmor //iron chestplate
		if(prob(50))
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron //iron chainmail
			if(H.gender == FEMALE)
				if(prob(50))
					shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/bikini
				else
					shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/bikini/bra
		else
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail //steel chainmail
			if(H.gender == FEMALE)
				if(prob(50))
					shirt  = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
				else
					shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini/bra
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
			head = /obj/item/clothing/head/roguetown/sackhood //sack hood, creepy.
		if(prob(50))
			shoes = /obj/item/clothing/shoes/roguetown/boots/armoriron //iron armor boots
		else
			shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather //leather boots

		r_hand = pick(/obj/item/rogueweapon/sword, /obj/item/rogueweapon/huntingknife/cleaver, /obj/item/rogueweapon/mace, /obj/item/rogueweapon/stoneaxe/battle, /obj/item/rogueweapon/sword/falchion)
	else //THICC bois
		wrists = /obj/item/clothing/wrists/roguetown/bracers //bracers
		if(prob(50))
			cloak = /obj/item/clothing/cloak/hidecloak //hide cloak
		gloves = /obj/item/clothing/gloves/roguetown/plate
		armor = /obj/item/clothing/suit/roguetown/armor/plate //half plate
		if(H.gender == FEMALE)
			if(prob(50))
				armor = /obj/item/clothing/suit/roguetown/armor/plate/bikini
			else
				armor = /obj/item/clothing/suit/roguetown/armor/plate/bikini/bra
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail //steel chainmail
		if(H.gender == FEMALE)
			if(prob(50))
				shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
			else
				shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini/bra
		pants = /obj/item/clothing/under/roguetown/chainlegs //steel chain leggings
		if(H.gender == FEMALE)
			if(prob(50))
				pants = /obj/item/clothing/under/roguetown/chainlegs/fishnet
			else
				pants = /obj/item/clothing/under/roguetown/chainlegs/skirt
		head = /obj/item/clothing/head/roguetown/helmet/bascinet/helmetbars //bascinet barred helmet
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor //steel armor boots
		r_hand = pick(/obj/item/rogueweapon/sword, /obj/item/rogueweapon/huntingknife/cleaver, /obj/item/rogueweapon/mace, /obj/item/rogueweapon/stoneaxe/battle, /obj/item/rogueweapon/sword/falchion)
	H.STASPD = 12
	H.STAPER = 8
	H.STACON = 12
	H.STAEND = 12
	H.STAINT = 12
	H.STASTR = rand(12,15)
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

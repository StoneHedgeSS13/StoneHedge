/datum/advclass/amazon
	name = "Amazon"
	tutorial = "Amazons are warrior-women from the deep jungles of an unknown continent."
	allowed_sexes = list(FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/amazon

	category_tags = list(CTAG_ADVENTURER)

	traits_applied = list(TRAIT_CRITICAL_RESISTANCE, TRAIT_NOPAINSTUN, TRAIT_STEELHEARTED, TRAIT_BLINDFIGHTING)
	cmode_music = 'sound/music/combat_gronn.ogg'

/datum/outfit/job/roguetown/adventurer/amazon/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/barbarian_rage)

	ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC) //danger sense.
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/rogueweapon/huntingknife
	shoes = /obj/item/clothing/shoes/roguetown/gladiator
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/javelinquiver
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
	armor = /obj/item/clothing/suit/roguetown/armor/leather/bikini
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltr = /obj/item/rogueweapon/sword/iron
	r_hand = /obj/item/rogueweapon/spear
	H.change_stat("strength", 2)
	H.change_stat("intelligence", -1)
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 2)
	backpack_contents = list(/obj/item/restraints/legcuffs/bola, /obj/item/restraints/legcuffs/bola, /obj/item/restraints/legcuffs/bola)
	ADD_TRAIT(H, TRAIT_DEATHBYSNOOSNOO, TRAIT_GENERIC) //doubles sex damage
	ADD_TRAIT(H, TRAIT_STRONGTHROW, TRAIT_GENERIC) //mighty throws, javelins etc

	if(H.wear_mask) //for stupid idiots with bad eyes
		var/obj/I = H.wear_mask
		H.dropItemToGround(H.wear_mask, TRUE)
		qdel(I)

/datum/job/roguetown/seelie
	title = "Forest Seelie"
	flag = SEELIE
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	allowed_races = list(/datum/species/seelie,)
	allowed_ages = ALL_AGES_LIST
	tutorial = "You are a fae sprite that came into existance around this forest, either recently or long ago. Perhaps you support people in their trade and craft, or you may be a disruptive nuisance that teaches valuable lessons. Either way, your miriad of mysterious spells and abilites will support you in your endeavours."
	outfit = /datum/outfit/job/roguetown/seelie
	display_order = JDO_SEELIE
	min_pq = 5
	max_pq = null
	give_bank_account = FALSE

/datum/outfit/job/roguetown/seelie/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/mage
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/tights/random
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/rogueweapon/huntingknife
	backl = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, pick(2,3), TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing , 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 3, TRUE)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strip)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/seelie_kiss)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)
		H.verbs |= (/mob/living/carbon/proc/switchaura)
		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)

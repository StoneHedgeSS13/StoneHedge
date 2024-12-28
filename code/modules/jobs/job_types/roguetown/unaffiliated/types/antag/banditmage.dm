/datum/advclass/banditmage //The Caster, brings some spells to the table to assist their bretherens
	name = "Bandit Mage"
	tutorial = "A shunned scholar, exploring matters forbidden to most mages, you relished in the controversy and the conflict, much more interested in magic for its strength rather than academic prowess. You were kicked out of the academy shunned from all magic practices.... But you don't give a damn, magic's a tool, and you're the master."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/bandit/banditmage
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_bandit_mage.ogg'
	traits_applied = list(TRAIT_LEARNMAGIC)

/datum/outfit/job/roguetown/bandit/banditmage/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 4, TRUE)
  
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/needle/thorn = 1, /obj/item/natural/cloth = 1)
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	head = /obj/item/clothing/head/roguetown/roguehood/red
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/magered
	r_hand = /obj/item/rogueweapon/woodstaff

	H.change_stat("strength", -2) //Nerd
	H.change_stat("endurance", 1) //Running everywhere helps your health though
	H.change_stat("intelligence", 4) //Smart Psycho
	H.change_stat("speed", 1) //Run away!
	H.mind.adjust_spellpoints(3) //they already get spells, so less points.
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/forcewall_weak)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/magicstone5e)

	H.verbs |= /mob/proc/haltyell
	H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
	H.ambushable = FALSE

//By DREAMKEEP, Vide Noir https://github.com/EaglePhntm.
//allows class selection for non adventurer roles.
/obj/item/class_selector
	name = "Book of memories"
	desc = "Activate to remember."
	icon = 'icons/obj/library.dmi'
	icon_state ="book1"
	embedding = list("embedded_pain_multiplier" = 0, "embed_chance" = 0, "embedded_fall_chance" = 0)
	var/datum/job/roguetown/intended_job
	var/inventory_items = list()
	var/classes = list()

/obj/item/class_selector/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOEMBED, TRAIT_GENERIC)

//guildmaster
/obj/item/class_selector/veteran/attack_self(mob/living/carbon/human/H)
	. = ..()
	classes = list(
	"Warrior",
	"Rogue",
	"Cleric"
	)
	//todo add more classes.
	var/classchoice = input("Choose your past", "Available archetypes") as anything in classes
	switch(classchoice)
		if("Warrior")
			inventory_items = list(
				/obj/item/clothing/neck/roguetown/bervor,
				/obj/item/clothing/suit/roguetown/armor/plate/scale,
				/obj/item/clothing/suit/roguetown/armor/chainmail,
				/obj/item/clothing/under/roguetown/chainlegs,
				/obj/item/clothing/shoes/roguetown/boots/armor,
				/obj/item/storage/belt/rogue/leather/black,
				/obj/item/rogueweapon/sword/sabre,
				/obj/item/storage/belt/rogue/pouch/coins/rich,
				/obj/item/storage/backpack/rogue/satchel,
				/obj/item/rogueweapon/huntingknife/idagger/steel/special,
				/obj/item/storage/keyring/veteran
			)
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 5, TRUE)		//Actual cancer but he fucks. Hard.
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 5, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
				H.change_stat("strength", 2)
				H.change_stat("intelligence", 1)
				H.change_stat("constitution", 2)
				H.change_stat("endurance", 2)
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			dressup(H, inventory_items)
		if("Rogue")
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/rogue_vanish)
			inventory_items = list(
				/obj/item/clothing/neck/roguetown/bervor,
				/obj/item/clothing/shoes/roguetown/boots/armor,
				/obj/item/storage/belt/rogue/leather,
				/obj/item/clothing/gloves/roguetown/chain,
				/obj/item/clothing/wrists/roguetown/hiddenblade,
				/obj/item/storage/backpack/rogue/satchel,
				/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow,
				/obj/item/quiver/Pbolts,
				/obj/item/rogueweapon/sword/estoc,
				/obj/item/lockpickring/mundane,
				/obj/item/rogueweapon/huntingknife/idagger/steel/parrying,
				/obj/item/storage/keyring/veteran,
				/obj/item/storage/belt/rogue/pouch/coins/rich,
			)
			if(H.gender == FEMALE) //funny
				inventory_items += /obj/item/clothing/suit/roguetown/armor/leather/studded/bikini
				inventory_items += /obj/item/clothing/suit/roguetown/armor/chainmail/bikini
				inventory_items += /obj/item/clothing/under/roguetown/chainlegs/fishnet
			else
				inventory_items += /obj/item/clothing/suit/roguetown/armor/leather/studded
				inventory_items += /obj/item/clothing/suit/roguetown/armor/chainmail
				inventory_items += /obj/item/clothing/under/roguetown/chainlegs
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 5, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 5, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 5, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 1, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 4, TRUE)
			ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
			H.change_stat("perception", 1)
			H.change_stat("speed", 4)
			H.change_stat("intelligence", 2)
			dressup(H, inventory_items)
		if("Cleric")
			inventory_items = list(
				/obj/item/clothing/suit/roguetown/armor/plate/scale,
				/obj/item/clothing/suit/roguetown/armor/chainmail,
				/obj/item/clothing/under/roguetown/chainlegs,
				/obj/item/clothing/gloves/roguetown/chain,
				/obj/item/clothing/shoes/roguetown/boots/armor,
				/obj/item/storage/belt/rogue/leather/black,
				/obj/item/rogueweapon/mace/steel,
				/obj/item/storage/belt/rogue/pouch/coins/rich,
				/obj/item/storage/backpack/rogue/satchel,
				/obj/item/rogueweapon/shield/wood,
				/obj/item/rogueweapon/huntingknife/idagger/steel/parrying,
				/obj/item/storage/keyring/veteran,
			)
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			switch(H.patron?.type)
				if(/datum/patron/divine/astrata)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/astrata
				if(/datum/patron/inhumen/zizo)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/skull
				if(/datum/patron/divine/noc)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/noc
					H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 2, TRUE)
					H.mind.adjust_spellpoints(2)
					H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)
					H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
				if(/datum/patron/divine/dendor)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/dendor
					H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 2, TRUE) // enough to craft druid mask, at least
				if(/datum/patron/divine/necra)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/necra
				if(/datum/patron/divine/pestra)
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/pestra
				if(/datum/patron/divine/eora) //Eora content from Stonekeep
					inventory_items += /obj/item/clothing/neck/roguetown/psicross/eora
			C.grant_spells_cleric(H)
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 5, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 6, TRUE)
				H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
			H.change_stat("strength", 1)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2) // Stronger but less intelligent/quick compared to life clerics.
			H.change_stat("intelligence", 2)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/bladeward5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/conjure/createbonfire5e)
			H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
			dressup(H, inventory_items)

/obj/item/class_selector/proc/dressup(mob/living/carbon/human/H, list/inventory_items)
	to_chat(H, span_warning("I shouldn't move until I am done dressing up."))
	for(var/obj/item/invitem as anything in inventory_items)
		var/spawneditem = new invitem(H.loc)
		H.pickup_and_wear(spawneditem)
	qdel(src)

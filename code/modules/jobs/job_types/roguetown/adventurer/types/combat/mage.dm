/datum/advclass/mage
	name = "Mage"
	f_title = "Sorceress"
	tutorial = "Mages are usually grown-up apprentices of wizards. They are seeking adventure, using their arcyne knowledge to aid or ward off other adventurers."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/mage
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/combat_bandit_mage.ogg'
	traits_applied = list(TRAIT_LEARNMAGIC)


/datum/outfit/job/roguetown/adventurer/mage/pre_equip(mob/living/carbon/human/H)

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	H.mind.adjust_spellpoints(2) //they already get spells, so less points.
	var/classes = list("Elementalist","Arcanist","Enchanter","Spellblade","Necromancer")
	var/classchoice = input("Choose your Specialization", "Available Specializations") as anything in classes
	switch(classchoice)

		if("Elementalist")
			H.set_blindness(0)
			to_chat(H, span_warning("You like the raw elements, choosing to specialize in mastering them for extravagent offensive magicks."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 3, TRUE)
			H.change_stat("intelligence", 3)
			H.change_stat("constitution", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/rayoffrost5e)
		if("Arcanist")
			H.set_blindness(0)
			to_chat(H, span_warning("You chose to specialize in occultist-like eldritch magicks, leading you down a unique path."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 4, TRUE)
			H.change_stat("intelligence", 3)
			H.change_stat("constitution", 1)
			H.change_stat("endurance", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mindsliver5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/eldritchblast5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/soulspeak)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/arcyne_storm)
		if("Enchanter")
			H.set_blindness(0)
			to_chat(H, span_warning("You specialize in Enchantments and Mental Magick. Unlike most Mages, this leads to a perculiar study between alchemy and Smithing that tends to have you in higher demand in a city."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 3, TRUE)
			H.change_stat("intelligence", 3)
			H.change_stat("perception", 1)
			H.change_stat("constitution", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/magicstone5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/encodethoughts5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/invisibility)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/featherfall)
		if("Spellblade")
			H.set_blindness(0)
			to_chat(H, span_warning("Unlike most of your kind, you weave the arts of the blade and magick into a dance."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 2, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("speed", 2)
			H.change_stat("endurance", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/greenflameblade5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/bladeward5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/slowdown_spell_aoe)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/push_spell)
		if("Necromancer")
			H.set_blindness(0)
			to_chat(H, span_warning("You took the school of magick most would not, magic of life and death and blood sorcery, knowing the consequences and the prejudice against it."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE) //sussy autopsy things probably
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/blood, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
			H.change_stat("intelligence", 3)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/strengthen_undead)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/chilltouch5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodlightning)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lifesteal)
			H.faction |= "undead"


	head = /obj/item/clothing/head/roguetown/roguehood/mage
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	beltl = /obj/item/rogueweapon/huntingknife
	backl = /obj/item/storage/backpack/rogue/satchel
	r_hand = /obj/item/rogueweapon/woodstaff
	if(classchoice == "Spellblade")
		head = /obj/item/clothing/head/roguetown/bardhat
		beltr = /obj/item/rogueweapon/sword/rapier
		shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
		pants = /obj/item/clothing/under/roguetown/trou/leather
		cloak = /obj/item/clothing/cloak/half
	if(classchoice == "Enchanter")
		head = /obj/item/clothing/head/roguetown/wizhat
		shirt = /obj/item/clothing/suit/roguetown/shirt/robe/abyssoracorobe
		pants = /obj/item/clothing/under/roguetown/tights/black
		shoes = /obj/item/clothing/shoes/roguetown/armor/shalal
		neck = /obj/item/clothing/neck/roguetown/psicross/eora
		ADD_TRAIT(H, TRAIT_ARTIFICER, TRAIT_GENERIC)
	if(classchoice == "Arcanist")
		head = /obj/item/clothing/head/roguetown/roguehood/shalal
		r_hand = /obj/item/scrying
		neck = /obj/item/clothing/neck/roguetown/psicross/necra
	if(classchoice == "Necromancer")
		head = /obj/item/clothing/head/roguetown/necromhood
		pants = /obj/item/clothing/under/roguetown/trou/leather
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/necromancer
		belt = /obj/item/storage/belt/rogue/leather/rope
		backl = /obj/item/storage/backpack/rogue/satchel
		beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
		beltl = /obj/item/rogueweapon/huntingknife
		r_hand = /obj/item/rogueweapon/woodstaff
		ADD_TRAIT(H, TRAIT_ZOMBIE_IMMUNE, TRAIT_GENERIC)

	H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)

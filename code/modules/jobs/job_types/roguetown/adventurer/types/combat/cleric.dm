//shield
/datum/advclass/cleric
	name = "Cleric"
	tutorial = "Clerics are wandering warriors of the Gods, an asset to any party."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	vampcompat = FALSE
	outfit = /datum/outfit/job/roguetown/adventurer/cleric
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/combat_clergy.ogg'

/datum/outfit/job/roguetown/adventurer/cleric
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/job/roguetown/adventurer/cleric/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	switch(H.patron?.type)
		if(/datum/patron/divine/elysius)
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
		if(/datum/patron/inhumen/levishth)
			neck = /obj/item/clothing/neck/roguetown/psicross/skull
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/blood, 2, TRUE)
		if(/datum/patron/divine/lune)
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
		if(/datum/patron/divine/sylvarn)
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 2, TRUE) // enough to craft druid mask, at least
		if(/datum/patron/divine/yamais)
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
		if(/datum/patron/divine/hermeir)
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
		if(/datum/patron/divine/viiritri) //Eora content from Stonekeep
			neck = /obj/item/clothing/neck/roguetown/psicross/eora

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Life Cleric","War Cleric","Nature Cleric", "Temple Devout")

	switch(H.patron?.type)

		// Divine Pantheon

		if(/datum/patron/divine/elysius)
			classes += "Sun-Drake"
		if(/datum/patron/divine/lune)
			classes += "Moon-Walker"
		if(/datum/patron/divine/sylvarn)
			classes += "Temple Druid"
		if(/datum/patron/divine/abyssia)
			classes += "Priest of All Waves"
		if(/datum/patron/divine/minhur)
			classes += "Siege Dancer"
		if(/datum/patron/divine/yamais)
			classes += "Guider of the Dead"
		/*
		if(/datum/patron/divine/onder)
			classes += "Holy Bard?"
		*/ // To-do until I think of something to give to Onder clerics in general
		if(/datum/patron/divine/hermeir)
			classes += "Sidewinder"
		if(/datum/patron/divine/svaeryog)
			classes += "Child of the Forge"
		if(/datum/patron/divine/viiritri)
			classes += "Temple Prostitute"
		if(/datum/patron/divine/jayx)
			classes += "Mana Tender"
		/*
		if(/datum/patron/divine/arshatra)
			classes += "Vengeance Placeholder"
		*/ // No idea what would fit here. Her spells are basically copied over from viiritri

		// Inhumen Pantheon

		if(/datum/patron/inhumen/levishth)
			classes += "Reanimator-Priest"
		if(/datum/patron/inhumen/nyrnhe)
			classes += "Flesh Sculptor"
		if(/datum/patron/inhumen/thief)
			classes += "Thief of Fates"
		/* if(/datum/patron/inhumen/sacrifice)
			classes += "The Offering"
		*/ // To-do until I figure out what to give the sacrifice

		// Fey Pantheon

		if(/datum/patron/fae/lathrandyr, /datum/patron/fae/tashari, /datum/patron/fae/menrhue)
			classes += "Fey Enchanter"

		// Old God Snek / Seraph-Iros

		/*
		if(/datum/patron/old_god)
			classes += "Cardinal"
		*/ // To-do. Seraph-Iros doesn't have any cleric spells rn, and its flavor text says that it doesn't particularly care about faith and worship

	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Life Cleric")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a cleric of the life domain. Well versed in the arts of healing and magic."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("speed", 1) // More intelligence and no speed penalty for Life Clerics.
			H.change_stat("strength", 1)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance5e)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if("War Cleric")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a cleric of the war domain. Experienced in both the granting of life and the taking of it. Unfortunately your study of warcraft has weakened your divine abilities..."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.change_stat("intelligence", 1)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2) // Stronger but less intelligent/quick compared to life clerics.
			H.change_stat("speed", -1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/bladeward5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/conjure/createbonfire5e)
		if("Nature Cleric")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a cleric of the nature domain."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 1, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("strength", 1)
			H.change_stat("constitution", 1)
			H.change_stat("endurance", 2)
			H.change_stat("speed", 1)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/conjure_glowshroom)
		// HEARTHSTONE ADD: cloistered cleric subclass (lighter armored and equipped)
		if("Temple Devout")
			// Devout start without the typical cleric heavy armor shtick and without much in the way of weapons or skills to use them.
			// They're better with miracles and regenerate devotion passively like the Priest does, however.
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Temple cleric, a devout traveller whom has engressed into distant lands to spread the word of your chosen Patron. Having secluded yourself for many years, your body has suffered... But you have gained great insight as a result!"))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
			H.change_stat("intelligence", 4)
			H.change_stat("strength", -2)
			H.change_stat("perception", 2)
			H.change_stat("speed", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance5e)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/light5e)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_USEMAGIC, TRAIT_GENERIC) //can get magic from spellpoints but no more.
		// HEARTHSTONE ADDITION END

		// Patron-specific subclasses

		if("Sun-Drake") // Elysius
			H.set_blindness(0)
			to_chat(H, span_warning("You are a member of the Sun-Drakes, a distant and esoteric religious order from the distant east. Though their teachings compel that they spill no blood by their hands, and heal all they can, they are certainly not pacifists. Their initiation rites of staring into the sun until they are temporarily blinded oftens lead them to be rather short-sighted."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
			H.change_stat("intelligence", 3)
			H.change_stat("constitution", 2)
			H.change_stat("perception", -2)
			H.change_stat("speed", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance5e)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/conjure/createbonfire5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/light5e)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

		if("Moon-Walker") // Lune
			H.set_blindness(0)
			to_chat(H, span_warning("Most see the Lunen Moon-Walkers as little more than thieves masquerading as clergy, but that is often a clever ploy by the shadowy order. After all, you would expect the ones worshiping the lunar goddess to be active during the night, so one of her devout worshipers staring at the full moon on a rooftop would raise few eyebrows. That your house was scoured clean of 'donations' the next day is merely coincidence."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("constitution", 1)
			H.change_stat("perception", 1)
			H.change_stat("speed", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/rogue_knock)
			ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_USEMAGIC, TRAIT_GENERIC)

		if("Temple Druid") // Sylvarn
			H.set_blindness(0)
			to_chat(H, span_warning("You are a druid, though not of the local Breuddwyd Grove. Your kind often take hold of smaller, more local temples and groves, often being the sole member of Sylvarni clergy. Villages and other small farming communities are often your home, and you are welcome there."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 3, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("strength", 1)
			H.change_stat("endurance", 2)
			H.change_stat("perception", 1)
			H.change_stat("speed", -1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/infestation5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/primalsavagery5e)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_VINE_WALKER, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)

		if("Priest of All Waves") // Abyssia
			H.set_blindness(0)
			to_chat(H, span_warning("\"Priest of All Waves!\" they shout, \"Grant us good tides, calm waves and bountiful waters!\" These are common words you hear from sailors, fishermen, and other peoples living by lakes, rivers and seas. Your fellow sea priests are granted high respect by sailors and sea-men, hoping that your patron will help keep the waves calm and the voyage safe."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/fishing, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 5, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("endurance", 2)
			H.change_stat("perception", 1)
			H.change_stat("speed", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/rayoffrost5e)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

		if("Siege Dancer") // Minhur // Basically a paladin minus with the cleric spells
			H.set_blindness(0)
			to_chat(H, span_warning("THE SONG OF WAR CALLS! The tactics of war, the dance of battle, and the merriment of victory are the voice through which Minhur speaks. Though the more demure of your compatriots and fellow warriors may think you boisterous and loud, they know not the truth of the joy of fulfilling one's duty to the god of war and song."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 1, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/bladeward5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/blade_burst)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

		if("Guider of the Dead") // Yamais
			H.set_blindness(0)
			to_chat(H, span_warning("Though often compared to the Gravesingers, you are considered more the lay clergy of the Yamaian faith. You are the grave-digger, mourner, and the one who prepares the dead for burial. Your connection with the dead through long exposure has caused you to be ignored by the less mindful of the waking dead. (Please don't abuse this to cheese dungeons.)"))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.change_stat("strength", -1)
			H.change_stat("speed", -1)
			H.change_stat("intelligence", 3)
			H.change_stat("endurance", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)

			H.faction |= "undead" // Again, please don't abuse this. Liches should still be aggressive
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

		/*if("Holy Bard") // Onder // To-do until I think of something to give to Onder clerics in general
		*/ // Placeholder

		if("Sidewinder") // Hermeir
			H.set_blindness(0)
			to_chat(H, span_warning("The Sidewinders are a Hermeiran order of alchemists, healers, and, on occasion, poisoners. They are the premier patrons of the Arts, the Work, and the Search. Though often based in large cities and capitals, you have taken to the wilderness and this adventurer-town, whether to learn, to teach, or to experiment, only you can say."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 2, TRUE)
			H.change_stat("strength", -1)
			H.change_stat("speed", -1)
			H.change_stat("intelligence", 4)
			H.change_stat("perception", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/purge)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/poisonspray5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/cure_rot)

			ADD_TRAIT(H, TRAIT_ALCHEMYKNOWLEDGE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)

		if("Child of the Forge") // Svaeryog
			H.set_blindness(0)
			to_chat(H, span_warning("In order to honor your god, you have become a crafter. Though not as specialized as most, you know enough to be useful in any area. Be it metal, stone, cloth or wood, you have dabbled in everything. A true jack-of-all-trades."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/hunting, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/mining, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/lumberjacking, 3, TRUE)
			H.change_stat("strength", 1)
			H.change_stat("speed", -1)
			H.change_stat("intelligence", 2)
			H.change_stat("endurance", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)


			ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC) // Hammer go bonk
			ADD_TRAIT(H, TRAIT_ARMORSMITH, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_WEAPONSMITH, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_ARTIFICER, TRAIT_GENERIC)

		if("Temple Prostitute") // Viiritri
			H.set_blindness(0)
			to_chat(H, span_warning("Despite the suggestive title, Viiritran temple prostitutes are not simply street workers in holy robes, and a decent amount of them shun overly sexual conduct. They are generally performers, therapists and spiritual healers, and often conduct marriage and other ceremonies."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/music, 3, TRUE)
			H.change_stat("strength", -1)
			H.change_stat("speed", 2)
			H.change_stat("intelligence", 2)
			H.change_stat("endurance", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)

			ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DODGEADEPT, TRAIT_GENERIC)

		if("Mana Tender") // Jayx
			H.set_blindness(0)
			to_chat(H, span_warning("Though frequently confused for mere mages, their knowledge of the arcyne magicks comes from devout worship and study, rather than innate talent and pouring over ancient tomes. They are often seen in large temple-complexes, tending to the mana-fires and wards. Though it is not unusual to see one in the wilds, such as you."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.change_stat("strength", -1)
			H.change_stat("speed", 2)
			H.change_stat("intelligence", 4)
			H.change_stat("endurance", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/magicstone5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/encodethoughts5e)

			ADD_TRAIT(H, TRAIT_LEARNMAGIC, TRAIT_GENERIC)

		/*if("Vengeance Placeholder") // Ar-Sgatra
		*/ // Placeholder

		if("Reanimator-Priest") // Levishth
			H.set_blindness(0)
			to_chat(H, span_warning("Though the teachings of the Lord of Envy, Levishth, states that you must acquire power, despite everyone else, some of the more moderate-minded of its adherents have taken to a more helpful path - claiming power from the dead. They have little use for it, after all. In distant, odd villages, Reanimator-Priests are seen as great boons, raising the dead to help with labor, working the fields, or protection. This often leads to superstition and shunning from the more commonly devout peoples, though."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/blood, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.change_stat("intelligence", 4)
			H.change_stat("strength", -1)
			H.change_stat("perception", 2)
			H.change_stat("endurance", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/control_undead)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodsteal)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodlightning)

			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_LEARNMAGIC, TRAIT_GENERIC)
			H.faction |= "undead"

		if("Flesh Sculptor") // Nyrnhe
			H.set_blindness(0)
			to_chat(H, span_warning("Disgust and abominations often follow the Nyrnhene Flesh Sculptors. The goddess of pain demands pain, and pain often begets pain. Many of your fellow Sculptors sew hooks and barbs into their flesh, seeking to get closer to their goddess. Why have you come to these woods? Will you make abominations of mismatched parts and pieces?")) // Dark Eldar haemonculi mixed with Tzimitze
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/blood, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("speed", -1)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/chilltouch5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/attach_bodypart)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/cure_rot)

			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

		if("Thief of Fates") // The Thief
			H.set_blindness(0)
			to_chat(H, span_warning("Thief, pickpocket, burglar. You are known by as many titles and names as your patron, who stole fire from the gods to give unto mortals. You take from those who hoard, whether it be magic, coin, knowledge, or even the souls of the dead, you take from those who will not give, and give to those who cannot share. A terror to the guards and richmen, a savior to the beggars."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("speed", 2)
			H.change_stat("strength", -1)
			H.change_stat("endurance", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/rogue_knock)

			ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_USEMAGIC, TRAIT_GENERIC)
			H.grant_language(/datum/language/thievescant)

		/*
		if("The Offering") // The Sacrifice
		*/ // Placeholder

		if("Fey Enchanter") // Fey Pantheon Combined
			H.set_blindness(0)
			to_chat(H, span_warning("The Fey Enchanters are what passes for clergy among the Feyish divinity. Wanderers, tricksters, teachers in equal parts. Depending on the court they serve, the Enchanter may prove to be a boon, an annoyance, or a curse. Oddly enough, though, despite the court they serve, they all have an odd fascination with hallucinogenics, and as such, their sight has withered somewhat."))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.change_stat("intelligence", 1)
			H.change_stat("perception", -2)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			if(isseelie(H))
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/summon_rat)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/splash)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
				H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/animate_object)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/seelie_dust)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/archfey_warlock_strip)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/archfey_warlock_seelie_kiss)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift)

			ADD_TRAIT(H, TRAIT_USEMAGIC, TRAIT_GENERIC)
			H.grant_language(/datum/language/faexin)

		/*
		if("Cardinal") // Seraph-Iros
		*/ // Placeholder

	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/mace
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/shield/wood
	backpack_contents = list(/obj/item/rogueweapon/huntingknife)
	// everything about this sucks - we should really make a subclass datum or something
	if(classchoice == "Nature Cleric")
		beltr = /obj/item/rogueweapon/sword
		armor = /obj/item/clothing/suit/roguetown/armor/leather
		pants = /obj/item/clothing/under/roguetown/trou
		cloak = /obj/item/clothing/cloak/raincloak/furcloak
		shoes = /obj/item/clothing/shoes/roguetown/boots
	// HEARTHSTONE ADD: cloistered devout custom outfits
	if (classchoice == "Temple Devout")
		// do the generic stuff first then replace it w/ patron specific things... if it exists
		// for reference, cloistered devouts are lightly armored/unarmored but get patron-specific stuff (if applicable) and a devo regen
		head = /obj/item/clothing/head/roguetown/roguehood/black
		armor = /obj/item/clothing/suit/roguetown/shirt/robe
		shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
		wrists = null
		beltr = null
		backr = /obj/item/rogueweapon/woodstaff
		pants = /obj/item/clothing/under/roguetown/tights
		shoes = /obj/item/clothing/shoes/roguetown/boots
		// apply patron-specific outfit alterations
		switch(H.patron?.type)
			if(/datum/patron/divine/elysius)
				head = /obj/item/clothing/head/roguetown/roguehood/astrata
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/astrata
				beltr = /obj/item/flashlight/flare/torch/lantern // you are the lightbringer
			if(/datum/patron/divine/lune)
				head =  /obj/item/clothing/head/roguetown/roguehood/nochood
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/noc
				pants = /obj/item/clothing/under/roguetown/tights/black
				belt = /obj/item/storage/belt/rogue/leather/black
			if(/datum/patron/divine/yamais)
				head = /obj/item/clothing/head/roguetown/necrahood
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/necra
				pants = /obj/item/clothing/under/roguetown/trou/leather/mourning
			if(/datum/patron/divine/sylvarn)
				head = /obj/item/clothing/head/roguetown/dendormask
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
				pants = /obj/item/clothing/under/roguetown/loincloth
				belt = /obj/item/storage/belt/rogue/leather/rope
				shoes = /obj/item/clothing/shoes/roguetown/sandals
			if(/datum/patron/divine/onder)
				head = /obj/item/clothing/head/roguetown/roguehood/tricksterhood
			if(/datum/patron/old_god)
				head = /obj/item/clothing/head/roguetown/psydonhood
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/psydonrobe
			if(/datum/patron/divine/viiritri)
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/eora
			if(/datum/patron/divine/jayx)
				armor = /obj/item/clothing/suit/roguetown/shirt/robe
				if(H.mind)
					H.mind.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
					H.mind.adjust_spellpoints(1)
	// HEARTHSTONE ADDITION END

	// Patron-specific subclasses

	if (classchoice == "Sun-Drake")
		cloak = /obj/item/clothing/cloak/templar/astrata
		armor = /obj/item/clothing/suit/roguetown/armor/plate/nephilimchest
		shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
		wrists = /obj/item/clothing/wrists/roguetown/nephilbracers
		pants = null
		shoes = /obj/item/clothing/shoes/roguetown/nephilimsandals
		head = /obj/item/clothing/head/roguetown/helmet/nephilhelm
		neck = /obj/item/clothing/neck/roguetown/nephilbervor
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/flashlight/flare/torch/lantern
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		backl = /obj/item/storage/backpack/rogue/satchel
		backr = null
		r_hand = /obj/item/rogueweapon/mace/goden/steel
		backpack_contents += /obj/item/clothing/neck/roguetown/psicross/astrata


	if (classchoice == "Moon-Walker")
		head =  /obj/item/clothing/head/roguetown/roguehood/nochood
		cloak = /obj/item/clothing/suit/roguetown/shirt/robe/noc
		armor = /obj/item/clothing/suit/roguetown/armor/leather/advanced
		pants = /obj/item/clothing/under/roguetown/tights/black
		belt = /obj/item/storage/belt/rogue/leather/black
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather
		neck = /obj/item/clothing/neck/roguetown/psicross/noc
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/rogueweapon/huntingknife/idagger
		backl = /obj/item/storage/backpack/rogue/satchel
		backr = null
		backpack_contents += /obj/item/lockpickring/mundane

	if (classchoice == "Temple Druid")
		shoes = /obj/item/clothing/shoes/roguetown/boots/forestershoes
		gloves = /obj/item/clothing/gloves/roguetown/forestergauntlets
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/rogueweapon/huntingknife/skin
		beltr = /obj/item/flashlight/flare/torch/lantern
		backl = /obj/item/storage/backpack/rogue/satchel
		backr = /obj/item/rogueweapon/woodstaff/aries
		head = /obj/item/clothing/head/roguetown/antlerhood
		neck = /obj/item/clothing/neck/roguetown/psicross/dendor
		armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
		shirt = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
		backpack_contents = list(/obj/item/rogueweapon/sickle,/obj/item/clothing/head/roguetown/dendormask)

	if (classchoice == "Priest of All Waves")
		backr = /obj/item/fishingrod
		neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
		head = /obj/item/clothing/head/roguetown/helmet/carapacecap
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		armor = /obj/item/clothing/suit/roguetown/armor/carapace/cuirass
		cloak = /obj/item/clothing/cloak/raincloak/yellow
		wrists = /obj/item/rope
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		belt =/obj/item/storage/belt/rogue/leather
		beltl = /obj/item/rogueweapon/sword/cutlass
		pants = /obj/item/clothing/under/roguetown/tights/sailor
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		backpack_contents = list(/obj/item/natural/worms = 2,/obj/item/rogueweapon/shovel/small= 1, /obj/item/cooking/pan = 1, /obj/item/rogueweapon/huntingknife = 1)

	if (classchoice == "Siege Dancer")

		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
		neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
		head = /obj/item/clothing/head/roguetown/helmet/ironpothelmet
		armor = /obj/item/clothing/suit/roguetown/armor/plate/half
		pants = /obj/item/clothing/under/roguetown/chainlegs/iron
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		cloak = /obj/item/clothing/cloak/templar/ravox
		backl = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/huntingknife,/obj/item/clothing/neck/roguetown/psicross/ravox)

	if (classchoice == "Guider of the Dead")
		head = /obj/item/clothing/head/roguetown/necrahood
		neck = /obj/item/clothing/neck/roguetown/psicross/necra
		gloves = /obj/item/clothing/gloves/roguetown/surggloves
		cloak = /obj/item/clothing/cloak/templar/necra
		wrists = null
		shirt = null
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/necra
		pants = /obj/item/clothing/under/roguetown/tights/black
		shoes = /obj/item/clothing/shoes/roguetown/boots
		belt = /obj/item/storage/belt/rogue/leather/blackleather
		backl = /obj/item/storage/backpack/rogue/satchel
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		backr = /obj/item/rogueweapon/shovel
		backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/silver, /obj/item/storage/fancy/skit)

	//if (classchoice == "Holy Bard?")


	if (classchoice == "Sidewinder")
		head = /obj/item/clothing/head/roguetown/roguehood/feldhood
		neck = /obj/item/clothing/neck/roguetown/psicross/pestra
		gloves = /obj/item/clothing/gloves/roguetown/feldgloves
		cloak = /obj/item/clothing/cloak/templar/pestra
		wrists = /obj/item/clothing/wrists/roguetown/wrappings
		shirt = null
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/feldrobe
		pants = /obj/item/clothing/under/roguetown/tights/random
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		backl = /obj/item/storage/backpack/rogue/satchel
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltl = /obj/item/rogueweapon/huntingknife
		backr = /obj/item/rogueweapon/woodstaff
		backpack_contents = list(/obj/item/reagent_containers/glass/mortar, /obj/item/roguegem/violet, /obj/item/roguegem/yellow, /obj/item/flashlight/flare/torch/lantern/bronzelamptern)

	if (classchoice == "Child of the Forge")
		gloves = /obj/item/clothing/gloves/roguetown/leather
		cloak = /obj/item/clothing/cloak/apron/blacksmith
		pants = /obj/item/clothing/under/roguetown/trou
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		if(H.gender == MALE)
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
			armor = null
		else
			armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
			shirt = null
		neck = /obj/item/clothing/neck/roguetown/psicross/malum
		belt = /obj/item/storage/belt/rogue/leather
		backl = /obj/item/storage/backpack/rogue/satchel
		backr = null
		beltr = /obj/item/rogueweapon/hammer
		beltl = /obj/item/rogueweapon/tongs
		backpack_contents = list(/obj/item/rogueweapon/huntingknife, /obj/item/flint, /obj/item/storage/belt/rogue/pouch/coins/mid)

	if (classchoice == "Temple Prostitute")
		head = /obj/item/clothing/head/roguetown/eoramask
		neck = /obj/item/clothing/neck/roguetown/psicross/eora
		gloves = null
		cloak = /obj/item/clothing/cloak/templar/eora
		wrists = /obj/item/rope
		shirt = null
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/eora
		pants = null
		shoes = /obj/item/clothing/shoes/roguetown/sandals
		belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		backl = /obj/item/storage/backpack/rogue/satchel
		beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
		beltl = /obj/item/rogueweapon/huntingknife
		backr = /obj/item/rogueweapon/woodstaff
		backpack_contents = list(/obj/item/dildo/silver, /obj/item/clothing/head/peaceflower)

	if (classchoice == "Mana Tender")
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		pants = /obj/item/clothing/under/roguetown/tights/black
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		armor = /obj/item/clothing/suit/roguetown/armor/silkcoat
		belt = /obj/item/storage/belt/rogue/leather/rope
		beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
		backl = /obj/item/storage/backpack/rogue/satchel
		backr = /obj/item/rogueweapon/woodstaff/wise
		neck = /obj/item/clothing/neck/roguetown/psicross/silver // There's no jayx-specific amulet T-T
		backpack_contents += /obj/item/scrying
		if(H.mind)
			H.mind.adjust_spellpoints(1)

	//if (classchoice == "Vengeance Placeholder")

	if (classchoice == "Reanimator-Priest")
		neck = /obj/item/clothing/neck/roguetown/psicross/skull
		gloves = null
		wrists = /obj/item/clothing/wrists/roguetown/wrappings
		shirt = null
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/surgrobe
		pants = /obj/item/clothing/under/roguetown/tights/random
		shoes = /obj/item/clothing/shoes/roguetown/boots
		belt = /obj/item/storage/belt/rogue/leather/black
		backl = /obj/item/storage/backpack/rogue/satchel
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltl = /obj/item/rogueweapon/huntingknife
		backr = /obj/item/rogueweapon/woodstaff
		backpack_contents = list(/obj/item/candle/skull)

	if (classchoice == "Flesh Sculptor")
		neck = /obj/item/clothing/neck/roguetown/psicross/skull
		gloves = /obj/item/clothing/gloves/roguetown/surggloves
		wrists = null
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/webs
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/surgrobe
		pants = /obj/item/clothing/under/roguetown/webs
		shoes = /obj/item/clothing/shoes/roguetown/boots
		belt = /obj/item/storage/belt/rogue/leather/black
		backl = /obj/item/storage/backpack/rogue/satchel
		beltr = /obj/item/rogueweapon/huntingknife/cleaver
		beltl = /obj/item/rogueweapon/whip
		backr = null
		backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor, /obj/item/storage/fancy/skit)

	if (classchoice == "Thief of Fates")
		cloak = pick(/obj/item/clothing/suit/roguetown/shirt/robe/noc,/obj/item/clothing/suit/roguetown/shirt/robe/dendor,/obj/item/clothing/suit/roguetown/shirt/robe/necra,/obj/item/clothing/suit/roguetown/shirt/robe/feldrobe,/obj/item/clothing/suit/roguetown/shirt/robe/surgrobe)
		armor = /obj/item/clothing/suit/roguetown/armor/leather/advanced
		pants = /obj/item/clothing/under/roguetown/webs
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/webs
		belt = /obj/item/storage/belt/rogue/leather/black
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather
		neck = /obj/item/clothing/neck/roguetown/psicross/skull
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/rogueweapon/huntingknife/idagger
		backl = /obj/item/storage/backpack/rogue/satchel
		backr = null
		backpack_contents += /obj/item/lockpickring/mundane

	//if (classchoice == "The Offering")


	if (classchoice == "Fey Enchanter")
		shoes = /obj/item/clothing/shoes/roguetown/jester
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/jester
		armor = null
		neck = null
		belt = /obj/item/storage/belt/rogue/leather/cloth
		beltr = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
		wrists = /obj/item/clothing/neck/roguetown/psicross/wood
		backl = /obj/item/storage/backpack/rogue/satchel
		backr = /obj/item/rogueweapon/woodstaff/wise
		backpack_contents = list(/obj/item/reagent_containers/powder/moondust, /obj/item/reagent_containers/powder/ozium)

	//if (classchoice == "Cardinal")



	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	// HEARTHSTONE ADDITION: cloistered devout devo regen & tier buff
	if (classchoice == "Temple Devout" || classchoice == "Mana Tender" || classchoice == "Fey Enchanter" || classchoice == "Reanimator-Priest" || classchoice == "Moon-Walker" || classchoice == "Flesh Sculptor")
		C.grant_spells_devout(H)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 1, TRUE)
		H.mind.adjust_spellpoints(2)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	else
		C.grant_spells_cleric(H)
	// HEARTHSTONE ADDITION END
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	if(H.mind?.get_skill_level(/datum/skill/magic/arcane))
		H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)

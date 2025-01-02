/datum/patron/inhumen
	name = null
	associated_faith = /datum/faith/inhumen
	undead_hater = FALSE
	confess_lines = list(
		"GRRRRR!",
		"GRRRRRRRRRRRR!!",
		"RAAAAAAAAAAAGH!!!!",
	)

/datum/patron/inhumen/levishth
	name = "Levishth"
	domain = "God of Chaos and Lies; the great manipulator. He who covets power for the sake of power and nothing else."
	desc = "Discovered long ago, Levisth gives power to the weak who do his bidding,elevating them in time. There are many tales of those who serve the greatsnake, all which eventuate with tales of how it yearns to gain power over all things, jealous of it's 'rivals' the other gods."
	worshippers = "Power-Hungry, Powerful, Charismatic, Liers."
	mob_traits = list(TRAIT_NASTY_EATER, TRAIT_SNEK, TRAIT_ZOMBIE_IMMUNE) //had to add zombie immune so as not to double dip when making the infection immune
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal_inhumen
	t1 = /obj/effect/proc_holder/spell/invoked/eldritchhealing/any
	t2 = /obj/effect/proc_holder/spell/invoked/raise_undead
	t3 = /obj/effect/proc_holder/spell/invoked/strengthen_undead //wrong spell
	t4 = /obj/effect/proc_holder/spell/invoked/revive_inhumen
	confess_lines = list(
		"Praisssse the Greatssssnake!!",
		"LONG LIVE HISSSS FORM!!",
		"HISSSSSSS!!!",
	)

/datum/patron/inhumen/nyrnhe
	name = "Nyrnhe" //Here she comes. It's her. Goddess of pain-fliction. It's Nyrnhe!
	domain = "God of Pain and Suffering."
	desc = "Nyrnhe, Goddess of many dark elves - mistress of pain, suffering and venoms. Nyrnhe revels in pain-giving, pain-receiving and suffering. Contrary to belief; to kill is against her creed in comparison to the struggle and entropy."
	worshippers = "Assasins, Alchemists, Torturers, Dark Elves, Cruel folk, Masochists."
	mob_traits = list(TRAIT_USEMAGIC)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal_inhumen
	t1 = /obj/effect/proc_holder/spell/invoked/eldritchhealing/any
	t2 = /obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e
	t3 = /obj/effect/proc_holder/spell/targeted/lightninglure5e
	t4 = /obj/effect/proc_holder/spell/invoked/revive_inhumen
	confess_lines = list(
		"YES, YES!!!",
		"MORE, MORE!!",
		"Nyrnhe, witness my anguish! Witness my wounds!",
	)

/datum/patron/inhumen/thief		// Removing 'class warfare' language in favor of 'uncivilized v civilized' language.
	name = "The Thief"
	domain = "Thievery. Cunning. "
	desc = "Man turned God, the 'Giver' 'The Thief' stole fire from 'Elysius' and gave it to primitive Mortal Kin huddled in darkness and demands the riches flame creates in sacrifice."
	worshippers = "Free-Men, Outlaws and Frontiersmen"
	mob_traits = list(TRAIT_COMMIE, TRAIT_GOODRUNNER)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal_inhumen
	t1 = /obj/effect/proc_holder/spell/invoked/Joy_takes_flight
	t2 = /obj/effect/proc_holder/spell/invoked/Laughing_god
	t3 = /obj/effect/proc_holder/spell/invoked/Smokebomb
	t4 = /obj/effect/proc_holder/spell/invoked/revive_inhumen/thief
	confess_lines = list(
		"I TAKE WITH SKILLED AND NIMBLE HANDS!",
		"MY NAME IS WITHOUT BEARING!",
		"FACELESS LORD, STEAL AWAY MY SORROWS!",
	)

/datum/patron/inhumen/sacrifice
	name = "The Sacrifice"
	domain = "Void, Loss, Absence, Nihility."
	desc = "The Sacrifice wishes to take from you, and for you to give it willingly. You will never get it back if you go too far. But you will always have the sacrifice."
	worshippers = "Nihilists, Gamblers, Warlocks, and Villains."
	mob_traits = list(TRAIT_CRACKHEAD)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal_inhumen
	confess_lines = list(
		"I do not yearn for anything!!",
		"I CANNOT LOSE WHAT I COULD NEVER HOPE TO HOLD!",
		"THERE IS NO LOSS, THERE IS NO LIE! THERE IS ONLY SACRIFICE!",
		"IT'S ALL OBLIVION IN THE END FOR ME!",
)

/datum/patron/inhumen
	name = null
	associated_faith = /datum/faith/inhumen
	undead_hater = FALSE
	confess_lines = list(
		"GRRRRR!",
		"GRRRRRRRRRRRR!!",
		"RAAAAAAAAAAAGH!!!!",
	)

/datum/patron/inhumen/zizo
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

/datum/patron/inhumen/graggar
	name = "Jayx"
	domain = "God of Twilight and Change. Magic. Transformation. Dusk/Dawn. Crisis/Resolution."
	desc = "Jayx is known as the Herald of change, often depicted as a two-tailed comet or Phoenix. The Divine Phoenix represents the immortal cycle of growth and advancement, often a god of both magic and art; they are known more than anything as the passage of time itself and bright blue magical fire. (Mana)"
	worshippers = "Mages, Alchemists, Soul-Searchers, Fateweavers, Supernatural Creatures, Soothsayers."
	mob_traits = list(TRAIT_USEMAGIC)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal_inhumen //inhumen for now until foxyn moves this shit to divine
	t1 = /obj/effect/proc_holder/spell/invoked/projectile/arcanebolt
	t2 = /obj/effect/proc_holder/spell/targeted/projectile/magic_missile
	t3 = /obj/effect/proc_holder/spell/invoked/invisibility
	t4 = /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater
	confess_lines = list(
		"THE PHOENIX BURNS BRIGHT AND PURE!",
		"IN HIS FLAMES I AM REBORN!",
		"JAYX, LET THE TWILIGHT BE RECKONED!",
	)

/datum/patron/inhumen/matthios		// Removing 'class warfare' language in favor of 'uncivilized v civilized' language.
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
		"THIEFLORD'S GIFT CONSUME YOU!",
		"THE GIVER IS OWED HIS SACRIFICE!",
	)

/datum/patron/inhumen/baotha
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

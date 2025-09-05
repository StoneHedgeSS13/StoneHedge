/datum/patron/fae
	name = null
	associated_faith = /datum/faith/fae
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/fae/lathrandyr
	name = "Lathrandyr"
	domain = "The Spring Monarch, Court of Life and Light."
	desc = "Spring and it's personifactions flow through him. Those who follow him are said to be ever-young. They dance in the life all around them."
	worshippers = "Spring-Affiliated Fae, Elves, Fey-Pact Warlocks. Followers of the Spring Court."
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY)
	undead_hater = TRUE
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/archfey_warlock_seelie_kiss
	t3 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom
	t4 = /obj/effect/proc_holder/spell/invoked/revive
	confess_lines = list(
		"Spring courts oath, I serve the Evergreen!",
		"This plane is one of many, lodestar protect!",
		"GOOD-KING PROTECT ME!!",
		"lathrandyr, GUIDE ME!",
	)

/datum/patron/fae/tashari
	name = "Tashari"
	domain = "The Winter Monarch, Court of Ice and Shadows."
	desc = "Winter and it's personifications flow through her. Those who follow her are often said to be cold and deeply emotive. They form icicles in their hearts and wield them as daggers."
	worshippers = "Winter-Affiliated Fae, Elves, Fey-Pact Warlocks. Those who follow the court of winter."
	mob_traits = list(TRAIT_EMPATH)
	undead_hater = FALSE
	t1 = /obj/effect/proc_holder/spell/invoked/projectile/rayoffrost5e
	t2 = /obj/effect/proc_holder/spell/invoked/invisibility
	// t3 = Snowstorm spell? Retextured arcane storm?
	confess_lines = list(
		"Winter courts oath, I serve the Cold Queene!",
		"I FEAR NOT THE FROZEN CLASP OF WINTER!",
		"ICEQUEEN, FORSAKE THEM!",
		"TASHARI, CURSE THEM!",
	)

/datum/patron/fae/menrhue
	name = "Menrhue"
	domain = "The Autumn Monarch, Court of Fear and Death."
	desc = "Autumn and its personifications flow through them. Those that follow autumn are known for their delight in fear, and their ties to the other side. They are steeled against evils and nightmares more than most."
	worshippers = "Autumn-Affiliated Fae, Elves, Fey-Pact Warlocks. Those who follow the court of Autumn."
	mob_traits = list(TRAIT_EMPATH)
	// Fear/direct damage spells? I think the mob flee code is too janky to rely on for it
	undead_hater = FALSE
	confess_lines = list(
		"Autumn courts oath, I serve the The Autumn Monarch!",
		"I am UNSHACKLED from the terrors of DEATH!",
		"Monarch of Autumn, forgive their fears!",
		"Menrhue, haunt them!",
	)

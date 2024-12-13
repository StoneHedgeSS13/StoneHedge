/datum/patron/norse/odin
	name = "Lathrandyr"
	domain = "The Summer King, Court of Fire and Light."
	desc = "Summer and it's personifactions flow through him. Those who follow him are said to be bright and deeply passionate. They form swords from promises, protecting what is dear to them by fighting darkness."
	worshippers = "Kings, Warriors, Chieftains."
	associated_faith = /datum/faith/norse
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY, TRAIT_VIKINGCAMP, TRAIT_NORTHMAN)
	undead_hater = TRUE
	confess_lines = list(
		"Summer courts oath, I serve the Summer King!",
		"This plane is one of many, lodestar protect!",
		"GOOD-KING PROTECT ME!!",
		"lathrandyr, GUIDE ME!",
	)

/datum/patron/norse/loki
	name = "Tashari"
	domain = "The Winter Queen, Court of Ice and Shadows."
	desc = "Winter and it's personifications flow through her. Those who follow her are often said to be cold and deeply emotive. They form icicles in their hearts and wield them as daggers."
	worshippers = "Those who follow the court of winter."
	associated_faith = /datum/faith/norse
	mob_traits = list(TRAIT_EMPATH, TRAIT_VIKINGCAMP, TRAIT_NORTHMAN)
	undead_hater = FALSE
	confess_lines = list(
		"Winter courts oath, I serve the Winter-Queen!",
		"I FEAR NOT THE FROZEN CLASP OF DEATH!",
		"ICEQUEEN, FORSAKE THEM!",
		"TASHARI, CURSE THEM!",
	)

/datum/patron/faerun
	abstract_type = /datum/patron/faerun
	name = null
	associated_faith = /datum/faith/faerun/neutral_gods
	preference_accessible = TRUE

/datum/patron/faerun/neutral_gods
	abstract_type = /datum/patron/faerun/neutral_gods
	name = null
	associated_faith = /datum/faith/faerun/neutral_gods
	profane_words = list()

/datum/patron/faerun/neutral_gods/Helm
	name = "Helm"
	domain = "Guardianship, Vigilance, Duty"
	desc = "The Watcher, unblinking and stern, devoted to eternal vigilance."
	flaws = "Emotionally distant, uncompromising; duty outweighs compassion."
	worshippers = "Guards, mercenaries, wardens, disciplined knights."
	sins = "Negligence, shirking duty, falling asleep on watch."
	boons = "Enhanced vigilance, unbreakable defense, clarity of purpose."

	confess_lines = list(
		"I remain vigilant, that others may sleep in peace!"
	)

/datum/patron/faerun/neutral_gods/Mystra
	name = "Mystra"
	domain = "Magic, Knowledge, Balance"
	desc = "Mother of All Magic, governing the Weave with careful precision."
	flaws = "Overly cautious; hides truths to protect magic’s balance."
	worshippers = "Mages, sages, arcane institutions."
	sins = "Misuse of magic, destabilizing the Weave, forbidden spellcraft."
	boons = "Arcane clarity, safer spellcasting, access to hidden lore."

	confess_lines = list(
		"Guide my hand through the Weave, and let my magic be in harmony!"
	)

/datum/patron/faerun/neutral_gods/Oghma
	name = "Oghma"
	domain = "Knowledge, Inspiration, Invention"
	desc = "Patron of ideas, creation, and the power of words."
	flaws = "Absent-minded; values knowledge over mortal consequences."
	worshippers = "Scholars, scribes, inventors, bards."
	sins = "Hoarding knowledge, destroying lore, suppressing creativity."
	boons = "Inspiration, recall of forgotten truths, mental clarity."

	confess_lines = list(
		"Let every thought be a seed of truth and wonder!"
	)

/datum/patron/faerun/neutral_gods/Tempus
	name = "Tempus"
	domain = "War, Courage, Battle"
	desc = "Neutral god of honorable warfare and bravery tempered by respect."
	flaws = "Indifferent to victory or loss; battle itself is the goal."
	worshippers = "Soldiers, mercenaries, warlords, duelists."
	sins = "Cowardice, treachery, cruelty in battle."
	boons = "Battle frenzy, martial prowess, blessings of honorable combat."

	confess_lines = list(
		"May my blade strike true and my courage never falter!"
	)

/datum/patron/faerun/neutral_gods/Tymora
	name = "Tymora"
	domain = "Luck, Adventure, Fortune"
	desc = "Lady Luck, smiling upon the bold and daring."
	flaws = "Fickle; blessings change with the winds of chance."
	worshippers = "Adventurers, gamblers, daredevils, explorers."
	sins = "Cowardice, stagnation, manipulating fate unjustly."
	boons = "Sudden fortune, narrow escapes, daring inspiration."

	confess_lines = list(
		"Fortune favor me, for I walk where others dare not!"
	)

/datum/patron/faerun/neutral_gods/Silvanus
	name = "Silvanus"
	domain = "Nature, Renewal, Wild Balance"
	desc = "The Oak Father, ancient and impartial guardian of the wilds, who ensures that nature’s cycle of growth, decay, and rebirth continues unbroken."
	flaws = "Indifferent to civilization; allows disasters and predation as natural balance; difficult for mortals to understand."
	worshippers = "Druids, rangers, hermits, foresters, those who rely on or protect the wild."
	sins = "Disturbing natural balance, needless exploitation of land, killing without purpose."
	boons = "Regeneration, communion with nature, protection of beasts and plants, resilience like ancient wood."

	confess_lines = list(
		"As the forest endures, so does my spirit; may my actions honor the cycle unbroken!"
	)

/datum/patron/faerun/neutral_gods/Jergal
	name = "Jergal"
	domain = "Fatalism, Records of the Dead, Passive Undeath, Oblivion"
	desc = "The Scribe of the Doomed, ancient and emotionless seneschal of the dead who records every mortal’s doom with perfect neutrality. Once a mighty god of death, now a cold administrator overseeing the cosmic order of endings."
	flaws = "Utterly apathetic; refuses to intervene even when imbalance is evident; obsessed with inevitability over justice or mercy."
	worshippers = "Sages, undertakers, monks seeking detachment, necromancers fascinated by fate rather than power."
	sins = "Interfering with destined death, altering fate for personal gain, destroying records or history."
	boons = "Knowledge of fate, resistance to undeath, calm mastery over fear of death, glimpses of inevitable outcomes."

	confess_lines = list(
		"My end is written, and in accepting it, I find stillness!"
	)

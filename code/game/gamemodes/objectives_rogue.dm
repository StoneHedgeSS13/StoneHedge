/datum/objective/bandit
	name = "the dragons hoarde"
	explanation_text = "Your band of merry men made a camp in the underdark, eventually you drew the attention of the  Black dragons who called it home; and they compelled your lot to work with them. You might hold a tentative relationship with the underkeep; offering them slaves who no longer hold any gold for your dragon master - the Hoard Keeper. She needs the gold to replace her wounded and exposed skin; having fallen in battle against those accursed adventurers long past. Whichever reason you serve; be it personal gain or allegiance to the dragon and their boons -- you are an enemy of Stone Hedge. Be careful to see your mission through."

/datum/objective/bandit/check_completion()
	if(SSticker.mode)
		var/datum/game_mode/chaosmode/C = SSticker.mode
		if(C.banditcontrib >= C.banditgoal)
			return TRUE

/datum/objective/bandit/update_explanation_text()
	..()
	if(SSticker.mode)
		var/datum/game_mode/chaosmode/C = SSticker.mode
		if(C)
			explanation_text = "Feed [C.banditgoal] mammon to an idol of greed."
		else
			explanation_text = "Pray to LEVISHTH."


/datum/objective/delf
	name = "delf"
	explanation_text = "Feed honeys to the mother."

/datum/objective/delf/check_completion()
	if(SSticker.mode)
		var/datum/game_mode/chaosmode/C = SSticker.mode
		if(C.delfcontrib >= C.delfgoal)
			return TRUE

/datum/objective/delf/update_explanation_text()
	..()
	if(SSticker.mode)
		var/datum/game_mode/chaosmode/C = SSticker.mode
		if(C)
			explanation_text = "Feed [C.delfgoal] honeys to the mother."
		else
			explanation_text = "Pray to LEVISHTH."

/datum/objective/werewolf
	name = "the beast of two halves"
	explanation_text = "You have come to find yourself afflicted with the curse or gift of Lycanthropy. Each night, the moon effects you to varying degrees; causing you to shift into 'the beast' within. Your primal urges to grow your clan and survive are heightened; as is your desire to hunt. The older or more wisened can rationalize with their beast; holding back their instincts at the cost of mental duress -- the druids and fae have long taken your ilk in; offering to help those afflicted around this forest. Perhaps you can co-exist. Perhaps you will be hunted by those you once loved."
	team_explanation_text = "Lycanthropy is said to be a wyldcurse, caused by the magicks of the feywylde. It is considered a gift and a curse; causing violent transformations that take time and practice to gain control and overcome. Sylvarhn, Viriitri and Lune are said to offer guidance to the Lycanthropes; offering them visions distorted amidst the often jagged memories of what occured during their transformation."
	triumph_count = 5

/datum/objective/werewolf/check_completion()
	var/datum/game_mode/chaosmode/C = SSticker.mode
	if(istype(C))
		if(C.vampire_werewolf() == "werewolf")
			return TRUE

/datum/objective/vampire
	name = "the blood that binds"
	explanation_text = "You are a viscount of a vampiric clan in the underdark; you are currently stationed in this border-fortress near an adventurer-city called Stone Hedge; a once-high elf city that then became a wood elf town. Your goal is to grow the size of your clan by whatever means necesarry; so that you may easily feed and work your presence into the night to sew the discord of Lavishth's will."
	team_explanation_text = "The feud between werewolves and vampires reaches back to the dawn of time. Long have those with natures curse fought against unlife; compelled by the moon-godesses treacherous voice to your lord Lavishth."
	triumph_count = 5

/datum/objective/vampire/check_completion()
	var/datum/game_mode/chaosmode/C = SSticker.mode
	if(istype(C))
		if(C.vampire_werewolf() == "vampire")
			return TRUE

/datum/objective/maniac
	name = "the dream is all there is"
	explanation_text = "She came to me in my dreams and bid me to swear my heart to her. Now I wield their power; though I can't help but to see the worlds colliding all around us. I must open and close the doors. I must listen to their dreams."
	flavor = "Dream"

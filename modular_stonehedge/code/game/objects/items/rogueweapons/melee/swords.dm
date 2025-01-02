/obj/item/rogueweapon/sword/rapier/combattante
	name = "duelling sword"
	desc = "Signature weapon of the Combattante Duellists. Considered the pride of the guild, the blade's spiralling design towards the hilt both mimics the Association's logo and is excellent for parrying"
	possible_item_intents = list(/datum/intent/sword/thrust/combattante, /datum/intent/sword/cut/rapier)
	minstr = 5
	icon_state = "rapier_combattante" //credit to lobcorp 13, edited a bit to make it darker, would need a new sprite and icon.

/datum/intent/sword/thrust/combattante
	clickcd = 8
	penfactor = 40

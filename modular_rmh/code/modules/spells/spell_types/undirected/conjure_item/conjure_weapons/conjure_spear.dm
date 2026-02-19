/obj/item/weapon/polearm/spear/steel/assegai/conjured
	sellprice = 0

/datum/action/cooldown/spell/undirected/conjure_item/conjure_spear
	name = "Conjure Spear"
	desc = "Summons a spectral spear that persists for a short time before fading away."
	button_icon_state = "moondagger"
	sound = 'sound/magic/whiteflame.ogg'

	invocation = "ARMA VOCARE!"
	invocation_type = INVOCATION_SHOUT

	associated_skill = /datum/skill/magic/arcane
	cooldown_time = 10 MINUTES
	invocation_type = INVOCATION_NONE

	item_type = /obj/item/weapon/polearm/spear/steel/assegai/conjured

	item_duration = 10 MINUTES
	item_outline ="#ababab"
	spell_type = SPELL_STAMINA //It is a way to balance it out since you are not a real miracle user.
	spell_cost = 40

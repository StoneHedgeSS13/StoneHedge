/datum/action/cooldown/spell/undirected/conjure_item/aphrodisiac_bomb
	name = "Aphrodisiac Bomb"
	desc = "Summons a Aphrodisiac-Bomb out of somewhere."
	button_icon_state = "love"
	sound = 'sound/magic/whiteflame.ogg'


	cooldown_time = 2 MINUTES
	invocation_type = INVOCATION_NONE
	associated_skill = /datum/skill/craft/alchemy
	item_type = /obj/item/smokebomb/aphrodisiac
	item_duration = null
	item_outline = "#FF00B4"
	delete_old = FALSE
	spell_type = SPELL_STAMINA
	spell_cost = 30

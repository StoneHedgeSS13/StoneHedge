/datum/action/cooldown/spell/undirected/conjure_item/sleeping_bomb
	name = "Sleeping Bomb"
	desc = "Summons a Sleeping-Bomb out of somewhere."
	button_icon_state = "sands_of_time"
	sound = 'sound/magic/whiteflame.ogg'


	cooldown_time = 2 MINUTES
	invocation_type = INVOCATION_NONE
	associated_skill = /datum/skill/craft/alchemy
	item_type = /obj/item/smokebomb/sleeping
	item_duration = null
	item_outline = "#9C3636"
	delete_old = FALSE
	spell_type = SPELL_STAMINA
	spell_cost = 30

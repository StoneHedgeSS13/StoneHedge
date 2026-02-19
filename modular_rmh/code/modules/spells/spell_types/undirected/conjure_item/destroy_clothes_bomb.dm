/datum/action/cooldown/spell/undirected/conjure_item/destroy_clothes_bomb
	name = "Destroy Clothes Bomb"
	desc = "Summons a Destroy-Clothes-Bomb out of somewhere."
	button_icon_state = "comedy"
	sound = 'sound/magic/whiteflame.ogg'


	cooldown_time = 2 MINUTES
	invocation_type = INVOCATION_NONE
	associated_skill = /datum/skill/craft/alchemy
	item_type = /obj/item/smokebomb/destroy_clothes
	item_duration = null
	item_outline = "#6a00ffc6"
	delete_old = FALSE
	spell_type = SPELL_STAMINA
	spell_cost = 30

/mob/living/simple_animal/hostile/retaliate/bat/crow
	name = "crow"
	desc = "CAW! CAW! CAW!"
	icon = 'modular_rmh/icons/mob/monster/crow.dmi'
	icon_state = "crow_flying"
	icon_living = "crow_flying"
	icon_dead = "crow1"
	icon_gib = "crow1"
	speak_emote = list("caws")
	base_intents = list(/datum/intent/unarmed/help)
	harm_intent_damage = 0
	melee_damage_lower = 0
	melee_damage_upper = 0
	remains_type = /obj/effect/decal/remains/crow

/obj/effect/decal/remains/crow
	name = "crow remains"
	desc = "Nevermore..."
	gender = PLURAL
	icon_state = "crow1"
	icon = 'modular_rmh/icons/mob/monster/crow.dmi'

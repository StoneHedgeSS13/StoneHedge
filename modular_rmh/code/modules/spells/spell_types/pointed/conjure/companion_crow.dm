/mob/living/simple_animal/hostile/retaliate/bat/crow/companion
	name = "companion crow"
	desc = "A crow companion."
	speak_emote = list("caws")
	base_intents = list(/datum/intent/simple/bite)
	faction = list("summoned")
	mob_biotypes = MOB_BEAST
	harm_intent_damage = 15
	melee_damage_lower = 5
	melee_damage_upper = 15
	food_type = list(/obj/item/reagent_containers/food/snacks/meat, /obj/item/bodypart, /obj/item/organ)
	pooptype = null
	deaggroprob = 0
	defprob = 60
	defdrain = 10
	retreat_health = 0.1
	attack_sound = list('sound/vo/mobs/bird/CROW_01.ogg','sound/vo/mobs/bird/CROW_02.ogg','sound/vo/mobs/bird/CROW_03.ogg')
	dodgetime = 20
	aggressive = 1
	remains_type = null
	botched_butcher_results = null
	butcher_results = null
	perfect_butcher_results = null
	head_butcher = null
	del_on_death = TRUE
	dendor_taming_chance = DENDOR_TAME_PROB_NONE

	ai_controller = /datum/ai_controller/summon

//SPELL

/datum/action/cooldown/spell/conjure/companion_crow
	name = "Companion Crow"
	desc = "Summons a temporary companion crow to aid you."
	button_icon_state = "familiar"
	self_cast_possible = FALSE

	point_cost = 2

	sound = 'sound/magic/whiteflame.ogg'

	invocation = "GET THEM, BOY!"
	invocation_type = INVOCATION_SHOUT

	charge_time = 1 SECONDS
	charge_drain = 1
	charge_slowdown = 1.3
	cooldown_time = 2 MINUTES
	spell_cost = 15
	spell_flags = SPELL_RITUOS
	summon_type = list(/mob/living/simple_animal/hostile/retaliate/bat/crow/companion)
	summon_radius = 0
	summon_lifespan = 5 MINUTES

	attunements = list(
		/datum/attunement/arcyne = 0.4,
	)

/datum/action/cooldown/spell/conjure/companion_crow/post_summon(atom/summoned_object, atom/cast_on)
	var/mob/living/crow = summoned_object
	crow.befriend(owner)

	if(isliving(cast_on))
		var/mob/living/L = cast_on
		if(L.stat != DEAD)
			crow.ai_controller?.set_blackboard_key(BB_BASIC_MOB_PRIORITY_TARGETS, L)
		return
	for(var/mob/living/L in get_turf(cast_on))
		if(L.stat == DEAD)
			continue
		crow.ai_controller?.set_blackboard_key(BB_BASIC_MOB_PRIORITY_TARGETS, L)
		break

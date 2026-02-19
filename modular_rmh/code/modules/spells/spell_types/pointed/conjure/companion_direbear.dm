/mob/living/simple_animal/hostile/retaliate/direbear/companion
	name = "companion direbear"
	desc = "A direbear companion."
	base_intents = list(/datum/intent/simple/bite/bear)
	faction = list("summoned")
	mob_biotypes = MOB_BEAST
	botched_butcher_results = null
	butcher_results = null
	perfect_butcher_results = null
	melee_damage_lower = 50
	melee_damage_upper = 60
	vision_range = 6
	aggro_vision_range = 8
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES // silly furniture won't stop our boy
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	health = 500
	maxHealth = 500
	food_type = list(/obj/item/reagent_containers/food/snacks/meat, /obj/item/bodypart, /obj/item/organ)
	defprob = 40
	defdrain = 10
	retreat_health = 0.1
	attack_sound = list('sound/vo/mobs/direbear/direbear_attack1.wav','sound/vo/mobs/direbear/direbear_attack2.wav','sound/vo/mobs/direbear/direbear_attack3.wav')
	dodgetime = 30
	aggressive = 1
	del_on_death = TRUE
	dendor_taming_chance = DENDOR_TAME_PROB_NONE

	ai_controller = /datum/ai_controller/summon

//SPELL

/datum/action/cooldown/spell/conjure/companion_direbear
	name = "Companion Direbear"
	desc = "Summons a temporary companion direbear to aid you."
	button_icon_state = "familiar"
	self_cast_possible = FALSE

	point_cost = 6

	sound = 'sound/magic/whiteflame.ogg'

	invocation = "GET THEM, BOY!"
	invocation_type = INVOCATION_SHOUT

	charge_time = 5 SECONDS
	charge_drain = 1
	charge_slowdown = 1.3
	cooldown_time = 12 MINUTES
	spell_cost = 30
	spell_flags = SPELL_RITUOS
	summon_type = list(/mob/living/simple_animal/hostile/retaliate/direbear/companion)
	summon_radius = 0
	summon_lifespan = 5 MINUTES

	attunements = list(
		/datum/attunement/arcyne = 0.4,
	)

/datum/action/cooldown/spell/conjure/companion_direbear/post_summon(atom/summoned_object, atom/cast_on)
	var/mob/living/bear = summoned_object
	bear.befriend(owner)

	if(isliving(cast_on))
		var/mob/living/L = cast_on
		if(L.stat != DEAD)
			bear.ai_controller?.set_blackboard_key(BB_BASIC_MOB_PRIORITY_TARGETS, L)
		return
	for(var/mob/living/L in get_turf(cast_on))
		if(L.stat == DEAD)
			continue
		bear.ai_controller?.set_blackboard_key(BB_BASIC_MOB_PRIORITY_TARGETS, L)
		break

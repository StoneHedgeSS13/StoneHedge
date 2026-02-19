/mob/living/simple_animal/hostile/retaliate/wolf/companion
	name = "companion wolf"
	desc = "A wolf companion."
	base_intents = list(/datum/intent/simple/bite)
	faction = list("summoned")
	mob_biotypes = MOB_BEAST
	health = 120
	maxHealth = 120
	melee_damage_lower = 10
	melee_damage_upper = 20
	food_type = list(/obj/item/reagent_containers/food/snacks/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	deaggroprob = 0
	defprob = 40
	defdrain = 10
	retreat_health = 0.1
	attack_sound = list('sound/vo/mobs/vw/attack (1).ogg','sound/vo/mobs/vw/attack (2).ogg','sound/vo/mobs/vw/attack (3).ogg','sound/vo/mobs/vw/attack (4).ogg')
	dodgetime = 30
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

/datum/action/cooldown/spell/conjure/companion_wolf
	name = "Companion Wolf"
	desc = "Summons a temporary companion wolf to aid you."
	button_icon_state = "familiar"
	self_cast_possible = FALSE

	point_cost = 3

	sound = 'sound/magic/whiteflame.ogg'

	invocation = "GET THEM, BOY!"
	invocation_type = INVOCATION_SHOUT

	charge_time = 2 SECONDS
	charge_drain = 1
	charge_slowdown = 1.3
	cooldown_time = 6 MINUTES
	spell_cost = 30
	spell_flags = SPELL_RITUOS
	summon_type = list(/mob/living/simple_animal/hostile/retaliate/wolf/companion)
	summon_radius = 0
	summon_lifespan = 5 MINUTES

	attunements = list(
		/datum/attunement/arcyne = 0.4,
	)

/datum/action/cooldown/spell/conjure/companion_wolf/post_summon(atom/summoned_object, atom/cast_on)
	var/mob/living/wolf = summoned_object
	wolf.befriend(owner)

	if(isliving(cast_on))
		var/mob/living/L = cast_on
		if(L.stat != DEAD)
			wolf.ai_controller?.set_blackboard_key(BB_BASIC_MOB_PRIORITY_TARGETS, L)
		return
	for(var/mob/living/L in get_turf(cast_on))
		if(L.stat == DEAD)
			continue
		wolf.ai_controller?.set_blackboard_key(BB_BASIC_MOB_PRIORITY_TARGETS, L)
		break

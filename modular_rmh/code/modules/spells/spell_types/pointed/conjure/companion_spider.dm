/mob/living/simple_animal/hostile/retaliate/spider/companion
	name = "companion beespider"
	desc = "A beespider companion."
	faction = list("summoned")
	mob_biotypes = MOB_BEAST
	move_to_delay = 2
	vision_range = 5
	aggro_vision_range = 5
	botched_butcher_results = null
	butcher_results = null
	perfect_butcher_results = null
	head_butcher = null
	food_type = list(/obj/item/reagent_containers/food/snacks/meat, /obj/item/bodypart, /obj/item/organ)
	pooptype = /obj/structure/spider/stickyweb
	attack_sound = list('sound/vo/mobs/spider/attack (1).ogg','sound/vo/mobs/spider/attack (2).ogg','sound/vo/mobs/spider/attack (3).ogg','sound/vo/mobs/spider/attack (4).ogg')
	tame_chance = 0
	del_on_death = TRUE
	dendor_taming_chance = DENDOR_TAME_PROB_NONE

	ai_controller = /datum/ai_controller/summon

//SPELL

/datum/action/cooldown/spell/conjure/companion_spider
	name = "Companion Beespider"
	desc = "Summons a temporary companion beespider to aid you."
	button_icon_state = "familiar"
	self_cast_possible = FALSE

	point_cost = 6

	sound = 'sound/magic/whiteflame.ogg'

	invocation = "GET THEM, BOY!"
	invocation_type = INVOCATION_SHOUT

	charge_time = 3 SECONDS
	charge_drain = 1
	charge_slowdown = 1.3
	cooldown_time = 8 MINUTES
	spell_cost = 35
	spell_flags = SPELL_RITUOS
	summon_type = list(/mob/living/simple_animal/hostile/retaliate/spider/companion)
	summon_radius = 0
	summon_lifespan = 5 MINUTES

	attunements = list(
		/datum/attunement/arcyne = 0.4,
	)

/datum/action/cooldown/spell/conjure/companion_spider/post_summon(atom/summoned_object, atom/cast_on)
	var/mob/living/spider = summoned_object
	spider.befriend(owner)

	if(isliving(cast_on))
		var/mob/living/L = cast_on
		if(L.stat != DEAD)
			spider.ai_controller?.set_blackboard_key(BB_BASIC_MOB_PRIORITY_TARGETS, L)
		return
	for(var/mob/living/L in get_turf(cast_on))
		if(L.stat == DEAD)
			continue
		spider.ai_controller?.set_blackboard_key(BB_BASIC_MOB_PRIORITY_TARGETS, L)
		break

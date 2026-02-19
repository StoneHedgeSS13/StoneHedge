#define GIANT_SHAPE_STAGE_1 1
#define GIANT_SHAPE_STAGE_2 2
#define GIANT_SHAPE_STAGE_3 3

/datum/action/cooldown/spell/undirected/giant_shape
	name = "Giant Shape"
	desc = "Borrow power from the Giant."
	button_icon_state = "trollshape"

	antimagic_flags = NONE

	associated_skill = /datum/skill/combat/unarmed
	associated_stat = STATKEY_STR

	charge_required = FALSE
	has_visual_effects = FALSE
	cooldown_time = 2 MINUTES
	spell_type = SPELL_STAMINA

	spell_cost = 20

	// Im sorry
	var/stage = GIANT_SHAPE_STAGE_1

/datum/action/cooldown/spell/undirected/giant_shape/can_cast_spell(feedback)
	. = ..()
	if(!.)
		return FALSE
	if(!isliving(owner))
		return FALSE

/datum/action/cooldown/spell/undirected/giant_shape/cast(atom/cast_on)
	. = ..()
	transformation()

/datum/action/cooldown/spell/undirected/giant_shape/proc/transformation()
	var/mob/living/barbarian = owner
	var/next_stage_time
	switch(stage)
		if(GIANT_SHAPE_STAGE_1)
			playsound(barbarian, 'sound/vo/smokedrag.ogg', 100, TRUE)
			barbarian.emote("rage", forced = TRUE)
			barbarian.Immobilize(3 SECONDS)
			next_stage_time = 3 SECONDS
		if(GIANT_SHAPE_STAGE_2)
			to_chat(barbarian, span_warning("I am growing STRONGER!"))
			barbarian.do_jitter_animation(4 SECONDS)
			barbarian.Immobilize(4 SECONDS)
			next_stage_time = 4 SECONDS
		if(GIANT_SHAPE_STAGE_3)
			barbarian.emote("rage", forced = TRUE)
			playsound(barbarian, 'sound/vo/mobs/troll/idle1.ogg', 100, TRUE)
			to_chat(barbarian, span_warning("I manifest the power of a giant!"))
			barbarian.apply_status_effect(/datum/status_effect/buff/giant_shape)
			return
		else
			return

	stage++
	addtimer(CALLBACK(src, PROC_REF(transformation)), next_stage_time, TIMER_DELETE_ME)

#undef GIANT_SHAPE_STAGE_1
#undef GIANT_SHAPE_STAGE_2
#undef GIANT_SHAPE_STAGE_3

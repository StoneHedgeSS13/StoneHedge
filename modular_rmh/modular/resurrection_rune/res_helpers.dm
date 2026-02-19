GLOBAL_LIST_EMPTY(global_resurrunes)

//#define IS_RES_ELIGIBLE(source) ((source.InBadHealth() && !source.IsSleeping()) || (source.IsSleeping() && source.health < source.crit_threshold))


//For revive - your body DIDN'T rot, but it did suffer damage. Unlike being rotted, this one is only timed. Not forever.
/datum/status_effect/debuff/revived/rune
	id = "revived_rune"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/revived/rune
	effectedstats = list("strength" = -5, "perception" = -5, "intelligence" = -2, "endurance" = -5, "constitution" = -5, "speed" = -5, "fortune" = -1)
	duration = 15 MINUTES		//Should be long enough to stop someone from running back into battle. Plus, this stacks with body-rot debuff. RIP.

/atom/movable/screen/alert/status_effect/debuff/revived/rune
	name = "Rune Fatigue"
	desc = "You felt unfathomable forces course through you, restoring your body and your essance. Your body aches, and you can barely lift your arms, let alone fight."
	icon_state = "beauty"

/datum/status_effect/debuff/revived/rune/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_PACIFISM, TRAIT_GENERIC)


/datum/status_effect/debuff/revived/rune/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_PACIFISM, TRAIT_GENERIC)

/datum/status_effect/debuff/revived/rune/rough
	id = "revived_rune_rough"
	effectedstats = list("strength" = -8, "perception" = -8, "intelligence" = -5, "endurance" = -8, "constitution" = -8, "speed" = -8, "fortune" = -5)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/debuff/revived/rune/rough
	name = "Rune Fatigue (rough)"
	desc = "You felt an alien force course through you, restoring your body and your essance almost against your will. Your body aches, and you can barely lift your arms, let alone fight."
	icon_state = "beauty"

#define REVIVAL_FILTER "revival_glow"
///atom/movable/screen/alert/status_effect/debuff/rune_glow
//	name = "Revival Afterglow"
//	desc = "You have been reknit and transported by unfathomable forces. You need time to recover,"
//	icon_state = "revived"

/datum/status_effect/debuff/rune_glow
	var/outline_colour ="#b86cf7"
	id = "rune_revival"
	//alert_type = /atom/movable/screen/alert/status_effect/debuff/rune_glow
	duration = 30 SECONDS
	alert_type = null

/datum/status_effect/debuff/rune_glow/on_apply()
	. = ..()
	var/filter = owner.get_filter(REVIVAL_FILTER)
	owner.SetKnockdown(duration)
	owner.SetStun(duration)
	if (!filter)
		owner.add_filter(REVIVAL_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 200, "size" = 1))

/datum/status_effect/debuff/rune_glow/on_remove()
	. = ..()
	to_chat(owner, span_warning("The revival sickness has eased a little..."))
	owner.remove_filter(REVIVAL_FILTER)

#undef REVIVAL_FILTER

/mob/living/carbon/human
	var/rune_linked = FALSE

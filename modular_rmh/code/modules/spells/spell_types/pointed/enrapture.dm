/datum/action/cooldown/spell/enrapture
	name = "Enrapture"
	desc = "Cause a target to be magically enraptured in pleasure."
	button_icon_state = "bliss"
	self_cast_possible = TRUE

	cast_range = 5

	charge_time = 3 SECONDS
	charge_drain = 1
	charge_slowdown = 1.3
	cooldown_time = 1 MINUTES
	spell_cost = 25

	sound = 'sound/magic/heal.ogg'
	invocation = "Enchanta Amoria!"
	associated_skill = /datum/skill/magic/holy

/datum/action/cooldown/spell/enrapture/is_valid_target(atom/cast_on)
	. = ..()
	if(!.)
		return FALSE
	return isliving(cast_on)

/datum/action/cooldown/spell/enrapture/cast(mob/living/cast_on)
	. = ..()
	do_enrapture(cast_on)

/datum/action/cooldown/spell/enrapture/proc/do_enrapture(mob/living/cast_on)
	var/enrapture_to_public = pick("[cast_on] shivers uncontrollably!", "[cast_on] struggles to stay standing!", "[cast_on] clutches their chest!", "[cast_on]' eyes glaze over!")
	var/enrapture_to_target = pick("A thrill runs down your spine!", "Your knees go weak!", "Your heart thrills in euphoria!", "Your imagination runs wild!")
	cast_on.visible_message(
		("<span class='aphrodisiac'>([enrapture_to_public]</span>"),
		("<span class='aphrodisiac'>([enrapture_to_target]</span>"))
	cast_on.Immobilize(85)
	cast_on.adjust_jitter(20)
	cast_on.add_stress(/datum/stress_event/enrapture)
	cast_on.emote(pick("twitch","drool","moan"))
	SEND_SIGNAL(cast_on, COMSIG_SEX_ADJUST_AROUSAL, 50)
	if(cast_on.has_quirk(/datum/quirk/vice/lovefiend))
		cast_on.sate_addiction(/datum/quirk/vice/lovefiend)

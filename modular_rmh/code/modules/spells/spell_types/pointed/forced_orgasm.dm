/datum/action/cooldown/spell/forced_orgasm
	name = "Power Word Cum"
	desc = "Cause a target to be magically forced to orgasm."
	button_icon_state = "love"

	cast_range = 5

	charge_time = 6 SECONDS
	charge_drain = 1
	charge_slowdown = 1.3
	cooldown_time = 2 MINUTES
	spell_cost = 50

	sound = 'sound/magic/heal.ogg'
	invocation = "Enchanta Amoria!"
	associated_skill = /datum/skill/magic/holy

/datum/action/cooldown/spell/forced_orgasm/is_valid_target(atom/cast_on)
	. = ..()
	if(!.)
		return FALSE
	return isliving(cast_on)

/datum/action/cooldown/spell/forced_orgasm/cast(mob/living/cast_on)
	. = ..()
	do_forced_orgasm(cast_on)

/datum/action/cooldown/spell/forced_orgasm/proc/do_forced_orgasm(mob/living/cast_on)
	var/forced_orgasm_to_public = pick("[cast_on]' legs give in!", "[cast_on] rolls eyes!")
	var/forced_orgasm_to_target = pick("A sudden pleasure surges through your body!", "Your can't hold it!")
	var/datum/component/arousal/aro = cast_on.GetComponent(/datum/component/arousal)
	cast_on.visible_message(
		("<span class='aphrodisiac'>([forced_orgasm_to_public]</span>"),
		("<span class='aphrodisiac'>([forced_orgasm_to_target]</span>"))
	cast_on.Immobilize(85)
	cast_on.adjust_jitter(50)
	cast_on.add_stress(/datum/stress_event/forced_orgasm)
	aro.ejaculate(null, cast_on, null, FALSE)
	SEND_SIGNAL(cast_on, COMSIG_SEX_ADJUST_AROUSAL, 80)
	SEND_SIGNAL(cast_on, COMSIG_SEX_ADJUST_ORGASM_PROG, 50)
	if(cast_on.has_quirk(/datum/quirk/vice/lovefiend))
		cast_on.sate_addiction(/datum/quirk/vice/lovefiend)

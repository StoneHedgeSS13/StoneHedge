/datum/action/cooldown/spell/conjure/summon_horse
	name = "Summon Horse"
	desc = "Summons your mount."
	button_icon_state = "deathdoor"
	self_cast_possible = FALSE

	antimagic_flags = NONE

	charge_required = FALSE
	has_visual_effects = FALSE
	spell_type = SPELL_STAMINA

	spell_cost = 20

	invocation = "COME HERE, GIRL!"
	invocation_type = INVOCATION_SHOUT

	cooldown_time = 11 MINUTES
	summon_type = list(/mob/living/simple_animal/hostile/retaliate/saiga/horse/tame/saddled)
	summon_radius = 0
	summon_lifespan = 10 MINUTES

/datum/action/cooldown/spell/conjure/summon_horse/cast(atom/cast_on)
	. = ..()
	var/mob/living/rider = owner
	rider.emote("whistle", forced = TRUE)

/datum/action/cooldown/spell/conjure/summon_horse/post_summon(atom/summoned_object, atom/cast_on)
	var/mob/living/horse = summoned_object
	horse.befriend(owner)

//TYPES

/datum/action/cooldown/spell/conjure/summon_horse/male
	name = "Summon Horse (male)"
	summon_type = list(/mob/living/simple_animal/hostile/retaliate/saiga/horse/male/tame/saddled)
	invocation = "COME HERE, BOY!"

/datum/action/cooldown/spell/conjure/summon_horse/black
	name = "Summon Horse (black)"
	summon_type = list(/mob/living/simple_animal/hostile/retaliate/saiga/horse/black/tame/saddled)

/datum/action/cooldown/spell/conjure/summon_horse/black_male
	name = "Summon Horse (black male)"
	summon_type = list(/mob/living/simple_animal/hostile/retaliate/saiga/horse/black/male/tame/saddled)
	invocation = "COME HERE, BOY!"

/datum/action/cooldown/spell/conjure/summon_horse/brown
	name = "Summon Horse (brown)"
	summon_type = list(/mob/living/simple_animal/hostile/retaliate/saiga/horse/brown/tame/saddled)

/datum/action/cooldown/spell/conjure/summon_horse/brown_male
	name = "Summon Horse (brown male)"
	summon_type = list(/mob/living/simple_animal/hostile/retaliate/saiga/horse/brown/male/tame/saddled)
	invocation = "COME HERE, BOY!"

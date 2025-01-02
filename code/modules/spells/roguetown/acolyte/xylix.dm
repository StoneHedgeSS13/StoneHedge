// Xylixan
/obj/effect/proc_holder/spell/invoked/Joy_takes_flight
	name = "Steal Speed"
	overlay_state = "Joy Takes Flight"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 0
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/webspin.ogg'
	invocation = "Sap my strength and speed my step!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 5 SECONDS
	miracle = TRUE
	devotion_cost = 30

/obj/effect/proc_holder/spell/invoked/Joy_takes_flight/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.apply_status_effect(/datum/status_effect/buff/Speedy)
		target.visible_message("<span class='info'>The feet of [target] begin to glow gold!</span>", "<span class='notice'>I feel much faster.</span>")
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/invoked/Laughing_god
	name = "Steal Time"
	desc = ""
	overlay_state = "Laughing God"
	releasedrain = 30
	chargedrain = 0
	chargetime = 5
	range = 5
	warnie = "sydwarning"
	movement_interrupt = FALSE
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/webspin.ogg'
	invocation = "Take their time and make it mine!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS
	miracle = TRUE
	devotion_cost = 30

/obj/effect/proc_holder/spell/invoked/Laughing_god/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/freeze_to_public = pick("[target] slows to a stop!", "[target] struggles to move!", "[target] freezes in place!")
		var/freeze_to_target = pick("You can't seem to move!", "Your body fails you for a moment!", "Your muscles lock up!")
		target.visible_message(span_warning("[freeze_to_public]"), span_warning("[freeze_to_target]"))
		target.Stun(10)

/obj/effect/proc_holder/spell/invoked/Smokebomb
	name = "Steal Sight"
	overlay_state = "Smoke Bomb"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	charge_max = 30 SECONDS
	range = 0
	warnie = "sydwarning"
	movement_interrupt = FALSE
	invocation = "Steal away their sight so your work may be done!"
	invocation_type = "whisper"
	sound = 'sound/misc/area.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	miracle = TRUE
	devotion_cost = 40

/obj/effect/proc_holder/spell/invoked/Smokebomb/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		target.visible_message(span_warning("[target] vanishes in a puff of smoke!"), span_notice("You vanish in a puff of smoke!"))
		animate(target, alpha = 0, time = 1 SECONDS, easing = EASE_IN)
		target.mob_timers[MT_INVISIBILITY] = world.time + 20 SECONDS
		addtimer(CALLBACK(target, TYPE_PROC_REF(/mob/living, update_sneak_invis), TRUE), 20 SECONDS)
		addtimer(CALLBACK(target, TYPE_PROC_REF(/atom/movable, visible_message), span_warning("[target] fades back into view."), span_notice("You become visible again.")), 20 SECONDS)
	return FALSE

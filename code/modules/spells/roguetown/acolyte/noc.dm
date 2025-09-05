// Noc/ Moon / Trickery / Illusion Spells
/obj/effect/proc_holder/spell/invoked/blindness
    name = "Blindness"
    overlay_state = "blindness"
    req_items = list(/obj/item/clothing/neck/roguetown/psicross)
    releasedrain = 30
    chargedrain = 0
    chargetime = 0
    range = 7
    warnie = "sydwarning"
    movement_interrupt = FALSE
    sound = 'sound/magic/churn.ogg'
    invocation = ""
    invocation_type = "none" //can be none, whisper, emote and shout
    associated_skill = /datum/skill/magic/arcane
    antimagic_allowed = TRUE
    miracle = FALSE
    charge_max = 15 SECONDS
    devotion_cost = 0

/obj/effect/proc_holder/spell/invoked/blindness/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		target.visible_message(span_warning("[user] points at [target]'s eyes!"),span_warning("My eyes are covered in darkness!"))
		target.blind_eyes(2)
	return TRUE

/obj/effect/proc_holder/spell/invoked/invisibility
	name = "Invisibility"
	overlay_state = "invisibility"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	charge_max = 30 SECONDS
	range = 3
	warnie = "sydwarning"
	movement_interrupt = FALSE
	invocation_type = "whisper"
	sound = 'sound/misc/area.ogg' //This sound doesnt play for some reason. Fix me.
	associated_skill = /datum/skill/magic/arcane
	antimagic_allowed = TRUE
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/invoked/invisibility/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		for(var/mob/living/simple_animal/hostile/nearmob in viewers(12, target))
			if(nearmob.target == target)
				nearmob.LoseTarget()
		for(var/mob/living/carbon/human/nearmob in viewers(12, target))
			if(nearmob.target == target)
				nearmob.back_to_idle()
		target.visible_message(span_warning("[target] starts to fade into thin air!"), span_notice("You start to become invisible!"))
		animate(target, alpha = 0, time = 1 SECONDS, easing = EASE_IN)
		target.mob_timers[MT_INVISIBILITY] = world.time + 15 SECONDS
		addtimer(CALLBACK(target, TYPE_PROC_REF(/mob/living, update_sneak_invis), TRUE), 15 SECONDS)
		addtimer(CALLBACK(target, TYPE_PROC_REF(/atom/movable, visible_message), span_warning("[target] fades back into view."), span_notice("You become visible again.")), 15 SECONDS)
	return FALSE

/obj/effect/proc_holder/spell/self/extinguish
	name = "Bring Darkness"
	overlay_state = "prestidigitation2"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	charge_max = 30 SECONDS
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	invocation_type = "whisper"
	invocation = "Lady of Night, take this light as an offering."
	sound = 'sound/magic/timestop.ogg'
	associated_skill = /datum/skill/magic/holy
	miracle = TRUE
	devotion_cost = 20

/obj/effect/proc_holder/spell/self/extinguish/cast(list/targets, mob/user = usr)
	for(var/turf/T in view(range, user))
		for(var/obj/machinery/light/roguestreet/i in T.contents)
			i.lights_out()
		for(var/obj/item/flashlight/flare/i in T.contents) // Flare subtype so that 'light' cantrip lights can be turned off as well
			i.turn_off()
		for(var/mob/living/carbon/lightbearer in T.contents)
			for(var/obj/item/flashlight/flare/i in lightbearer.contents)
				i.turn_off()
		for(var/obj/i in T.contents)
			i.extinguish()
	to_chat(user, span_notice("You extinguish all lights in the area."))
	. = ..()

/obj/effect/proc_holder/spell/invoked/conjuredreambeast
	name = "Lunacy Beast"
	overlay_state = "ensnare2"
	releasedrain = 60
	chargedrain = 0
	chargetime = 10
	charge_max = 60 SECONDS
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	invocation_type = "shout"
	invocation = "Lady of Night, lend me your aid!"
	sound = 'sound/magic/timestop.ogg'
	associated_skill = /datum/skill/magic/holy
	miracle = TRUE
	devotion_cost = 40

	// Copied over from aoe_turf/conjure with bits cut out. This is jank beyond jank, but it works.

	var/mob/summon_type = /mob/living/simple_animal/hostile/retaliate/rogue/brain_gusher_beast/summoned

	var/summon_lifespan = 60 SECONDS // In deciseconds. Will live for a minute.
	var/summon_amt = 1 //amount of objects summoned


/obj/effect/proc_holder/spell/invoked/conjuredreambeast/cast(list/targets,mob/user = usr)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		for(var/i=0,i<summon_amt,i++)
			if(!targets.len)
				break
			var/summoned_object_type = summon_type
			var/spawn_place = get_step(user.loc, turn(user.dir, 90))

			var/mob/living/simple_animal/hostile/retaliate/summoned_object = new summoned_object_type(spawn_place)
			summoned_object.Retaliate()
			summoned_object.GiveTarget(target)
			if(summon_lifespan)
				QDEL_IN(summoned_object, summon_lifespan)
		to_chat(user, span_notice("You call Lune, the Silver Serpent's, faithful beast to help you."))
		target.visible_message(span_info("A translucent beast is called from above, glaring at [target]!"), span_notice("I feel a chill down my spine as the beast glares at me."))
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/invoked/moonbeam
	name = "Moonbeam"
	desc = "Summon a storm of arcyne force in an area that damages through armor, wounding anything in that location after a delay."
	xp_gain = TRUE
	releasedrain = 30
	chargedrain = 1
	chargetime = 20
	charge_max = 10 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	miracle = TRUE
	devotion_cost = 40
	overlay_state = "blade_burst2"
	invocation = "Lady of Night, strike down my foes!"
	invocation_type = "shout"
	var/delay = 10
	var/damage = 60

/obj/effect/temp_visual/moonbeam
	icon = 'icons/effects/effects.dmi'
	icon_state = "moonbeam"
	name = "Silver Light"
	desc = "A sense of dread fills you!"
	randomdir = FALSE
	duration = 1 SECONDS
	layer = ABOVE_ALL_MOB_LAYER

/obj/effect/proc_holder/spell/invoked/moonbeam/cast(list/targets, mob/user)
	var/turf/T = get_turf(targets[1])
	new /obj/effect/temp_visual/trap(T)
	sleep(delay)
	new /obj/effect/temp_visual/moonbeam(T)
	playsound(T,'sound/magic/charged.ogg', 80, TRUE)
	for(var/mob/living/target in T.contents)
		target.adjustFireLoss(damage)
		playsound(T, 'sound/magic/fireball.ogg', 80, TRUE)
		to_chat(target, "<span class='userdanger'>I'm burned by a silver light!</span>")
		if(target.mob_biotypes & MOB_UNDEAD)
			target.visible_message(span_danger("[target] is burned by holy light!"), span_userdanger("I'm burned by holy light!"))
			target.adjustFireLoss(30)
			target.fire_act(3,10)
		if(target.mind.has_antag_datum(/datum/antagonist/vampirelord))
			var/datum/antagonist/vampirelord/VD = target.mind.has_antag_datum(/datum/antagonist/vampirelord)
			var/mob/living/carbon/human/VL = target
			if(VD.disguised)
				to_chat(target, span_warning("My disguise fails!"))
				VL.vampire_undisguise(src)
		if(istype(target, /mob/living/simple_animal/hostile/retaliate/rogue/wolf/werewolf))
			target.visible_message(span_danger("[target] is frozen in fear of the silver light!"))
			target.Stun(30)
	return TRUE

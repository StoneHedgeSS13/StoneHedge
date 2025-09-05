// Abyssia's spells. Mostly copied over from Azure, with some changes
/obj/effect/proc_holder/spell/invoked/divine_angling
	name = "Divine Angling"
	overlay_state = "aqua"
	releasedrain = 15
	chargedrain = 0
	chargetime = 0.5 SECONDS
	range = 3
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/foley/bubb (5).ogg'
	invocation = ""
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 5 SECONDS
	miracle = TRUE
	devotion_cost = 5
	var/water = list(/turf/open/water/river, /turf/open/water/cleanshallow, /turf/open/water/swamp, /turf/open/water/ocean)
	var/list/fishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 200,
		/obj/item/reagent_containers/food/snacks/fish/eel = 140,
		/obj/item/reagent_containers/food/snacks/fish/angler = 140,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 20,
		/obj/item/reagent_containers/food/snacks/fishfresh/guppy = 50,
		/obj/item/reagent_containers/food/snacks/fishfresh/catfish = 50,
		/obj/item/reagent_containers/food/snacks/fishfresh/ratfish = 50,
		/obj/item/reagent_containers/food/snacks/fishfresh/firefish = 50,
		/obj/item/reagent_containers/food/snacks/fishfresh/angelfish = 50,
		/obj/item/reagent_containers/food/snacks/fishfresh/goldfish = 50,
		/obj/item/reagent_containers/food/snacks/fishfresh/jellyfish = 50,
		/obj/item/reagent_containers/food/snacks/fishfresh/crab = 50,
		/obj/item/reagent_containers/food/snacks/fishfresh/sludgefish = 50,
		/obj/item/reagent_containers/food/snacks/fishfresh/pufferfish = 50,
		/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 5,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 20,
		/mob/living/carbon/human/species/goblin/npc/sea = 10,
	)

/obj/effect/proc_holder/spell/invoked/divine_angling/cast(list/targets, mob/user = usr)
	. = ..()
	if(isturf(targets[1]))
		var/turf/T = targets[1]
		var/success
		var/A
		if(T.type in water)
			A = pickweight(fishloot)
			success = TRUE
		if(success)
			var/atom/movable/AF = new A(T)
			AF.throw_at(get_turf(user), 5, 1, null)
			playsound(T, 'sound/foley/footsteps/FTWAT_1.ogg', 100)
			user.visible_message("<font color='yellow'>[user] makes a pulling gesture at [T], yanking out [AF]!</font>")
			return TRUE
		else
			return FALSE
	return FALSE


/obj/effect/proc_holder/spell/invoked/seasickness
	name = "Depth Bends"
	overlay_state = "thebends"
	releasedrain = 15
	chargedrain = 0
	chargetime = 2 SECONDS
	range = 7
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/foley/bubb (5).ogg'
	invocation = "Weight of the deep, crush!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS
	miracle = TRUE
	devotion_cost = 10
	var/base_fatdrain = 10

/obj/effect/proc_holder/spell/invoked/seasickness/cast(list/targets, mob/living/user)
	. = ..()
	if(!ismob(targets[1]))
		return FALSE
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		user.visible_message("<font color='yellow'>[user] points at [target] and twists their hand!</font>")
		if(istype(target, /mob/living/carbon))
			var/mob/living/carbon = target
			var/fatdrain = user.mind?.get_skill_level(associated_skill) * base_fatdrain
			carbon.rogfat_add(fatdrain)
			to_chat(target, span_warning("A sudden wave of nausea comes upon me!"))
		else
			target.adjustBruteLoss(20) // Fallback for simplemob damage
		target.Dizzy(30)
		target.blur_eyes(20)
		target.emote("drown")
		target.Stun(10)
		return TRUE
	return FALSE


/obj/effect/proc_holder/spell/invoked/riptide
	name = "Riptide"
	desc = "Conjure forth a wave, either pulling or pushing those before you."
	releasedrain = 50
	chargedrain = 1
	chargetime = 3 SECONDS
	charge_max = 25 SECONDS
	warnie = "spellwarning"
	no_early_release = FALSE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	miracle = TRUE
	devotion_cost = 25

	var/waverange = 5
	var/push = TRUE

/obj/structure/riptide
	desc = "A shimmering wave of divine energies."
	name = "Divine Wave"
	icon = 'icons/effects/effects.dmi'
	icon_state = "riptide"
	density = FALSE
	var/timeleft = 10 SECONDS


/obj/structure/riptide/Initialize()
	. = ..()
	if(timeleft)
		QDEL_IN(src, timeleft) //delete after it runs out

/obj/structure/riptide/Crossed(atom/movable/AM)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(process_current)), 0.3 SECONDS)

/obj/structure/riptide/proc/process_current()
	for(var/atom/movable/A in loc.contents)
		if((A != src) && A.has_gravity())
			A.ConveyorMove(dir)


/obj/effect/proc_holder/spell/invoked/riptide/cast(list/targets,mob/user = usr)
	var/turf/T = user.loc
	if(user.client.chargedprog >= 100)
		push = FALSE
	if(push)
		for(var/i=0, i<waverange, i++) // This is the only thing I found that works. Maybe I'm just braindead
			var/turf/target_turf = get_step(T, user.dir)
			var/turf/target_turf_two = get_step(target_turf, turn(user.dir, 90))
			var/turf/target_turf_three = get_step(target_turf, turn(user.dir, -90))
			if(!locate(/obj/structure/riptide) in target_turf)
				var/obj/structure/riptide/RT = new /obj/structure/riptide(target_turf, user)
				RT.dir = user.dir
			if(!locate(/obj/structure/riptide) in target_turf_two)
				var/obj/structure/riptide/RT = new /obj/structure/riptide(target_turf_two, user)
				RT.dir = user.dir
			if(!locate(/obj/structure/riptide) in target_turf_three)
				var/obj/structure/riptide/RT = new /obj/structure/riptide(target_turf_three, user)
				RT.dir = user.dir
			T = target_turf
	else
		for(var/i=0, i<waverange, i++)
			var/turf/target_turf = get_step(T, user.dir)
			var/turf/target_turf_two = get_step(target_turf, turn(user.dir, 90))
			var/turf/target_turf_three = get_step(target_turf, turn(user.dir, -90))
			if(!locate(/obj/structure/riptide) in target_turf)
				var/obj/structure/riptide/RT = new /obj/structure/riptide(target_turf, user)
				RT.dir = turn(user.dir, 180)
			if(!locate(/obj/structure/riptide) in target_turf_two)
				var/obj/structure/riptide/RT = new /obj/structure/riptide(target_turf_two, user)
				RT.dir = turn(user.dir, 180)
			if(!locate(/obj/structure/riptide) in target_turf_three)
				var/obj/structure/riptide/RT = new /obj/structure/riptide(target_turf_three, user)
				RT.dir = turn(user.dir, 180)
			T = target_turf
	return TRUE


/obj/effect/proc_holder/spell/invoked/abyssalstrength
	name = "Abyssal Strength"
	desc = "Consume the bounty of the sea to gain its strength."
	releasedrain = 50
	chargedrain = 1
	chargetime = 5 SECONDS
	charge_max = 60 SECONDS
	warnie = "spellwarning"
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	miracle = TRUE
	devotion_cost = 25
	range = 7

/obj/effect/proc_holder/spell/invoked/revive/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		return FALSE
	var/found = null
	for(var/turf/open/water/W in oview(range, user))
		found = W
	if(!found)
		to_chat(user, span_warning("I am disconnected from the Abyss. I need to find water!"))
		return FALSE
	return TRUE

/obj/effect/proc_holder/spell/invoked/abyssalstrength/cast(list/targets,mob/user = usr)
	. = ..()
	if(!ismob(targets[1]))
		return FALSE
	var/mob/living/target = targets[1]
	if(target.patron.name != "Abyssia")
		to_chat(user, span_warning("You can only grant the strength of the Abyss to those who are familiar with it!"))
		return FALSE
	var/list/fish = subtypesof(/obj/item/reagent_containers/food/snacks/fish) // Why do we have 2 different types of fish?
	fish |= subtypesof(/obj/item/reagent_containers/food/snacks/fishfresh)
	for(var/I in fish)
		for(var/obj/item/reagent_containers/food/snacks/fishy in user.contents)
			user.dropItemToGround(fishy)
			qdel(fishy)
			if(target == user)
				target.visible_message(span_info("[target] bites and consumes the [fishy], an inky black substance dissipating into their flesh!"), span_notice("You consume the [fishy], and are filled with Abyssal strength!"))
			else
				target.visible_message(span_info("[target] crushes the [fishy] in hand, an inky black substance pouring into [target]'s flesh!"), span_notice("You sacrifice the [fishy] to grant [target] Abyssal strength!"))
			target.apply_status_effect(/datum/status_effect/buff/abyssalstrength)
	return TRUE


/datum/status_effect/buff/abyssalstrength //You ate a fish. Therefore, you are strong
	id = "Abyssal Strength"
	alert_type = /atom/movable/screen/alert/status_effect/buff/abyssalstrength
	effectedstats = list("strength" = 2,"endurance" = 2, "constitution" = 2)
	duration = 45 SECONDS

/atom/movable/screen/alert/status_effect/buff/abyssalstrength
	name = "Abyssal Strength"
	desc = "The crushing strength of the Abyssal Depths is yours to wield."
	icon_state = "endurance"

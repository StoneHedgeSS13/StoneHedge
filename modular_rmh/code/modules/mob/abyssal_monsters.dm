#define MINOR_DREAMFIEND_HEALTH 225
#define MAJOR_DREAMFIEND_HEALTH 750
#define ANCIENT_DREAMFIEND_HEALTH 1500
#define MINOR_DREAMFIEND_ATTACK_SPEED (CLICK_CD_MELEE * 1.1)
#define MAJOR_DREAMFIEND_ATTACK_SPEED (CLICK_CD_MELEE)
#define ANCIENT_DREAMFIEND_ATTACK_SPEED (CLICK_CD_MELEE * 0.9)

/mob/living/simple_animal/hostile/dreamfiend
	icon = 'modular_rmh/icons/mob/monster/abyssal_small.dmi'
	name = "minor dream fiend"
	icon_state = "dreamfiend"
	icon_living = "dreamfiend"
	icon_dead = "dreamfiend"

	//Not a crab, but mossbacks respect other creations of Abyssor...
	faction = list("dream", "crabs")
	attack_sound = list('modular_rmh/sound/mob/abyssal/abyssal_attack.ogg','modular_rmh/sound/mob/abyssal/abyssal_attack2.ogg')

	base_intents = list(/datum/intent/simple/bite)

	health = MINOR_DREAMFIEND_HEALTH
	maxHealth = MINOR_DREAMFIEND_HEALTH
	melee_damage_lower = 25
	melee_damage_upper = 40


	ai_controller = /datum/ai_controller/deepone
	//melee_cooldown = MINOR_DREAMFIEND_ATTACK_SPEED
	var/next_blink = 0
	var/blink_cooldown = 5 SECONDS
	var/inner_tele_radius = 1
	var/outer_tele_radius = 2
	var/include_dense = FALSE
	var/include_teleport_restricted = FALSE
	var/sound1 = 'modular_rmh/sound/mob/abyssal/abyssal_idle.ogg'
	var/sound2 = 'modular_rmh/sound/mob/abyssal/abyssal_teleport.ogg'
	var/desummon_timer = 8 SECONDS

/mob/living/simple_animal/hostile/dreamfiend/major
	icon = 'modular_rmh/icons/mob/monster/abyssal_medium.dmi'
	name = "major dream fiend"
	pixel_x = -4

	base_constitution = 15
	base_strength = 15
	base_perception = 15

	health = MAJOR_DREAMFIEND_HEALTH
	maxHealth = MAJOR_DREAMFIEND_HEALTH
	melee_damage_lower = 50
	melee_damage_upper = 90
	//melee_cooldown = MAJOR_DREAMFIEND_ATTACK_SPEED
	desummon_timer = 12 SECONDS

	attack_sound = list('modular_rmh/sound/mob/abyssal/abyssal_attack.ogg','modular_rmh/sound/mob/abyssal/abyssal_attack2.ogg')

/mob/living/simple_animal/hostile/dreamfiend/ancient
	icon = 'modular_rmh/icons/mob/monster/abyssal_large.dmi'
	name = "ancient dream fiend"
	desc = "A truly horrifying creature. It makes you dizzy just looking at it."
	pixel_x = -16

	health = ANCIENT_DREAMFIEND_HEALTH
	maxHealth = ANCIENT_DREAMFIEND_HEALTH
	melee_damage_lower = 40
	melee_damage_upper = 120
	base_intents = list(/datum/intent/simple/dreamfiend_ancient)
	//melee_cooldown = ANCIENT_DREAMFIEND_ATTACK_SPEED
	desummon_timer = 20 SECONDS

	base_constitution = 20
	base_strength = 20
	base_perception = 20

	ai_controller = /datum/ai_controller/deepone
	attack_sound = list('modular_rmh/sound/mob/abyssal/abyssal_attack.ogg','modular_rmh/sound/mob/abyssal/abyssal_attack2.ogg')

/mob/living/simple_animal/hostile/dreamfiend/get_sound(input)
    switch(input)
        if("aggro")
            return pick('modular_rmh/sound/mob/abyssal/abyssal_aggro.ogg')
        if("pain")
            return pick('modular_rmh/sound/mob/abyssal/abyssal_pain.ogg')
        if("death")
            return pick('modular_rmh/sound/mob/abyssal/abyssal_pain.ogg')
        if("idle")
            return pick('modular_rmh/sound/mob/abyssal/abyssal_idle.ogg')

/mob/living/simple_animal/hostile/dreamfiend/Initialize()
	AddElement(/datum/element/ai_retaliate)
	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_KNEESTINGER_IMMUNITY, INNATE_TRAIT)
	. = ..()

/mob/living/simple_animal/hostile/dreamfiend/ancient/Initialize()
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOFIRE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BASHDOORS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_ORGAN_EATER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NASTY_EATER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_DEADNOSE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_STRONGBITE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOFALLDAMAGE1, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)
	. = ..()

/mob/living/simple_animal/hostile/dreamfiend/proc/blink_to_target(var/mob/target)
	if(world.time < next_blink || QDELETED(target) || target.stat == DEAD)
		return FALSE

	var/turf/target_turf = get_turf(target)
	var/list/turfs = list()

	for(var/turf/T in range(target,outer_tele_radius))
		if(T in range(target,inner_tele_radius))
			continue
		if(istransparentturf(T))
			continue
		if(T.density && !include_dense)
			continue
		//if(T.teleport_restricted && !include_teleport_restricted)
		//	continue
		if(T.x>world.maxx-outer_tele_radius || T.x<outer_tele_radius)
			continue	//putting them at the edge is dumb
		if(T.y>world.maxy-outer_tele_radius || T.y<outer_tele_radius)
			continue
		turfs += T

	if(!length(turfs))
		for(var/turf/T in orange(target_turf, outer_tele_radius))
			if(!(T in orange(target_turf, inner_tele_radius)))
				turfs += T

	if(!length(turfs))
		return FALSE

	var/turf/tele_turf = pick(turfs)
	playsound(src, sound1, 50, TRUE)
	new /obj/effect/temp_visual/decoy(loc, src)

	if(do_teleport(src, tele_turf, forceMove = TRUE, channel = TELEPORT_CHANNEL_MAGIC))
		playsound(tele_turf, sound2, 50, TRUE)
		next_blink = world.time + blink_cooldown
		return TRUE

	return FALSE

/mob/living/simple_animal/hostile/dreamfiend/proc/return_to_abyssor()
	src.visible_message(span_notice("The [src] starts to fade out of reality!"))
	if(do_after(src, desummon_timer, FALSE, target = src))
		qdel(src)

/mob/living/simple_animal/hostile/dreamfiend/death()
	if(prob(5))
		new /obj/item/gem/yellow(loc)
	//Was it even real?!
	new /obj/effect/decal/cleanable/dreamfiend_ichor(loc)
	qdel(src)

/mob/living/simple_animal/hostile/dreamfiend/major/death()
	new /obj/effect/decal/cleanable/dreamfiend_ichor/large(loc)
	var/main_target = ai_controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	for(var/i in 1 to 2)
		var/mob/living/simple_animal/hostile/dreamfiend/F = new(loc)
		F.ai_controller.set_blackboard_key(BB_BASIC_MOB_CURRENT_TARGET, main_target)
	if(main_target)
		src.visible_message(span_notice("some dreamfiends split forth front the body of the [src] following after [main_target]... countless teeth bared with hostility!"))
	qdel(src)

/mob/living/simple_animal/hostile/dreamfiend/ancient/death()
	new /obj/effect/decal/cleanable/dreamfiend_ichor/huge(loc)
	qdel(src)

/obj/effect/decal/cleanable/dreamfiend_ichor
	name = "vile ichor"
	desc = "this dark shifting liquid looks impossibly deep"
	icon = 'modular_rmh/icons/mob/monster/abyssal_small.dmi'
	icon_state = "dreamfiend_dead"
	beauty = -100
	alpha = 200
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = NO_CLIENT_COLOR

/obj/effect/decal/cleanable/dreamfiend_ichor/large
	pixel_x = -4
	icon = 'modular_rmh/icons/mob/monster/abyssal_medium.dmi'

/obj/effect/decal/cleanable/dreamfiend_ichor/huge
	pixel_x = -16
	icon = 'modular_rmh/icons/mob/monster/abyssal_large.dmi'

/datum/intent/simple/dreamfiend_ancient
	name = "devastating bite"
	icon_state = "inchop"
	attack_verb = list("eviscerates", "tears at")
	animname = "cut"
	blade_class = BCLASS_CHOP
	hitsound = list('modular_rmh/sound/mob/abyssal/abyssal_attack.ogg','modular_rmh/sound/mob/abyssal/abyssal_attack2.ogg')
	penfactor = 30

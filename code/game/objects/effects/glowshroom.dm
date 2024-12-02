//separate dm since hydro is getting bloated already

/obj/structure/glowshroom
	name = "kneestingers"
	desc = ""
	anchored = TRUE
	max_integrity = 1 //its a stupid mushroom
	opacity = 0
	density = FALSE
	icon = 'icons/roguetown/misc/foliage.dmi'
	icon_state = "glowshroom1" //replaced in New
	layer = ABOVE_NORMAL_TURF_LAYER
	max_integrity = 30
	blade_dulling = DULLING_CUT
	resistance_flags = FLAMMABLE

/obj/structure/glowshroom/Initialize(mapload)
	. = ..()
	//50% chance on creation to be glowshroom instead of kneestinger
	if(prob(50) && mapload)
		new /obj/structure/safeglowshroom(src.loc)
		qdel(src)

/obj/structure/glowshroom/fire_act(added, maxstacks)
	visible_message(span_warning("[src] catches fire!"))
	var/turf/T = get_turf(src)
	qdel(src)
	new /obj/effect/hotspot(T)

/obj/structure/glowshroom/CanPass(atom/movable/mover, turf/target)
	if(isliving(mover) && mover.z == z)
//		var/throwdir = get_dir(src, mover)
		var/mob/living/L = mover

		if(HAS_TRAIT(L, TRAIT_KNEESTINGER_IMMUNITY)) //Dendor kneestinger immunity
			return TRUE

		if(L.electrocute_act(10, src))
			L.consider_ambush()
			if(L.throwing)
				L.throwing.finalize(FALSE)
//			if(mover.loc != loc && L.stat == CONSCIOUS)
//				L.throw_at(get_step(L, throwdir), 1, 1, L, spin = FALSE)
			return FALSE
	. = ..()

/obj/structure/glowshroom/Crossed(AM as mob|obj)
	if(isliving(AM))
		var/mob/living/L = AM
		if(L.z == z)
			if(!HAS_TRAIT(L, TRAIT_KNEESTINGER_IMMUNITY))
				if(L.electrocute_act(10, src))
					L.emote("painscream")
					L.update_sneak_invis(TRUE)
					L.consider_ambush()
	. = ..()

/obj/structure/glowshroom/attackby(obj/item/W, mob/user, params)
	if(isliving(user) && W && user.z == z)
		if(W.flags_1 & CONDUCT_1)
			var/mob/living/L = user
			if(L.electrocute_act(15, src)) // The kneestingers will let you pass if you worship dendor, but they won't take your stupid ass hitting them.
				L.emote("painscream")
				L.consider_ambush()
				if(L.throwing)
					L.throwing.finalize(FALSE)
				return FALSE
	..()


/obj/structure/glowshroom/New(loc, obj/item/seeds/newseed, mutate_stats)
	..()
	set_light(1.5, 1.5, "#d4fcac")

	icon_state = "glowshroom[rand(1,3)]"

	pixel_x = rand(-4, 4)
	pixel_y = rand(0,5)


/obj/structure/glowshroom/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	if(damage_type == BURN && damage_amount)
		playsound(src.loc, 'sound/blank.ogg', 100, TRUE)

/obj/structure/glowshroom/temperature_expose(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if(exposed_temperature > 300)
		take_damage(5, BURN, 0, 0)

/obj/structure/glowshroom/acid_act(acidpwr, acid_volume)
	. = 1
	visible_message(span_danger("[src] melts away!"))
	var/obj/effect/decal/cleanable/molten_object/I = new (get_turf(src))
	I.desc = ""
	qdel(src)

/obj/structure/safeglowshroom
	name = "glowshroom"
	desc = "the actually liked sibling of kneestingers."
	anchored = TRUE
	opacity = 0
	max_integrity = 10
	density = FALSE
	icon = 'icons/roguetown/misc/foliage.dmi'
	icon_state = "glowshroom1" //replaced in New
	color = "#00fffb"
	layer = ABOVE_NORMAL_TURF_LAYER
	max_integrity = 30
	blade_dulling = DULLING_CUT
	resistance_flags = FLAMMABLE
	debris = list(/obj/item/natural/fibers = 1, /obj/item/reagent_containers/food/snacks/grown/shroom = 1)

/obj/structure/safeglowshroom/fire_act(added, maxstacks)
	visible_message(span_warning("[src] catches fire!"))
	var/turf/T = get_turf(src)
	qdel(src)
	new /obj/effect/hotspot(T)

/obj/structure/safeglowshroom/New(loc, obj/item/seeds/newseed, mutate_stats)
	..()
	set_light(1.5, 1.5, "#00fffb")

	icon_state = "glowshroom[rand(1,3)]"

	pixel_x = rand(-4, 4)
	pixel_y = rand(0,5)

/obj/structure/safeglowshroom/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	if(damage_type == BURN && damage_amount)
		playsound(src.loc, 'sound/blank.ogg', 100, TRUE)

/obj/structure/safeglowshroom/temperature_expose(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if(exposed_temperature > 300)
		take_damage(5, BURN, 0, 0)

/obj/structure/safeglowshroom/acid_act(acidpwr, acid_volume)
	. = 1
	visible_message(span_danger("[src] melts away!"))
	var/obj/effect/decal/cleanable/molten_object/I = new (get_turf(src))
	I.desc = ""
	qdel(src)

/obj/structure/safeglowshroom/Destroy()
	var/datum/reagents/R = new/datum/reagents(25)
	R.my_atom = src
	R.add_reagent(/datum/reagent/toxin/berrypoison, 25)
	var/datum/effect_system/smoke_spread/chem/smoke = new
	smoke.set_up(R, 6, get_turf(src), FALSE)
	smoke.start()
	. = ..()

//used by stupid spell
/obj/structure/glowshroom/proc/destroy()
    qdel(src)

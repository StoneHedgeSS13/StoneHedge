////// Roguetown version of the kitchen spike
#define VIABLE_MOB_CHECK(X) (isliving(X) && !issilicon(X) && !isbot(X))

/obj/structure/meathook
	name = "meathook"
	icon = 'modular_stonehedge/icons/roguetown/misc/tallstructure.dmi'
	icon_state = "meathook"
	desc = "A hook used to secure livestock for butchering."
	density = TRUE
	anchored = TRUE
	max_integrity = 250
	buckle_lying = 0
	can_buckle = 1

/obj/structure/meathook/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/meathook/attack_hand(mob/user)
	if(VIABLE_MOB_CHECK(user.pulling) && !has_buckled_mobs())
		var/mob/living/L = user.pulling
		L.visible_message(span_danger("[user] starts hanging [L] on [src]!"), span_danger("[user] starts hanging you on [src]]!"), span_hear("I hear the sound of clanging chains..."))
		if(do_mob(user, src, 120))
			if(has_buckled_mobs())
				return
			if(L.buckled)
				return
			if(user.pulling != L)
				return
			if(L.butcher_results)
				for(var/item in L.butcher_results)
					if(istype(item, /obj/item/reagent_containers/food/snacks/meat) || istype(item, /obj/item/reagent_containers/food/snacks/fat))
						L.butcher_results[item] += 1
			if(L.guaranteed_butcher_results)
				for(var/item in L.guaranteed_butcher_results)
					if(istype(item, /obj/item/reagent_containers/food/snacks/meat) || istype(item, /obj/item/reagent_containers/food/snacks/fat))
						L.guaranteed_butcher_results[item] += 1
			playsound(src.loc, 'sound/foley/butcher.ogg', 25, TRUE)
			L.visible_message(span_danger("[user] hangs [L] on [src]!"), span_danger("[user] hangs you on [src]]!"))
			L.forceMove(drop_location())
			L.emote("scream")
			L.add_splatter_floor()
			L.adjustBruteLoss(30)
			L.setDir(2)
			buckle_mob(L, force=1)
			var/matrix/m90 = matrix(L.transform)
			m90.Turn(90)
			m90.Translate(12,12)
			animate(L, transform = m90, time = 3)
			L.pixel_y = L.get_standard_pixel_x_offset(180)
	else if (has_buckled_mobs())
		for(var/mob/living/L in buckled_mobs)
			user_unbuckle_mob(L, user)
	else
		..()

/obj/structure/meathook/user_buckle_mob(mob/living/M, mob/user, check_loc)
	return

/obj/structure/meathook/user_unbuckle_mob(mob/living/buckled_mob, mob/user)
	if(buckled_mob)
		var/mob/living/M = buckled_mob
		if (M != user)
			M.visible_message(span_notice("[user] is trying to pull [M] free of [src]!"),\
				span_notice("[user] is trying to pull you off [src]! It hurts!"),\
				span_hear("I hear the sound of torn flesh and whimpering..."))
			if(!do_after(user, 300, target = src))
				if(M && M.buckled)
					M.visible_message(span_notice("[user] fails to free [M]!"),\
					span_notice("[user] fails to pull you off of [src]!"))
				return
		else
			M.visible_message(span_warning("[M] struggles to break free from [src]!"),\
				span_notice("I struggle to break free from [src], tearing my legs! (Stay still for two minutes.)"),\
				span_hear("I hear the sound of torn flesh and whimpering..."))
			M.adjustBruteLoss(30)
			if(!do_after(M, 1200, target = src))
				if(M && M.buckled)
					to_chat(M, span_warning("I fail to free myself!"))
				return
			if(!M.buckled)
				return
		release_mob(M)

/obj/structure/meathook/proc/release_mob(mob/living/M)
	if(L.butcher_results)
				for(var/item in L.butcher_results)
					if(istype(item, /obj/item/reagent_containers/food/snacks/meat) || istype(item, /obj/item/reagent_containers/food/snacks/fat))
						L.butcher_results[item] -= 1
			if(L.guaranteed_butcher_results)
				for(var/item in L.guaranteed_butcher_results)
					if(istype(item, /obj/item/reagent_containers/food/snacks/meat) || istype(item, /obj/item/reagent_containers/food/snacks/fat))
						L.guaranteed_butcher_results[item] -= 1
	var/matrix/m270 = matrix(M.transform)
	m270.Turn(270)
	m270.Translate(-12,-12)
	animate(M, transform = m270, time = 3)
	M.pixel_y = M.get_standard_pixel_y_offset(180)
	M.adjustBruteLoss(30)
	src.visible_message(span_danger("[M] falls free of [src]!"))
	unbuckle_mob(M,force=1)
	M.emote("scream")
	M.AdjustParalyzed(20)

/obj/structure/meathook/Destroy()
	if(has_buckled_mobs())
		for(var/mob/living/L in buckled_mobs)
			release_mob(L)
	return ..()

/obj/structure/kitchenspike/deconstruct()
	new /obj/item/grown/log/tree/small(loc, 1)
	new /obj/item/rope(loc, 1)
	qdel(src)

#undef VIABLE_MOB_CHECK

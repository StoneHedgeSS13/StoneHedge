#define RUNE_DAMAGE_THRESHOLD 80


/datum/resurrection_rune_controller
	var/obj/structure/resurrection_rune/control/control_rune
	var/obj/structure/resurrection_rune/sub_rune
	var/list/linked_users = list()
	var/list/linked_users_names = list()
	var/list/linked_users_minds = list()
	var/list/body_mind_link = list()
	var/list/resurrecting = list()
	// If the body is destroyed, what do we spawn for them
	var/mob_type = /mob/living/carbon/human

/datum/resurrection_rune_controller/New()
	.=..()
	START_PROCESSING(SSobj, src)

/datum/resurrection_rune_controller/Destroy()
	.=..()
	STOP_PROCESSING(SSobj, src)

	for(var/el in linked_users)
		UnregisterSignal(el, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(start_revive))


/datum/resurrection_rune_controller/process()
	if(!sub_rune.main_rune_link)
		sub_rune.find_master()
		return
	if(control_rune.disabled_res && !sub_rune.is_main)
		return
	//if(!linked_users_minds.len)
	//	return
	for(var/datum/mind/mind_user in linked_users_minds) //revive linked no-body
		if(!isnull(mind_user.current?.client))
			if(isnewplayer(mind_user.current?.client.mob))
				linked_users_minds -= mind_user
				linked_users -= body_mind_link[mind_user]
				break
		if(!mind_user.current && !(mind_user in resurrecting))
			to_chat(mind_user.get_ghost(TRUE, TRUE), span_blue("Somewhere, you are being remade anew..."))
			resurrecting |= mind_user
			addtimer(CALLBACK(src, PROC_REF(spawn_new_body), mind_user), 5 SECONDS)
	for(var/mob/H in GLOB.rune_roundstart_mobs) //revive unlinked bodies //idk how to add unlinked souls though
		if(!H)
			return
		if(sub_rune.is_main)
			return
		if(ishuman(H) && !(H.status_flags & GODMODE))
			var/mob/living/carbon/human/unlinked = H
			if(HAS_TRAIT(unlinked, TRAIT_RUNE_SEVERED))
				return
			if(!isnull(unlinked.client))
				if(!unlinked.rune_linked)
					var/turf/tur = get_turf(H)
					if(unlinked.maxHealth - unlinked.health >= RUNE_DAMAGE_THRESHOLD || unlinked.is_dead() || istype(tur, /turf/open/lava) || istype(tur, /turf/open/lava/acid))
						if(!(unlinked in resurrecting))
							resurrecting |= unlinked
							to_chat(unlinked.mind.get_ghost(TRUE, TRUE), span_blue("An alien force suddenly <b>YANKS</b> you back to life!"))
							addtimer(CALLBACK(src, PROC_REF(start_revival), unlinked, FALSE), 1 SECONDS)


/datum/resurrection_rune_controller/proc/spawn_new_body(datum/mind/mind)
	linked_users -= body_mind_link[mind]
	var/turf/T = get_turf(sub_rune)
	var/mob/living/body = new mob_type(T)
	var/mob/ghostie = mind.get_ghost(TRUE)
	if(ghostie.client && ghostie.client.prefs)
		ghostie.client.prefs.apply_prefs_to(body, TRUE)
	mind.current = body //little hack
	mind.transfer_to(body)
	mind.grab_ghost(TRUE)
	body.flash_act()
	resurrecting -= mind
	linked_users += body
	body.apply_status_effect(/datum/status_effect/debuff/revived/rune)
	body.apply_status_effect(/datum/status_effect/debuff/rune_glow)
	playsound(T, 'sound/misc/vampirespell.ogg', 100, FALSE, -1)
	to_chat(body, span_blue("You are back."))


/datum/resurrection_rune_controller/proc/add_user(mob/user)
	if(user in linked_users)
		return FALSE
	linked_users += user
	linked_users_minds += user.mind
	linked_users_names[user.name] = user
	body_mind_link[user.mind] = user
	RegisterSignal(user, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(start_revive))
	var/mob/living/carbon/human/H = user
	H.rune_linked = TRUE
	return TRUE

/datum/resurrection_rune_controller/proc/remove_user(mob/user)
	if(!(user in linked_users))
		return FALSE
	linked_users -= user
	if(user.mind)
		linked_users_minds -= user.mind
	linked_users_names.Remove(user.name)
	body_mind_link.Remove(user.mind)
	UnregisterSignal(user, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(start_revive))
	var/mob/living/carbon/human/H = user
	H.rune_linked = FALSE
	return TRUE

/datum/resurrection_rune_controller/proc/start_revive(mob/living/carbon/target)
	SIGNAL_HANDLER

	if(control_rune.disabled_res && !sub_rune.is_main)
		return

	//if(target.IsSleeping())
	//	return

	if(!(target in linked_users)) //sanity check
		return

	var/turf/tur = get_turf(target)
	if(target.maxHealth - target.health >= RUNE_DAMAGE_THRESHOLD || target.is_dead() || istype(tur, /turf/open/lava) || istype(tur, /turf/open/lava/acid))
		if(target in resurrecting)
			return
		start_revival(target)
	return

/datum/resurrection_rune_controller/proc/start_revival(mob/living/carbon/user, is_linked = TRUE)
	if(is_linked)
		to_chat(user.mind, span_blue("You feel a faint force tuggung you back to life..."))
	else
		to_chat(user.mind, span_blue("An alien force suddenly <b>YANKS</b> you back to life!"))
	sub_rune.visible_message(span_blue("The rune begins to grow brighter."))
	if(!(user in resurrecting))
		resurrecting |= user
	addtimer(CALLBACK(src, PROC_REF(revive_mob), user, is_linked), 1 SECONDS)


/datum/resurrection_rune_controller/proc/revive_mob(mob/living/carbon/user, is_linked)
	/*if(!IS_RES_ELIGIBLE(user) && !(istype(get_turf(user), /turf/open/lava) || istype(get_turf(user), /turf/open/lava/acid)))
		resurrecting -= user
		to_chat(user.mind, span_blue("The tugging stops; you seem to be recovering."))
		return*/
	var/turf/T = get_turf(sub_rune)
	var/mob/living/carbon/body = user
	if(!body)
		sub_rune.visible_message(span_blue("The rune flickers, connection to a body suddenly severed."))
		resurrecting -= user
		return
	body.visible_message(span_blue("With a loud pop, [body.name] suddenly disappears!"))
	playsound(get_turf(body), 'sound/magic/repulse.ogg', 100, FALSE, -1)
	body.ExtinguishMob()
	body.forceMove(T)
	body.revive(ADMIN_HEAL_ALL, force_grab_ghost = TRUE)
	body.clear_fullscreens()
	body.reload_fullscreen()
	body.update_cone_show()
	body.update_fov_angles()

	var/was_zombie = body.mind?.has_antag_datum(/datum/antagonist/zombie)
	var/has_rot = FALSE
	if(!was_zombie)
		for(var/obj/item/bodypart/bodypart as anything in body.bodyparts)
			if(bodypart.rotted)
				has_rot = TRUE
				break
	if(has_rot || was_zombie)
		remove_zombie(body, has_rot, was_zombie)

	body.grab_ghost(TRUE)
	body.flash_act()
	addtimer(CALLBACK(src, PROC_REF(remove_res), body), 10 SECONDS)
	var/mob/living/carbon/human/H = body
	if(H.rune_linked)
		body.apply_status_effect(/datum/status_effect/debuff/revived/rune)
	else
		body.apply_status_effect(/datum/status_effect/debuff/revived/rune/rough)
	body.apply_status_effect(/datum/status_effect/debuff/rune_glow)

	playsound(T, 'sound/misc/vampirespell.ogg', 100, FALSE, -1)
	to_chat(body, span_blue("Despite everything, you are back to life..."))
	to_chat(body, span_red("...But you remember the gnashing horror of what brought you here in minute detail - and you are terrified of repeating it."))

/datum/resurrection_rune_controller/proc/remove_zombie(mob/living/carbon/target, has_rot, was_zombie)

	if(was_zombie)
		target.mind.remove_antag_datum(/datum/antagonist/zombie)
		target.death()

	var/datum/component/rot/rot = target.GetComponent(/datum/component/rot)
	if(rot)
		rot.amount = 0

	for(var/obj/item/bodypart/rotty in target.bodyparts)
		rotty.rotted = FALSE
		rotty.update_limb()
		if(rotty.can_be_disabled)
			rotty.update_disabled()

	target.update_body()
	target.visible_message("<span class='notice'>The rot leaves [target]'s body!</span>", "<span class='green'>I feel the rot leave my body!</span>")

/datum/resurrection_rune_controller/proc/remove_res(mob/living/carbon/user)
	resurrecting -= user


/obj/structure/resurrection_rune
	name = "grand rune"
	desc = "It emits an otherwordly hum."
	icon = 'icons/effects/160x160.dmi'
	icon_state = "portal"
	anchored = TRUE
	layer = BELOW_OPEN_DOOR_LAYER
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

	var/datum/resurrection_rune_controller/resrunecontroler
	var/is_main = FALSE
	var/obj/structure/resurrection_rune/control/main_rune_link
	pixel_x = -64
	pixel_y = -64

/obj/structure/resurrection_rune/Initialize()
	. = ..()
	resrunecontroler = new /datum/resurrection_rune_controller()
	resrunecontroler.sub_rune = src
	find_master()
	GLOB.global_resurrunes += src

/obj/structure/resurrection_rune/Destroy()
	resrunecontroler.control_rune = null
	resrunecontroler.sub_rune = null
	main_rune_link = null
	qdel(resrunecontroler)
	GLOB.global_resurrunes -= src
	. = ..()

/obj/structure/resurrection_rune/proc/find_master()
	for(var/rune in GLOB.global_resurrunes)
		if(istype(rune, /obj/structure/resurrection_rune/control))
			main_rune_link = rune
			resrunecontroler.control_rune = rune

/obj/structure/resurrection_rune/attack_hand(mob/user)
	. = ..()
	if(!main_rune_link)
		find_master()

	if(!istype(user, /mob/living/carbon))
		return

	if(!resrunecontroler)
		return
	if(!main_rune_link && !is_main)
		to_chat(user, span_blue("Somehow, the main rune is not connected..."))
		return

	if(main_rune_link.disabled_res && !is_main)
		to_chat(user, span_blue("Your masters have disabled the rune!"))
		return

	if(!is_main)
		var/input = input(user, "What do you wish to do?", "Rune of Souls") as anything in list("Link Soul", "Revive a lost Soul", "Cancel")
		switch(input)
			if("Link Soul")
				if(user in resrunecontroler.linked_users)
					to_chat(user, span_blue("Your Soul is already linked."))
					return

				to_chat(user, span_blue("You link your Soul to the Rune."))
				resrunecontroler.add_user(user)
				return
			if("Revive a lost Soul")
				to_chat(user, span_blue("The rune sputters, as if offended."))
				return
			else
				return


/obj/structure/resurrection_rune/attacked_by(obj/item/I, mob/living/user)
	return FALSE

/obj/structure/resurrection_rune/control
	name = "master rune"
	is_main = TRUE
	var/disabled_res = FALSE

/obj/structure/resurrection_rune/control/Initialize()
	. = ..()

/obj/structure/resurrection_rune/control/attack_hand(mob/user)
	. = ..()

	var/input = input(user, "What do you wish to do?", "Master Rune") as anything in list("Link Soul", "Unlink a Soul", "Toggle Sub Rune", "Cancel")
	switch(input)
		if("Link Soul")
			if(user in resrunecontroler.linked_users)
				to_chat(user, span_blue("Your Soul is already linked."))
				return

			to_chat(user, span_blue("You link your Soul to the Rune."))
			resrunecontroler.add_user(user)
			return
		if("Unlink a Soul")
			var/obj/structure/resurrection_rune/sub_rune
			for(var/obj/structure/resurrection_rune/rune_l in GLOB.global_resurrunes)
				if(!rune_l.is_main)
					sub_rune = rune_l
					break
			if(!sub_rune)
				return
			var/mob/target = input(user, "Choose.", "Souls") as null|anything in sub_rune.resrunecontroler.linked_users_names
			if(target)
				sub_rune.resrunecontroler.remove_user(sub_rune.resrunecontroler.linked_users_names[target])
				to_chat(user, span_blue("They are now damned."))
			return
		if("Toggle Sub Rune")
			if(!disabled_res)
				disabled_res = TRUE
				to_chat(user, span_blue("Let them perish."))
			else
				disabled_res = FALSE
				to_chat(user, span_blue("Another chance."))
			return
		else
			return

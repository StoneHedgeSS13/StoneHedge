/datum/sex_action/npc_vaginal_ride_sex
	name = "NPC Ride them"
	stamina_cost = 0
	check_same_tile = FALSE

/datum/sex_action/npc_vaginal_ride_sex/shows_on_menu(mob/living/user, mob/living/target)
	return FALSE

/datum/sex_action/npc_vaginal_ride_sex/can_perform(mob/living/user, mob/living/target)
	if(user.seeksfuck) //should filter down to only npcs with seeksfuck behavior.
		return TRUE
	return FALSE

/datum/sex_action/npc_vaginal_ride_sex/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] gets on top of [target] and begins riding them with their cunt!"))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)


/datum/sex_action/npc_vaginal_ride_sex/on_perform(mob/living/user, mob/living/target)
	do_thrust_animate(user, target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] rides [target]."))

	if(user.rogue_sneaking || user.alpha <= 100)
		segsovolume *= 0.5
	playsound(target, 'sound/misc/mat/segso.ogg', segsovolume, TRUE, -2, ignore_walls = FALSE)

	target.heal_overall_damage(3,3,0, updating_health = TRUE)
	if(target.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 2.4, 3, TRUE)
	else
		user.sexcon.perform_sex_action(target, 4.8, 7, TRUE)
	user.sexcon.handle_passive_ejaculation()

	user.sexcon.perform_sex_action(target, 2, 4, FALSE)
	if(target.sexcon.check_active_ejaculation())
		target.visible_message(span_love("[target] cums into [user]'s cunt!"))
		if(issimple(user))
			target.sexcon.cum_into()
		else
			target.sexcon.cum_into(vaginal = TRUE)
//		target.try_impregnate(user)
		target.virginity = FALSE

/datum/sex_action/npc_vaginal_ride_sex/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] gets off [target]."))
	if(issimple(user))
		var/mob/living/simple_animal/hostile/retaliate/rogue/simpleuser = user
		simpleuser.stoppedfucking(target)
	else
		var/mob/living/carbon/human/humanuser = user
		humanuser.stoppedfucking(target)


/datum/sex_action/npc_vaginal_ride_sex/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		if(issimple(user))
			var/mob/living/simple_animal/hostile/retaliate/rogue/simpleuser = user
			simpleuser.stoppedfucking(target)
		else
			var/mob/living/carbon/human/humanuser = user
			humanuser.stoppedfucking(target)
		return TRUE
	return FALSE

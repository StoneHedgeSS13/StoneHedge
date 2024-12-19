/datum/sex_action/npc_anal_sex
	name = "NPC Sodomize them"
	stamina_cost = 0
	check_same_tile = FALSE
	require_grab = FALSE

/datum/sex_action/npc_anal_sex/shows_on_menu(mob/living/user, mob/living/target)
	return FALSE

/datum/sex_action/npc_anal_sex/can_perform(mob/living/user, mob/living/target)
	if(user.seeksfuck) //should filter down to only npcs with seeksfuck behavior.
		return TRUE
	return FALSE

/datum/sex_action/npc_anal_sex/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] slides his cock into [target]'s ass!"))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/datum/sex_action/npc_anal_sex/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s ass."))

	if(user.rogue_sneaking || user.alpha <= 100)
		segsovolume *= 0.5
	playsound(target, 'sound/misc/mat/segso.ogg', segsovolume, TRUE, -2, ignore_walls = FALSE)
	do_thrust_animate(user, target)
	if(user.sexcon.check_active_ejaculation())
		user.visible_message(span_lovebold("[user] cums into [target]'s ass!"))
		user.sexcon.cum_into(vaginal = TRUE)
//		user.try_impregnate(target)
		target.virginity = FALSE

	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(user, 8, 0, TRUE)
		user.sexcon.perform_sex_action(target, 2, 3, FALSE)
	else
		user.sexcon.perform_sex_action(user, 8, 0, TRUE)
		user.sexcon.perform_sex_action(target, 4, 7, FALSE)
	target.sexcon.handle_passive_ejaculation()


/datum/sex_action/npc_anal_sex/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] gets off [target]."))
	if(issimple(user))
		var/mob/living/simple_animal/hostile/retaliate/rogue/simpleuser = user
		simpleuser.stoppedfucking(target)
	else
		var/mob/living/carbon/human/humanuser = user
		humanuser.stoppedfucking(target)

/datum/sex_action/npc_anal_sex/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		if(issimple(user))
			var/mob/living/simple_animal/hostile/retaliate/rogue/simpleuser = user
			simpleuser.stoppedfucking(target)
		else
			var/mob/living/carbon/human/humanuser = user
			humanuser.stoppedfucking(target)
		return TRUE
	return FALSE

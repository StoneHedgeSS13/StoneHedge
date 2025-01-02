/datum/sex_action/npc_cunnilingus
	name = "NPC Suck their cunt off"
	stamina_cost = 0
	check_same_tile = FALSE


/datum/sex_action/npc_cunnilingus/shows_on_menu(mob/living/user, mob/living/target)
	return FALSE

/datum/sex_action/npc_cunnilingus/can_perform(mob/living/user, mob/living/target)
	if(user.seeksfuck) //should filter down to only npcs with seeksfuck behavior.
		return TRUE
	return FALSE

/datum/sex_action/npc_cunnilingus/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts licking [target]'s cunt..."))

/datum/sex_action/npc_cunnilingus/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] licking [target]'s cunt..."))
	user.make_sucking_noise()

	target.heal_overall_damage(3,3,0, updating_health = TRUE)
	user.sexcon.perform_sex_action(target, 4, 3, TRUE)
	if(target.sexcon.check_active_ejaculation())
		target.visible_message(span_love("[target] ejaculates into [user]'s mouth!"))
		target.sexcon.cum_into(girljuice = TRUE)

/datum/sex_action/npc_cunnilingus/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops licking [target]'s cunt ..."))
	if(issimple(user))
		var/mob/living/simple_animal/hostile/retaliate/rogue/simpleuser = user
		simpleuser.stoppedfucking(target)
	else
		var/mob/living/carbon/human/humanuser = user
		humanuser.stoppedfucking(target)


/datum/sex_action/npc_cunnilingus/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		if(issimple(user))
			var/mob/living/simple_animal/hostile/retaliate/rogue/simpleuser = user
			simpleuser.stoppedfucking(target)
		else
			var/mob/living/carbon/human/humanuser = user
			humanuser.stoppedfucking(target)

		return TRUE
	return FALSE

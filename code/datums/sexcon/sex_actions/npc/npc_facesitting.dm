/datum/sex_action/npc_facesitting
	name = "NPC Sit on their face with cunt"
	stamina_cost = 0
	check_same_tile = FALSE

/datum/sex_action/npc_facesitting/shows_on_menu(mob/living/user, mob/living/target)
	return FALSE

/datum/sex_action/npc_facesitting/can_perform(mob/living/user, mob/living/target)
	if(user.seeksfuck) //should filter down to only npcs with seeksfuck behavior.
		return TRUE
	return FALSE


/datum/sex_action/npc_facesitting/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] sits their butt on [target]'s face!"))


/datum/sex_action/npc_facesitting/on_perform(mob/living/user, mob/living/target)
	var/verbstring = pick(list("rubs", "smushes", "forces"))
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] [verbstring] their butt against [target] face."))
	target.make_sucking_noise()

	user.sexcon.perform_sex_action(user, 14, 3, TRUE)
	user.sexcon.handle_passive_ejaculation()

	target.heal_overall_damage(3,3,0, updating_health = TRUE)
	user.sexcon.perform_deepthroat_oxyloss(target, 1.3)
	user.sexcon.perform_sex_action(target, 0, 2, FALSE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/npc_facesitting/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] gets off [target]'s face."))
	if(issimple(user))
		var/mob/living/simple_animal/hostile/retaliate/rogue/simpleuser = user
		simpleuser.stoppedfucking(target)
	else
		var/mob/living/carbon/human/humanuser = user
		humanuser.stoppedfucking(target)

/datum/sex_action/npc_facesitting/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		if(issimple(user))
			var/mob/living/simple_animal/hostile/retaliate/rogue/simpleuser = user
			simpleuser.stoppedfucking(target)
		else
			var/mob/living/carbon/human/humanuser = user
			humanuser.stoppedfucking(target)

		return TRUE
	return FALSE

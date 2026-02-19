/datum/ai_behavior/horny
	action_cooldown = 2 SECONDS
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT | AI_BEHAVIOR_MOVE_AND_PERFORM | AI_BEHAVIOR_CAN_PLAN_DURING_EXECUTION

	var/seekboredom = 0
	var/stand_up_counter = 0
	var/wrong_action = FALSE
	var/knockdown_need = TRUE


/datum/ai_behavior/horny/setup(datum/ai_controller/controller, target_key, targetting_datum_key)
	. = ..()
	var/datum/horny_targetting_datum/targetting_datum = controller.blackboard[targetting_datum_key]
	if(isnull(targetting_datum))
		CRASH("No target datum was supplied in the blackboard for [controller.pawn]")

	if(isnull(controller.blackboard[BB_HORNY_TIME_START]))
		controller.set_blackboard_key(BB_HORNY_TIME_START, world.time)

	var/atom/target = controller.blackboard[target_key]

	var/mob/living/target_living = target
	var/mob/living/basic_mob = controller.pawn

	if(!basic_mob.GetComponent(/datum/component/arousal)) // give arousal datum if none
		basic_mob.AddComponent(/datum/component/arousal)

	if((basic_mob.gender == MALE && !basic_mob.getorganslot(ORGAN_SLOT_PENIS)) || (basic_mob.gender == FEMALE && !basic_mob.getorganslot(ORGAN_SLOT_VAGINA)))
		basic_mob.give_genitals()

	var/list/arousal_data = list()
	SEND_SIGNAL(basic_mob, COMSIG_SEX_GET_AROUSAL, arousal_data)
	var/is_spent = arousal_data["is_spent"]

	if(world.time < controller.blackboard[BB_HORNY_SEEK_COOLDOWN] || is_spent) // if on cooldown or unhorny - stop
		return FALSE

	if(targetting_datum.can_horny(basic_mob, target_living))
		if(basic_mob.gender == MALE)
			basic_mob.visible_message(span_boldwarning("[basic_mob] has his eyes on [target_living], cock throbbing!"))
		else
			basic_mob.visible_message(span_boldwarning("[basic_mob] has her eyes on [target_living], cunt dripping!"))

	SEND_SIGNAL(basic_mob, COMSIG_SET_ERECT_STATE, 4)

	var/obj/item/organ/genitals/picked_organ
	if(basic_mob.getorganslot(ORGAN_SLOT_PENIS))
		picked_organ = basic_mob.getorganslot(ORGAN_SLOT_PENIS)
	else if(basic_mob.getorganslot(ORGAN_SLOT_VAGINA))
		picked_organ = basic_mob.getorganslot(ORGAN_SLOT_VAGINA)
	if(picked_organ)
		picked_organ.toggle_visibility("Show Above clothes")

	basic_mob.start_sex_session(target_living)
	if(QDELETED(target))
		return FALSE
	set_movement_target(controller, target)

	controller.set_blackboard_key(BB_HORNY_STUN_COOLDOWN, world.time)
	SEND_SIGNAL(controller.pawn, COMSIG_HORNY_TARGET_SET, TRUE)

/datum/ai_behavior/horny/perform(seconds_per_tick, datum/ai_controller/controller, target_key, targetting_datum_key)
	. = ..()

	if(world.time < controller.blackboard[BB_HORNY_SEEK_COOLDOWN]) // if on cooldown - stop
		controller.CancelActions()
		controller.modify_cooldown(controller, world.time)
		return FALSE

	var/datum/horny_targetting_datum/targetting_datum = controller.blackboard[targetting_datum_key]

	if(!targetting_datum)
		CRASH("No target datum was supplied in the blackboard for [controller.pawn]")

	var/atom/current_target = controller.blackboard[target_key]
	var/mob/living/basic_mob = controller.pawn

	if(!targetting_datum.can_horny(basic_mob, current_target))
		finish_action(controller, FALSE, target_key)
		return

	if(ismob(current_target))
		if(current_target:stat == DEAD)
			finish_action(controller, FALSE, target_key)
			return


	var/mob/living/target_living = current_target

	//check if they got away during chasing
	if(seekboredom > 10) //11 cycles of Perform, thus //44 sec
		seekboredom = 0
		finish_action(controller, FALSE, target_key)
		return

	if(!basic_mob.Adjacent(target_living))
		knockdown_need = TRUE
		seekboredom += 1
		return
	else
		seekboredom = CLAMP(seekboredom - 1, 0, 10)

	if(target_living.body_position != LYING_DOWN)
		knockdown_need = TRUE

	var/list/arousal_data = list()
	SEND_SIGNAL(basic_mob, COMSIG_SEX_GET_AROUSAL, arousal_data)
	var/is_spent = arousal_data["is_spent"]
	var/last_orgasm_time = arousal_data["last_ejaculation_time"]

	var/datum/sex_session/session = get_sex_session(basic_mob, target_living)
	if(!session) //if we took too long and it's deleted
		basic_mob.start_sex_session(target_living)
		session = get_sex_session(basic_mob, target_living)

	//check if we are sated
	if(last_orgasm_time > world.time - 10 SECONDS || is_spent || controller.blackboard[BB_HORNY_TIME_START] < world.time - 5 MINUTES)
		if(session)
			session.stop_current_action()
		finish_action(controller, TRUE, target_key)
		return

	if(basic_mob.body_position == LYING_DOWN) //try to stand before doing anything
		if(!basic_mob.stand_up())
			stand_up_counter += 1
			if(stand_up_counter >= 5)
				finish_action(controller, FALSE, target_key)
		stand_up_counter = 0
		return

	//do stun here
	if(world.time > controller.blackboard[BB_HORNY_STUN_COOLDOWN] && knockdown_need)
		if(basic_mob.Adjacent(target_living))
			var/prob2defend
			var/obj/item/mainhand = target_living.get_active_held_item()
			var/obj/item/offhand = target_living.get_inactive_held_item()
			var/parry_data = target_living.calculate_parry_values(mainhand, offhand)
			prob2defend += CLAMP(parry_data["defense_bonus"]/80, 0, 40)
			prob2defend += CLAMP(target_living.STASPD / 20 * 50, 0, 50)
			if(target_living.body_position == LYING_DOWN)
				prob2defend *= 0.1
			if(target_living.cmode)
				prob2defend *= 1.2
			if(target_living.surrendering)
				prob2defend *= 0.1
			prob2defend = CLAMP(prob2defend, 0, 85)

			if(prob(100-prob2defend))
				if(iscarbon(basic_mob))
					target_living.SetStun(40)
					target_living.SetKnockdown(50)
				else
					target_living.SetStun(100)
					target_living.SetKnockdown(200)
				if(target_living.body_position != LYING_DOWN)
					target_living.emote("gasp")
				controller.set_blackboard_key(BB_HORNY_STUN_COOLDOWN, world.time + 10 SECONDS)
				basic_mob.visible_message(span_danger("[basic_mob] tackles [target_living] down to the ground, dazing them!"))
			else
				controller.set_blackboard_key(BB_HORNY_STUN_COOLDOWN, world.time + 5 SECONDS)
				basic_mob.visible_message(span_danger("[basic_mob] fails to tackle [target_living] down!"))

			knockdown_need = FALSE
			return
		else
			knockdown_need = TRUE

	//do grab here
	if(iscarbon(basic_mob))
		var/mob/living/carbon/carbon_mob = controller.pawn
		if(!carbon_mob.pulling)
			carbon_mob.drop_all_held_items()
			var/sel_zone
			if(prob(30)) // chance to gag
				sel_zone = BODY_ZONE_PRECISE_MOUTH
			else
				sel_zone = pick(BODY_ZONE_CHEST, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG, BODY_ZONE_PRECISE_NECK, BODY_ZONE_PRECISE_GROIN)
			if(!length(target_living.grabbedby))
				target_living.grabbedby(carbon_mob, FALSE, sel_zone)


	if(ishuman(target_living))
		var/mob/living/carbon/human/human_target = target_living

		//disarm
		if(human_target.get_active_held_item() && human_target.Adjacent(basic_mob))
			for(var/obj/item/I in human_target.held_items)
				human_target.dropItemToGround(I, force = FALSE, silent = FALSE)
			human_target.Stun(30)
			human_target.visible_message(span_danger("[basic_mob] disarms [human_target]!"), \
					span_userdanger("[basic_mob] disarms me!"), span_hear("I hear someone getting punished!"), COMBAT_MESSAGE_RANGE)
			return

		//do undress here
		if(human_target.wear_pants)
			if(human_target.wear_pants.flags_inv & HIDECROTCH && !human_target.wear_pants.genital_access)
				if(!do_after(basic_mob, 1 SECONDS, human_target))
					if(!human_target.cmode) //pants off if not in cmode
						basic_mob.visible_message(span_danger("[basic_mob] manages to rip [human_target]'s [human_target.wear_pants.name] off!"))
						var/obj/item/clothing/thepants = human_target.wear_pants
						human_target.dropItemToGround(thepants)
						thepants.throw_at(pick(orange(2, get_turf(human_target))), 2, 1, basic_mob, TRUE)
					else if(human_target.cmode)
						basic_mob.visible_message(span_danger("[basic_mob] manages to tug [human_target]'s [human_target.wear_pants.name] out of the way!"))
					return
		else if(prob(30))
			for(var/obj/item/item as anything in human_target.get_equipped_items(FALSE))
				if(istype(item, /obj/item/clothing) || istype(item, /obj/item/storage/belt))
					if(!do_after(basic_mob, 1 SECONDS, human_target))
						if(!istype(item, /obj/item/storage) && !istype(item, /obj/item/clothing/ring))
							item.take_damage(damage_amount = item.max_integrity * 0.2, sound_effect = FALSE)
						basic_mob.visible_message(span_danger("[basic_mob] manages to rip [human_target]'s [item] off!"))
						human_target.dropItemToGround(item)
						item.throw_at(pick(orange(2, get_turf(human_target))), 2, 1, basic_mob, TRUE)
						return

		//do tie up here
		if(iscarbon(basic_mob) && human_target.body_position == LYING_DOWN && !human_target.get_active_held_item())
			var/mob/living/carbon/c_mob = controller.pawn
			if(basic_mob.Adjacent(human_target) && human_target.get_num_arms(TRUE) > 1 && !human_target.handcuffed)
				c_mob.visible_message(span_danger("[c_mob] begins to tie up [human_target]'s hands!"))
				session.stop_current_action()
				if(do_after(c_mob, 1 SECONDS, human_target))
					// Create and use rope cuffs
					var/obj/item/rope/rope_item = new /obj/item/rope
					if(rope_item.apply_cuffs(human_target, c_mob))
						return
					else
						qdel(rope_item)

			if(basic_mob.Adjacent(human_target) && !human_target.legcuffed)
				c_mob.visible_message(span_danger("[c_mob] begins to tie up [human_target]'s legs!"))
				session.stop_current_action()
				if(do_after(c_mob, 1 SECONDS, human_target))
					// Create and use rope cuffs
					var/obj/item/rope/leg_rope = new /obj/item/rope
					if(leg_rope.apply_cuffs(human_target, c_mob, TRUE))  // TRUE for legcuffs
						c_mob.stop_pulling()
						return
					else
						qdel(leg_rope)


	//starting the action

	if(session)
		//make it depend on anger or smth
		var/action_type = basic_mob.select_horny_ai_act(target_living)
		if(isnull(session.current_action))
			session.try_start_action(action_type)
			basic_mob.face_atom(target_living)
			var/force = rand(SEX_FORCE_MID, SEX_FORCE_MAX)
			var/speed = rand(SEX_SPEED_MID, SEX_SPEED_MAX)
			session.set_current_force(force)
			session.set_current_speed(speed)
			if(isnull(session.current_action))
				wrong_action = TRUE
				finish_action(controller, FALSE, target_key)




/datum/ai_behavior/horny/finish_action(datum/ai_controller/controller, succeeded, target_key, targetting_datum_key, hiding_location_key)
	. = ..()
	var/mob/living/basic_mob = controller.pawn

	SEND_SIGNAL(basic_mob, COMSIG_SET_ERECT_STATE, 0)


	var/obj/item/organ/genitals/picked_organ
	if(basic_mob.getorganslot(ORGAN_SLOT_PENIS))
		picked_organ = basic_mob.getorganslot(ORGAN_SLOT_PENIS)
		picked_organ.toggle_visibility(FALSE)
	if(basic_mob.getorganslot(ORGAN_SLOT_VAGINA))
		picked_organ = basic_mob.getorganslot(ORGAN_SLOT_VAGINA)
		picked_organ.toggle_visibility(FALSE)


	seekboredom = 0
	knockdown_need = TRUE
	wrong_action = FALSE
	basic_mob.stop_pulling()
	controller.clear_blackboard_key(target_key)
	controller.clear_blackboard_key(BB_HORNY_TIME_START)
	if(!succeeded)
		//if ran away - be angry
		controller.set_blackboard_key(BB_HORNY_SEEK_COOLDOWN, world.time + 30 SECONDS)
		basic_mob.visible_message(span_danger("[basic_mob] stomps on the ground, clearly unsatisfied!"))
		controller.modify_cooldown(controller, world.time)
		//controller.CancelActions()
		return



	//if sated - go off and sleep or smth
	controller.set_blackboard_key(BB_HORNY_SEEK_COOLDOWN, world.time + 90 SECONDS)
	basic_mob.visible_message(span_danger("[basic_mob] exhales contently!"))
	controller.modify_cooldown(controller, world.time)
	//controller.CancelActions()

/mob/living/proc/select_horny_ai_act(mob/living/target)
	var/current_action = /datum/sex_action/rub_body
	var/mob/living/target_mob = target
	if(gender == FEMALE && target_mob.gender == MALE)
		switch(rand(1,2))
			if(1) //anal
				current_action = /datum/sex_action/npc/npc_anal_ride_sex
			if(2) //vaginal
				current_action = /datum/sex_action/npc/npc_vaginal_ride_sex
	if(gender == MALE && target_mob.gender == MALE)
		switch(rand(1,2))
			if(1) //oral
				current_action = /datum/sex_action/npc/npc_throat_sex
			if(2) //anal
				current_action = /datum/sex_action/npc/npc_anal_sex
	if(gender == MALE && target_mob.gender == FEMALE)
		switch(rand(1,3))
			if(1) //oral
				current_action = /datum/sex_action/npc/npc_throat_sex
			if(2) //anal
				current_action = /datum/sex_action/npc/npc_anal_sex
			if(3) //vaginal
				current_action = /datum/sex_action/npc/npc_vaginal_sex
	if(gender == FEMALE && target_mob.gender == FEMALE)
		switch(rand(1,3))
			if(1) //oral
				current_action = /datum/sex_action/npc/npc_facesitting
			if(2) //anal
				current_action = /datum/sex_action/npc/npc_rimming
			if(3) //vaginal
				current_action = /datum/sex_action/npc/npc_cunnilingus
	return current_action

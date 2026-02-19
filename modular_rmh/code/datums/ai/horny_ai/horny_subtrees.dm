/datum/ai_planning_subtree/simple_find_horny

/datum/ai_planning_subtree/simple_find_horny/SelectBehaviors(datum/ai_controller/controller, delta_time)
	if(world.time < controller.blackboard[BB_HORNY_SEEK_COOLDOWN])
		return
	controller.queue_behavior(/datum/ai_behavior/find_potential_horny_targets, BB_BASIC_MOB_CURRENT_HORNY_TARGET, BB_HORNY_TARGETTING_DATUM, BB_BASIC_MOB_CURRENT_TARGET_HIDING_LOCATION)

/datum/ai_planning_subtree/horny
	/// Blackboard key containing current target
	var/target_key = BB_BASIC_MOB_CURRENT_HORNY_TARGET


/datum/ai_planning_subtree/horny/SelectBehaviors(datum/ai_controller/controller, delta_time)
	. = ..()
	var/atom/target = controller.blackboard[target_key]
	if(QDELETED(target))
		return
	if(world.time < controller.blackboard[BB_HORNY_SEEK_COOLDOWN])
		return
	controller.queue_behavior(/datum/ai_behavior/horny, BB_BASIC_MOB_CURRENT_HORNY_TARGET, BB_HORNY_TARGETTING_DATUM, BB_BASIC_MOB_CURRENT_TARGET_HIDING_LOCATION)
	if(target)
		return SUBTREE_RETURN_FINISH_PLANNING //we are going into +battle+...no distractions.

/datum/surgery/rogue_revival
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp,
		/datum/surgery_step/retract,
		/datum/surgery_step/saw,
		/datum/surgery_step/infuse_lux,
		/datum/surgery_step/cauterize
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_CHEST)

/datum/surgery_step/infuse_lux
	name = "infuse lux"
	ignore_clothes = TRUE
	implements = list(
		/obj/item/reagent_containers/lux = 80,
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	time = 10 SECONDS
	surgery_flags = SURGERY_BLOODY | SURGERY_INCISED | SURGERY_CLAMPED | SURGERY_RETRACTED | SURGERY_BROKEN
	skill_min = SKILL_LEVEL_JOURNEYMAN
	experience_multiplier = 5
	preop_sound = 'sound/surgery/organ2.ogg'
	success_sound = 'sound/surgery/organ1.ogg'

/datum/surgery_step/infuse_lux/preop(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	display_results(user, target, span_notice("I begin to revive [target]..."),
		span_notice("[user] begins to work lux into [target]'s heart."),
		span_notice("[user] begins to work lux into [target]'s heart."))
	return TRUE

/datum/surgery_step/infuse_lux/success(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool, datum/intent/intent)
	var/revive_pq = PQ_GAIN_REVIVE
	if(target.stat != DEAD)
		to_chat(user, "They're not dead!")
		return FALSE
	if(target.mob_biotypes & MOB_UNDEAD)
		display_results(user, target, span_notice("You cannot infuse life into the undead! The rot must be cured first."),
		"[user] works the lux into [target]'s innards.",
		"[user] works the lux into [target]'s innards.")
		return FALSE
	target.adjustOxyLoss(-target.getOxyLoss()) //Ye Olde CPR
	if(!target.revive(full_heal = FALSE))
		display_results(user, target, span_notice("The lux refuses to meld with [target]'s heart. Their damage must be too severe still."),
			"[user] works the lux into [target]'s innards, but nothing happens.",
			"[user] works the lux into [target]'s innards, but nothing happens.")
		return FALSE
	display_results(user, target, span_notice("You succeed in restarting [target]'s heart with the infusion of lux."),
		"[user] works the lux into [target]'s innards.",
		"[user] works the lux into [target]'s innards.")
	var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
	if(underworld_spirit)
		var/mob/dead/observer/ghost = underworld_spirit.ghostize()
		qdel(underworld_spirit)
		ghost.mind.transfer_to(target, TRUE)
	target.grab_ghost(force = TRUE) // even suicides
	target.emote("breathgasp")
	target.Jitter(100)
	target.update_body()
	target.client.prefs.copy_to(target, TRUE, FALSE) //reapply prefs for skin color and shit
	target.visible_message(span_notice("[target] is dragged back from Yamais's hold!"), span_green("I awake from the void."))
	qdel(tool)
	if(target.mind)
		if(revive_pq && !HAS_TRAIT(target, TRAIT_IWASREVIVED) && user?.ckey)
			adjust_playerquality(revive_pq, user.ckey)
			ADD_TRAIT(target, TRAIT_IWASREVIVED, "[type]")
	return TRUE

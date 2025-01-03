/datum/advclass/sawbones // doctor class. like the pilgrim, but more evil
	name = "Sawbones"
	tutorial = "It was an accident! Your patient wasn't using his second kidney, anyway. After an unfortunate 'misunderstanding' with the town and your medical practice, you know practice medicine on the run with your new associates. Business has never been better!"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/bandit/sawbones
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_bandit2.ogg'

/datum/outfit/job/roguetown/bandit/sawbones/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	head = /obj/item/clothing/head/roguetown/nightman
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	belt = /obj/item/storage/belt/rogue/leather
	wrists = /obj/item/clothing/wrists/roguetown/wrappings
	cloak = /obj/item/clothing/cloak/black_cloak //spooky drip
	beltr = /obj/item/rogueweapon/huntingknife/cleaver
	beltl = /obj/item/rogueweapon/sword/rapier
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backl = /obj/item/storage/backpack/rogue/backpack
	id = /obj/item/flashlight/flare/torch/lantern/ring
	backpack_contents = list(
		/obj/item/reagent_containers/glass/alembic = 1,
		/obj/item/storage/fancy/ifak = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1,
		/obj/item/storage/box/matches = 1, /// for carterizer and lantern.
		/obj/item/storage/fancy/skit = 1,
	)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE) //normally was gonna be knife only but this is still a hunted man.
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/lumberjacking, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE) //needed for getting into hideout
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE) //so they can use alembic and do more shit.
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) //Given for consistency sake as the idol still provides scalemail.
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	H.change_stat("strength", 3)
	H.change_stat("endurance", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("speed", 1)
	if(H.age == AGE_OLD)
		H.change_stat("speed", -1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/docheal)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/stable)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/purge)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/debride)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/cpr)
	H.verbs |= /mob/proc/haltyell
	H.ambushable = FALSE

//some of the stuff mori didnt port
/obj/effect/proc_holder/spell/targeted/debride // Cure rot if has weak liver debuff
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Tissue Debridement"
	overlay_state = "unrot"
	range = 1
	include_user = FALSE
	sound = 'sound/combat/newstuck.ogg'
	associated_skill = /datum/skill/misc/medicine
	antimagic_allowed = TRUE
	chargetime = 100
	charge_max = 1 MINUTES
	miracle = FALSE
	devotion_cost = 0
	var/unzombification_pq = PQ_GAIN_UNZOMBIFY

/obj/effect/proc_holder/spell/targeted/cpr
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Cardiac Massage"
	overlay_state = "cpr"
	range = 1
	include_user = FALSE
	sound = 'sound/combat/newstuck.ogg'
	associated_skill = /datum/skill/misc/medicine
	antimagic_allowed = TRUE
	chargetime = 100
	charge_max = 1 MINUTES
	miracle = FALSE
	devotion_cost = 0
	var/revive_pq = PQ_GAIN_REVIVE

/obj/effect/proc_holder/spell/targeted/cpr/cast(list/targets, mob/living/user)
	. = ..()
	var/mob/living/carbon/human/targetboi = targets[1]
	if(isliving(targetboi) && targetboi.has_status_effect(/datum/status_effect/debuff/wheart))
		testing("revived1")
		var/mob/living/target = targetboi
		if(target == user)
			return FALSE
		if(target.stat < DEAD)
			to_chat(user, span_warning("Nothing happens."))
			return FALSE
		if(target.mob_biotypes & MOB_UNDEAD)
			to_chat(user, span_warning("it's undead, I can't."))
			return FALSE
		if(!target.revive(full_heal = FALSE))
			to_chat(user, span_warning("they need to be mended more."))
			return FALSE
		testing("revived2")
		var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
		//GET OVER HERE!
		if(underworld_spirit)
			var/mob/dead/observer/ghost = underworld_spirit.ghostize()
			qdel(underworld_spirit)
			ghost.mind.transfer_to(target, TRUE)
		target.grab_ghost(force = TRUE)
		target.emote("breathgasp")
		target.Jitter(100)
		if(isseelie(target))
			var/mob/living/carbon/human/fairy_target = target
			fairy_target.set_heartattack(FALSE)
			var/obj/item/organ/wings/Wing = fairy_target.getorganslot(ORGAN_SLOT_WINGS)
			if(Wing == null)
				var/wing_type = fairy_target.dna.species.organs[ORGAN_SLOT_WINGS]
				var/obj/item/organ/wings/seelie/new_wings = new wing_type()
				new_wings.Insert(fairy_target)
		target.update_body()
		target.visible_message(span_notice("[target] is revived by holy light!"), span_green("I awake from the void."))
		if(target.mind)
			if(revive_pq && !HAS_TRAIT(target, TRAIT_IWASREVIVED) && user?.ckey)
				adjust_playerquality(revive_pq, user.ckey)
				ADD_TRAIT(target, TRAIT_IWASREVIVED, "[type]")
			target.mind.remove_antag_datum(/datum/antagonist/zombie)
		return TRUE
	to_chat(user, span_warning("I need too prime their heart first"))
	return FALSE

/obj/effect/proc_holder/spell/targeted/cpr/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		return FALSE
	var/found = null
	for(var/obj/structure/bed/rogue/S in oview(5, user))
		found = S
	if(!found)
		to_chat(user, span_warning("I need them on a bed"))
		return FALSE
	return TRUE

/obj/effect/proc_holder/spell/targeted/debride/cast(list/targets, mob/living/user)
	var/mob/living/carbon/human/targetboi = targets[1]
	if(isliving(targetboi) && targetboi.has_status_effect(/datum/status_effect/debuff/wliver))
		testing("curerot1")
		var/mob/living/target = targetboi
		if(target == user)
			return FALSE
		var/datum/antagonist/zombie/was_zombie = target.mind?.has_antag_datum(/datum/antagonist/zombie)
		var/has_rot = was_zombie
		if(!has_rot && iscarbon(target))
			var/mob/living/carbon/stinky = target
			for(var/obj/item/bodypart/bodypart as anything in stinky.bodyparts)
				if(bodypart.rotted || bodypart.skeletonized)
					has_rot = TRUE
					break
		if(!has_rot)
			to_chat(user, span_warning("Nothing happens."))
			return FALSE
		testing("curerot2")
		if(was_zombie)
			if(was_zombie.become_rotman && prob(10)) //10% chance to NOT become a rotman
				was_zombie.become_rotman = FALSE
			target.mind.remove_antag_datum(/datum/antagonist/zombie)
			target.Unconscious(20 SECONDS)
			target.emote("breathgasp")
			target.Jitter(100)
			if(unzombification_pq && !HAS_TRAIT(target, TRAIT_IWASUNZOMBIFIED) && user?.ckey)
				adjust_playerquality(unzombification_pq, user.ckey)
				ADD_TRAIT(target, TRAIT_IWASUNZOMBIFIED, "[type]")
		var/datum/component/rot/rot = target.GetComponent(/datum/component/rot)
		if(rot)
			rot.amount = 0
		if(iscarbon(target))
			var/mob/living/carbon/stinky = target
			for(var/obj/item/bodypart/rotty in stinky.bodyparts)
				rotty.rotted = FALSE
				rotty.skeletonized = FALSE
				rotty.update_limb()
				rotty.update_disabled()
		target.update_body()
		if(!HAS_TRAIT(target, TRAIT_ROTMAN))
			target.visible_message(span_notice("The rot leaves [target]'s body!"), span_green("I feel the rot leave my body!"))
		else
			target.visible_message(span_warning("The rot fails to leave [target]'s body!"), span_warning("I feel no different..."))
		return TRUE
	to_chat(user, span_warning("I need too prime their liver first"))
	return FALSE

/obj/effect/proc_holder/spell/targeted/debride/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		return FALSE
	var/found = null
	for(var/obj/structure/bed/rogue/S in oview(5, user))
		found = S
	if(!found)
		to_chat(user, span_warning("I need to lay them on a bed"))
		return FALSE
	return TRUE


/obj/effect/proc_holder/spell/targeted/docheal/cast(list/targets, mob/living/user)
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.visible_message(span_green("[user] tends to [target]'s wounds with the focus and purpose."), span_notice("I feel better already."))
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			var/obj/item/bodypart/affecting = C.get_bodypart(check_zone(user.zone_selected))
			if(affecting)
				if(affecting.heal_damage(50, 50))
					C.update_damage_overlays()
				if(affecting.heal_wounds(50))
					C.update_damage_overlays()
		else
			target.adjustBruteLoss(-50)
			target.adjustFireLoss(-50)
		target.adjustToxLoss(-50)
		target.adjustOxyLoss(-50)
		target.blood_volume += BLOOD_VOLUME_SURVIVE
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/targeted/stable/cast(list/targets, mob/user)
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/ramount = 10
		var/rid = /datum/reagent/medicine/stimu
		target.reagents.add_reagent(rid, ramount)
		target.visible_message(span_green("[user] stabs [target]'s chest with a syringe, causing there breathing to return to normal."), span_notice("I feel my breathing steady and grip on life tighten."))
		target.setOxyLoss(-100)
		target.adjustToxLoss(-50)
		target.emote("rage")
		target.blood_volume += BLOOD_VOLUME_SURVIVE
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/targeted/purge/cast(list/targets, mob/user)
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/obj/item/bodypart/BPA = target.get_bodypart(BODY_ZONE_R_ARM)
		BPA.add_wound(/datum/wound/artery/)
		target.visible_message(span_danger("[user] slashes [target]'s artery open letting the toxins and other impurities bleed and drain from them. they might want to stitch that soon."), span_notice("I've been cut by [user] I feel the toxins leaving my body with each heart beat. im getting light headed...."))
		target.adjustToxLoss(-999)
		target.adjustBruteLoss(30, BRUTE, BPA)
		target.reagents.remove_all_type(/datum/reagent, 9999)
		target.emote("scream")
		return TRUE
	return FALSE

/obj/item/organ/heart/weak
	name = "weakened heart"
	desc = "this thing seems barely functional"

/datum/status_effect/debuff/wheart
	id = "wheart"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/wheart
	effectedstats = list("strength" = -3, "constitution" = -3, "endurance" = -3, "speed" = -3)

/atom/movable/screen/alert/status_effect/debuff/wheart
	name = "Weak Heart"
	desc = "I feel drained and sluggish, I should get a new heart."

/obj/item/organ/heart/weak/Insert(mob/living/carbon/M)
	..()
	M.apply_status_effect(/datum/status_effect/debuff/wheart)

/obj/item/organ/heart/weak/Remove(mob/living/carbon/M, special = 0)
	..()
	if(M.has_status_effect(/datum/status_effect/debuff/wheart))
		M.remove_status_effect(/datum/status_effect/debuff/wheart)

/obj/item/organ/liver/weak
	name = "weakened liver"
	desc = "this thing seems barely functional"

/datum/status_effect/debuff/wliver
	id = "wliver"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/wliver
	effectedstats = list("strength" = -3, "constitution" = -3, "endurance" = -3, "speed" = -3)

/atom/movable/screen/alert/status_effect/debuff/wliver
	name = "Weak Liver"
	desc = "I feel drained and sluggish, I should get a new liver."

/obj/item/organ/liver/weak/Insert(mob/living/carbon/M)
	..()
	if(M)
		M.apply_status_effect(/datum/status_effect/debuff/wliver)

/obj/item/organ/liver/weak/Remove(mob/living/carbon/M, special = 0)
	..()
	if(M.has_status_effect(/datum/status_effect/debuff/wliver))
		M.remove_status_effect(/datum/status_effect/debuff/wliver)

/datum/surgery/hepa
	name = "Hepatectomy"
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_PRECISE_STOMACH)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp,
		/datum/surgery_step/retract,
		/datum/surgery_step/saw,
		/datum/surgery_step/resection,
		/datum/surgery_step/cauterize,
	)

/datum/surgery_step/resection
	name = "Perform Liver Rejuvination"
	time = 20 SECONDS
	accept_hand = FALSE
	possible_locs = list(BODY_ZONE_PRECISE_STOMACH)
	implements = list(
		TOOL_SCALPEL = 60,
		TOOL_SHARP = 40,
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	surgery_flags = SURGERY_INCISED | SURGERY_RETRACTED
	skill_min = SKILL_LEVEL_EXPERT
	skill_median = SKILL_LEVEL_MASTER

/datum/surgery_step/resection/preop(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	if(target.has_status_effect(/datum/status_effect/debuff/wliver))
		to_chat(user, "Their liver is too weak")
		return FALSE
	else
		display_results(user, target, span_notice("I begin a resection on [target]'s liver..."),
			span_notice("[user] begins to carve into [target]'s liver."),
			span_notice("[user] begins to carve into [target]'s liver."))
		return TRUE

/datum/surgery_step/resection/success(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	display_results(user, target, span_notice("I successfully resect damaged and infected portions of [target]'s liver."),
		span_notice("[user] successfully carves out chunks of [target]'s liver, restoring its function!"),
		span_notice("[user] successfully carves out chunks of [target]'s liver, restoring its function!"))
	var/obj/item/organ/liver/liver = target.getorganslot(ORGAN_SLOT_LIVER)
	if(liver)
		liver.Remove(target)
		QDEL_NULL(liver)
		liver = new /obj/item/organ/liver/weak
		liver.Insert(target)
		return TRUE

/datum/surgery/bypass
	name = "Coronary artery bypass surgery"
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_CHEST)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp,
		/datum/surgery_step/retract,
		/datum/surgery_step/saw,
		/datum/surgery_step/bypass,
		/datum/surgery_step/cauterize,
	)

/datum/surgery_step/bypass
	name = "Perform Heart Rejuvination"
	time = 20 SECONDS
	accept_hand = TRUE
	implements = list(
		TOOL_HEMOSTAT = 60,
		TOOL_IMPROVHEMOSTAT = 30,
		TOOL_HAND = 10,
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	surgery_flags = SURGERY_BLOODY | SURGERY_INCISED | SURGERY_CLAMPED | SURGERY_RETRACTED | SURGERY_BROKEN
	skill_min = SKILL_LEVEL_EXPERT
	skill_median = SKILL_LEVEL_MASTER

/datum/surgery_step/bypass/preop(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	if(target.has_status_effect(/datum/status_effect/debuff/wheart))
		to_chat(user, "Their heart is too weak")
		return FALSE
	else
		display_results(user, target, span_notice("I begin to bypass the arteries in [target]'s heart...."),
			span_notice("[user] begins to bypass the arteries in [target]'s heart."),
			span_notice("[user] begins to bypass the arteries in [target]'s heart."))
		return TRUE

/datum/surgery_step/bypass/success(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	display_results(user, target, span_notice("I successfully bypass the arteries in [target]'s heart."),
		span_notice("[user] successfully bypassess the arteries in [target]'s heart, restoring its function!"),
		span_notice("[user] successfully bypassess the arteries in [target]'s heart, restoring its function!"))
	var/obj/item/organ/heart/heart = target.getorganslot(ORGAN_SLOT_HEART)
	if(heart)
		heart.Remove(target)
		QDEL_NULL(heart)
		heart = new /obj/item/organ/heart/weak
		heart.Insert(target)
		return TRUE

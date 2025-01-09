// Eldritch faithless healing
/obj/effect/proc_holder/spell/invoked/eldritchhealing/any
	ignore_faithless = TRUE

/obj/effect/proc_holder/spell/invoked/eldritchhealing
	name = "Eldritch Healing"
	overlay_state = null
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/magic/heal.ogg'
	invocation = "Wounds, be sealed."
	invocation_type = "whisper"
	associated_skill = /datum/skill/magic/arcane
	antimagic_allowed = TRUE
	charge_max = 20 SECONDS
	miracle = FALSE
	var/patronname = ""
	var/targetnotification = "Shimmering arcane energy lessens my pain!" // This (and the line below) is a default message; Warlocks with patrons will have it overwritten in their job file.
	var/othernotification = "is surrounded by shimmering arcane energy."
	var/ignore_faithless = FALSE

/obj/effect/proc_holder/spell/invoked/eldritchhealing/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		target.visible_message(span_info("[target] "+othernotification), span_notice(targetnotification))
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

// curse
/obj/effect/proc_holder/spell/invoked/eldritchcurse
	name = "curse of the "
	overlay_state = null
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/magic/heal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/arcane
	antimagic_allowed = TRUE
	charge_max = 20 SECONDS
	miracle = FALSE
	var/patronname = ""
	var/datum/status_effect/buff/eldritchcurse/curse

/obj/effect/proc_holder/spell/invoked/eldritchcurse/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]

		if(target.has_status_effect(curse))
			target.remove_status_effect(curse)
		else
			target.apply_status_effect(curse) //apply debuff

/datum/status_effect/buff/eldritchcurse
	id = "eldritchcurse"
	effectedstats = list("fortune" = -4) // This default case will be overridden for warlocks. Low luck is the closest to a "generic" curse, randomly failing a bit at everything.
	alert_type = /atom/movable/screen/alert/status_effect/buff/eldritchcurse
	duration = -1

/datum/status_effect/buff/eldritchcurse/archfey
	effectedstats = list("intelligence" = -2, "fortune" = -2)

/datum/status_effect/buff/eldritchcurse/celestial
	effectedstats = list("constitution" = -2, "perception" = -2)

/datum/status_effect/buff/eldritchcurse/fathomless
	effectedstats = list("endurance" = -2, "perception" = -2)

/datum/status_effect/buff/eldritchcurse/genie
	effectedstats = list("fortune" = -4)

/datum/status_effect/buff/eldritchcurse/goo
	effectedstats = list("intelligence" = -2, "constitution" = -2)

/datum/status_effect/buff/eldritchcurse/hexblade
	effectedstats = list("speed" = -2,"strength" = -2)

/datum/status_effect/buff/eldritchcurse/undead
	effectedstats = list("constitution" = -4)

/atom/movable/screen/alert/status_effect/buff/eldritchcurse
	name = "eldritch curse"
	desc = "I am cursed by a lesser diety."
	icon_state = "debuff"

// cloak of flies
/obj/effect/proc_holder/spell/self/cloakofflies
	name = "Cloak of Flies"
	desc = ""
	overlay_state = "null"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	charge_max = 20  //2 seconds

	warnie = "spellwarning"

	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Shield me with rot!"
	invocation_type = "shout"
	var/activated = FALSE
	var/rot_type = /datum/component/rot/warlock
	var/static/mutable_appearance/flies = mutable_appearance('icons/roguetown/mob/rotten.dmi', "rotten")

/obj/effect/proc_holder/spell/self/cloakofflies/cast(mob/user = usr)
	..()

	if(activated)
		qdel(user.GetComponent(/datum/component/rot/warlock))
		activated = FALSE
		user.cut_overlay(flies)
		user.update_vision_cone()
		user.visible_message("<span class='info'>The flies surrounding [user] go away.</span>", "<span class='notice'>My cloak of flies dissipates.</span>")
	else
		user.AddComponent(/datum/component/rot/warlock)
		activated = TRUE
		user.add_overlay(flies)
		user.update_vision_cone()
		user.visible_message("<span class='info'>[user] is surrounded in a cloud of flies.</span>", "<span class='notice'>My cloak of flies surrounds me.</span>")

/datum/component/rot/warlock
	soundloop = /datum/looping_sound/fliesloop/quiet

/datum/component/rot/warlock/process()
	..()
	var/mob/living/L = parent
	if(soundloop && soundloop.stopped)
		soundloop.start()
	var/turf/open/T = get_turf(L)
	if(istype(T))
		T.add_pollutants(/datum/pollutant/flies, 10)

/datum/looping_sound/fliesloop/quiet
	mid_sounds = list('sound/misc/fliesloop.ogg')
	mid_length = 60
	volume = 25
	extra_range = 0

//find familiar (imp, psuedodragon, quasit, seelie)
/obj/effect/proc_holder/spell/self/findfamiliar
	name = "Find Familiar"
	desc = ""
	overlay_state = "null"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	charge_max = 1 HOURS

	warnie = "spellwarning"

	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Come forth, familiar."
	invocation_type = "whisper"

	var/mob/living/fam
	var/mob/master

/obj/effect/proc_holder/spell/self/findfamiliar/cast(mob/user = usr)
	..()
	var/familiars = list(
		"Imp" = /mob/living/carbon/human/species/goblin/hell,
		"Crab" = /mob/living/simple_animal/hostile/retaliate/rogue/mossback,
		"Skeleton" = /mob/living/carbon/human/species/skeleton,
		"Sprite" = /mob/living/simple_animal/shade,
		"Wolf" = /mob/living/simple_animal/hostile/retaliate/rogue/wolf,
		"Mutated Spider" = /mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated,
		"Buck" = /mob/living/simple_animal/hostile/retaliate/rogue/saigabuck,
		"Rous" = /mob/living/simple_animal/hostile/retaliate/rogue/bigrat,
		"Goat" = /mob/living/simple_animal/hostile/retaliate/rogue/goat,
		"Mole" = /mob/living/simple_animal/hostile/retaliate/rogue/mole,
		)
	var/familiarchoice = input("Choose your familiar", "Available familiars") as anything in familiars
	var/familiar_type = familiars[familiarchoice]
	to_chat(user, span_notice("Trying to find familiar..."))
	var/list/L = pollGhostCandidates("Do you want to play as [span_notice("[span_danger("[user.real_name]'s")] familiar")]?", ROLE_PAI)

	if(LAZYLEN(L))
		master = user
		var/mob/chosen_one =  pick(L)
		fam = new familiar_type(user.loc)
		fam.key = chosen_one.key
		to_chat(user, span_notice("Your familiar appears..."))
		chosen_one.mind.transfer_to(fam)
		fam.fully_replace_character_name(null, "[user]'s familiar")
		fam.get_language_holder().omnitongue = TRUE //Grants omnitongue
		//user.mind.RemoveSpell(/obj/effect/proc_holder/spell/self/findfamiliar)  Until we find a way to bring the spell back, there'll be a cooldown of 1 hour instead
	else
		to_chat(user, span_notice("You could not find a familiar..."))
		revert_cast()

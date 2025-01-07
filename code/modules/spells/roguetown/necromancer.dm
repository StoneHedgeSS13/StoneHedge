/obj/effect/proc_holder/spell/invoked/strengthen_undead
	name = "Infuse Unlife"
	overlay_state = "raiseskele"
	releasedrain = 30
	chargetime = 2
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	associated_skill = /datum/skill/magic/blood
	antimagic_allowed = TRUE
	charge_max = 5 SECONDS //you are likely to have many undeads and no other way to heal them so it should be fast.
	miracle = FALSE
	invocation = "Infuse unlife!"
	invocation_type = "shout"
	xp_gain = TRUE

/obj/effect/proc_holder/spell/invoked/strengthen_undead/cast(list/targets, mob/living/user)
	. = ..()
	if(!ismob(targets[1])) //no miscasting this shit on empty turfs.
		return FALSE
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.mob_biotypes & MOB_UNDEAD) //negative energy heals the undead
			var/obj/item/bodypart/affecting = target.get_bodypart(check_zone(user.zone_selected))
			if(affecting)
				if(affecting.heal_damage(150, 150))
					target.update_damage_overlays()
				if(affecting.heal_wounds(50)) //this shit is per limb and slow so damn.
					target.update_damage_overlays()
			target.heal_overall_damage(150, 150, updating_health = TRUE)
			target.visible_message(span_danger("[target] reforms under the vile energy!"), span_notice("I'm remade by dark magic!"))
			return TRUE
/*
		target.visible_message(span_info("Necrotic energy floods over [target]!"), span_userdanger("I feel colder as the dark energy floods into me!"))
		if(iscarbon(target))
			target.emote("scream")
			target.Stun(20)
		else
			target.adjustBruteLoss(20)
		return TRUE
*/
	return FALSE

/obj/effect/proc_holder/spell/invoked/eyebite
	name = "Eyebite"
	overlay_state = "raiseskele"
	releasedrain = 30
	chargetime = 7
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/items/beartrap.ogg'
	associated_skill = /datum/skill/magic/arcane
	antimagic_allowed = TRUE
	charge_max = 15 SECONDS
	miracle = FALSE
	invocation = "Eyebite!"
	invocation_type = "shout"
	xp_gain = TRUE

/obj/effect/proc_holder/spell/invoked/eyebite/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.visible_message(span_info("A loud crunching sound has come from [target]!"), span_userdanger("I feel arcane teeth biting into my eyes!"))
		target.adjustBruteLoss(30)
		target.blind_eyes(2)
		target.blur_eyes(10)
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/invoked/raise_undead
	name = "Raise Undead"
	desc = ""
	clothes_req = FALSE
	range = 7
	overlay_state = "raiseskele"
	sound = list('sound/magic/magnet.ogg')
	releasedrain = 40
	chargetime = 30
	warnie = "spellwarning"
	no_early_release = TRUE
	charging_slowdown = 1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/blood
	charge_max = 30 SECONDS
	xp_gain = TRUE


/**
  * Raises a minion from a corpse. Prioritizing ownership to original player > ghosts > npc.
  *
  * Vars:
  * * targets: list of mobs that are targetted.
  * * user: spell caster.
  */
/obj/effect/proc_holder/spell/invoked/raise_undead/cast(list/targets, mob/living/carbon/human/user)
	. = ..()

	user.say("Hgf'ant'kthar!")

	var/obj = targets[1]

	if(!obj || !istype(obj, /mob/living/carbon/human))
		to_chat(user, span_warning("I need to cast this spell on a corpse."))
		return FALSE

	var/mob/living/carbon/human/target = obj

	if(target.stat != DEAD)
		to_chat(user, span_warning("I cannot raise the living."))
		return FALSE

	var/obj/item/bodypart/target_head = target.get_bodypart(BODY_ZONE_HEAD)
	if(!target_head)
		to_chat(user, span_warning("This corpse is headless."))
		return FALSE

	var/offer_refused = FALSE

	target.visible_message(span_warning("[target.real_name]'s body is engulfed by dark energy..."), runechat_message = TRUE)

	if(target.ckey) //player still inside body

		var/offer = alert(target, "Do you wish to be reanimated as a minion? If you refuse someone else will take over your body.", "RAISED BY NECROMANCER", "Yes", "No")
		var/offer_time = world.time

		if(offer == "No" || world.time > offer_time + 5 SECONDS)
			to_chat(target, span_danger("Another soul will take over."))
			offer_refused = TRUE

		else if(offer == "Yes")
			to_chat(target, span_danger("You rise as a minion."))
			target.turn_to_minion(user, target.ckey)
			target.visible_message(span_warning("[target.real_name]'s eyes light up with an evil glow."), runechat_message = TRUE)
			return TRUE

	if(!target.ckey || offer_refused) //player is not inside body or has refused, poll for candidates

		var/list/candidates = pollCandidatesForMob("Do you want to play as a Necromancer's minion?", null, null, null, 100, target, POLL_IGNORE_NECROMANCER_SKELETON)

		// theres at least one candidate
		if(LAZYLEN(candidates))
			var/mob/C = pick(candidates)
			target.turn_to_minion(user, C.ckey)
			target.visible_message(span_warning("[target.real_name]'s eyes light up with an eerie glow."), runechat_message = TRUE)

		//no candidates, raise as npc
		else
			target.turn_to_minion(user)
			target.visible_message(span_warning("[target.real_name]'s eyes light up with a weak glow."), runechat_message = TRUE)

		return TRUE

	return FALSE

/mob/living/carbon/human

	///npc's master that it should follow around.
	var/mob/living/carbon/human/mastermob = null
	var/following_master = FALSE

/mob/living/carbon/human/npc_idle()
	. = ..()
	if(mastermob && following_master)
		if(mode == AI_IDLE || mode == AI_HUNT) //if not in combat, follow master.
			walk2derpless(mastermob)

/**
  * Turns a mob into a skeletonized minion. Used for raising undead minions.
  * If a ckey is provided, the minion will be controlled by the player, NPC otherwise.
  *
  * Vars:
  * * master: master of the minion.
  * * ckey (optional): ckey of the player that will control the minion.
  */
/mob/living/carbon/human/proc/turn_to_minion(mob/living/carbon/human/master, ckey)

	if(!master)
		return FALSE

	src.revive(TRUE, TRUE)

	if(ckey) //player
		src.ckey = ckey
	else //npc
		mastermob = master
		aggressive = 1
		mode = AI_HUNT
		wander = TRUE
		following_master = TRUE

	if(!mind)
		mind_initialize()

	mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
	mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	mind.current.job = null

	dna.species.species_traits |= NOBLOOD
	dna.species.soundpack_m = new /datum/voicepack/skeleton()
	dna.species.soundpack_f = new /datum/voicepack/skeleton()


	cmode_music = 'sound/music/combat_cult.ogg'

	patron = master.patron
	mob_biotypes = MOB_UNDEAD
	faction = list("undead")
	ambushable = FALSE
	underwear = "Nude"

	for(var/obj/item/bodypart/BP in bodyparts)
		BP.skeletonize()

	var/obj/item/organ/eyes/eyes = getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)

	eyes = new /obj/item/organ/eyes/night_vision/zombie
	eyes.Insert(src)

	if(charflaw)
		QDEL_NULL(charflaw)

	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOLIMBDISABLE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_EASYDISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_LIMBATTACHMENT, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOSLEEP, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)

	update_body()

	to_chat(src, span_userdanger("My master is [master.real_name]. I must follow their orders and protect them, no matter what."))

	master.minions += src

	return TRUE

/obj/effect/proc_holder/spell/invoked/projectile/sickness
	name = "Ray of Sickness"
	desc = ""
	clothes_req = FALSE
	range = 15
	projectile_type = /obj/projectile/magic/sickness
	overlay_state = "raiseskele"
	sound = list('sound/misc/portal_enter.ogg')
	active = FALSE
	releasedrain = 30
	chargetime = 5
	warnie = "spellwarning"
	no_early_release = TRUE
	charging_slowdown = 1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	charge_max = 15 SECONDS
	invocation = "Ray of Sickness!"
	invocation_type = "shout"
	xp_gain = TRUE

/obj/effect/proc_holder/spell/self/command_undead
	name = "Command Undead"
	desc = "!"
	overlay_state = "raiseskele"
	sound = list('sound/magic/magnet.ogg')
	invocation = "Zuth'gorash vel'thar dral'oth!"
	invocation_type = "shout"
	antimagic_allowed = TRUE
	charge_max = 15 SECONDS

/obj/effect/proc_holder/spell/self/command_undead/cast(mob/user = usr)
	..()

	var/message = input("Speak to your minions!", "LICH") as text|null

	if(!message)
		return

	var/mob/living/carbon/human/lich_player = user

	to_chat(lich_player, span_boldannounce("Lich [lich_player.real_name] commands: [message]"))

	for(var/mob/player in lich_player.minions)
		if(player.mind)
			to_chat(player, span_boldannounce("Lich [lich_player.real_name] commands: [message]"))


/obj/effect/proc_holder/spell/invoked/projectile/lifesteal
	name = "Life Steal"
	desc = ""
	clothes_req = FALSE
	overlay_state = "bloodsteal"
	sound = 'sound/magic/vlightning.ogg'
	range = 8
	projectile_type = /obj/projectile/magic/lifesteal
	releasedrain = 30
	chargedrain = 1
	chargetime = 25
	charge_max = 20 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/blood
	invocation = "Life Steal!"
	invocation_type = "shout"
	xp_gain = TRUE

/obj/projectile/magic/lifesteal
	name = "life steal"
	tracer_type = /obj/effect/projectile/tracer/lifesteal
	muzzle_type = null
	impact_type = null
	hitscan = TRUE
	movement_type = UNSTOPPABLE
	damage = 25
	damage_type = BRUTE
	nodamage = FALSE
	speed = 0.3
	flag = "magic"
	light_color = "#00d5ff"
	light_range = 7

/obj/effect/projectile/tracer/lifesteal
	name = "life steal"
	icon_state = "tracer_beam"

/obj/projectile/magic/lifesteal/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[src] fizzles on contact with [target]!"))
			playsound(get_turf(target), 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK
		var/mob/living/living = target
		living.visible_message(span_danger("[target] has their life force ripped from their body!!"), \
				span_userdanger("I feel like i lost a part of me within!"), \
				span_hear("..."), COMBAT_MESSAGE_RANGE, target)
		sender.heal_overall_damage(100, 100, updating_health = TRUE)
		if(sender.blood_volume < BLOOD_VOLUME_NORMAL) //can not overfill
			sender.blood_volume = min(sender.blood_volume+150, BLOOD_VOLUME_MAXIMUM)
		var/list/wCount = sender.get_wounds()
		if(wCount.len > 0)
			sender.heal_wounds(150) //the fucking wound hps are crazy.
			sender.update_damage_overlays()
			to_chat(sender, span_blue("I feel some of my wounds mend."))
		sender.update_damage_overlays()
	qdel(src)

/obj/effect/proc_holder/spell/invoked/control_undead
	name = "Control Undead"
	desc = "Use on a undead to toggle it's aggressiveness, use on yourself to get your minions to follow you and stop being aggressive, use on a turf to send your minions to attack, use on a mob to send your minions to attack that mob. "
	overlay_state = "raiseskele"
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	associated_skill = /datum/skill/magic/blood
	antimagic_allowed = TRUE
	charge_max = 2 SECONDS
	miracle = FALSE
	invocation = ""
	invocation_type = "none"
	xp_gain = FALSE

/obj/effect/proc_holder/spell/invoked/control_undead/cast(list/targets, mob/user)
	. = ..()
	var/commanded = 0
	for(var/mob/living/carbon/human/minion in orange(7, user)) //a necromancer can control their own risen undead.
		if(minion.mob_biotypes & ~MOB_UNDEAD)
			continue
		if(minion.stat == DEAD) //cant command the dead-dead
			continue
		if(minion.client) //we dont touch mobs that are connected players.
			continue
		if(user.mind.has_antag_datum(/datum/antagonist/lich)) //lich control ALL undead, that is not owned and their own.
			if(minion.mastermob && minion.mastermob != user) //skip if this mob has a master AND it's not you, if it's masterless or your own, it should command.
				continue
		else
			if(minion.mastermob != user) //if you are not lich and you are not master of this mob, skip.
				continue
			commanded ++
			if(commanded >= 4) //shouldnt allow commanding more than 3 minions per cast, atleast makes it inconvenient to get a party of 10 skeletons to go do bad shit. I'm too lazy to make an entire system for keeping track of minions.
				to_chat(user, span_necrosis("I can't easily control more than three undead at once."))
				return
		if(minion == targets[1] && minion.mastermob == user)
			minion.aggressive = !minion.aggressive
			if(!minion.aggressive)
				minion.back_to_idle()
			minion.balloon_alert(user, "Now [minion.aggressive ? "" : "not"] aggressive.")
			return
		if(user == targets[1])
			minion.back_to_idle()
			minion.emote("idle")
			minion.walk2derpless(user)
			user.visible_message("[user] beckons while incanting.")
			minion.balloon_alert(user, "Returning to master.")
			minion.aggressive = FALSE
			minion.following_master = TRUE
		if(isturf(targets[1]))
			minion.back_to_idle()
			minion.emote("idle")
			var/turf/turftarget = targets[1]
			user.visible_message("[user] points at \the [turftarget] while incanting.")
			minion.balloon_alert(user, "Marching to [turftarget].")
			minion.mode = AI_HUNT
			minion.aggressive = TRUE
			minion.following_master = FALSE
			minion.walk2derpless(turftarget)
		if(ismob(targets[1]) && user != targets[1])
			var/mob/living/mobtarget = targets[1]
			if(mobtarget.mob_biotypes & MOB_UNDEAD)
				return
			minion.back_to_idle() //so he stops attacking something if it is right now.
			minion.mode = AI_COMBAT
			minion.aggressive = TRUE
			minion.retaliate(mobtarget)
			user.visible_message("[user] points menacingly at [mobtarget.name] while incanting.")
			minion.balloon_alert(user, "Marked [mobtarget.name] as target.")

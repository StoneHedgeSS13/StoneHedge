GLOBAL_LIST_INIT(generated_slave_phrases, list()) //retarded dev made GLOB right here and entire fucking proc oh my goooooooooooooooood
GLOBAL_LIST_INIT(slave_collars, list())
GLOBAL_LIST_INIT(slave_phrases_translations, list(
		"touch_phrase" = "Touch Themself",
		"orgasm_phrase" = "Orgasm",
		"drop_phrase" = "Fall",
		"sleep_phrase" = "Sleep",
		"stop_phrase" = "Stay",
		"pleasure_phrase" = "Lust",
		"submission_phrase" = "Submit",
		"lock_phrase" = "Toggle Lock",
))
GLOBAL_LIST_INIT(reverse_slave_phrases_translations, list(
		"Touch Themself" = "touch_phrase",
		"Orgasm" = "orgasm_phrase",
		"Fall" = "drop_phrase",
		"Sleep" = "sleep_phrase",
		"Stay" = "stop_phrase",
		"Lust" = "pleasure_phrase",
		"Submit" = "submission_phrase",
		"Toggle Lock" = "lock_phrase",
))
/proc/generate_slave_code()
	var/list/syllables1 = list("ka", "zu", "lo", "da", "ra", "ve", "so", "ti", "ma", "xi", "no", "qu", "ga", "shi", "ni", "fa", "jo", "li", "pa", "re", "sa", "do", "ke", "mi")
	var/list/syllables2 = list("th", "gor", "lek", "ram", "dra", "von", "nar", "zeth", "mir", "kul", "tar", "mol", "shan", "ruk", "vek", "zun", "bel", "thrall", "grim")

	var/code
	var/tries = 0
	do
		var/code1 = "[pick(syllables1)][pick(syllables2)]"
		var/code2 = "[pick(syllables1)][pick(syllables2)]"
		while(code1 == code2)
			code2 = "[pick(syllables1)][pick(syllables2)]"
		code = "[capitalize(code1)] [capitalize(code2)]"
		tries++
	while(code in GLOB.generated_slave_phrases && tries < 100)

	GLOB.generated_slave_phrases += code
	return code


/obj/item/clothing/neck/slave_collar
	name = "slave collar"
	desc = "A sturdy leather collar with ominous arcane engravings."
	icon_state = "collar"
	item_state = "collar"
	smeltresult = /obj/item/ingot/iron
	anvilrepair = /datum/skill/craft/armorsmithing
	max_integrity = 150
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	flags_1 = HEAR_1
	leashable = TRUE
	var/list/phrases_list = list(
		"touch_phrase" = null,
		"orgasm_phrase" = null,
		"drop_phrase" = null,
		"sleep_phrase" = null,
		//"freeze_orgasm_phrase" = null,
		"stop_phrase" = null,
		"pleasure_phrase" = null,
		"submission_phrase" = null,
		"lock_phrase" = null,
	)
	var/collar_bound = FALSE
	var/obj/item/clothing/ring/slave_control/bound_ring
	var/stuck = FALSE
	var/mob/living/carbon/human/bearer
	var/list_name
	COOLDOWN_DECLARE(collar_phrase_usage)

/obj/item/clothing/neck/slave_collar/male
	name = "Cruel slave gorget"
	icon = 'modular_rmh/icons/clothing/neck.dmi'
	desc = "A brutal-looking iron gorget inscribed with cruel arcane patterns. There's no mistaking its purpose."
	icon_state = "m_collar"
	item_state = "gorget"
	armor = ARMOR_NECK_BAD

/obj/item/clothing/neck/slave_collar/female
	name = "Elegant slave collar"
	icon = 'modular_rmh/icons/clothing/neck.dmi'
	desc = "An elegant black choker with faint arcane patterns along its trim. Beautiful, yet deeply symbolic."
	icon_state = "f_collar"
	item_state = "collar_f"

/obj/item/clothing/neck/slave_collar/New()
	. = ..()
	for(var/el in phrases_list)
		phrases_list[el] = generate_slave_code()

/obj/item/clothing/neck/slave_collar/equipped(mob/living/carbon/human/human)
	. = ..()
	var/mob/living/carbon/human/parent = loc
	if(ismob(parent) && parent.wear_neck == src)
		RegisterSignal(human, COMSIG_MOVABLE_HEAR, PROC_REF(process_phrase), override = TRUE)
		list_name = parent.name
		if(parent.job)
			list_name += " the [parent.job]"
		GLOB.slave_collars[list_name] = src
		bearer = parent

/obj/item/clothing/neck/slave_collar/dropped(mob/user)
	. = ..()
	if(bearer)
		GLOB.slave_collars.Remove(list_name)
		UnregisterSignal(bearer, COMSIG_MOVABLE_HEAR)
		bearer = null

/obj/item/clothing/neck/slave_collar/Destroy()
	stuck = FALSE
	var/mob/living/carbon/human/parent = loc
	if (ismob(parent))
		UnregisterSignal(parent, COMSIG_MOVABLE_HEAR)
	return ..()

/obj/item/clothing/neck/slave_collar/attackby(obj/item/I, mob/living/user)
	if(!ismob(user))
		return
	if(istype(I, /obj/item/clothing/ring/slave_control))
		bind_collar(src, I, user)
	return ..()

/obj/item/clothing/neck/slave_collar/proc/bind_collar(obj/item/clothing/ring/slave_control/s_r, mob/living/user, master_ring = FALSE)
	if(collar_bound && !master_ring)
		to_chat(user, "<span class='warning'>The collar is already bound.</span>")
		return FALSE
	//if(s_r.ring_bound)
	//	to_chat(user, "<span class='warning'>The ring is already bound.</span>")
	to_chat(user, "<span class='info'>You bind the ring to the collar, transferring the control words.</span>")
	if(!master_ring)
		user.visible_message("<span class='info'><b>[user] touches the ring and collar together, producing a dull chime.</b></span>")
	else if(bearer)
		to_chat(bearer, "<span class='info'><b>Some unknown force seems to *yank* you by your collar.</b></span>")
	if(bound_ring)
		var/obj/item/clothing/ring/slave_control/ring = bound_ring
		ring.bound_collar = null
		ring.phrases_list = null
	collar_bound = TRUE
	bound_ring = s_r

	s_r.phrases_list = phrases_list
	s_r.bound_collar = src
	return TRUE


/obj/item/clothing/neck/slave_collar/proc/process_phrase(datum/source, list/hear_args)
	var/raw_message = hear_args[HEARING_RAW_MESSAGE]
	var/atom/movable/speaker = hear_args[HEARING_SPEAKER]

	if (!ismob(speaker))
		return

	var/mob/living/carbon/human/H = src.loc
	if (!ismob(H))
		return

	var/msg = normalize_slave_phrase(raw_message)

	var/phrase_found = FALSE
	for(var/el in phrases_list)
		if(normalize_slave_phrase(phrases_list[el]) == msg)
			phrase_found = TRUE

	if(!phrase_found)
		return

	var/mob/living/carbon/human/h_speaker = speaker
	var/ring_found = FALSE
	for(var/obj/item/I in h_speaker.get_equipped_items())
		if(I == bound_ring)
			ring_found = TRUE

	if(!COOLDOWN_FINISHED(src, collar_phrase_usage))
		return

	if(H == speaker && !ring_found) //so that a slave with the ring can escape, otherwise - mute for the audacity
		H.visible_message("<span class='warning'><b>The collar around [H]'s neck flashes brightly, muting the wearer in punishment.</b></span>")

		ADD_TRAIT(H, TRAIT_MUTE, "rune")
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(remove_mute), H), 30 SECONDS) //shameless copypaste
		return

	if(!ring_found)
		return

	perform_command(msg)

/obj/item/clothing/neck/slave_collar/proc/perform_command(msg)
	if(!msg)
		return FALSE

	var/mob/living/carbon/human/H = src.loc
	if (!ismob(H))
		return FALSE

	if(!COOLDOWN_FINISHED(src, collar_phrase_usage))
		return

	COOLDOWN_START(src, collar_phrase_usage, 10 SECONDS)

	if(msg == normalize_slave_phrase(phrases_list["touch_phrase"]))
		H.visible_message("<span class='danger'><b>[H] starts masturbating uncontrollably!</b></span>")
		H.emote("moan")
		H.start_sex_session(H, FALSE)
		var/current_action = /datum/sex_action/masturbate/anus
		if(H.getorganslot(ORGAN_SLOT_VAGINA))
			current_action = /datum/sex_action/masturbate/vagina
		else if(H.getorganslot(ORGAN_SLOT_PENIS))
			current_action = /datum/sex_action/masturbate/penis
		var/datum/sex_session/session = get_sex_session(H, H)
		session.try_start_action(current_action)
		session.set_current_force(SEX_FORCE_HIGH)
		session.set_current_speed(SEX_SPEED_MAX)
		return TRUE

	if(msg == normalize_slave_phrase(phrases_list["orgasm_phrase"]))
		H.visible_message("<span class='danger'><b>[H] convulses in a sudden orgasm!</b></span>")
		var/datum/component/arousal/aro = H.GetComponent(/datum/component/arousal)
		if(aro)
			aro.ejaculate(null, H, null, FALSE)
			SEND_SIGNAL(H, COMSIG_SEX_ADJUST_AROUSAL, 60)
			SEND_SIGNAL(H, COMSIG_SEX_ADJUST_EDGING, 15)
			SEND_SIGNAL(H, COMSIG_SEX_ADJUST_ORGASM_PROG, 10)
			COOLDOWN_START(src, collar_phrase_usage, 30 SECONDS)
		return TRUE

	if(msg == normalize_slave_phrase(phrases_list["drop_phrase"]))
		H.visible_message("<span class='danger'><b>[H] falls prone!</b></span>")
		H.Knockdown(10 SECONDS)
		return TRUE

	if(msg == normalize_slave_phrase(phrases_list["sleep_phrase"]))
		H.visible_message("<span class='danger'><b>[H] has their eyes shut - fallig asleep instantly!</b></span>")
		H.Sleeping(15 SECONDS)
		return TRUE

	if(msg == normalize_slave_phrase(phrases_list["stop_phrase"]))
		H.visible_message("<span class='danger'><b>[H] freezes in place, unable to move!</b></span>")
		H.apply_status_effect(/datum/status_effect/collar_stun)
		return TRUE

	if(msg == normalize_slave_phrase(phrases_list["pleasure_phrase"]))
		H.visible_message("<span class='danger'><b>[H] shivers, pleasure foced on them!</b></span>")
		H.emote("moan")
		SEND_SIGNAL(H, COMSIG_SEX_ADJUST_AROUSAL, 120)
		SEND_SIGNAL(H, COMSIG_SEX_ADJUST_EDGING, 30)
		SEND_SIGNAL(H, COMSIG_SEX_ADJUST_ORGASM_PROG, 50)
		return TRUE

	if(msg == normalize_slave_phrase(phrases_list["submission_phrase"]))
		H.visible_message("<span class='warning'><b>[H] is shocked, collar tightening!</b></span>")
		H.electrocute_act(5, src)
		H.emote("choke")
		if(H.oxyloss > 45)
			return FALSE
		H.adjustOxyLoss(25)
		return TRUE

	if(msg == normalize_slave_phrase(phrases_list["lock_phrase"]))
		if(!stuck)
			H.visible_message("<span class='notice'><b>The collar around [H]'s neck engages it's arcane lock.</b></span>")
			stuck = TRUE

		else
			H.visible_message("<span class='notice'><b>The collar around [H]'s neck releases it's arcane lock.</b></span>")
			//H.dropItemToGround(src, force = TRUE, silent = TRUE)
			stuck = FALSE

		return TRUE

	return FALSE

/obj/item/clothing/neck/slave_collar/proc/stuck_check(mob/living/user)
	// return true if we should be unequippable, return false if not
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.get_item_by_slot(ITEM_SLOT_NECK) && stuck)
			to_chat(user, span_userdanger("I can't take it off"))
			return TRUE
	return FALSE

/obj/item/clothing/neck/slave_collar/attack_hand(mob/user)
	if(!stuck_check(usr))
		return ..()

/obj/item/clothing/neck/slave_collar/MouseDrop(atom/over_object)
	if(!stuck_check(usr))
		return ..()

/proc/normalize_slave_phrase(text)
	text = lowertext(strip_html(text))
	text = strip_punctuation(text)
	text = trim(text)
	return text

/datum/status_effect/collar_stun
	id = "stun_collar"
	alert_type = /atom/movable/screen/alert/status_effect/collar_stun
	status_type = STATUS_EFFECT_REPLACE
	tick_interval = 10
	duration = 20 SECONDS

/atom/movable/screen/alert/status_effect/collar_stun
	name = "Stunned"
	desc = ""
	icon_state = "stun"

/datum/status_effect/collar_stun/on_apply()
	. = ..()
	if(!.)
		return
	ADD_TRAIT(owner, TRAIT_INCAPACITATED, TRAIT_STATUS_EFFECT(id))
	ADD_TRAIT(owner, TRAIT_IMMOBILIZED, TRAIT_STATUS_EFFECT(id))

/datum/status_effect/collar_stun/on_remove()
	REMOVE_TRAIT(owner, TRAIT_INCAPACITATED, TRAIT_STATUS_EFFECT(id))
	REMOVE_TRAIT(owner, TRAIT_IMMOBILIZED, TRAIT_STATUS_EFFECT(id))
	return ..()

/datum/repeatable_crafting_recipe/arcyne/slavecollar
	name = "slave collar"
	reagent_requirements = list()
	tool_usage = list()
	requirements = list(
		/obj/item/natural/hide/cured  = 1,
		/obj/item/gem/red = 1,
		/obj/item/gem/blue = 1,
		/obj/item/gem/diamond = 1
	)
	output = /obj/item/clothing/neck/slave_collar
	starting_atom = /obj/item/gem/diamond
	attacked_atom = /obj/item/natural/hide/cured
	craftdiff = 4

/datum/repeatable_crafting_recipe/arcyne/slavecollar/cruel
	name = "cruel slave collar"
	output = /obj/item/clothing/neck/slave_collar/male

/datum/repeatable_crafting_recipe/arcyne/slavecollar/elegant
	name = "elegant slave collar"
	output = /obj/item/clothing/neck/slave_collar/female

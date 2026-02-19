/**
 * PORTAL CONTROL RING
*/
/*/obj/item/clothing/ring/portal_control //do something here
	name = "Portal control ring"
	desc = "Ring to control "
	icon_state = "g_ring_ruby"*/


/**
 * PORTAL LIGHT
*/

/obj/item/portallight
    name = "portal light"
    desc = "A softly pulsing arcane device."
    icon = 'modular_rmh/icons/obj/lewd/fleshlight.dmi'
    icon_state = "unpaired"
    var/obj/item/clothing/undies/portalpanties/linked_underwear = null
    var/mutable_appearance/organ_overlay
    var/mutable_appearance/sleeve_overlay
    var/org_target = ORGAN_SLOT_VAGINA
    loadout_blacklisted = TRUE
    w_class = WEIGHT_CLASS_SMALL
    body_storage_bulk = 100 //so that people can't stuff it in for now

/obj/item/portallight/proc/get_wearer()
    if(!linked_underwear)
        return null
    return linked_underwear.current_wearer

/obj/item/portallight/proc/is_held_by(mob/living/carbon/human/user)
    return (user.get_active_held_item() == src)

/obj/item/portallight/update_appearance()
	. = ..()
	cut_overlay(organ_overlay)
	cut_overlay(sleeve_overlay)
	icon_state = "unpaired"
	if(!get_wearer())
		return

	var/mob/living/carbon/human/user = get_wearer()
	if(!user)
		return
	if(user.underwear != linked_underwear)
		return

	sleeve_overlay = mutable_appearance(icon, "portal_sleeve_normal")
	var/sleevecolor = user.skin_tone
	sleeve_overlay.color = "#" + sleevecolor
	add_overlay(sleeve_overlay)

	if(linked_underwear.org_target == ORGAN_SLOT_VAGINA)
		organ_overlay = mutable_appearance(icon, "portal_vag")
	else
		organ_overlay = mutable_appearance(icon, "portal_anus")
	organ_overlay.color = "#f37272"
	add_overlay(organ_overlay)

	icon_state = "paired"


/obj/item/portallight/attack_self(mob/user, params)
	if(!linked_underwear)
		to_chat(user, span_info("The portal isn't connected to anything!"))
		return FALSE
	var/mob/living/carbon/human/target = get_wearer()
	if(!target)
		to_chat(user, span_info("There's no one on the other side!"))
		return FALSE
	var/mob/living/carbon/human/user_human = user
	var/datum/sex_session/session = get_sex_session(user_human, target)
	if(!session)
		user_human.start_sex_session(target)
	else
		session.show_ui()
	. = ..()

/obj/item/portallight/MiddleClick(mob/user, params)
	. = ..()
	if(!linked_underwear)
		to_chat(user, span_info("The portal isn't connected to anything!"))
		return
	var/mob/living/carbon/human/target = get_wearer()
	if(!target)
		to_chat(user, span_info("There's no one on the other side!"))
		return
	if(linked_underwear.org_target == ORGAN_SLOT_VAGINA)
		to_chat(user, span_info("You refocus the portal to your target's backside!"))
		org_target = ORGAN_SLOT_ANUS
		linked_underwear.org_target = ORGAN_SLOT_ANUS
		update_appearance()
		return
	else if(target.getorganslot(ORGAN_SLOT_VAGINA))
		to_chat(user, span_info("You refocus the portal to your target's loins!"))
		org_target = ORGAN_SLOT_VAGINA
		linked_underwear.org_target = ORGAN_SLOT_VAGINA
		update_appearance()
		return
/**
 * PORTAL PANTIES
*/

/obj/item/clothing/undies/portalpanties
    name = "portal panties"
    desc = "Laced with unstable portal magic."
    icon = 'modular_rmh/icons/obj/lewd/fleshlight.dmi'
    mob_overlay_icon = 'modular_rmh/icons/obj/lewd/portals_onmob.dmi'
    item_state = "panties"
    icon_state = "panties"
    gendered = TRUE
    slot_flags = ITEM_SLOT_UNDER_BOTTOM
    loadout_blacklisted = TRUE

    var/obj/item/portallight/linked_light = null
    var/mob/living/carbon/human/current_wearer = null
    var/org_target = ORGAN_SLOT_VAGINA
    misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/undies/portalpanties/equipped(mob/living/carbon/human/H, slot)
	. = ..()
	current_wearer = H
	if(current_wearer.getorganslot(ORGAN_SLOT_VAGINA))
		org_target = ORGAN_SLOT_VAGINA
		to_chat(current_wearer, span_info("You feel magical energies focus around your loins."))
		if(linked_light)
			linked_light.org_target = ORGAN_SLOT_VAGINA
	else
		org_target = ORGAN_SLOT_ANUS
		to_chat(current_wearer, span_info("You feel magical energies focus around your backside."))
		if(linked_light)
			linked_light.org_target = ORGAN_SLOT_ANUS

	if(linked_light)

		linked_light.linked_underwear = src

		linked_light.update_appearance()

/obj/item/clothing/undies/portalpanties/dropped(mob/living/carbon/human/H)
	. = ..()
	if(current_wearer)
		current_wearer = null

		if(linked_light)

			linked_light.linked_underwear = null

			linked_light.update_appearance()

/obj/item/clothing/undies/portalpanties/Destroy()
    if(current_wearer && linked_light)
        linked_light.linked_underwear = null
    . = ..()
/obj/item/clothing/undies/portalpanties/attackby(obj/item/I, mob/living/carbon/human/user)
    if(!istype(I, /obj/item/portallight))
        return ..()

    var/obj/item/portallight/P = I

    if(linked_light == P)
        linked_light.update_appearance()
        linked_light = null
        P.linked_underwear = null
        to_chat(user, span_notice("[P] has been successfully unlinked."))

        return

    linked_light = P
    linked_light.update_appearance()
    linked_light.org_target = org_target

    P.linked_underwear = src

    update_appearance()

    to_chat(user, span_notice("[P] has been successfully linked."))

/**
 * BASE PORTAL ACTION
*/
/datum/sex_action/portal_base
    abstract_type = /datum/sex_action/portal_base
    target_priority = 50
    var/obj/item/portallight/light
    var/mob/living/carbon/human/target
    check_same_tile = FALSE
    check_distance = FALSE

/datum/sex_action/portal_base/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)

	var/obj/item/portallight/L = user.get_active_held_item()
	if(!istype(L, /obj/item/portallight))
		return FALSE
	if(hole_id != L.org_target && !isnull(hole_id))
		return FALSE
	return TRUE

/datum/sex_action/portal_base/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	var/obj/item/portallight/L = user.get_active_held_item()
	if(!istype(L, /obj/item/portallight))
		return FALSE
	var/mob/living/carbon/human/W = L.get_wearer()
	if(!W)
		return FALSE
	if(user == target && user != W)
		return FALSE
	light = L
	target = W

/**
 * SEX ACTION: PORTAL HAND
*/

/datum/sex_action/portal_base/portal_hand
    name = "Portal Hand"
    target_priority = 50

/datum/sex_action/portal_base/portal_hand/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(user.get_inactive_held_item())
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE

/datum/sex_action/portal_base/portal_hand/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	to_chat(user, span_warning("You start touching the needy hole through the portal."))
	to_chat(target, span_love("You feel a distant touch through the portal!"))

/datum/sex_action/portal_base/portal_hand/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
    var/datum/sex_session/sex_session = get_sex_session(user, target)
    if(!sex_session)
        sex_session = new(user, target)
    do_thrust_animate(user, user)
    if(can_show_action_message())
        to_chat(user, sex_session.spanify_force("You [sex_session.get_generic_force_adjective()] finger your target through the portal."))
        to_chat(target, sex_session.spanify_force("Someone [sex_session.get_generic_force_adjective()] fingers you through the portal."))
    sex_session.perform_sex_action(target, user, 2, 4, 2, src)
    sex_session.handle_passive_ejaculation(target)
    playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

/datum/sex_action/portal_base/portal_hand/handle_climax_message(mob/living/carbon/human/user, mob/living/carbon/human/target, must_flip) //must_flip indicates when the target of your actions orgasms rom this action
	if(must_flip)
		to_chat(user, span_love("You climax from the portal touch! Your body trembles with pleasure."))//thus you must flip user and target in the logic when must_flip == TRUE
		to_chat(target, span_love("Your target shudders and reacts to your touch through the portal."))
		return ORGASM_LOCATION_SELF

/datum/sex_action/portal_base/portal_hand/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	to_chat(user, span_notice("You withdraw your hand from the portal."))
	to_chat(target, span_notice("The distant touch fades away."))

/**
 * SEX ACTION: PORTAL ORAL
*/

/datum/sex_action/portal_base/portal_oral
    name = "Portal Oral"
    target_priority = 70
    gags_user = TRUE

/datum/sex_action/portal_base/portal_oral/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	to_chat(user, span_warning("You press your mouth to the portal, reaching your target."))
	to_chat(target, span_love("Warm sensations bloom between your legs!"))

/datum/sex_action/portal_base/portal_oral/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
    var/datum/sex_session/sex_session = get_sex_session(user, target)
    if(!sex_session)
        sex_session = new(user, target)
    user.make_sucking_noise()
    if(can_show_action_message())
        to_chat(user, sex_session.spanify_force("You [sex_session.get_generic_force_adjective()] lick your target through the portal."))
        to_chat(target, sex_session.spanify_force("Someone [sex_session.get_generic_force_adjective()] licks you through the portal."))
    sex_session.perform_sex_action(target, user, 2, 3, 2, src)
    sex_session.handle_passive_ejaculation(target)

/datum/sex_action/portal_base/portal_oral/handle_climax_message(mob/living/carbon/human/user, mob/living/carbon/human/target, must_flip)
	if(must_flip)
		to_chat(user, span_love("You climax from the portal oral! Your body shudders in ecstasy."))
		user.visible_message(span_love("Your target shudders and moans, their legs almost giving out!"))
		to_chat(target, span_love("You bring your target to climax through the portal!"))
		return ORGASM_LOCATION_ORAL

/datum/sex_action/portal_base/portal_oral/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	to_chat(user, span_notice("You pull back from the portal."))
	to_chat(target, span_notice("The sensations from the portal fade away."))

/**
 * SEX ACTION: PORTAL PENIS
*/

/datum/sex_action/portal_base/portal_penis_vaginal
    name = "Portal Pussy Fuck"
    target_priority = 80
    stamina_cost = 1.0
    hole_id = ORGAN_SLOT_VAGINA

/datum/sex_action/portal_base/portal_penis_vaginal/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(check_sex_lock(user, ORGAN_SLOT_PENIS))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/portal_base/portal_penis_vaginal/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	to_chat(user, span_warning("You slide your cock into the portal, reaching your target's pussy."))
	to_chat(target, span_love("You feel feel someting penetrating your pussy through the portal!"))

/datum/sex_action/portal_base/portal_penis_vaginal/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
    var/datum/sex_session/sex_session = get_sex_session(user, target)
    if(!sex_session)
        sex_session = new(user, target)
    do_thrust_animate(user, user)
    if(can_show_action_message(user, target))
        to_chat(user, sex_session.spanify_force("You [sex_session.get_generic_force_adjective()] fuck your target's pussy through the portal."))
        to_chat(target, sex_session.spanify_force("Someone [sex_session.get_generic_force_adjective()] fucks you through the portal."))
    sex_session.perform_sex_action(user, target, 2, 0, 2, src)
    sex_session.perform_sex_action(target, user, 2, 3, 2, src)
    sex_session.handle_passive_ejaculation(target)
    sex_session.handle_passive_ejaculation(user)
    playsound(user, sex_session.get_force_sound(), 50, TRUE, -2, ignore_walls = FALSE)

/datum/sex_action/portal_base/portal_penis_vaginal/handle_climax_message(mob/living/carbon/human/user, mob/living/carbon/human/target, must_flip)
	if(must_flip)
		to_chat(user, span_love("You cum from the portal fuck! Your body trembles in ecstasy."))
		to_chat(target, span_love("You feel your target's pussy spasming around your member, shuddering in orgasm."))
		user.virginity = FALSE
		target.virginity = FALSE
		return ORGASM_LOCATION_SELF
	else
		to_chat(user, span_love("You cum inside your target! You shudder with pleasure."))
		to_chat(target, span_love("You feel the invading member shudder and let out ropes of seed deep inside your pussy!"))
		user.virginity = FALSE
		target.virginity = FALSE
		return ORGASM_LOCATION_INTO

/datum/sex_action/portal_base/portal_penis_vaginal/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	to_chat(user, span_notice("You pull your cock back from the portal."))
	to_chat(target, span_notice("The penetration through the portal ends."))

/**
 * SEX ACTION: PORTAL PENIS
*/

/datum/sex_action/portal_base/portal_penis_anal
    name = "Portal Ass Fuck"
    target_priority = 80
    stamina_cost = 1.0
    hole_id = ORGAN_SLOT_ANUS

/datum/sex_action/portal_base/portal_penis_anal/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(check_sex_lock(user, ORGAN_SLOT_PENIS))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_ANUS))
		return FALSE
	return TRUE

/datum/sex_action/portal_base/portal_penis_anal/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	to_chat(user, span_warning("You slide your cock into the portal, reaching your target's ass."))
	to_chat(target, span_love("You feel someting penetrating your ass through the portal!"))

/datum/sex_action/portal_base/portal_penis_anal/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
    var/datum/sex_session/sex_session = get_sex_session(user, target)
    if(!sex_session)
        sex_session = new(user, target)
    do_thrust_animate(user, user)
    if(can_show_action_message(user, target))
        to_chat(user, sex_session.spanify_force("You [sex_session.get_generic_force_adjective()] fuck your target's ass through the portal."))
        to_chat(target, sex_session.spanify_force("Someone [sex_session.get_generic_force_adjective()] fucks your ass through the portal."))
    sex_session.perform_sex_action(user, target, 2, 0, 2, src)
    sex_session.perform_sex_action(target, user, 2, 3, 2, src)
    sex_session.handle_passive_ejaculation(target)
    sex_session.handle_passive_ejaculation(user)
    playsound(user, sex_session.get_force_sound(), 50, TRUE, -2, ignore_walls = FALSE)

/datum/sex_action/portal_base/portal_penis_anal/handle_climax_message(mob/living/carbon/human/user, mob/living/carbon/human/target, must_flip)
	if(must_flip)
		to_chat(user, span_love("You cum from the portal fuck! Your body trembles in ecstasy."))
		to_chat(target, span_love("You feel your target's ass spasming around your member, shuddering in orgasm."))
		user.virginity = FALSE
		target.virginity = FALSE
		return ORGASM_LOCATION_SELF
	else
		to_chat(user, span_love("You cum inside your target! You shudder with pleasure."))
		to_chat(target, span_love("You feel the invading member shudder and let out ropes of seed deep inside your ass!"))
		user.virginity = FALSE
		target.virginity = FALSE
		return ORGASM_LOCATION_INTO

/datum/sex_action/portal_base/portal_penis_anal/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	to_chat(user, span_notice("You pull your cock back from the portal."))
	to_chat(target, span_notice("The penetration through the portal ends."))

/**
 * SEX ACTION: PORTAL STORAGE
*/

/datum/sex_action/portal_base/portal_store_vaginal
    name = "Portal Store"
    target_priority = 80
    hole_id = ORGAN_SLOT_VAGINA

    requires_hole_storage = FALSE

    var/self = FALSE

    var/obj/item/organ/genitals/target_organ

    continous = TRUE

/datum/sex_action/portal_base/portal_store_vaginal/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!user.get_inactive_held_item())
		return FALSE
	return TRUE

/datum/sex_action/portal_base/portal_store_vaginal/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	var/datum/sex_session/sex_session = get_sex_session(user, target)
	var/obj/item/dildo = user.get_inactive_held_item()
	if(istype(dildo, /obj/item/portallight))
		to_chat(user, span_warning("You can't stick a portal into another one!"))
		sex_session.stop_current_action()
		return

	if(user == target)
		target_organ = user.getorganslot(hole_id)
		to_chat(user, sex_session.spanify_force("I start inserting \the [dildo] in the portal..."))
	else
		target_organ = target.getorganslot(hole_id)
		to_chat(user, sex_session.spanify_force("I start inserting \the [dildo] in the portal..."))
		to_chat(target, sex_session.spanify_force("You feel someting being inserted in you through the portal..."))

	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)


/datum/sex_action/portal_base/portal_store_vaginal/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/pain_amt = 2 //base pain amt to use
	var/self = (user == target)
	if(!target_organ)
		if(self)
			target_organ = user.getorganslot(hole_id)
		else
			target_organ = target.getorganslot(hole_id)
	var/datum/sex_session/sex_session = get_sex_session(user, target)

	var/obj/item/dildo = user.get_inactive_held_item()
	if(!dildo)
		sex_session.stop_current_action()
		return
	var/force = FALSE
	if(sex_session.get_current_force() >= SEX_FORCE_HIGH)
		force = TRUE
	var/success = SEND_SIGNAL(target_organ, COMSIG_BODYSTORAGE_TRY_INSERT, dildo, STORAGE_LAYER_INNER, force)
	switch(success)
		if(INSERT_FEEDBACK_OK)
			if(self)
				to_chat(user, sex_session.spanify_force("I stuff \the [dildo] in the portal..."))
			else
				to_chat(user, sex_session.spanify_force("I stuff \the [dildo] in the portal..."))
				to_chat(target, sex_session.spanify_force("You feel like someting was inserted in you through the portal!"))
		if(INSERT_FEEDBACK_OK_FORCE)
			if(prob(15))
				var/stuffed_res = SEND_SIGNAL(target_organ, COMSIG_BODYSTORAGE_SWAP_LAYERS_RAND, STORAGE_LAYER_INNER, STORAGE_LAYER_DEEP, force)
				if(stuffed_res == INSERT_FEEDBACK_OK_FORCE || stuffed_res == INSERT_FEEDBACK_OK)
					pain_amt += 4
					if(self)
						to_chat(user, sex_session.spanify_force("\The [dildo] slips deep inside of the portal!"))
					else
						to_chat(user, sex_session.spanify_force("\The [dildo] slips deep inside of the portal pussy!"))
						to_chat(target, sex_session.spanify_force("You feel someting slipping deep inside you!"))
			else
				pain_amt += 4
				if(self)
					to_chat(user, sex_session.spanify_force("I force \the [dildo] in the portal, fighting the pressure!"))
				else
					to_chat(user, sex_session.spanify_force("I force \the [dildo] in the portal, fighting the pressure!"))
					to_chat(target, sex_session.spanify_force("Something was forcefully inserted inside you!"))
		if(INSERT_FEEDBACK_ALMOST_FULL)
			pain_amt += 2
			if(self)
				to_chat(user, sex_session.spanify_force("I stuff \the [dildo] in the portal, seems like it won't fit much more..."))
			else
				to_chat(user, sex_session.spanify_force("I stuff \the [dildo] in the portal pussy, seems like it won't fit much more..."))
				to_chat(target, sex_session.spanify_force("You feel another item inserted in you, strething you to the limit."))
		if(INSERT_FEEDBACK_STUFFED)
			if(force && prob(50))
				var/stuffed_res = SEND_SIGNAL(target_organ, COMSIG_BODYSTORAGE_SWAP_LAYERS_RAND, STORAGE_LAYER_INNER, STORAGE_LAYER_DEEP, force)
				if(stuffed_res == INSERT_FEEDBACK_OK_FORCE || stuffed_res == INSERT_FEEDBACK_OK)
					pain_amt += 2
					if(self)
						to_chat(user, sex_session.spanify_force("\The [dildo] slips deep inside of the portal!"))
					else
						to_chat(user, sex_session.spanify_force("\The [dildo] slips deep inside of the portal pussy!"))
						to_chat(target, sex_session.spanify_force("You feel someting slipping deep inside you!"))
			else
				if(self)
					to_chat(user, sex_session.spanify_force("The portal is too full to stuff even \the [dildo] in."))
				else
					to_chat(user, sex_session.spanify_force("The portal pussy is too full to stuff even \the [dildo] in."))
					to_chat(target, sex_session.spanify_force("You feel someting probing the portal entrance, but you are too full!"))
				sex_session.stop_current_action()
				return
		if(INSERT_FEEDBACK_TRY_FORCE)
			pain_amt += 3
			if(self)
				to_chat(user, sex_session.spanify_force("I feel like \the [dildo] might fit if I just use more force."))
			else
				to_chat(user, sex_session.spanify_force("I feel like \the [dildo] might fit if I just use more force."))
				to_chat(target, sex_session.spanify_force("You feel someting probing the portal entrance..."))
		if(FALSE)
			if(self)
				to_chat(user, sex_session.spanify_force("I fail to stuff \the [dildo] in the portal."))
			else
				to_chat(user, sex_session.spanify_force("I fail to stuff \the [dildo] in the portal."))
				to_chat(target, sex_session.spanify_force("You feel someting probing the portal entrance..."))
			sex_session.stop_current_action()
			return

	user.update_inv_hands()
	user.update_a_intents()
	sex_session.perform_sex_action(user, target, 0.5, pain_amt, 0.5, src)
	sex_session.handle_passive_ejaculation()

/datum/sex_action/portal_base/portal_remove_vaginal
	name = "Remove items from vagina"
	hole_id = ORGAN_SLOT_VAGINA
	var/self = FALSE
	var/obj/item/organ/genitals/target_organ
	continous = TRUE

/datum/sex_action/portal_base/portal_remove_vaginal/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(!user.get_inactive_held_item())
		return FALSE
	if(user == target)
		target_organ = user.getorganslot(hole_id)
	else
		target_organ = target.getorganslot(hole_id)
	var/list/stored_items = SEND_SIGNAL(target_organ, COMSIG_BODYSTORAGE_GET_LISTS)
	var/list/stored_items_layer = stored_items[STORAGE_LAYER_INNER]
	if(!stored_items_layer.len)
		return FALSE
	return TRUE

/datum/sex_action/portal_base/portal_remove_vaginal/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!.)
		return FALSE
	return TRUE

/datum/sex_action/portal_base/portal_remove_vaginal/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()

	if(user == target)
		target_organ = user.getorganslot(hole_id)
		to_chat(user, span_warning("I start removing items from the portal..."))
	else
		target_organ = target.getorganslot(hole_id)
		user.visible_message(span_warning("[user] starts removing items from the portal pussy..."))

	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)


/datum/sex_action/portal_base/portal_remove_vaginal/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/pain_amt = 1 //base pain amt to use

	var/datum/sex_session/sex_session = get_sex_session(user, target)
	var/self = (user == target)

	if(!target_organ)
		if(self)
			target_organ = user.getorganslot(hole_id)
		else
			target_organ = target.getorganslot(hole_id)

	var/obj/item/removed_item
	removed_item = SEND_SIGNAL(target_organ, COMSIG_BODYSTORAGE_REMOVE_RAND_ITEM, STORAGE_LAYER_INNER)
	if(!removed_item)
		to_chat(user, sex_session.spanify_force("I couldn't find anything inside..."))
		sex_session.stop_current_action()
		return
	if(user.get_active_held_item())
		user.visible_message(sex_session.spanify_force("\The [removed_item] falls down on the floor..."))
		removed_item.doMove(get_turf(user))
	else
		if(self)
			to_chat(user, sex_session.spanify_force("I fish out \the [removed_item] from the portal..."))
		else
			user.visible_message(sex_session.spanify_force("I fish out \the [removed_item] from the portal pussy..."))
		removed_item.doMove(get_turf(user))
		user.put_in_active_hand(removed_item)
	sex_session.perform_sex_action(user, target, 0.5, pain_amt, 0.5, src)
	sex_session.handle_passive_ejaculation()
/*
/datum/sex_action/portal_base/portal_object_fuck
	name = "Fuck portal with object"
	var/ouchietext = "owie"
	do_time = 4 SECONDS //slower on your own but not as much as ass since this is on your front.
	user_priority = 100
	target_priority = 1

    var/self = FALSE

    var/obj/item/organ/genitals/target_organ

    continous = TRUE


/datum/sex_action/portal_base/portal_object_fuck/shows_on_menu(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!get_sextoy_in_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/portal_base/portal_object_fuck/can_perform(mob/living/user, mob/living/target)
	. = ..()
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!user.get_inactive_held_item())
		return FALSE
	return TRUE


/datum/sex_action/portal_base/portal_object_fuck/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	var/datum/sex_session/sex_session = get_sex_session(user, target)
	var/obj/item/dildo = user.get_active_held_item()
	if(istype(user.get_active_held_item(), /obj/item/weapon) || istype(user.get_active_held_item(), /obj/item/ammo_casing))
		to_chat(user, span_userdanger("\the [dildo] will hurt your target!"))
		sex_session.desire_stop = TRUE
		return

	if(istype(user.get_active_held_item(), /obj/item/reagent_containers/glass))
		var/obj/item/reagent_containers/glass/contdildo = dildo
		if(contdildo.spillable)
			to_chat(user, span_info("\the [contdildo] will likely spill inside me."))
			to_chat(user, span_smallred("I can pump it with <bold>speed</bold> for faster success."))

	user.visible_message(span_warning("[user] stuffs \the [dildo] in their cunt..."))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/datum/sex_action/portal_base/portal_object_fuck/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/pain_amt = 3 //base pain amt to use
	var/obj/item/dildo = user.get_active_held_item()

	var/datum/sex_session/sex_session = get_sex_session(user, target)
	if(can_show_action_message(user, target))
		user.visible_message(sex_session.spanify_force("[user] [sex_session.get_generic_force_adjective()] fucks their cunt with \the [dildo]."))
	if(user.rogue_sneaking || user.alpha <= 100)
		action_volume *= 0.5
	playsound(target, sex_session.get_force_sound(), 50, TRUE, -2, ignore_walls = FALSE)

	if(user.has_kink(KINK_ONOMATOPOEIA))
		do_onomatopoeia(user)

	if(istype(user.get_active_held_item(), /obj/item/reagent_containers/glass))
		var/obj/item/reagent_containers/glass/contdildo = dildo
		var/spillchance = 15*sex_session.speed //multiplies with speed
		if(target.body_position == LYING_DOWN) //double spill odds if lying down due gravity and stuff.
			spillchance *= 2
		if(contdildo.spillable && prob(spillchance) && contdildo.reagents.total_volume)
			var/obj/item/organ/genitals/filling_organ/targetpuss = target.getorganslot(ORGAN_SLOT_VAGINA)
			if(targetpuss.reagents.total_volume >= (targetpuss.reagents.maximum_volume -0.5))
				target.visible_message(span_notice("[contdildo] splashes it's contents around your target's hole as it is packed full!"))
				contdildo.reagents.reaction(target, TOUCH, sex_session.speed, FALSE)
				contdildo.reagents.remove_all(sex_session.speed)
			else
				target.visible_message(span_notice(pick("[english_list(contdildo.reagents.reagent_list)] from \the [contdildo] fill your target's ass.", "[user] feeds your target's ass with [english_list(contdildo.reagents.reagent_list)] from \The [contdildo]", "[english_list(contdildo.reagents.reagent_list)] from \the [contdildo] splash into your target's ass.", "[english_list(contdildo.reagents.reagent_list)] from \the [contdildo] flood into your target's ass.")), span_notice(pick("[english_list(contdildo.reagents.reagent_list)] from \the [contdildo] fill my ass.", "I feed my ass with [english_list(contdildo.reagents.reagent_list)] from \The [contdildo]", "[english_list(contdildo.reagents.reagent_list)] from \the [contdildo] splash into my ass.", "[english_list(contdildo.reagents.reagent_list)] from \the [contdildo] flood into me.")))
				contdildo.reagents.trans_to(targetpuss, sex_session.speed, 1, TRUE, FALSE, targetpuss, FALSE, INJECT, FALSE, TRUE)
			playsound(user.loc, 'sound/misc/mat/endin.ogg', 20, TRUE)
			pain_amt = -8 //liquid ease pain i guess
			target.heal_bodypart_damage(0,1,0,TRUE) //water on burn i guess.

	sex_session.perform_sex_action(user, target, 2, pain_amt, 2, src)
	sex_session.handle_passive_ejaculation()


/datum/sex_action/portal_base/portal_object_fuck/handle_climax_message(mob/living/carbon/human/user, mob/living/carbon/human/target, must_flip)
	user.visible_message(span_love("your target cream themselves!"))
	user.virginity = FALSE
	return ORGASM_LOCATION_SELF

/datum/sex_action/portal_base/portal_object_fuck/on_finish(mob/living/user, mob/living/target)
	. = ..()
	var/obj/item/dildo = get_sextoy_in_hand(user)
	user.visible_message(span_warning("[user] pulls \the [dildo] from your target's cunt."))*/
/**
 * CRAFT AND SUPPLY
*/
/datum/supply_pack/portals_and_fleshlight
	name = "Set of Portal Smallclothes"
	cost = 200
	contains = list(
		/obj/item/portallight,
		/obj/item/clothing/undies/portalpanties
		)

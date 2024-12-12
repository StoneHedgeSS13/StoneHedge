//all the stuff used for ravenloft academy


//==============================================
//	Warding Crystal
//==============================================
/obj/structure/wardingcrystal
	name = "ravenloft warding crystal"
	desc = "A crystal that shimmers with a warding glow, its surface veined with crackles of arcane energy, while faint, shadowy shapes swirl within, accompanied by an eerie hum and distant whispers."
	icon = 'icons/obj/crystal.dmi'
	icon_state = "Crystal"
	anchored = TRUE
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/active = FALSE
	var/disabled_by_nullmagic = FALSE

/obj/structure/wardingcrystal/attack_hand(mob/user)
	to_chat(user, span_neutraltext("Whosoever doth seek to commune with the spirit bound within this crystal must first bear the Academy's Arch-Keystone in hand."))
	return TRUE

/obj/structure/wardingcrystal/attackby(obj/item/I, mob/user, params)
    . = ..()

    if(istype(I, /obj/item/clothing/ring/keystone/archkey))
        var/obj/item/clothing/ring/keystone/archkey/key = I
        if(!key.active)
            to_chat(user, span_warning("The Archkeystone must first be activated. (Right-click to activate)"))
            return

        if(disabled_by_nullmagic)
            audible_message(span_neutraltext("[user] begins channeling magical energy into the crystal..."), 7)
            if(do_after(user, 10 SECONDS, target = src))
                disabled_by_nullmagic = FALSE
                audible_message(span_hear("The crystal rings out with a clear, harmonious tone as its power returns!"), 7)
                for(var/mob/living/L in range(5, src))
                    to_chat(L, span_blue("The crystal pulses with renewed vigor as arcane energy flows through it, its veins of power rekindling with brilliant light as ancient magicks stir once more within."), 7)
                icon_state = "Crystal"
                playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
                for(var/obj/structure/academyward/ward in world)
                    if(!istype(ward, /obj/structure/academyward/perm))
                        ward.density = active
                        ward.alpha = active ? 125 : 0
                        ward.invisibility = active ? null : INVISIBILITY_MAXIMUM
                return TRUE
            return

        audible_message(span_neutraltext("[user] begins channeling energy through the keystone..."), 7)
        if(do_after(user, 3 SECONDS, target = src))
            active = !active
            for(var/obj/structure/academyward/ward in world)
                if(!istype(ward, /obj/structure/academyward/perm))
                    ward.density = active
                    ward.alpha = active ? 125 : 0
                    ward.invisibility = active ? null : INVISIBILITY_MAXIMUM

            if(active)
                audible_message(span_blue("A chorus of ethereal chimes echoes through the air as the academy's wards spring to life!"), 7)
            else
                audible_message(span_blue("The magical harmonies fade to silence as the academy's wards dissipate."), 7)
            return TRUE
        return

    if(disabled_by_nullmagic)
        to_chat(user, span_warning("The crystal remains dark and unresponsive. An Archmage's power might be able to reinvigorate it..."))
        return

    if(istype(I, /obj/item/clothing/ring/active/nomag))
        var/obj/item/clothing/ring/active/nomag/ring = I
        if(!ring.active)
            to_chat(user, span_warning("The ring must first be activated. (Right-click to activate)"))
            return

        audible_message(span_cultlarge("[user] begins channeling null magic into the crystal..."), 7)
        if(do_after(user, 5 SECONDS, target = src))
            disabled_by_nullmagic = TRUE
            icon_state = "Crystal_Inert"
            audible_message(span_cultlarge("The crystal shudders violently as its arcane energies are disrupted, its inner light dimming to a dull, lifeless shade."), 7)
            playsound(src, 'sound/magic/antimagic.ogg', 50, TRUE)
            for(var/obj/structure/academyward/ward in world)
                if(!istype(ward, /obj/structure/academyward/perm))
                    ward.density = FALSE
                    ward.alpha = 0
                    ward.invisibility = INVISIBILITY_MAXIMUM
        return TRUE

    return ..()

//==============================================
//	Defensive Wards
//==============================================

/obj/structure/academyward
	name = "defensive ward"
	desc = "A defensive ward manifested by an ancient artifact, meant to withstand a full on siege. As you get closer, you hear a woman's voice in the distance.. Creepy.."
	icon = 'icons/effects/effects.dmi'
	icon_state = "purplesparkles"
	density = FALSE
	alpha = 0
	layer = POINT_LAYER
	plane = ABOVE_LIGHTING_PLANE
	flags_1 = NOJAUNT_1
	var/reactivating = FALSE
	invisibility = INVISIBILITY_MAXIMUM

/obj/structure/academyward/Bumped(atom/movable/AM)
	if(!density)
		return ..()

	if(!istype(AM, /mob/living))
		return ..()

	var/mob/living/M = AM
	var/obj/item/I = M.get_active_held_item()

	if(istype(I, /obj/item/clothing/ring/keystone))
		var/obj/item/clothing/ring/keystone/key = I
		if(!key.active)
			to_chat(M, span_warning("The Keystone must first be activated. (Right-click to activate)"))
			return
		audible_message(span_blue("The ward recognizes the Academy Keystone and temporarily dissipates."), 7)
		temporary_deactivate(FALSE)
		return

	if(istype(I, /obj/item/clothing/ring/active/nomag))
		var/obj/item/clothing/ring/active/nomag/ring = I
		if(!ring.active)
			return
		audible_message(span_hear("The ward's steady hum distorts into a discordant wail before falling silent."), 7)
		temporary_deactivate(TRUE)
		for(var/mob/living/L in range(5, src))
			to_chat(L, span_cult("The ward shudders, its radiant glow flickering and warping like a fading star, before collapsing into nothingness with a final, mournful pulse of dissipating energy."))
		return

/obj/structure/academyward/proc/temporary_deactivate(is_nullmagic = FALSE)
	if(reactivating)
		return

	reactivating = TRUE
	var/old_density = density
	var/old_alpha = alpha
	density = FALSE
	alpha = 0
	invisibility = INVISIBILITY_MAXIMUM

	if(is_nullmagic)
		addtimer(CALLBACK(src, PROC_REF(reactivate), old_density, old_alpha), 10 SECONDS)
	else
		addtimer(CALLBACK(src, PROC_REF(reactivate), old_density, old_alpha), 5 SECONDS)

/obj/structure/academyward/proc/reactivate(old_density, old_alpha)
	density = old_density
	alpha = old_alpha
	invisibility = (old_density && old_alpha > 0) ? 0 : INVISIBILITY_MAXIMUM
	reactivating = FALSE

/obj/structure/academyward/perm
	name = "permanent defensive ward"
	desc = "A permanent defensive ward etched into reality itself by powerful magicks. You hear a distant tortured wailing when you go near it."
	icon = 'icons/effects/effects.dmi'
	density = TRUE
	alpha = 125

/obj/structure/academyward/perm/Initialize()
	. = ..()
	icon_state = "forcefield"
	invisibility = 0

/obj/structure/academyward/perm/Bumped(atom/movable/AM)
	if(!istype(AM, /mob/living))
		return
	..()

/obj/structure/academyward/perm/temporary_deactivate(is_nullmagic = FALSE)
	if(reactivating)
		return

	reactivating = TRUE
	var/old_density = density
	var/old_alpha = alpha
	density = FALSE
	alpha = 0
	invisibility = INVISIBILITY_MAXIMUM

	if(is_nullmagic)
		addtimer(CALLBACK(src, PROC_REF(reactivate), old_density, old_alpha), 10 SECONDS)
	else
		addtimer(CALLBACK(src, PROC_REF(reactivate), old_density, old_alpha), 5 SECONDS)

/obj/structure/academyward/perm/reactivate(old_density, old_alpha)
	density = old_density
	alpha = old_alpha
	invisibility = (old_density && old_alpha > 0) ? 0 : INVISIBILITY_MAXIMUM
	reactivating = FALSE

//==============================================
//	Warded Bookcases
//==============================================
/obj/structure/bookcase/academy
    name = "warded bookcase"
    desc = "A bookcase that hums with arcane energy. The items within should only be handled by authorized mages."
    allowed_books = list(/obj/item/book, /obj/item/spellbook, /obj/item/storage/book, /obj/item/book/granter/spell/spells5e)
    var/disabled_by_nullmagic = FALSE
    var/reactivate_time = 300 // 30 seconds

/obj/structure/bookcase/academy/proc/reactivate_wards()
    if(!disabled_by_nullmagic)
        return
    disabled_by_nullmagic = FALSE
    playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
    visible_message(span_warning("[src]'s magical wards crackle back to life!"))
    for(var/mob/living/carbon/human/M in GLOB.player_list)
        if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
            to_chat(M, span_cultbold("The wards on a scrollcase at [get_area(src)] have reactivated."))

/obj/structure/bookcase/academy/proc/check_mage_access(mob/living/carbon/human/H)
    if(!ishuman(H))
        return FALSE
    if(H.job == "Academy Archmage" || H.job == "Academy Mage" || H.job == "Academy Apprentice")
        for(var/obj/structure/academy_binder/binder in world)
            if(binder.revoked_users[H.real_name])
                return FALSE
        return TRUE
    return FALSE

/obj/structure/bookcase/academy/attack_hand(mob/living/user)
    if(!ishuman(user))
        return ..()

    var/mob/living/carbon/human/H = user
    if(disabled_by_nullmagic)
        return ..()

    if(!check_mage_access(H))
        user.visible_message(
            span_warning("As [user] reaches toward the bookcase, arcane energy pulses!"),
            span_danger("As you reach toward the bookcase, magical wards shock you with crackling energy!")
        )
        H.electrocute_act(20, src)
        H.apply_effects(2 SECONDS, 2 SECONDS)
        shake_camera(H, 2, 1)
        playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
        var/throwlocation = get_turf(user)
        user.throw_at(throwlocation, 2, 1)

        for(var/mob/living/carbon/human/M in GLOB.player_list)
            if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
                to_chat(M, span_redtext("[user] attempted to access the warded case at [get_area(src)]!"))
        return TRUE
    return ..()

/obj/structure/bookcase/academy/attackby(obj/item/I, mob/user, params)
    if(istype(I, /obj/item/clothing/ring/active/nomag))
        var/obj/item/clothing/ring/active/nomag/ring = I
        if(!ring.active)
            return ..()

        disabled_by_nullmagic = TRUE
        playsound(src, 'sound/magic/antimagic.ogg', 50, TRUE)
        visible_message(span_warning("[src]'s magical wards flicker and fade as they're disrupted by anti-magic!"))

        for(var/mob/living/carbon/human/M in GLOB.player_list)
            if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
                to_chat(M, span_cultbold("The wards on a scrollcase at [get_area(src)] have been nullified!"))

        addtimer(CALLBACK(src, PROC_REF(reactivate_wards)), reactivate_time)
        return TRUE

    if(disabled_by_nullmagic)
        return ..()

    if(!ishuman(user))
        return ..()

    var/mob/living/carbon/human/H = user
    if(!check_mage_access(H))
        user.visible_message(
            span_warning("As [user] tries to place [I] in the case, arcane energy pulses!"),
            span_danger("As you try to place [I] in the case, magical wards shock you with crackling energy!")
        )
        H.electrocute_act(20, src)
        H.apply_effects(2 SECONDS, 2 SECONDS)
        shake_camera(H, 2, 1)
        playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
        var/throwlocation = get_turf(user)
        user.throw_at(throwlocation, 2, 1)

        for(var/mob/living/carbon/human/M in GLOB.player_list)
            if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
                to_chat(M, span_cultbold("[user] attempted to place [I] into the warded case at [get_area(src)]!"))
        return TRUE
    return ..()

//==============================================
//	Communication Orb
//==============================================
/obj/structure/academy_orb
	name = "academy communication orb"
	desc = "A crystalline orb humming with arcane energy. When activated with an Arch-Keystone, it can send magical messages to all Academy mages."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state ="scrying"
	color = "#D381C9"
	anchored = TRUE
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/last_used
	var/cooldown = 5 MINUTES

/obj/structure/academy_orb/attackby(obj/item/I, mob/user, params)
	if(!istype(I, /obj/item/clothing/ring/keystone/archkey))
		return ..()

	var/obj/item/clothing/ring/keystone/archkey/K = I
	if(!K.active)
		to_chat(user, span_warning("The Arch-Keystone must first be activated. (Right-click to activate)"))
		return

	if(last_used && world.time < last_used + cooldown)
		to_chat(user, span_warning("The orb's energies are still regenerating."))
		return

	var/message = stripped_input(user, "What message would you like to send to every Academy Mage?", "Arcane Message")
	if(!message)
		return

	last_used = world.time

	visible_message(span_blue("The orb pulses with brilliant light as [user] channels energy through the Arch-Keystone!"))
	playsound(src, 'sound/magic/timestop.ogg', 100, FALSE, -1)

	for(var/mob/living/carbon/human/M in GLOB.player_list)
		if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
			to_chat(M, "<span style='color: #7246ff'><b>Arcane Message from the Academy:</b> [message]</span>")
			playsound(M, 'sound/magic/churn.ogg', 50, TRUE)

	to_chat(user, span_notice("Your message has been sent to every Academy Mage."))

/obj/structure/academy_orb/examine(mob/user)
	. = ..()
	if(last_used && world.time < last_used + cooldown)
		. += span_warning("The orb is still regenerating its energy. It will be ready in [round((last_used + cooldown - world.time)/600)] minutes.")
	else
		. += span_notice("The orb is ready to transmit messages.")

//==============================================
//	Disciplinary Nexus
//==============================================
/obj/structure/academy_binder
	name = "keystone binding nexus"
	desc = "An ornate crystalline nexus humming with arcane energy. Ancient runes of binding and revocation are carved into its surface. When activated with an Arch-Keystone, it can revoke or restore an Academy Mage's privileges."
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "anomaly_crystal"
	color = "#D381C9"
	anchored = TRUE
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/static/list/revoked_users = list()

/obj/structure/academy_binder/attackby(obj/item/I, mob/user, params)
    if(!istype(I, /obj/item/clothing/ring/keystone/archkey))
        return ..()

    var/obj/item/clothing/ring/keystone/archkey/K = I
    if(!K.active)
        to_chat(user, span_warning("The Arch-Keystone must first be activated. (Right-click to activate)"))
        return

    var/choice = alert(user, "Would you like to revoke or restore Academy privileges?", "Keystone Nexus", "Revoke", "Restore", "Cancel")
    if(choice == "Cancel")
        return

    var/input = stripped_input(user, "Enter the full name of the person to [choice == "Revoke" ? "revoke Academy privileges from" : "restore Academy privileges to"]:", "Academy Binding")
    if(!input)
        return

    for(var/mob/living/carbon/human/H in GLOB.player_list)
        if(H.real_name == input && H.job == "Academy Archmage")
            to_chat(user, span_boldwarning("The Altar refuses to bind an Archmage's powers!"))
            playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
            return

    if(choice == "Revoke")
        if(revoked_users[input])
            to_chat(user, span_warning("This person's Academy privileges have already been revoked."))
            return

        var/reason = stripped_multiline_input(user, "Enter the reason for revoking privileges:", "Revocation Reason")

        visible_message(span_danger("The altar pulses with dark energy as [user] channels power through the Arch-Keystone!"))
        playsound(src, 'sound/magic/antimagic.ogg', 100, FALSE, -1)

        revoked_users[input] = reason || "No reason provided"

        for(var/mob/living/carbon/human/M in GLOB.player_list)
            if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
                to_chat(M, span_redtext("<b>Academy Binding Alert:</b> [input] has had their Academy privileges revoked by order of [user]."))
                to_chat(M, span_redtext("<b>Reason:</b> [revoked_users[input]]"))
                playsound(M, 'sound/magic/churn.ogg', 50, TRUE)

        for(var/mob/living/carbon/human/H in GLOB.player_list)
            if(H.real_name == input)
                for(var/obj/item/clothing/ring/keystone/stone in H.GetAllContents())
                    stone.bound = FALSE
                    stone.bound_user = null
                    stone.active = FALSE
                    stone.update_icon()
                    to_chat(H, span_userdanger("You feel your connection to the Academy's magic suddenly severed!"))
                    playsound(H, 'sound/magic/antimagic.ogg', 50, TRUE)

    else if(choice == "Restore")
        if(!revoked_users[input])
            to_chat(user, span_warning("This person's Academy privileges are not currently revoked."))
            return

        visible_message(span_blue("The altar hums with restorative energy as [user] channels power through the Arch-Keystone!"))
        playsound(src, 'sound/magic/churn.ogg', 100, FALSE, -1)

        revoked_users -= input

        for(var/mob/living/carbon/human/M in GLOB.player_list)
            if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
                to_chat(M, span_blue("<b>Academy Binding Alert:</b> [input] has had their Academy privileges restored by order of [user]."))
                playsound(M, 'sound/magic/churn.ogg', 50, TRUE)

        for(var/mob/living/carbon/human/H in GLOB.player_list)
            if(H.real_name == input)
                to_chat(H, span_blue("You feel your connection to the Academy's magic return!"))
                playsound(H, 'sound/magic/churn.ogg', 50, TRUE)

/obj/structure/academy_binder/examine(mob/user)
    . = ..()
    if(ishuman(user))
        var/mob/living/carbon/human/H = user
        if(H.job == "Academy Archmage" || H.job == "Academy Mage" || H.job == "Academy Apprentice")
            . += span_notice("Currently suspended users:")
            for(var/name in revoked_users)
                . += span_warning("- [name] ([revoked_users[name]])")

//==============================================
//	Academy Portal Statue (vault, archmage quarters, other stuff)
//==============================================

/obj/structure/statue/academy_portal
    name = "Gateway to Vermyra"
    desc = "An ornate statue depicting a solemn stone face. Ancient runes of transportation are carved into its base, pulsing with a deep violet energy. The figure's eyes seem to glow with an otherworldly wisdom, hinting at the magical realm that lies beyond."
    icon = 'icons/roguetown/topadd/statue1.dmi'
    icon_state = "baldguy"
    anchored = TRUE
    density = TRUE
    resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
    var/obj/effect/portal/linked_portal
    var/portal_active = FALSE
    var/portal_cooldown = 3 MINUTES
    var/last_activation = 0

/obj/structure/statue/academy_portal/examine(mob/user)
    . = ..()
    if(ishuman(user))
        var/mob/living/carbon/human/H = user
        if(H.job == "Academy Archmage" || H.job == "Academy Mage" || H.job == "Academy Apprentice")
            . += "<span style='color: #7246ff'>The runes read: 'Through this gate lies Vermyra, the Violet Isles, where the very air crackles with arcane power. Let those who bear the Academy's mark pass freely between realms.'</span>"
            if(world.time < last_activation + portal_cooldown)
                . += span_warning("The statue's energies are still regenerating. It will be ready in [round((last_activation + portal_cooldown - world.time)/600)] minutes.")
            else
                . += "<span style='color: #7246ff'>The statue hums with ready power.</span>"
        else
            . += span_warning("The runes are written in an ancient magical script you cannot decipher.")

/obj/structure/statue/academy_portal/attackby(obj/item/I, mob/user, params)
    if(!istype(I, /obj/item/clothing/ring/keystone))
        return ..()

    var/obj/item/clothing/ring/keystone/key = I
    if(!key.active)
        to_chat(user, span_warning("The Keystone must first be activated. (Right-click to activate)"))
        return

    if(!linked_portal)
        to_chat(user, span_warning("The statue's connection to Vermyra seems unstable, it would be unwise to activate it."))
        return

    if(world.time < last_activation + portal_cooldown)
        to_chat(user, span_warning("The statue's energies are still regenerating."))
        return

    user.visible_message("<span style='color: #7246ff'>[user] holds up [I], causing the statue's runes to pulse with violet light!</span>")
    playsound(src, 'sound/misc/portalactivate.ogg', 50, TRUE)

    if(do_after(user, 3 SECONDS, target = src))
        create_portal(user)

/obj/structure/statue/academy_portal/proc/create_portal(mob/user)
    var/turf/portal_turf = get_step(src, SOUTH)

    if(portal_active)
        to_chat(user, span_warning("A portal is already active!"))
        return

    last_activation = world.time
    portal_active = TRUE

    var/obj/effect/portal/P = new /obj/effect/portal(portal_turf, linked_portal, null, 30 SECONDS)
    P.name = "shimmering portal to Vermyra"
    P.desc = "A swirling gateway of violet energy, through which you can glimpse floating towers and purple seas."
    P.icon = 'icons/effects/effects.dmi'
    P.icon_state = "bluestream_fade"

    visible_message("<span style='color: #7246ff'>The air splits apart with a crack of thunder, revealing a portal to a realm of floating towers and violet seas!</span>")
    playsound(src, 'sound/misc/portal_op.ogg', 100, FALSE)
    playsound(src, 'sound/misc/portal_loop.ogg', 50, TRUE)

    addtimer(CALLBACK(src, PROC_REF(deactivate_portal)), 30 SECONDS)

/obj/structure/statue/academy_portal/proc/deactivate_portal()
    portal_active = FALSE

/obj/effect/portal/permanent/academy
    name = "portal to the material realm"
    desc = "A permanent magical gateway connecting Vermyra to the material realm."
    icon = 'icons/effects/effects.dmi'
    icon_state = "bluestream_fade"
    anchored = TRUE
    density = TRUE
    var/failchance = 0
    resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
    var/static/list/return_destinations = list()

/obj/effect/portal/permanent/academy/Initialize()
    . = ..()
    for(var/obj/structure/statue/academy_portal/P in world)
        var/turf/T = get_step(P, SOUTH)
        return_destinations += T

/obj/effect/portal/permanent/academy/Crossed(atom/movable/AM)
    . = ..()
    if(isliving(AM))
        if(length(return_destinations))
            var/turf/destination = pick(return_destinations)
            AM.forceMove(destination)
            to_chat(AM, "<span style='color: #7246ff'>You step through the portal, feeling arcane energies wash over you...</span>")
            playsound(src, 'sound/misc/portal_enter.ogg', 100, FALSE)

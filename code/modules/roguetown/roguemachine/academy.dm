//all the stuff used for ravenloft academy

/obj/structure/wardingcrystal
	name = "ravenloft warding crystal"
	desc = "A crystal that shimmers with a warding glow, its surface veined with crackles of arcyne energy, while faint, shadowy shapes swirl within, accompanied by an eerie hum and distant whispers."
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
                    ward.density = active
                    ward.alpha = active ? 125 : 0
                    ward.invisibility = active ? null : INVISIBILITY_MAXIMUM
                return TRUE
            return

        audible_message(span_neutraltext("[user] begins channeling energy through the keystone..."), 7)
        if(do_after(user, 3 SECONDS, target = src))
            active = !active
            for(var/obj/structure/academyward/ward in world)
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
                ward.density = FALSE
                ward.alpha = 0
                ward.invisibility = INVISIBILITY_MAXIMUM
        return TRUE

    return ..()

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

//portal statue
/obj/structure/academystatue
    name = "Grandmage Lancoh"
    desc = "A statue depicting Grandmage Lancoh, one of the first Professors of the Ravenloft Academy. Fiercely protective of his students, he was executed by the founders of the town when he refused them entry into the Academy during a crusade. There appears to be a keystone-shaped indent."
    icon = 'icons/roguetown/misc/tallstructure.dmi'
    icon_state = "bstatue"
    anchored = TRUE
    density = TRUE
    var/linked_travel_id = "academy_secret"
    var/reveal_duration = 300

/obj/structure/academystatue/attackby(obj/item/I, mob/user, params)
    if(istype(I, /obj/item/clothing/ring/keystone/archkey))
        var/obj/item/clothing/ring/keystone/archkey/K = I
        if(K.active)
            audible_message(span_blue("Ancient runes flare to life as [user] presses the Arch-Keystone into the statue's indent, causing wisps of arcane energy to coalesce..."), 7)
            if(do_after(user, 5 SECONDS, target = src))
                audible_message(span_blue("The air shimmers and parts as an ethereal doorway materializes!"), 7)
                reveal_path(user)
        else
            to_chat(user, span_warning("The Keystone must first be activated. (Right-click to activate)"))
        return TRUE
    return ..()

/obj/structure/academystatue/proc/reveal_path(mob/user)
    var/obj/structure/fluff/traveltile/T = new(get_step(src, SOUTH))
    T.aportalid = linked_travel_id
    T.aportalgoesto = "scholarium"
    T.time2go = reveal_duration
    addtimer(CALLBACK(GLOBAL_PROC, PROC_REF(qdel), T), reveal_duration)
    playsound(src, 'sound/magic/timestop.ogg', 100, FALSE, -1)
    to_chat(user, span_notice("A magical pathway reveals itself!"))


//watched bookcase
/obj/structure/bookcase/academy
    name = "warded bookcase"
    desc = "A bookcase that hums with arcane energy. The items within should only be handled by authorized mages."
    allowed_books = list(/obj/item/book, /obj/item/spellbook, /obj/item/storage/book, /obj/item/book/granter/spell/spells5e)
    var/disabled_by_nullmagic = FALSE
    var/reactivate_time = 300 // 30 seconds

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
                to_chat(M, span_userdanger("The wards on a scrollcase at [get_area(src)] have been nullified!"))

        addtimer(CALLBACK(src, PROC_REF(reactivate_wards)), reactivate_time)
        return TRUE

    if(disabled_by_nullmagic)
        return ..()

    if(ishuman(user))
        var/mob/living/carbon/human/H = user
        if(H.job == "Academy Archmage" || H.job == "Academy Mage" || H.job == "Academy Apprentice")
            return ..()

        if(is_type_in_list(I, allowed_books))
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
                    to_chat(M, span_warning("[user] attempted to place [I] into the warded case at [get_area(src)]!"))

            return TRUE

    return ..()

/obj/structure/bookcase/academy/attack_hand(mob/living/user)
    if(disabled_by_nullmagic)
        return ..()

    if(ishuman(user))
        var/mob/living/carbon/human/H = user
        if(H.job == "Academy Archmage" || H.job == "Academy Mage" || H.job == "Academy Apprentice")
            return ..()

        if(contents.len)
            var/obj/item/choice = input(user, "Which item would you like to remove from the case?") as null|obj in contents.Copy()
            if(choice)
                user.visible_message(
                    span_warning("As [user] reaches for [choice.name], arcane energy pulses!"),
                    span_danger("As you reach for [choice.name], magical wards shock you with crackling energy!")
                )

                H.electrocute_act(20, src)
                H.apply_effects(2 SECONDS, 2 SECONDS)
                shake_camera(H, 2, 1)

                playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
                var/throwlocation = get_turf(user)
                user.throw_at(throwlocation, 2, 1)

                for(var/mob/living/carbon/human/M in GLOB.player_list)
                    if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
                        to_chat(M, span_warning("[user] attempted to take [choice.name] from the warded case at [get_area(src)]!"))

                return TRUE

    return ..()

/obj/structure/bookcase/academy/proc/reactivate_wards()
    if(!disabled_by_nullmagic)
        return

    disabled_by_nullmagic = FALSE
    playsound(src, 'sound/magic/charging.ogg', 50, TRUE)
    visible_message(span_warning("[src]'s magical wards crackle back to life!"))

    // Notify magical staff
    for(var/mob/living/carbon/human/M in GLOB.player_list)
        if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
            to_chat(M, span_notice("The wards on a scrollcase at [get_area(src)] have reactivated."))

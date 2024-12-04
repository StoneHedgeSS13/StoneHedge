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
            to_chat(user, span_neutraltext("You begin channeling magical energy into the crystal..."))
            if(do_after(user, 10 SECONDS, target = src))
                disabled_by_nullmagic = FALSE
                for(var/mob/living/L in range(5, src))
                    to_chat(L, span_blue("The crystal pulses with renewed vigor as arcane energy flows through it, its veins of power rekindling with brilliant light as ancient magicks stir once more within."))
                icon_state = "Crystal"
                playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
                for(var/obj/structure/academyward/ward in world)
                    ward.density = active
                    ward.alpha = active ? 125 : 0
                    ward.invisibility = active ? null : INVISIBILITY_MAXIMUM
                return TRUE
            return

        to_chat(user, span_neutraltext("You begin channeling energy through the keystone..."))
        if(do_after(user, 3 SECONDS, target = src))
            active = !active
            for(var/obj/structure/academyward/ward in world)
                ward.density = active
                ward.alpha = active ? 125 : 0
                ward.invisibility = active ? null : INVISIBILITY_MAXIMUM

            if(active)
                to_chat(user, span_blue("The wards of protection hath been stirred, and now awaken in their full might."))
            else
                to_chat(user, span_blue("The wards of protection hath been undone and their power withdrawn."))
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

        to_chat(user, span_cultlarge("You begin channeling null magic into the crystal..."))
        if(do_after(user, 5 SECONDS, target = src))
            disabled_by_nullmagic = TRUE
            icon_state = "Crystal_Inert"
            for(var/mob/living/L in range(5, src))
                to_chat(L, span_userdanger("The crystal shudders violently as its arcane energies are disrupted, its inner light dimming to a dull, lifeless shade."))
            playsound(src, 'sound/magic/antimagic.ogg', 50, TRUE)
            for(var/obj/structure/academyward/ward in world)
                ward.density = FALSE
                ward.alpha = 0
                ward.invisibility = INVISIBILITY_MAXIMUM
        return TRUE

    return ..()

/obj/structure/academyward
	name = "defensive ward"
	desc = "A defensive ward manifested by a powerful artifact. It looks like it can withstand a full on siege."
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield2"
	density = FALSE
	alpha = 0
	layer = ABOVE_ALL_MOB_LAYER
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
		temporary_deactivate(FALSE)
		to_chat(M, span_blue("The ward recognizes the Academy Keystone and temporarily parts before you."))
		return

	if(istype(I, /obj/item/clothing/ring/active/nomag))
		var/obj/item/clothing/ring/active/nomag/ring = I
		if(!ring.active)
			return
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


//all the stuff used for ravenloft academy

//==============================================
//	Warding Crystal
//==============================================
/obj/structure/wardingcrystal
	name = "ravenloft warding crystal"
	desc = "A crystal that shimmers with a warding glow, its surface veined with crackles of arcane energy, while faint, shadowy shapes swirl within, accompanied by an eerie hum and distant whispers. For use when the Academy is facing a great danger."
	icon = 'icons/obj/crystal.dmi'
	icon_state = "Crystal"
	anchored = TRUE
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/active = FALSE
	var/disabled_by_nullmagic = FALSE
	var/total_active_time = 0
	var/max_active_time = 10 MINUTES
	var/needs_recharge = FALSE
	var/last_active_time = 0
	var/sublimate_charges = 0

/obj/structure/wardingcrystal/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	last_active_time = world.time

/obj/structure/wardingcrystal/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/structure/wardingcrystal/process()
	if(active && !needs_recharge)
		var/time_since_last = world.time - last_active_time
		total_active_time += time_since_last
		last_active_time = world.time

		if(total_active_time >= max_active_time)
			needs_recharge = TRUE
			active = FALSE
			icon_state = "Crystal_Inert"
			visible_message(span_redtext("[src]'s energies fade as it enters a depleted state!"))
			playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
			for(var/obj/structure/academyward/ward in world)
				if(!istype(ward, /obj/structure/academyward/perm))
					ward.density = FALSE
					ward.alpha = 0
					ward.invisibility = INVISIBILITY_MAXIMUM

/obj/structure/wardingcrystal/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.job == "Academy Archmage" || H.job == "Academy Mage" || H.job == "Academy Apprentice")
			if(needs_recharge)
				. += span_redtext("The crystal's energies are depleted and requires [10 - sublimate_charges] more arcyne sublimate to recharge.")
			else
				var/time_left = max_active_time - total_active_time
				. += span_notice("The crystal has enough arcyne sublimate for [round(time_left/600, 0.1)] minutes.")

/obj/structure/wardingcrystal/attackby(obj/item/I, mob/user, params)
	. = ..()

	if(needs_recharge && istype(I, /obj/item/reagent_containers/powder/sublimate))
		to_chat(user, span_notice("You begin feeding arcyne sublimate into the crystal's matrix..."))
		if(do_after(user, 5 SECONDS, target = src))
			sublimate_charges++
			if(sublimate_charges >= 10)
				sublimate_charges = 0
				total_active_time = 0
				needs_recharge = FALSE
				icon_state = "Crystal"
				playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
				visible_message(span_blue("[src] pulses with renewed energy as it absorbs the final sublimate!"))
			else
				visible_message(span_notice("[src] absorbs the sublimate. [10 - sublimate_charges] more needed for full recharge."))
			qdel(I)
		return TRUE

	if(istype(I, /obj/item/clothing/ring/keystone/archkey))
		var/obj/item/clothing/ring/keystone/archkey/key = I
		if(!key.active)
			to_chat(user, span_warning("The Arch-Keystone must first be activated. (Right-click to activate)"))
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

		if(needs_recharge)
			to_chat(user, span_warning("The crystal's energies are depleted and requires arcyne sublimate to recharge."))
			return

		audible_message(span_neutraltext("[user] begins channeling energy through the keystone..."), 7)
		if(do_after(user, 3 SECONDS, target = src))
			active = !active
			if(active)
				last_active_time = world.time
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
		visible_message(span_redtext("[src]'s magical wards flicker and fade as they're disrupted by anti-magic!"))

		for(var/mob/living/carbon/human/M in GLOB.player_list)
			if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
				to_chat(M, span_redtext("The wards on a scrollcase at [get_area(src)] have been nullified!"))

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
				to_chat(M, span_redtext("[user] attempted to place [I] into the warded case at [get_area(src)]!"))
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
//	Windows + test of a confiscation system that will be expanded on later
//==============================================

/obj/structure/roguewindow/academy
	name = "enchanted window"
	desc = "A reinforced window humming with arcane energy. Faint runes of protection shimmer across its surface."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "window-solid"
	base_state = "window-solid"
	max_integrity = 800
	integrity_failure = 0.1
	var/disabled_by_nullmagic = FALSE
	var/reactivate_time = 30 SECONDS
	var/list/warned_users = list()
	night_variants = FALSE
	openable = FALSE

/obj/structure/roguewindow/academy/Initialize()
	. = ..()
	update_icon()

/obj/structure/roguewindow/academy/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.job == "Academy Archmage" || H.job == "Academy Mage" || H.job == "Academy Apprentice")
			if(disabled_by_nullmagic)
				. += span_redtext("The window's wards have been nullified and will reactivate in [round((reactivate_time)/10)] seconds.")
			else
				. += span_notice("The window's wards are active and ready to defend against intruders.")

/obj/structure/roguewindow/academy/proc/handle_confiscation(mob/living/carbon/human/H)
	visible_message(span_danger("The window's wards surge with retributive energy as reality warps around [H]!"), \
		span_userdanger("Reality warps around you as the window's wards activate!"), \
		target = H)
	playsound(H, 'sound/magic/timestop.ogg', 100, TRUE)
	new /obj/effect/temp_visual/dir_setting/ninja(get_turf(H))
	H.Stun(10)
	H.Paralyze(10)

	var/obj/item/confiscated_pouch/P = new(get_turf(H))
	P.name = "[H.real_name]'s confiscated belongings"
	P.desc = "A magically sealed pouch containing items confiscated from [H.real_name] for attempting to violently breach the Academy's Wards."

	var/list/stripped_items = list()
	stripped_items += H.get_active_held_item()
	stripped_items += H.get_inactive_held_item()
	H.dropItemToGround(H.get_active_held_item())
	H.dropItemToGround(H.get_inactive_held_item())

	for(var/obj/item/I in H.GetAllContents())
		stripped_items += I
		H.dropItemToGround(I)

	var/list/item_list = list()
	for(var/obj/item/I in stripped_items)
		if(I)
			item_list += "[I.name]"
			P.add_item(I)

	var/obj/structure/closet/crate/roguecloset/lord/academy_confiscated/C = locate() in world
	if(C)
		P.forceMove(C)
		playsound(C, 'sound/misc/portalopen.ogg', 50, TRUE)

	var/obj/effect/landmark/academy_records/R = locate() in GLOB.landmarks_list
	if(R)
		var/obj/item/paper/scroll/confiscation_record/record = new(get_turf(R))
		record.record_name = "Confiscation Record - [H.real_name]"
		record.name = record.record_name
		record.info = {"
			<center><b>Academy Confiscation Record</b></center><br>
			<b>Subject:</b> [H.real_name]<br>
			<b>Time:</b> [station_time_timestamp()]<br>
			<b>Location:</b> [get_area(src)]<br>
			<b>Reason:</b> Attempted to violently breach the Academy's Wards<br>
			<b>Action Taken:</b> Items confiscated and subject teleported to front gate<br>
			<br>
			<b>Confiscated Items:</b><br>
			[item_list.Join("<br>")]
			<br>
			<b><i>By order of the Council of Archmages</i></b>
		"}

	var/list/academy_staff = list()
	for(var/mob/living/carbon/human/M in GLOB.player_list)
		if(M.job == "Academy Archmage")
			academy_staff += "<b>Archmage [M.real_name]</b>"
		else if(M.job == "Academy Mage")
			academy_staff += "Mage [M.real_name]"
		else if(M.job == "Academy Apprentice")
			academy_staff += "Apprentice [M.real_name]"

	var/obj/effect/landmark/academy_gate/G = locate() in GLOB.landmarks_list
	if(G)
		playsound(H, 'sound/misc/portalopen.ogg', 100, TRUE)
		new /obj/effect/temp_visual/dir_setting/ninja/phase/out(get_turf(H))
		H.forceMove(get_turf(G))
		new /obj/effect/temp_visual/dir_setting/ninja/phase/out(get_turf(H))
		playsound(H, 'sound/misc/portalopen.ogg', 100, TRUE)
		visible_message(span_warning("[H] is banished to the Academy gates!"))
	else
		var/turf/T = find_safe_turf()
		playsound(H, 'sound/misc/portalopen.ogg', 100, TRUE)
		new /obj/effect/temp_visual/dir_setting/ninja/phase/out(get_turf(H))
		H.forceMove(T)
		new /obj/effect/temp_visual/dir_setting/ninja/phase/out(get_turf(H))
		playsound(H, 'sound/misc/portalopen.ogg', 100, TRUE)
		visible_message(span_warning("[H] is banished to a distant location!"))

	var/obj/item/paper/notice = new(get_turf(H))
	notice.name = "Notice of Confiscation"
	notice.info = {"
		<center><b>NOTICE OF CONFISCATION</b></center><br>
		<br>
		Your items have been confiscated by the Ravenloft Academy for attempting to violently breach Academy property.<br>
		<br>
		<b>Items Confiscated:</b><br>
		[item_list.Join("<br>")]<br>
		<br>
		<b>Current Academy Staff:</b><br>
		[academy_staff.Join("<br>")]<br>
		<br>
		<b>Steps to Retrieve Your Items:</b><br>
		1. Locate a member of the Academy Staff listed above<br>
		2. Request access to your confiscated items<br>
		3. The Academy Staff will retrieve your items from the confiscation cabinet.<br>
		4. Your items will be returned at the Academy Staff's discretion and you may never get them back.<br>
		<br>
		<i>Note: Attempting to breach Academy property again will result in more severe consequences, including full body incineration.</i><br>
		<br>
		<center><i>By order of the Council of Archmages</i></center>
	"}
	H.put_in_hands(notice)

/obj/structure/roguewindow/academy/proc/handle_ward_activation(mob/living/user)
	if(!warned_users[user.ckey])
		visible_message(span_warning("The window's wards flare ominously as [user] attempts to break it!"))
		playsound(src, 'sound/magic/holyshield.ogg', 100, TRUE)
		to_chat(user, span_redtext("The window's magical wards pulse with magical energy. Another attempt to break it while the enchantments are active might be unwise!"))
		warned_users[user.ckey] = TRUE
		return TRUE

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		to_chat(H, span_userdanger("Reality warps around you as the window's wards activate!"))
		handle_confiscation(H)

		var/obj/effect/landmark/academy_gate/G = locate() in GLOB.landmarks_list
		if(G)
			playsound(src, 'sound/magic/timestop.ogg', 50, TRUE)
			new /obj/effect/temp_visual/dir_setting/ninja(get_turf(H))
			H.forceMove(get_turf(G))
			new /obj/effect/temp_visual/dir_setting/ninja(get_turf(H))
		else
			var/turf/T = find_safe_turf()
			playsound(src, 'sound/magic/timestop.ogg', 50, TRUE)
			new /obj/effect/temp_visual/dir_setting/ninja(get_turf(H))
			H.forceMove(T)
			new /obj/effect/temp_visual/dir_setting/ninja(get_turf(H))

		for(var/mob/living/carbon/human/M in GLOB.player_list)
			if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
				to_chat(M, span_redtext("The wards on a window at [get_area(src)] have teleported an intruder to the front gate! Their items have been confiscated."))

	warned_users -= user.ckey
	return TRUE

/obj/structure/roguewindow/academy/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/clothing/ring/active/nomag))
		var/obj/item/clothing/ring/active/nomag/ring = I
		if(!ring.active)
			return ..()

		visible_message(span_warning("[src]'s wards flicker and fade as they're disrupted by anti-magic!"))
		playsound(src, 'sound/magic/antimagic.ogg', 50, TRUE)
		disabled_by_nullmagic = TRUE

		for(var/mob/living/carbon/human/M in GLOB.player_list)
			if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
				to_chat(M, span_redtext("The wards on a window at [get_area(src)] have been nullified!"))

		addtimer(CALLBACK(src, PROC_REF(reactivate_wards)), reactivate_time)
		return TRUE

	if(disabled_by_nullmagic)
		return ..()

	if(I.force > 0 || istype(I, /obj/item/crowbar))
		return handle_ward_activation(user)

	return ..()

/obj/structure/roguewindow/academy/attack_hand(mob/user, params)
	return

/obj/structure/roguewindow/academy/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir)
	if(disabled_by_nullmagic)
		return ..()

	if(damage_amount > 0 && isliving(usr))
		return handle_ward_activation(usr)
	return 0

/obj/structure/roguewindow/academy/obj_break(damage_flag)
	if(disabled_by_nullmagic)
		return ..()
	return FALSE

/obj/structure/roguewindow/academy/proc/reactivate_wards()
	if(!disabled_by_nullmagic)
		return
	disabled_by_nullmagic = FALSE
	playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
	visible_message(span_warning("[src]'s magical wards crackle back to life!"))
	warned_users.Cut()

	for(var/mob/living/carbon/human/M in GLOB.player_list)
		if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
			to_chat(M, span_cultbold("The wards on a window at [get_area(src)] have reactivated."))

//==============================================
//	Confiscation System Misc.
//==============================================
/obj/effect/landmark/academy_gate
	name = "academy front gate"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x"

/obj/effect/landmark/academy_records
	name = "academy records"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x"

/obj/item/paper/scroll/confiscation_record
	name = "confiscation record"
	desc = "An official Ravenloft Academy scroll detailing confiscated items from a would-be intruder."
	icon_state = "scroll"
	textper = 108
	maxlen = 2000
	var/record_name = null

/obj/item/paper/scroll/confiscation_record/Initialize()
	. = ..()
	update_icon()

/obj/item/paper/scroll/confiscation_record/update_icon()
	. = ..()
	if(record_name)
		name = record_name

/obj/item/confiscated_pouch
	name = "confiscated items pouch"
	desc = "A magically sealed pouch containing confiscated items from those who attempted to violently breach the Academy's Wards. Upon opening, the pouch will unravel and dump its contents."
	icon = 'icons/roguetown/clothing/storage.dmi'
	icon_state = "pouch"
	item_state = "pouch"
	lefthand_file = 'icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/belt_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/list/stored_items = list()

/obj/item/confiscated_pouch/examine(mob/user)
	. = ..()
	. += span_notice("The pouch is magically sealed. Opening it will unravel the magic and scatter its contents.")

/obj/item/confiscated_pouch/attack_self(mob/user)
	switch(alert(user, "Do you really want to unravel this pouch? All contents will be scattered!", "Unravel Pouch", "Yes", "No"))
		if("Yes")
			playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
			visible_message(span_warning("[src] unravels as its magical seal breaks!"))

			var/turf/T = get_turf(src)
			for(var/obj/item/I in stored_items)
				I.forceMove(T)
				var/randomx = rand(-1, 1)
				var/randomy = rand(-1, 1)
				var/turf/target = locate(T.x + randomx, T.y + randomy, T.z)
				if(target)
					I.throw_at(target, 1, 1)
			stored_items.Cut()
			qdel(src)
		if("No")
			return

/obj/item/confiscated_pouch/proc/add_item(obj/item/I)
	stored_items += I
	I.forceMove(src)

/obj/structure/closet/crate/roguecloset/lord/academy_confiscated
	name = "magically sealed cabinet"
	desc = "A sealed cabinet containing items confiscated from those who attempted to violently bypass the Academy's Wards."
	base_icon_state = "closetlord"
	icon_state = "closetlord"
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	keylock = TRUE
	lockid = "academy_confiscated"
	masterkey = TRUE
	var/magically_sealed = TRUE
	var/disabled_by_nullmagic = FALSE
	var/reactivate_time = 30 SECONDS

/obj/structure/closet/crate/roguecloset/lord/academy_confiscated/Initialize()
	. = ..()
	locked = TRUE
	update_icon()

/obj/structure/closet/crate/roguecloset/lord/academy_confiscated/examine(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.job == "Academy Archmage" || H.job == "Academy Mage" || H.job == "Academy Apprentice")
		if(disabled_by_nullmagic)
			. += span_redtext("The cabinet's wards have been nullified and will reactivate in [round((reactivate_time)/10)] seconds.")
		else if(magically_sealed)
			. += span_notice("The cabinet is magically sealed. Use an activated Keystone to unseal it.")
		else
			. += span_notice("The cabinet is unsealed and can be opened normally.")

/obj/structure/closet/crate/roguecloset/lord/academy_confiscated/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/clothing/ring/active/nomag))
		var/obj/item/clothing/ring/active/nomag/ring = W
		if(!ring.active)
			return ..()

		visible_message(span_redtext("[src]'s wards flicker and fade as they're disrupted by anti-magic!"))
		playsound(src, 'sound/magic/antimagic.ogg', 50, TRUE)
		disabled_by_nullmagic = TRUE
		magically_sealed = FALSE
		locked = FALSE

		for(var/mob/living/carbon/human/M in GLOB.player_list)
			if(M.job == "Academy Archmage" || M.job == "Academy Mage" || M.job == "Academy Apprentice")
				to_chat(M, span_redtext("The wards on the confiscation cabinet at [get_area(src)] have been nullified!"))

		addtimer(CALLBACK(src, PROC_REF(reactivate_wards)), reactivate_time)
		return TRUE

	if(istype(W, /obj/item/clothing/ring/keystone))
		if(!ishuman(user))
			return ..()

		var/mob/living/carbon/human/H = user
		if(!(H.job in list("Academy Archmage", "Academy Mage", "Academy Apprentice")))
			to_chat(user, span_warning("Only Academy Mages can unlock this Cabinet."))
			return TRUE

		var/obj/item/clothing/ring/keystone/key = W
		if(!key.active)
			to_chat(user, span_warning("The Keystone must first be activated. (Right-click to activate)"))
			return

		if(disabled_by_nullmagic)
			to_chat(user, span_warning("The cabinet's wards have been nullified by anti-magic. You must wait for them to reactivate."))
			return

		magically_sealed = !magically_sealed
		locked = magically_sealed
		playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
		to_chat(user, span_notice("You [magically_sealed ? "magically seal" : "unseal"] the Confiscation Cabinet."))
		return

	if(magically_sealed && !disabled_by_nullmagic)
		to_chat(user, span_warning("The cabinet is magically sealed. An activated Keystone is required to unseal it."))
		return TRUE

	return ..()

/obj/structure/closet/crate/roguecloset/lord/academy_confiscated/attack_hand(mob/user)
	if(magically_sealed && !disabled_by_nullmagic)
		to_chat(user, span_warning("The cabinet is magically sealed. An activated Keystone is required to unseal it."))
		return TRUE
	return ..()

/obj/structure/closet/crate/roguecloset/lord/academy_confiscated/proc/reactivate_wards()
	if(!disabled_by_nullmagic)
		return
	disabled_by_nullmagic = FALSE
	magically_sealed = TRUE
	locked = TRUE
	playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
	visible_message(span_warning("[src]'s magical wards crackle back to life!"))

	for(var/mob/living/carbon/human/M in GLOB.player_list)
		if(M.job in list("Academy Archmage", "Academy Mage", "Academy Apprentice"))
			to_chat(M, span_green("The wards on the confiscation cabinet at [get_area(src)] have reactivated."))

//==============================================
//	Doors
//==============================================

/obj/structure/mineral_door/wood/fancywood/academy
	name = "enchanted door"
	desc = "A heavy wooden door inscribed with runes of warding. Flames dance within the etchings, promising a fiery fate to would-be intruders."
	icon = 'icons/roguetown/misc/doors.dmi'
	icon_state = "fancy_wood"
	resistance_flags = ACID_PROOF | FIRE_PROOF
	var/disabled_by_nullmagic = FALSE
	var/reactivate_time = 30 SECONDS
	keylock = TRUE
	locked = TRUE
	lockid = "mage"

/obj/structure/mineral_door/wood/fancywood/academy/Initialize()
	. = ..()
	Close()
	locked = TRUE

/obj/structure/mineral_door/wood/fancywood/academy/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.job in list("Academy Archmage", "Academy Mage", "Academy Apprentice"))
			. += span_notice("The door's wards are [disabled_by_nullmagic ? "temporarily disabled" : "active"].")

/obj/structure/mineral_door/wood/fancywood/academy/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/clothing/ring/active/nomag))
		var/obj/item/clothing/ring/active/nomag/ring = I
		if(!ring.active || disabled_by_nullmagic)
			return ..()

		disabled_by_nullmagic = TRUE
		locked = FALSE
		playsound(src, 'sound/magic/antimagic.ogg', 50, TRUE)
		visible_message(span_warning("[src]'s wards flicker and fade as they're disrupted by anti-magic!"))

		for(var/mob/living/carbon/human/M in GLOB.player_list)
			if(M.job in list("Academy Archmage", "Academy Mage", "Academy Apprentice"))
				to_chat(M, span_redtext("The wards on a door at [get_area(src)] have been nullified!"))

		addtimer(CALLBACK(src, PROC_REF(reactivate_wards)), reactivate_time)
		return TRUE

	if(istype(I, /obj/item/storage/keyring))
		var/obj/item/storage/keyring/K = I
		for(var/obj/item/roguekey/key in K.contents)
			if(key.lockhash == lockhash)
				locked = !locked
				playsound(src, locked ? locksound : unlocksound, 50, TRUE)
				to_chat(user, span_notice("You [locked ? "lock" : "unlock"] [src] with [I]."))
				return TRUE
		playsound(src, rattlesound, 50, TRUE)
		to_chat(user, span_warning("[I] doesn't have the right key!"))
		return TRUE

	if(!disabled_by_nullmagic && (istype(I, /obj/item/lockpick) || istype(I, /obj/item/crowbar) || I.force > 0))
		user.adjust_fire_stacks(5)
		user.IgniteMob()
		playsound(src, 'sound/magic/fireball.ogg', 100, TRUE)
		visible_message(span_danger("[src]'s wards flare with violent energy as [user] attempts to breach them!"))

		for(var/mob/living/carbon/human/M in GLOB.player_list)
			if(M.job in list("Academy Archmage", "Academy Mage", "Academy Apprentice"))
				to_chat(M, span_redtext("The wards on a door at [get_area(src)] have incinerated an intruder!"))
		return TRUE

	return ..()

/obj/structure/mineral_door/wood/fancywood/academy/TryToSwitchState(atom/user)
	return !locked && ..()

/obj/structure/mineral_door/wood/fancywood/academy/Open()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(autoclose)), 10 SECONDS)

/obj/structure/mineral_door/wood/fancywood/academy/proc/autoclose()
	Close()
	locked = TRUE

/obj/structure/mineral_door/wood/fancywood/academy/proc/reactivate_wards()
	if(!disabled_by_nullmagic)
		return
	disabled_by_nullmagic = FALSE
	locked = TRUE
	playsound(src, 'sound/magic/churn.ogg', 50, TRUE)
	visible_message(span_warning("[src]'s magical wards crackle back to life!"))

	for(var/mob/living/carbon/human/M in GLOB.player_list)
		if(M.job in list("Academy Archmage", "Academy Mage", "Academy Apprentice"))
			to_chat(M, span_green("The wards on a door at [get_area(src)] have reactivated."))

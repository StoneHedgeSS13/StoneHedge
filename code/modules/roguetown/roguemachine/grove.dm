//==============================================
// waygate amulet
//==============================================

/obj/item/clothing/neck/roguetown/psicross/dendor/grove
	name = "greater amulet of nature"
	desc = "An enhanced amulet of nature that allows its wielder to create mystical pathways through the trees. Click any tree while holding this amulet to create druidic waygates to various locations. You can also activate it in your hand to send a distress signal."
	icon_state = "dendor"
	var/channeling = FALSE
	var/last_used = 0
	var/cooldown_time = 300
	var/last_distress = 0
	var/distress_cooldown = 300

/obj/item/clothing/neck/roguetown/psicross/dendor/grove/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_UNPICKPOCKETABLE, ROUNDSTART_TRAIT)

/obj/item/clothing/neck/roguetown/psicross/dendor/grove/afterattack(atom/target, mob/user, proximity_flag)
	. = ..()
	if(!proximity_flag)
		return

	var/is_valid_target = FALSE
	if(istype(target, /obj/structure/flora/roguetree) || istype(target, /obj/structure/flora/wildtree) || istype(target, /obj/structure/flora/newtree))
		is_valid_target = TRUE
	else
		to_chat(user, "<span class='warning'>You must target a valid tree to create a waygate.</span>")
		return

	if(!is_valid_target)
		return

	if(world.time < last_used + cooldown_time)
		var/remaining_time = round((last_used + cooldown_time - world.time)/10)
		to_chat(user, "<span class='warning'>The amulet's power hasn't yet recovered. [remaining_time] seconds remaining.</span>")
		return

	if(channeling)
		to_chat(user, "<span class='warning'>You are already channeling a waygate!</span>")
		return

	var/list/destinations = list()
	var/list/sorted_names = list()
	for(var/obj/effect/landmark/waygate_destination/L in GLOB.landmarks_list)
		destinations[L.name] = L
		sorted_names += L.name
	sorted_names = sortList(sorted_names)

	var/destination_name = input(user, "Where would you like to create a waygate to?", "Waygate Destination") as null|anything in sorted_names
	if(!destination_name)
		return

	channeling = TRUE
	user.visible_message("<span class='green'>[user] begins channeling energy through their amulet into the [target]...</span>", \
						"<span class='green'>You begin channeling the power of nature to create a waygate to [destination_name]...</span>")

	if(do_after(user, 60, target = target))
		last_used = world.time
		var/obj/effect/portal/waygate/P = new(get_turf(target))
		P.name = "nature's waygate"
		P.desc = "A mystical portal formed through the power of nature, leading to [destination_name]."
		P.icon = 'icons/effects/effects.dmi'
		P.icon_state = "anom"
		P.color = "#45b726"
		P.linked_destination = destinations[destination_name]

		var/old_density = target.density
		target.density = FALSE
		addtimer(CALLBACK(src, PROC_REF(restore_density), target, old_density), 10 SECONDS, TIMER_UNIQUE | TIMER_STOPPABLE)

		playsound(target, 'sound/misc/treefall.ogg', 50, TRUE)
		new /obj/effect/temp_visual/grove_portal_transit(get_turf(target))
		user.visible_message("<span class='green'>A mystical portal springs forth from the [target]!</span>", \
							"<span class='green'>You successfully create a waygate to [destination_name]!</span>")
	else
		to_chat(user, "<span class='warning'>Your channeling was interrupted!</span>")

	channeling = FALSE

/obj/item/clothing/neck/roguetown/psicross/dendor/grove/proc/restore_density(atom/target, old_density)
	if(target)
		target.density = old_density

/obj/effect/portal/waygate
	name = "nature's waygate"
	desc = "A mystical portal formed through the power of nature."
	var/obj/effect/landmark/waygate_destination/linked_destination
	var/turf/linked_turf
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/id

/obj/effect/portal/waygate/Initialize()
	. = ..()
	GLOB.portals += src
	QDEL_IN(src, 10 SECONDS)

/obj/effect/portal/waygate/Destroy()
	GLOB.portals -= src
	linked_destination = null
	linked_turf = null
	return ..()

/obj/effect/portal/waygate/Crossed(atom/movable/AM)
	if(!linked_destination && !linked_turf)
		return
	if(AM.anchored || !ismob(AM))
		return
	var/turf/T
	if(linked_destination)
		T = get_turf(linked_destination)
	else
		T = linked_turf
	if(!T)
		return

	AM.forceMove(T)

	if(ismob(AM))
		var/mob/M = AM
		var/atom/movable/pulled = M.pulling
		if(pulled && !pulled.anchored)
			pulled.forceMove(T)

	playsound(src, 'sound/misc/treefall.ogg', 50, TRUE)
	playsound(T, 'sound/misc/treefall.ogg', 50, TRUE)
	new /obj/effect/temp_visual/grove_portal_transit(get_turf(src))
	new /obj/effect/temp_visual/grove_portal_transit(T)
	for(var/mob/M in view(7, T))
		to_chat(M, "<span class='green'>[AM] emerges from a druidic waygate!</span>")

//distress signal code, made after the shrine which is why it looks a little wonky

/obj/item/clothing/neck/roguetown/psicross/dendor/grove/attack_self(mob/user)
	. = ..()
	if(world.time < last_distress + distress_cooldown)
		var/remaining_time = round((last_distress + distress_cooldown - world.time)/10)
		to_chat(user, "<span class='warning'>The amulet's distress signal hasn't yet recovered. [remaining_time] seconds remaining.</span>")
		return

	var/choice = alert(user, "Do you wish to send a distress signal to the Grove?", "Nature's Distress", "Yes", "No")
	if(choice != "Yes")
		return

	last_distress = world.time
	var/turf/alert_location = get_turf(user)
	var/area/A = get_area(user)
	var/message = "<span class='boldannounce'>GROVEMEMBER'S DISTRESS: [user.name] seeks assistance in [A.name]! (<a href='?src=[REF(src)];alert_response=1;caller=[user.name];x=[alert_location.x];y=[alert_location.y];z=[alert_location.z]'>Create Waygate</a>)</span>"

	for(var/mob/M in GLOB.player_list)
		if(M.mind && (M.mind.assigned_role in list("Great Druid", "Druid", "Hedge Warden", "Hedge Knight")))
			to_chat(M, message)
			SEND_SOUND(M, sound('sound/misc/treefall.ogg'))

	to_chat(user, "<span class='green'>You grasp the amulet tightly, sending ripples of natural energy outward...</span>")
	playsound(src, 'sound/misc/treefall.ogg', 50, TRUE)

	var/obj/effect/temp_visual/shrine_activation/effect = new(get_turf(src))
	effect.color = "#4ca64c"

/obj/item/clothing/neck/roguetown/psicross/dendor/grove/Topic(href, href_list)
	. = ..()
	if(.)
		return

	if(!href_list["alert_response"])
		return

	var/target_x = text2num(href_list["x"])
	var/target_y = text2num(href_list["y"])
	var/target_z = text2num(href_list["z"])
	var/turf/target_turf = locate(target_x, target_y, target_z)

	create_emergency_waygate(usr, target_turf, href_list["caller"])

//landmarks to add new waygates

/obj/effect/landmark/waygate_destination
	name = "waygate destination"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x2"
	invisibility = INVISIBILITY_ABSTRACT

/obj/effect/landmark/waygate_destination/Initialize(mapload)
	. = ..()
	GLOB.landmarks_list += src

/obj/effect/landmark/waygate_destination/advguild
	name = "Adventurer's Guild"

/obj/effect/landmark/waygate_destination/greattree
	name = "Great Tree"

/obj/effect/landmark/waygate_destination/hfort
	name = "Hedge Fortress"

/obj/effect/landmark/waygate_destination/hfortarm
	name = "Hedge Fortress Armory"

/obj/effect/landmark/waygate_destination/northgate
	name = "North Gate"

/obj/effect/landmark/waygate_destination/northeastgate
	name = "North-East Gate"

/obj/effect/landmark/waygate_destination/prison
	name = "Prison"

/obj/effect/landmark/waygate_destination/academy
	name = "Ravenloft Academy"

/obj/effect/landmark/waygate_destination/southgate
	name = "South Gate"

/obj/effect/landmark/waygate_destination/inn
	name = "Sylver Dragonne Inn"

/obj/effect/landmark/waygate_destination/sshrine
	name = "Sylvaran's Shrine"

//==============================================
// grove shrine
//==============================================
/obj/structure/grove_shrine
	name = "ancient grove shrine"
	desc = "A mystical stone shrine covered in druidic runes and overgrown with sacred vines. It seems to pulse with an ethereal energy. Used for summoning the Hedge Guard in times of emergency."
	icon = 'icons/roguetown/topadd/statue1.dmi'
	icon_state = "baldguy"
	anchored = TRUE
	density = TRUE
	var/cooldown_time = 300
	var/last_used = 0

/obj/structure/grove_shrine/Initialize()
	. = ..()
	add_overlay("vines")

/obj/structure/grove_shrine/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(world.time < last_used + cooldown_time)
		var/remaining_time = round((last_used + cooldown_time - world.time)/10)
		to_chat(user, "<span class='warning'>The shrine's energy hasn't yet recovered. [remaining_time] seconds remaining.</span>")
		return

	var/choice = alert(user, "Do you wish to summon the Hedge Guard?", "Grove Shrine", "Yes", "No")
	if(choice != "Yes")
		return

	if(world.time < last_used + cooldown_time)
		to_chat(user, "<span class='warning'>The shrine's energy hasn't yet recovered. Please wait a moment.</span>")
		return

	last_used = world.time

	var/area/A = get_area(user)
	var/message = "<span class='boldannounce'>GROVE SHRINE ALERT: [user.name] seeks assistance in [A.name]! (<a href='?src=[REF(src)];alert_response=1;caller=[user.name]'>Create Waygate</a>)</span>"

	for(var/mob/M in GLOB.player_list)
		if(M.mind && (M.mind.assigned_role in list("Great Druid", "Druid", "Hedge Warden", "Hedge Knight")))
			to_chat(M, message)
			SEND_SOUND(M, sound('sound/misc/treefall.ogg'))

	to_chat(user, "<span class='notice'>You place your hand on the shrine, and feel its ancient magic ripple outward...</span>")
	playsound(src, 'sound/misc/treefall.ogg', 50, TRUE)

	var/obj/effect/temp_visual/shrine_activation/effect = new(get_turf(src))
	effect.color = "#4ca64c"

/obj/structure/grove_shrine/Topic(href, href_list)
	. = ..()
	if(.)
		return

	if(!href_list["alert_response"])
		return

	create_emergency_waygate(usr, get_turf(src), href_list["caller"])

/proc/create_emergency_waygate(mob/living/responder, turf/destination_turf, caller_name)
	if(!responder?.mind || !(responder.mind.assigned_role in list("Great Druid", "Druid", "Hedge Warden", "Hedge Knight")))
		return FALSE

	if(!destination_turf)
		to_chat(responder, "<span class='warning'>Unable to locate the destination!</span>")
		return FALSE

	var/obj/structure/flora/target_tree = null
	for(var/obj/structure/flora/T in view(1, responder))
		if(istype(T, /obj/structure/flora/roguetree) || istype(T, /obj/structure/flora/wildtree) || istype(T, /obj/structure/flora/newtree))
			target_tree = T
			break

	if(!target_tree)
		to_chat(responder, "<span class='warning'>You need to be next to a tree to create a waygate!</span>")
		return FALSE

	responder.visible_message("<span class='green'>Ancient roots burst from the ground around [target_tree] as [responder] channels nature's call!</span>", \
							"<span class='green'>You begin channeling druidic energy to create a quick waygate to aid [caller_name]!</span>")

	if(do_after(responder, 100, target = target_tree))
		var/obj/effect/portal/waygate/P = new(get_turf(target_tree))
		P.name = "emergency waygate"
		P.desc = "A hastily formed portal of twisted roots and natural energy."
		P.icon = 'icons/effects/effects.dmi'
		P.icon_state = "anom"
		P.color = "#45b726"
		P.linked_turf = destination_turf

		var/old_density = target_tree.density
		target_tree.density = FALSE
		addtimer(CALLBACK(GLOBAL_PROC, /proc/restore_emergency_tree_density, target_tree, old_density), 10 SECONDS, TIMER_UNIQUE | TIMER_STOPPABLE)

		playsound(target_tree, 'sound/misc/treefall.ogg', 50, TRUE)
		new /obj/effect/temp_visual/grove_portal_transit(get_turf(target_tree))
		responder.visible_message("<span class='green'>A mystical portal springs forth from the twisted roots!</span>", \
								"<span class='green'>You successfully create a waygate!</span>")
		return TRUE
	else
		to_chat(responder, "<span class='warning'>Your druidic channeling was interrupted!</span>")
		return FALSE

/proc/restore_emergency_tree_density(atom/target, old_density)
	if(target)
		target.density = old_density

//==============================================
// speaking stone
//==============================================

/obj/structure/grove_speaker
	name = "ancient speaking stone"
	desc = "A massive, ancient stone circle adorned with glowing runes and wrapped in ethereal vines. The Great Druid uses this to make important announcements to the town."
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "basalt"
	anchored = TRUE
	density = TRUE
	var/cooldown_time = 600
	var/last_used = 0

/obj/structure/grove_speaker/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(!user.mind || user.mind.assigned_role != "Great Druid")
		to_chat(user, "<span class='warning'>The ancient stone only responds to the Great Druid's touch.</span>")
		return

	if(world.time < last_used + cooldown_time)
		var/remaining_time = round((last_used + cooldown_time - world.time)/10)
		to_chat(user, "<span class='warning'>The speaking stone's energy hasn't yet recovered. [remaining_time] seconds remaining.</span>")
		return

	var/message = stripped_input(user, "What message do you wish to convey to the town?", "Druidic Announcement", "")
	if(!message)
		return

	last_used = world.time

	priority_announce("[message]", "Voice of the Great Druid", 'sound/misc/notice.ogg')

	playsound(src, 'sound/misc/notice.ogg', 100, TRUE)
	var/obj/effect/temp_visual/shrine_activation/effect = new(get_turf(src))
	effect.color = "#45b726"

	to_chat(user, "<span class='notice'>Your words echo through the ancient stone, carrying to all corners of the Town...</span>")

/obj/effect/temp_visual/shrine_activation
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield-flash"
	duration = 10

/obj/effect/temp_visual/grove_portal_transit
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield-flash"
	duration = 15
	color = "#45b726"


//==============================================
// grove marking totem
//==============================================

/obj/structure/grove_wanted
	name = "druidic marking totem"
	desc = "A tall wooden totem pole covered in druidic runes and wrapped in sacred vines. The Great Druid and Druids use this to mark those who have wronged nature as criminals."
	icon = 'icons/roguetown/misc/tallstructure.dmi'
	icon_state = "psycrosscrafted"
	anchored = TRUE
	density = TRUE
	var/list/marked_individuals = list()
	var/list/roundstart_marks = list()

/obj/structure/grove_wanted/Initialize()
	. = ..()
	add_overlay("vines")
	check_for_marked_status()
	START_PROCESSING(SSobj, src)

/obj/structure/grove_wanted/process()
	check_for_marked_status()

/obj/structure/grove_wanted/proc/check_for_marked_status()
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.has_status_effect(/datum/status_effect/grove_outlaw) && !marked_individuals[H.real_name] && !roundstart_marks[H.real_name])
			var/datum/status_effect/grove_outlaw/G = H.has_status_effect(/datum/status_effect/grove_outlaw)
			roundstart_marks[H.real_name] = G.crime || "Crimes Against Nature"

/obj/structure/grove_wanted/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	if(!(H.job in list("Great Druid", "Druid")))
		to_chat(user, span_warning("The totem only responds to Druids attuned to the Grove's magic."))
		return

	var/choice = alert(user, "What would you like to do?", "Grove's Judgment", "Mark Individual", "Remove Mark")

	switch(choice)
		if("Mark Individual")
			var/mark_target = stripped_input(user, "Enter the name of the individual:", "Mark Individual")
			if(!mark_target)
				return

			if(marked_individuals[mark_target] || roundstart_marks[mark_target])
				to_chat(user, span_warning("[mark_target] is already marked by the Grove!"))
				return

			var/reason = stripped_input(user, "Enter the reason for marking [mark_target]:", "Reason")
			if(!reason)
				return

			marked_individuals[mark_target] = reason

			log_admin("[key_name(user)] has marked [mark_target] using the grove marking totem. Reason: [reason]")
			message_admins("[key_name_admin(user)] has marked [mark_target] using the grove marking totem. Reason: [reason]")

			priority_announce("By decree of the Grove, [mark_target] has been marked for [reason]. They are a wanted criminal and all who show quarter to them shall face nature's fury.", "Breuddwyd Grove", 'sound/misc/notice.ogg')

			for(var/mob/living/carbon/human/M in GLOB.player_list)
				if(M.job in list("Great Druid", "Druid", "Hedge Warden", "Hedge Knight"))
					to_chat(M, span_green("<b>Grove Judgment Alert:</b> [mark_target] has been marked for [reason] by [user.real_name]."))
					playsound(M, 'sound/misc/treefall.ogg', 50, TRUE)

			for(var/mob/living/carbon/human/C in GLOB.player_list)
				if(C.real_name == mark_target)
					C.apply_status_effect(/datum/status_effect/grove_outlaw, reason)
					playsound(C, 'sound/misc/treefall.ogg', 50, TRUE)

		if("Remove Mark")
			var/list/all_marked = marked_individuals.Copy()
			all_marked += roundstart_marks

			if(!length(all_marked))
				to_chat(user, span_notice("There are currently no individuals marked by the Grove."))
				return

			var/mark_target = input(user, "Select individual to unmark:", "Remove Mark") as null|anything in all_marked
			if(!mark_target)
				return

			var/reason = all_marked[mark_target]
			marked_individuals -= mark_target
			roundstart_marks -= mark_target

			log_admin("[key_name(user)] has removed the mark from [mark_target] using the grove marking totem. They were previously marked for: [reason]")
			message_admins("[key_name_admin(user)] has removed the mark from [mark_target] using the grove marking totem. They were previously marked for: [reason]")

			priority_announce("[mark_target] has been pardoned for their crimes by the Grove and no longer suffers nature's wrath.", "Breuddwyd Grove", 'sound/misc/notice.ogg')

			for(var/mob/living/carbon/human/M in GLOB.player_list)
				if(M.job in list("Great Druid", "Druid", "Hedge Warden", "Hedge Knight"))
					to_chat(M, span_green("<b>Grove Judgment Alert:</b> [mark_target] has been pardoned by [user.real_name]."))
					playsound(M, 'sound/misc/treefall.ogg', 50, TRUE)

			for(var/mob/living/carbon/human/C in GLOB.player_list)
				if(C.real_name == mark_target)
					C.remove_status_effect(/datum/status_effect/grove_outlaw)
					playsound(C, 'sound/misc/treefall.ogg', 50, TRUE)

/obj/structure/grove_wanted/examine(mob/user)
	. = ..()
	var/list/all_marked = marked_individuals.Copy()
	all_marked += roundstart_marks

	if(!length(all_marked))
		. += span_notice("There are currently no individuals marked by the Grove.")
		return

	. += span_notice("The following individuals are marked by the Grove:")
	for(var/marked in all_marked)
		. += span_warning("- [marked]: [all_marked[marked]]")

		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(H.real_name == marked)
				user.visible_message(span_warning("[user] bears the mark of nature's judgment: [all_marked[marked]]"), \
								span_warning("You bear the mark of nature's judgment: [all_marked[marked]]"))

/obj/structure/grove_wanted/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/datum/status_effect/grove_outlaw
	id = "grove_outlaw"
	duration = -1
	alert_type = /atom/movable/screen/alert/status_effect/grove_outlaw
	var/crime

/atom/movable/screen/alert/status_effect/grove_outlaw
	name = "Nature's Judgment"
	desc = "You have been marked as an enemy of nature and the town."
	icon_state = "his_grace"

/datum/status_effect/grove_outlaw/on_creation(mob/living/new_owner, crime_reason)
	. = ..()
	if(.)
		crime = crime_reason

/datum/status_effect/grove_outlaw/on_apply()
	ADD_TRAIT(owner, TRAIT_GROVE_MARKED, "grove_mark")
	to_chat(owner, span_warning("You feel nature's judgment fall upon you for your crimes: [crime]"))
	return TRUE

/datum/status_effect/grove_outlaw/on_remove()
	REMOVE_TRAIT(owner, TRAIT_GROVE_MARKED, "grove_mark")
	to_chat(owner, span_green("You feel nature's judgment lift from you."))
	playsound(owner, 'sound/misc/treefall.ogg', 50, TRUE)
	return ..()

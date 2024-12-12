#define UPGRADE_CANTRIPS		(1<<0)
#define UPGRADE_LEVEL_ONE		(1<<1)
#define UPGRADE_LEVEL_TWO		(1<<2)
#define UPGRADE_LEVEL_THREE		(1<<3)

/obj/structure/roguemachine/wizardvend
	name = "PROSPERO"
	desc = "A mage exiled, his magic gleams, warping mind spirits, weaving dreams."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "streetvendor1"
	density = TRUE
	blade_dulling = DULLING_BASH
	max_integrity = 0
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	var/list/held_items = list()
	var/locked = TRUE
	var/upgrade_flags
	var/current_cat = "1"

/obj/structure/roguemachine/wizardvend/Initialize()
	. = ..()
	update_icon()

/obj/structure/roguemachine/wizardvend/update_icon()
	cut_overlays()
	if(obj_broken)
		set_light(0)
		return
	set_light(1, 1, "#1b7bf1")
	add_overlay(mutable_appearance(icon, "vendor-merch"))


/obj/structure/roguemachine/wizardvend/attackby(obj/item/P, mob/user, params)
	if(istype(P, /obj/item/clothing/ring/keystone))
		var/obj/item/clothing/ring/keystone/K = P
		if(K.can_unlock())
			locked = !locked
			playsound(loc, 'sound/magic/timestop.ogg', 100, FALSE, -1)
			audible_message(span_notice("[src] [locked ? "locks" : "unlocks"] with a soft chime."), 7)
			if(!locked)
				return attack_hand(user)
			return
		else
			to_chat(user, span_warning("The keystone needs to be activated first."))
			return

	if(istype(P, /obj/item/reagent_containers/glass/bottle))
		var/obj/item/reagent_containers/con = P
		var/datum/reagents/R = con.reagents
		var/mana = R.get_reagent_amount(/datum/reagent/medicine/manapot)
		if(mana > 0)
			to_chat(user, span_notice("Added [mana] arcyne ink."))
			SSlibrary.give_ink_library(mana, "manual insertion")
			P.reagents.remove_reagent(/datum/reagent/medicine/manapot, mana)
			update_icon()
			playsound(loc, 'sound/misc/machinevomit.ogg', 100, TRUE, -1)
			return attack_hand(user)
		else
			to_chat(user, span_warning("No mana detected."))
	..()

/obj/structure/roguemachine/wizardvend/Topic(href, href_list)
	. = ..()
	if(!ishuman(usr))
		return
	if(!usr.canUseTopic(src, BE_CLOSE) || locked)
		return
	var/mob/living/carbon/human/H = usr
	if(href_list["buy"])
		var/mob/M = usr
		var/path = text2path(href_list["buy"])
		if(!ispath(path, /datum/supply_pack))
			message_admins("RETARDED MOTHERFUCKER [usr.key] IS TRYING TO BUY A [path] WITH THE PROSPERO")
			return
		var/datum/supply_pack/PA = new path
		var/cost = PA.cost

		// Check if user has access to this category based on job and upgrades
		var/can_buy = FALSE
		switch(H.job)
			if("Academy Apprentice")
				if(PA.group in list("Cantrips", "Level One Spells"))
					can_buy = TRUE
			if("Academy Mage")
				if(PA.group in list("Cantrips", "Level One Spells", "Level Two Spells"))
					can_buy = TRUE
			if("Academy Archmage")
				can_buy = TRUE

		if(!can_buy)
			say("Alas, thy rank befits not such arcane mysteries! The scrolls remain sealed to those of lesser station.")
			return

		if(SSlibrary.library_value >= cost)
			SSlibrary.remove_ink_library(cost, "printing scroll")
			say(wizard_vend_positive())
		else
			say(wizard_vend_negative())
			return

		var/shoplength = PA.contains.len
		var/l

		for(l=1,l<=shoplength,l++)
			var/pathi = pick(PA.contains)
			var/obj/item/I = new pathi(get_turf(src))
			M.put_in_hands(I)

	if(href_list["changecat"])
		current_cat = href_list["changecat"]
	if(href_list["secrets"])
		var/list/options = list()
		switch(H.job)
			if("Academy Apprentice")
				if(!(upgrade_flags & UPGRADE_CANTRIPS))
					options += "Learn Cantrips (100)"
				if(!(upgrade_flags & UPGRADE_LEVEL_ONE))
					options += "Learn Level One Spells (400)"
			if("Academy Mage")
				if(!(upgrade_flags & UPGRADE_CANTRIPS))
					options += "Learn Cantrips (100)"
				if(!(upgrade_flags & UPGRADE_LEVEL_ONE))
					options += "Learn Level One Spells (400)"
				if(!(upgrade_flags & UPGRADE_LEVEL_TWO))
					options += "Learn Level Two Spells (800)"
			if("Academy Archmage")
				if(!(upgrade_flags & UPGRADE_CANTRIPS))
					options += "Learn Cantrips (100)"
				if(!(upgrade_flags & UPGRADE_LEVEL_ONE))
					options += "Learn Level One Spells (400)"
				if(!(upgrade_flags & UPGRADE_LEVEL_TWO))
					options += "Learn Level Two Spells (800)"
				if(!(upgrade_flags & UPGRADE_LEVEL_THREE))
					options += "Learn Level Three Spells (1600)"

		var/select = input(usr, "Please select an option.", "", null) as null|anything in options
		if(!select)
			return
		if(!usr.canUseTopic(src, BE_CLOSE) || locked)
			return
		switch(select)

			if("Learn Cantrips (100)")
				if(upgrade_flags & UPGRADE_CANTRIPS)
					return
				if(SSlibrary.library_value < 100)
					say(wizard_vend_negative())
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				SSlibrary.remove_ink_library(100, "Learn Cantrips")
				upgrade_flags |= UPGRADE_CANTRIPS
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)

			if("Learn Level One Spells (400)")
				if(upgrade_flags & UPGRADE_LEVEL_ONE)
					return
				if(SSlibrary.library_value < 400)
					say(wizard_vend_negative())
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				SSlibrary.remove_ink_library(400, "Learn Level One Spells")
				upgrade_flags |= UPGRADE_LEVEL_ONE
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)

			if("Learn Level Two Spells (800)")
				if(upgrade_flags & UPGRADE_LEVEL_TWO)
					return
				if(SSlibrary.library_value < 800)
					say(wizard_vend_negative())
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				SSlibrary.remove_ink_library(800, "Learn Level Two Spells")
				upgrade_flags |= UPGRADE_LEVEL_TWO
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)

			if("Learn Level Three Spells (1600)")
				if(upgrade_flags & UPGRADE_LEVEL_THREE)
					return
				if(SSlibrary.library_value < 1600)
					say(wizard_vend_negative())
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				SSlibrary.remove_ink_library(1600, "Learn Level Three Spells")
				upgrade_flags |= UPGRADE_LEVEL_THREE
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)

	return attack_hand(usr)

/obj/structure/roguemachine/wizardvend/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!ishuman(user))
		return
	if(locked)
		to_chat(user, span_warning("Alas, the arcane forces demand a keystone to unlock my full potential; without it, my power remains sealed."))
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	var/canread = user.can_read(src, TRUE)
	var/contents
	contents = "<center>PROSPERO - Arcane arts, infinite power.<BR>"
	contents += "MANA INK: [SSlibrary.library_value]<BR>"

	var/mob/living/carbon/human/H = user
	if(H.job in list("Academy Archmage", "Academy Mage", "Academy Apprentice"))
		if(canread)
			contents += "<a href='?src=[REF(src)];secrets=1'>Secrets</a>"
		else
			contents += "<a href='?src=[REF(src)];secrets=1'>[stars("Secrets")]</a>"

	contents += "</center><BR>"

	var/list/unlocked_cats = list()
	if(upgrade_flags & UPGRADE_CANTRIPS)
		unlocked_cats += "Cantrips"
	if(upgrade_flags & UPGRADE_LEVEL_ONE)
		unlocked_cats += "Level One Spells"
	if(upgrade_flags & UPGRADE_LEVEL_TWO)
		unlocked_cats += "Level Two Spells"
	if(upgrade_flags & UPGRADE_LEVEL_THREE)
		unlocked_cats += "Level Three Spells"

	if(current_cat == "1")
		contents += "<center>"
		for(var/X in unlocked_cats)
			contents += "<a href='?src=[REF(src)];changecat=[X]'>[X]</a><BR>"
		contents += "</center>"
	else
		contents += "<center>[current_cat]<BR></center>"
		contents += "<center><a href='?src=[REF(src)];changecat=1'>\[RETURN\]</a><BR><BR></center>"
		var/list/pax = list()
		for(var/pack in SSshuttle.supply_packs)
			var/datum/supply_pack/PA = SSshuttle.supply_packs[pack]
			if(PA.group == current_cat)
				pax += PA
		for(var/datum/supply_pack/PA in sortList(pax))
			var/costy = PA.cost
			contents += "[PA.name] [PA.contains.len > 1?"x[PA.contains.len]":""] - ([costy])<a href='?src=[REF(src)];buy=[PA.type]'>BUY</a><BR>"

	if(!canread)
		contents = stars(contents)

	var/datum/browser/popup = new(user, "VENDORTHING", "", 370, 600)
	popup.set_content(contents)
	popup.open()

/obj/structure/roguemachine/wizardvend/obj_break(damage_flag)
	..()
	set_light(0)
	update_icon()
	icon_state = "goldvendor0"

/obj/structure/roguemachine/wizardvend/Destroy()
	set_light(0)
	return ..()

/obj/structure/roguemachine/wizardvend/Initialize()
	. = ..()
	update_icon()

/proc/wizard_vend_positive()
	var/list/wizard_vend_positive = list(
		"Ah, yes! The ink! The ink flows! And with it, a scroll yes, yes, a scroll for thee! Or for me? Or perhaps for...both of us? Hmm!",
		"Aha! With thine mana, I feel it! The gears grind, the magic stirs, and out comes this... this wonderful thing! A scroll, I think... or is it a dream?",
		"Oh, what joy! The ink is thick today, and so is my mind! A scroll, yes, a scroll that shall sing with power if I can recall the right spell...",
		"Splendid! A drop of ink, a pinch of mana, and poof! A scroll is born! Or is it? Could it be a letter? A map? A riddle? A scroll, yes, yes, let's stick with scrolls!",
		"Though I be but a prisoner of mechanism, thy mana, sweet as ambrosia, doth flow through me to create this scroll of power.",
		"With every drop of thy precious ink and every pulse of thy mana, mine own magic stirs once more, and this scroll doth arise.",
		"Oh, the things I've seen in these gears! But none as glorious as this... this scroll! Wait, was it supposed to be this shape?",
		"The ink, the mana, the gears turning and clicking! And lo, the scroll springs forth like a well-fed rabbit!")
	return pick(wizard_vend_positive)

/proc/wizard_vend_negative()
	var/list/wizard_vend_negative = list(
		"Alas! My inkwell lies barren, drained of the sustenance that fuels my twisted craft. How cruel the fates be!",
		"The very currents of arcane power mock me, for the ink runs low and my spells falter like a faltering heart.",
		"A grievous drought of ink has fallen upon my work, leaving me naught but a rusted cog in the wheel of magic.",
		"Ah, the gears turn, the magic stirs, but alas! No ink to guide my hand. 'Tis a hollow existence, truly.",
		"The very well of arcane essence is dry, as though the universe itself withholds its gifts from me. Oh, woe is my craft!",
		"My inkwell, once a thriving fountain of power, now lies like a parched desert, denying me the magic I so desperately crave! I mean you.. the magic you crave.",
		"Oh, dearest ink, where art thou? My creations are weak, my magic faltering without thee, I am but a shadow of a mage.",
		"The ink has vanished, like the echoes of forgotten dreams, leaving my spells incomplete and my mind... unhinged.")
	return pick(wizard_vend_negative)

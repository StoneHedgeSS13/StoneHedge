

/obj/item/clothing/ring
	name = "ring"
	desc = ""
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = ""
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/neck/roguetown/psicross/ringP  /////////////////////// cast focus ring for acolytes and shit.
	name = "psi ring"
	desc = "a blessed psi ring, for the religious type"
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = "castring"
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/ring/silver
	name = "silver ring"
	icon_state = "ring_s"
	sellprice = 33

/obj/item/clothing/ring/gold
	name = "gold ring"
	icon_state = "ring_g"
	sellprice = 45


/obj/item/flashlight/flare/torch/lantern/ring
	name = "alchemist ring"
	icon_state = "lanternR"
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	desc = "flick of the thumb portable flame"
	light_range = 4 // standard torch range
	on = FALSE
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_HIP
	force = 5
	on_damage = 5
	produce_heat = 1500
	heat = 1000
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing
	fuel = 9999
	sellprice = 30

/obj/item/flashlight/flare/torch/lantern/ring/MiddleClick(mob/living/user, params)
	on = !on
	to_chat(user, span_notice("With a flick of the thumb, you [on ? "strike a" : "snuff the"] flame."))
	..()

/obj/item/clothing/ring/active
	var/active = FALSE
	desc = "Unfortunately, like most magic rings, it must be used sparingly. (Right-click me to activate)"
	var/cooldowny
	var/cdtime
	var/activetime
	var/activate_sound

/obj/item/clothing/ring/active/attack_right(mob/user)
	if(loc != user)
		return
	if(cooldowny)
		if(world.time < cooldowny + cdtime)
			to_chat(user, span_warning("Nothing happens."))
			return
	user.visible_message(span_warning("[user] twists the [src]!"))
	if(activate_sound)
		playsound(user, activate_sound, 100, FALSE, -1)
	cooldowny = world.time
	addtimer(CALLBACK(src, PROC_REF(demagicify)), activetime)
	active = TRUE
	update_icon()
	activate(user)

/obj/item/clothing/ring/active/proc/activate(mob/user)
	user.update_inv_wear_id()

/obj/item/clothing/ring/active/proc/demagicify()
	active = FALSE
	update_icon()
	if(ismob(loc))
		var/mob/user = loc
		user.visible_message(span_warning("The ring settles down."))
		user.update_inv_wear_id()


/obj/item/clothing/ring/active/nomag
	name = "ring of null magic"
	icon_state = "ruby"
	activate_sound = 'sound/magic/antimagic.ogg'
	cdtime = 10 MINUTES
	activetime = 30 SECONDS
	sellprice = 100

/obj/item/clothing/ring/active/nomag/update_icon()
	..()
	if(active)
		icon_state = "rubyactive"
	else
		icon_state = "ruby"

/obj/item/clothing/ring/active/nomag/activate(mob/user)
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, FALSE, FALSE, ITEM_SLOT_RING, INFINITY, FALSE)

/obj/item/clothing/ring/active/nomag/demagicify()
	. = ..()
	var/datum/component/magcom = GetComponent(/datum/component/anti_magic)
	if(magcom)
		magcom.RemoveComponent()

//gold rings
/obj/item/clothing/ring/emerald
    name = "emerald ring"
    icon_state = "g_ring_emerald"
    sellprice = 195

/obj/item/clothing/ring/ruby
    name = "ruby ring"
    icon_state = "g_ring_ruby"
    sellprice = 255

/obj/item/clothing/ring/topaz
    name = "topaz ring"
    icon_state = "g_ring_topaz"
    sellprice = 120

/obj/item/clothing/ring/quartz
    name = "quartz ring"
    icon_state = "g_ring_quartz"
    sellprice = 245

/obj/item/clothing/ring/sapphire
    name = "sapphire ring"
    icon_state = "g_ring_sapphire"
    sellprice = 200

/obj/item/clothing/ring/diamond
    name = "diamond ring"
    icon_state = "g_ring_diamond"
    sellprice = 270

/obj/item/clothing/ring/psydon
	name = "psydon ring"
	icon_state = "g_ring_psydon"
	sellprice = 250

//steel rings
/obj/item/clothing/ring/emeralds
    name = "emerald ring"
    icon_state = "s_ring_emerald"
    sellprice = 80

/obj/item/clothing/ring/rubys
    name = "ruby ring"
    icon_state = "s_ring_ruby"
    sellprice = 130

/obj/item/clothing/ring/topazs
    name = "topaz ring"
    icon_state = "s_ring_topaz"
    sellprice = 45

/obj/item/clothing/ring/quartzs
    name = "quartz ring"
    icon_state = "s_ring_quartz"
    sellprice = 110

/obj/item/clothing/ring/sapphires
    name = "sapphire ring"
    icon_state = "s_ring_sapphire"
    sellprice = 95

/obj/item/clothing/ring/diamonds
    name = "diamond ring"
    icon_state = "s_ring_diamond"
    sellprice = 140

/obj/item/clothing/ring/dragon_ring
	name = "dragon ring"
	icon_state = "dragonring"
	sellprice = 666
	attunement_cost = 5
	var/active_item
	infusable = FALSE

/obj/item/clothing/ring/dragon_ring/equipped(mob/living/user)
	. = ..()
	if(active_item)
		return
	else
		active_item = TRUE
		to_chat(user, span_notice("Here be dragons."))
		user.change_stat("strength", 2)
		user.change_stat("constitution", 2)
		user.change_stat("endurance", 2)
		user.attunement_points_used += attunement_cost
		user.check_attunement_points()
		return

/obj/item/clothing/ring/dragon_ring/dropped(mob/living/user)
	..()
	if(active_item)
		to_chat(user, span_notice("Gone is thy hoard."))
		user.change_stat("strength", -2)
		user.change_stat("constitution", -2)
		user.change_stat("endurance", -2)
		user.attunement_points_used -= attunement_cost
		user.check_attunement_points()
		active_item = FALSE
		return

//academy keystones
/obj/item/clothing/ring/keystone
	name = "academy keystone"
	desc = "A silver-banded sapphire keystone used to allow passage through certain magical wards. This one is issued to Mages of the Ravenloft Academy. It must be bound to a mage before it can be activated."
	icon_state = "s_ring_sapphire"
	var/active = FALSE
	var/bound = FALSE
	var/mob/living/bound_user = null
	var/active_timer = 30 SECONDS

/obj/item/clothing/ring/keystone/examine(mob/user)
	. = ..()
	if(bound)
		. += span_smallnotice("This keystone is bound to [bound_user].")
	else
		. += span_smallnotice("This keystone needs to be bound to a mage. (Use in hand to bind)")

/obj/item/clothing/ring/keystone/attack_self(mob/user)
	if(!bound && ishuman(user))
		var/mob/living/carbon/human/H = user
		for(var/obj/structure/academy_binder/binder in world)
			if(binder.revoked_users[H.real_name])
				to_chat(user, span_danger("The keystone violently rejects your attempt to bind it - your Academy privileges have been revoked!"))
				if(isliving(user))
					var/mob/living/L = user
					L.electrocute_act(15, src)
				playsound(src, 'sound/magic/antimagic.ogg', 50, TRUE)
				return
		bound_user = user
		bound = TRUE
		to_chat(user, span_green("You feel the keystone attune to your magical signature."))
		playsound(src, 'sound/magic/charged.ogg', 50, TRUE)
		return
	return ..()

/obj/item/clothing/ring/keystone/attack_right(mob/user)
	if(loc != user)
		return

	if(!bound)
		to_chat(user, span_warning("The keystone must be bound to a mage first!"))
		return

	if(user != bound_user)
		user.visible_message(span_danger("The keystone violently rejects [user]!"))
		if(isliving(user))
			var/mob/living/L = user
			if(L.electrocute_act(15, src))
				user.dropItemToGround(src)
				playsound(src, 'sound/magic/antimagic.ogg', 50, TRUE)
		return

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		for(var/obj/structure/academy_binder/binder in world)
			if(binder.revoked_users[H.real_name])
				to_chat(user, span_danger("The keystone refuses to activate - your Academy privileges have been revoked!"))
				if(isliving(user))
					var/mob/living/L = user
					L.electrocute_act(15, src)
				playsound(src, 'sound/magic/antimagic.ogg', 50, TRUE)
				return

	active = !active
	user.visible_message(span_warning("[user] twists the [src], causing it to [active ? "glow" : "dim"]!"))
	playsound(src, 'sound/magic/timestop.ogg', 50, TRUE)
	update_icon()

	if(active)
		addtimer(CALLBACK(src, PROC_REF(deactivate), user), active_timer)

/obj/item/clothing/ring/keystone/proc/deactivate(mob/user)
	if(!active)
		return
	active = FALSE
	update_icon()
	if(ismob(user))
		to_chat(user, span_warning("The keystone's power fades, requiring reactivation."))
		playsound(user, 'sound/magic/timestop.ogg', 50, TRUE)

/obj/item/clothing/ring/keystone/update_icon()
	..()
	icon_state = active ? "acadactive" : "s_ring_sapphire"

/obj/item/clothing/ring/keystone/proc/can_unlock()
	return active

/obj/item/clothing/ring/keystone/proc/update_specialization_name(specialization)
	name = "academy [lowertext(specialization)]'s keystone"
	desc = "A silver-banded sapphire keystone used to allow passage through certain magical wards. This one is issued to [specialization]'s of the Ravenloft Academy. It must be bound to a mage before it can be activated."

/obj/item/clothing/ring/keystone/archkey
	name = "academy arch-keystone"
	desc = "A gold-banded sapphire keystone used to activate, deactivate, and allow passage through certain magical wards. This one is issued to Archmages of the Ravenloft Academy. It must be bound to a mage before it can be activated."
	icon_state = "g_ring_sapphire"

/obj/item/clothing/ring/keystone/archkey/update_icon()
	..()
	icon_state = active ? "acadarchactive" : "g_ring_sapphire"

/obj/item/clothing/ring/keystone/archkey/update_specialization_name(specialization)
	name = "academy [lowertext(specialization)]'s arch-keystone"
	desc = "A gold-banded sapphire keystone used to activate, deactivate, and allow passage through certain magical wards. This one is issued to [specialization]'s of the Ravenloft Academy. It must be bound to a mage before it can be activated."



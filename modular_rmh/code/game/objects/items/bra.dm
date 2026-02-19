/obj/item/clothing/bra
	name = "bra"
	desc = "An absolute necessity, for your chest."
	icon = 'modular_rmh/icons/clothing/bra.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/bra.dmi'
	icon_state = "bra"
	item_state = "bra"
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	break_sound = 'sound/foley/cloth_rip.ogg'
	blade_dulling = DULLING_CUT
	max_integrity = 200
	integrity_failure = 0.1
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	boob_sized = FALSE
	sewrepair = TRUE
	salvage_result = /obj/item/natural/cloth
	slot_flags = ITEM_SLOT_UNDER_TOP
	flags_inv = HIDEBOOB

/obj/item/clothing/bra/apply_components()
	. = ..()
	AddComponent(/datum/component/storage/concrete/bra)

/obj/item/clothing/bra/attack(mob/M, mob/user, def_zone)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.bra)
			if(!get_location_accessible(H, BODY_ZONE_CHEST))
				return
			user.visible_message(span_notice("[user] tries to put [src] on [H]..."))
			if(do_after(user, 50, target = H))
				H.equip_to_slot_if_possible(src, ITEM_SLOT_UNDER_TOP, disable_warning = TRUE)

/obj/item/clothing/bra/bikini
	name = "bikini top"
	desc = "The centerpiece of a bathing suit."
	icon_state = "bikini_top"
	item_state = "bikini_top"
	boob_sized = TRUE

// Craft

/datum/repeatable_crafting_recipe/sewing/bra
	name = "bra"
	output = /obj/item/clothing/bra
	requirements = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/bra/bikini
	name = "bikini top"
	output = /obj/item/clothing/bra/bikini

/datum/component/storage/concrete/bra
	max_w_class = WEIGHT_CLASS_SMALL
	screen_max_rows = 1
	screen_max_columns = 1

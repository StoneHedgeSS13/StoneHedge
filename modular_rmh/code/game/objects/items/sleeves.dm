/obj/item/clothing/armsleeves
	name = "cloth armsleeve"
	desc = "Beautiful, form-fitting long armsleeves."
	icon = 'modular_rmh/icons/clothing/sleeves_undershirts.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/sleeves_undershirts.dmi'
	sleeved = 'modular_rmh/icons/clothing/onmob/sleeves_undershirts.dmi'
	sleevetype = "shirt"
	icon_state = "solid"
	item_state = "solid"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	break_sound = 'sound/foley/cloth_rip.ogg'
	blade_dulling = DULLING_CUT
	max_integrity = 200
	integrity_failure = 0.1
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	salvage_result = /obj/item/natural/cloth
	slot_flags = ITEM_SLOT_ARMSLEEVES | ITEM_SLOT_WRISTS

/obj/item/clothing/armsleeves/attack(mob/M, mob/user, def_zone)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.armsleeves)
			if(!get_location_accessible(H, BODY_ZONE_PRECISE_L_HAND))
				return
			if(!get_location_accessible(H, BODY_ZONE_PRECISE_R_HAND))
				return
			user.visible_message(span_notice("[user] tries to put [src] on [H]..."))
			if(do_after(user, 50, target = H))
				H.equip_to_slot_if_possible(src, ITEM_SLOT_ARMSLEEVES, disable_warning = TRUE)

/obj/item/clothing/armsleeves/solid_half
	name = "sheer half-armsleeve"
	icon_state = "solid-half"
	item_state = "solid-half"

/obj/item/clothing/armsleeves/silk
	name = "silk armsleeve"
	icon_state = "silk"
	item_state = "silk"

/obj/item/clothing/armsleeves/silk_half
	name = "silk half-armsleeve"
	icon_state = "silk-half"
	item_state = "silk-half"

/obj/item/clothing/armsleeves/mesh
	name = "mesh armsleeve"
	icon_state = "mesh"
	item_state = "mesh"

/obj/item/clothing/armsleeves/mesh_half
	name = "mesh half-armsleeve"
	icon_state = "mesh-half"
	item_state = "mesh-half"

/obj/item/clothing/armsleeves/net
	name = "net armsleeve"
	icon_state = "net"
	item_state = "net"

/obj/item/clothing/armsleeves/net_half
	name = "net half-armsleeve"
	icon_state = "net-half"
	item_state = "net-half"

/datum/repeatable_crafting_recipe/sewing/solid_armsleeves
	name = "solid armsleeve"
	output = /obj/item/clothing/armsleeves
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/solid_half_armsleeve
	name = "solid half armsleeve"
	output = /obj/item/clothing/armsleeves/solid_half
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/silk_armsleeve
	name = "silk armsleeve"
	output = /obj/item/clothing/armsleeves/silk
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/silk_half_armsleeve
	name = "silk half armsleeve"
	output = /obj/item/clothing/armsleeves/silk_half
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/mesh_armsleeve
	name = "mesh armsleeve"
	output = /obj/item/clothing/armsleeves/mesh
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/mesh_half_armsleeve
	name = "mesh half armsleeve"
	output = /obj/item/clothing/armsleeves/mesh_half
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/net_armsleeve
	name = "net armsleeve"
	output = /obj/item/clothing/armsleeves/net
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/net_half_armsleeve
	name = "net half armsleeve"
	output = /obj/item/clothing/armsleeves/net_half
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

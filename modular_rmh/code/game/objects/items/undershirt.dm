/obj/item/clothing/undershirt
	name = "sheer body"
	desc = "Something to cover yourself with."
	icon = 'modular_rmh/icons/clothing/undershirt.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/undershirts.dmi'
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
	slot_flags = ITEM_SLOT_UNDERSHIRT
	flags_inv = HIDEBOOB | HIDEBELLY
	boobed = TRUE
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/obj/item/clothing/undershirt/attack(mob/M, mob/user, def_zone)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.undershirt)
			if(!get_location_accessible(H, BODY_ZONE_CHEST))
				return
			user.visible_message(span_notice("[user] tries to put [src] on [H]..."))
			if(do_after(user, 50, target = H))
				H.equip_to_slot_if_possible(src, ITEM_SLOT_UNDERSHIRT, disable_warning = TRUE)

/obj/item/clothing/undershirt/leotard
	name = "leotard"
	icon_state = "leotard"
	item_state = "leotard"
	boob_sized = TRUE
	boobed = FALSE

/obj/item/clothing/undershirt/athletic_leotard
	name = "athletic leotard"
	icon_state = "athletic_leotard"
	item_state = "athletic_leotard"
	boobed = FALSE

/obj/item/clothing/undershirt/solid_half
	name = "sheer half-body"
	icon_state = "solid-half"
	item_state = "solid-half"

/obj/item/clothing/undershirt/fullbody
	name = "full-body suit"
	desc = "Leaves both everything and nothing to imagination."
	icon_state = "full"
	item_state = "full"
	flags_inv = HIDECROTCH | HIDEBOOB | HIDEBELLY | HIDEBUTT
	sleeved = 'modular_rmh/icons/clothing/onmob/helpers/undershirts.dmi'
	nodismemsleeves = FALSE
	sleevetype = "shirt"

/obj/item/clothing/undershirt/silk
	name = "silk body"
	icon_state = "silk"
	item_state = "silk"

/obj/item/clothing/undershirt/silk_half
	name = "silk half-body"
	icon_state = "silk-half"
	item_state = "silk-half"

/obj/item/clothing/undershirt/mesh
	name = "mesh body"
	icon_state = "mesh"
	item_state = "mesh"

/obj/item/clothing/undershirt/mesh_half
	name = "mesh half-body"
	icon_state = "mesh-half"
	item_state = "mesh-half"

/obj/item/clothing/undershirt/net
	name = "net body"
	icon_state = "net"
	item_state = "net"

/obj/item/clothing/undershirt/net_half
	name = "net half-body"
	icon_state = "net-half"
	item_state = "net-half"

/datum/repeatable_crafting_recipe/sewing/leotard
	name = "leotard"
	output = /obj/item/clothing/undershirt/leotard
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/athletic_leotard
	name = "athletic leotard"
	output = /obj/item/clothing/undershirt/athletic_leotard
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/fullbody
	name = "full-body suit"
	output = /obj/item/clothing/undershirt/fullbody
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/solid_body
	name = "solid body"
	output = /obj/item/clothing/undershirt
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/solid_half_body
	name = "solid half body"
	output = /obj/item/clothing/undershirt/solid_half
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/silk_body
	name = "silk body"
	output = /obj/item/clothing/undershirt/silk
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/silk_half_body
	name = "silk half body"
	output = /obj/item/clothing/undershirt/silk_half
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/mesh_body
	name = "mesh body"
	output = /obj/item/clothing/undershirt/mesh
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/mesh_half_body
	name = "mesh half body"
	output = /obj/item/clothing/undershirt/mesh_half
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/net_body
	name = "net body"
	output = /obj/item/clothing/undershirt/net
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/repeatable_crafting_recipe/sewing/net_half_body
	name = "net half body"
	output = /obj/item/clothing/undershirt/net_half
	requirements = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

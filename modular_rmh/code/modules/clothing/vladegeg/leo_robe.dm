/obj/item/clothing/shirt/leo_robe
	slot_flags = ITEM_SLOT_SHIRT | ITEM_SLOT_ARMOR
	name = "leopard robe"
	desc = "An exquisite silky robe with a lepard pattern."
	body_parts_covered = CHEST|GROIN|VITALS
	icon = 'modular_rmh/icons/clothing/vladegeg/tig.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/tig.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/tig_sleeves.dmi'
	sleevetype = "armor"
	icon_state = "tig"
	item_state = "tig"
	flags_inv = HIDEBOOB|HIDECROTCH|HIDEBELLY
	color = "#d88a32ff"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	nodismemsleeves = TRUE
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/shirt/leo_robe/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "tig_open"
			flags_inv = HIDEBOOB
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_armor()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
		if(ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_armor()

/obj/item/clothing/shirt/leo_robe/colored
	color = "#FFFFFF"

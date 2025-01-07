/obj/item/clothing/head/roguetown/helmet/leather
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "leather helmet"
	desc = "A helmet made of leather."
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	icon = 'modular_stonehedge/icons/armor/head.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/head.dmi'
	icon_state = "leatherhelm"
	armor = list("blunt" = 57, "slash" = 37, "stab" = 37, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	smeltresult = null
	sewrepair = TRUE
	blocksound = SOFTHIT
	clothing_flags = null
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/head/roguetown/helmet/leather/advanced
	name = "hardened leather helmet"
	desc = "Sturdy, durable, flexible. A confortable and reliable hood made of hardened leather."
	max_integrity = 250
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES|MOUTH
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_SMASH)
	armor = list("blunt" = 70, "slash" = 70, "stab" = 40, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/roguetown/helmet/leather/masterwork
	name = "enhanced leather helmet"
	desc = "This helmet is a craftsmanship marvel. Made with the finest leather. Strong, nimible, reliable."
	max_integrity = 300
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES|MOUTH
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST) //like carapace armors.
	armor = list("blunt" = 100, "slash" = 80, "stab" = 50, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = list(list("type" = "drop_shadow", "x" = 0, "y" = 0, "size" = 0.5, "offset" = 1, "color" = "#daa520"))

//Better than hardened leather, worse than masterwork, it requires a coif and blacksmithing, like studded armor.
/obj/item/clothing/head/roguetown/helmet/leather/armorhood
	name = "padded leather hood"
	desc = "A padded leather hood with buckles."
	icon = 'modular_stonehedge/icons/armor/head.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/head.dmi'
	icon_state = "studhood"
	item_state = "studhood"
	flags_inv = HIDEHAIR
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES|MOUTH|NECK
	armor = list("blunt" = 70, "slash" = 45, "stab" = 40, "bullet" = 25, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_SMASH)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE

/obj/item/clothing/head/roguetown/helmet/leather/armorhood/advanced

	name = "studded leather hood"
	desc = "A thick studded leather hood with buckles."
	icon_state = "studhood" //make into new sprite
	item_state = "studhood"
	max_integrity = 280
	armor = list("blunt" = 85, "slash" = 70, "stab" = 45, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_SMASH)

//the top dog of leather shiet also looks good, you needed to visit a blacksmith for the previous step, and you are back to needing a master seamster.
/obj/item/clothing/head/roguetown/helmet/leather/armorhood/masterwork
	name = "enhanced studded leather hood"
	desc = "A thick plate reinforced leather hood with buckles designed for battle."
	icon_state = "studhood"
	item_state = "studhood"
	max_integrity = 320
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST)
	armor = list("blunt" = 100, "slash" = 90, "stab" = 60, "bullet" = 40, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = list(list("type" = "drop_shadow", "x" = 0, "y" = 0, "size" = 0.5, "offset" = 1, "color" = "#daa520"))

/obj/item/clothing/head/roguetown/helmet/leather/armorhood/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
				H.update_inv_neck()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEHAIR|HIDEEARS|HIDEFACE
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
					H.update_inv_neck()

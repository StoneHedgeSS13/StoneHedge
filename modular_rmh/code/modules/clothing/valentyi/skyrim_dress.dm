//light blue dress

/obj/item/clothing/shirt/dress/skyrim_dress
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "light blue dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|VITALS
	icon = 'modular_rmh/icons/clothing/valentyi/skyrim_dress.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/valentyi/onmob/skyrim_dress.dmi'

	icon_state = "dress"
	item_state = "dress"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/datum/repeatable_crafting_recipe/sewing/skyrim_dress
	name = "light blue dress"
	output = /obj/item/clothing/shirt/dress/skyrim_dress
	requirements = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	category = "Dress"

/datum/supply_pack/apparel/skyrim_dress
	name = "Light Blue Dress"
	cost = 20
	contains = /obj/item/clothing/shirt/dress/skyrim_dress

//salad green dress

/obj/item/clothing/shirt/dress/hw_dress
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "salad green dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|VITALS
	icon = 'modular_rmh/icons/clothing/valentyi/skyrim_dress.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/valentyi/onmob/skyrim_dress.dmi'

	icon_state = "hdress"
	item_state = "hdress"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/datum/repeatable_crafting_recipe/sewing/hw_dress
	name = "light blue dress"
	output = /obj/item/clothing/shirt/dress/hw_dress
	requirements = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	category = "Dress"

/datum/supply_pack/apparel/hw_dress
	name = "Salad Green Dress"
	cost = 20
	contains = /obj/item/clothing/shirt/dress/hw_dress


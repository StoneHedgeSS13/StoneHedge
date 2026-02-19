/obj/item/clothing/shirt/dress/skyrim_taven
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "waitress dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|VITALS
	icon = 'modular_rmh/icons/clothing/vladegeg/skyrim_tavern.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/skyrim_tavern.dmi'

	icon_state = "tavern"
	item_state = "tavern"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/datum/repeatable_crafting_recipe/sewing/skyrim_taven
	name = "waitress dress"
	output = /obj/item/clothing/shirt/dress/skyrim_taven
	requirements = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	category = "Dress"

/datum/supply_pack/apparel/skyrim_taven
	name = "Waitress Dress"
	cost = 20
	contains = /obj/item/clothing/shirt/dress/skyrim_taven

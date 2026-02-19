/obj/item/clothing/shirt/dress/courtesan
	name = "courtesan dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|VITALS
	slot_flags = ITEM_SLOT_SHIRT | ITEM_SLOT_ARMOR
	icon_state = "dress"
	icon = 'modular_rmh/icons/clothing/vladegeg/courtesan.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/courtesan.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/courtesan_sleeves.dmi'

/datum/repeatable_crafting_recipe/sewing/courtesan
	name = "courtesan dress"
	output = /obj/item/clothing/shirt/dress/courtesan
	requirements = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	category = "Dress"

/datum/supply_pack/apparel/courtesan
	name = "Courtesan Dress"
	cost = 20
	contains = /obj/item/clothing/shirt/dress/courtesan

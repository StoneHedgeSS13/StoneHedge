/obj/item/clothing/shoes/toga_sandals
	name = "fancy sandals"
	desc = "Fancy sandals."
	gender = PLURAL
	icon = 'modular_rmh/icons/clothing/valentyi/toga_sandals.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/valentyi/onmob/toga_sandals.dmi'
	icon_state = "toga_sandals"
	item_state = "toga_sandals"
	salvage_result = /obj/item/natural/hide/cured
	salvage_amount = 1

/datum/repeatable_crafting_recipe/leather/toga_sandals
	name = "fancy sandals"
	requirements = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/natural/fibers = 1
	)
	output = /obj/item/clothing/shoes/toga_sandals

/datum/supply_pack/apparel/toga_sandals
	name = "Fancy sandals"
	cost = 5
	contains = /obj/item/clothing/shoes/toga_sandals

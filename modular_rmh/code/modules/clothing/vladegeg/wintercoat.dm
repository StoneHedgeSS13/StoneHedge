/obj/item/clothing/armor/gambeson/winter_coat
	name = "warm winter coat"
	desc = "A thick, well-crafted winter coat designed to retain heat and protect against harsh cold while remaining comfortable for daily wear."
	icon_state = "wintercoat"
	item_state = "wintercoat"
	armor = ARMOR_PADDED_GOOD
	icon = 'modular_rmh/icons/clothing/vladegeg/wintercoat.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/wintercoat.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/wintercoat_sleeves.dmi'
	salvage_result = /obj/item/natural/fur
	min_cold_protection_temperature = -40

/datum/repeatable_crafting_recipe/leather/winter_coat
	name = "winter coat"
	requirements = list(
		/obj/item/natural/hide/cured = 2,
		/obj/item/natural/fur = 1,
	)
	output = /obj/item/clothing/armor/gambeson/winter_coat
	craftdiff = 2

/datum/supply_pack/apparel/winter_coat
	name = "Winter Coat"
	cost = 40
	contains = /obj/item/clothing/armor/gambeson/winter_coat

/obj/item/clothing/shirt/robe/skyrim_mage
	name = "mage robes"
	desc = "Simple but finely woven robes favored by the mages. The cloth is light, warm, and practical."
	icon_state = "mage"
	icon = 'modular_rmh/icons/clothing/vladegeg/skyrim_mage.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/skyrim_mage.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/skyrim_mage_sleeves.dmi'
	flags_inv = null


/datum/repeatable_crafting_recipe/sewing/skyrim_mage
	name = "mage robes"
	output = /obj/item/clothing/shirt/robe/skyrim_mage
	requirements = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)

/datum/supply_pack/apparel/skyrim_mage
	name = "Mage Robes"
	cost = 15
	contains = /obj/item/clothing/shirt/robe/skyrim_mage

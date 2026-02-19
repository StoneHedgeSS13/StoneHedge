//By Vide Noir https://github.com/EaglePhntm.

/obj/item/clothing/pants/trou/leather/skirt
	name = "leather skirt"
	icon = 'modular_rmh/icons/clothing/armor/pants.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/armor/onmob/pants.dmi'
	desc = "Short skirt made of fine leather."
	icon_state = "leatherskirt"
	genital_access = TRUE

/obj/item/clothing/pants/trou/leather/advanced/skirt
	name = "hardened leather skirt"
	icon = 'modular_rmh/icons/clothing/armor/pants.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/armor/onmob/pants.dmi'
	icon_state = "hlskirt"
	item_state = "hlskirt"
	genital_access = TRUE

/obj/item/clothing/pants/chainlegs/iron/studdedskirt
	name = "studded leather skirt"
	icon = 'modular_rmh/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_rmh/icons/armor/onmob/pants.dmi'
	armor = ARMOR_LEATHER_GOOD
	desc = "Short studded skirt made of fine leather and iron."
	icon_state = "studdedskirt"
	genital_access = TRUE

/obj/item/clothing/pants/chainlegs/iron/skirt
	name = "iron chain skirt"
	icon = 'modular_rmh/icons/clothing/armor/pants.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/armor/onmob/pants.dmi'
	icon_state = "chain_skirt"
	item_state = "chain_skirt"
	color = "#9EA48E"
	genital_access = TRUE

/obj/item/clothing/pants/chainlegs/skirt
	name = "chain skirt"
	icon = 'modular_rmh/icons/clothing/armor/pants.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/armor/onmob/pants.dmi'
	icon_state = "chain_skirt"
	item_state = "chain_skirt"
	genital_access = TRUE

/obj/item/clothing/pants/platelegs/skirt
	name = "plated skirt"
	icon = 'modular_rmh/icons/clothing/armor/pants.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/armor/onmob/pants.dmi'
	icon_state = "plate_skirt"
	item_state = "plate_skirt"
	genital_access = TRUE

/obj/item/clothing/pants/trou/leather/masterwork/skirt
	name = "masterwork leather skirt"
	icon = 'modular_rmh/icons/clothing/armor/pants.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/armor/onmob/pants.dmi'
	icon_state = "hlskirt"
	item_state = "hlskirt"
	genital_access = TRUE

///RECIPES

/datum/repeatable_crafting_recipe/leather/leatherskirt
	name = "leather skirt"
	output = /obj/item/clothing/pants/trou/leather/skirt

/datum/repeatable_crafting_recipe/leather/standalone/hlskirt
	name = "hardened leather skirt"
	output = /obj/item/clothing/pants/trou/leather/advanced/skirt
	requirements = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1,
				/obj/item/reagent_containers/food/snacks/tallow = 1)
	craftdiff = 4

/datum/repeatable_crafting_recipe/leather/standalone/hlskirt
	name = "hardened leather skirt"
	output = /obj/item/clothing/pants/trou/leather/advanced/skirt
	requirements = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1,
				/obj/item/reagent_containers/food/snacks/tallow = 1)
	craftdiff = 4

/datum/anvil_recipe/armor/iron/studdedskirt
	name = "Studded Skirt (+1 Leather Skirt)"
	recipe_name = "studded leather skirt"
	additional_items = list(/obj/item/clothing/pants/trou/leather/skirt)
	created_item = /obj/item/clothing/pants/chainlegs/iron/studdedskirt

/datum/anvil_recipe/armor/steel/chainskirt
	name = "Chain Skirt"
	recipe_name = "chain skirt"
	created_item = /obj/item/clothing/pants/chainlegs/skirt
	craftdiff = 2

/datum/anvil_recipe/armor/iron/ichainskirt
	name = "Iron Chain Skirt"
	recipe_name = "iron chain skirt"
	created_item = /obj/item/clothing/pants/chainlegs/iron/skirt
	craftdiff = 1

/datum/anvil_recipe/armor/steel/plateskirt
	name = "Plate Skirt (+1 Steel)"
	recipe_name = "plated skirt"
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/pants/platelegs/skirt
	craftdiff = 4	//It's plate, no easy craft.

/datum/repeatable_crafting_recipe/leather/standalone/chausses/masterwork/skirt
	name = "masterwork leather skirt"
	output = /obj/item/clothing/pants/trou/leather/masterwork/skirt
	attacked_atom = /obj/item/clothing/pants/trou/leather
	requirements = list(/obj/item/clothing/pants/trou/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

///CONVERSIONS

/datum/repeatable_crafting_recipe/conversion
	tool_usage = list(
		/obj/item/weapon/knife = list("starts to cut", "start to cut")
	)
	starting_atom = /obj/item/weapon/knife
	output_amount = 1
	craftdiff = 0
	subtypes_allowed = TRUE

/datum/repeatable_crafting_recipe/conversion/leatherskirtconv
	name = "leather skirt"
	output = /obj/item/clothing/pants/trou/leather/skirt
	requirements = list(/obj/item/clothing/pants/trou/leather = 1)
	attacked_atom = /obj/item/clothing/pants/trou/leather

/datum/repeatable_crafting_recipe/conversion/leatherskirtconvtwo
	name = "hardened leather skirt"
	output = /obj/item/clothing/pants/trou/leather/advanced/skirt
	requirements = list(/obj/item/clothing/pants/trou/leather/advanced = 1)
	attacked_atom = /obj/item/clothing/pants/trou/leather/advanced

/datum/repeatable_crafting_recipe/conversion/leatherskirtconvthree
	name = "masterwork leather skirt"
	output = /obj/item/clothing/pants/trou/leather/masterwork/skirt
	requirements = list(/obj/item/clothing/pants/trou/leather/masterwork/skirt = 1)
	attacked_atom = /obj/item/clothing/pants/trou/leather/masterwork

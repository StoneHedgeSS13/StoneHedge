/obj/item/clothing/armor/gambeson/steward/townhall
	name = "rich tailcoat"
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/armor/leather/jacket/gatemaster_jacket/armored/bulwark
	name = "town watch bulwark armor"
	desc = "Steel armor with thick cloth padded coat. A bulky set of excellent armor made for the Town Watch Bulwarks."
	icon_state = "master_coat_cuirass"
	anvilrepair = /datum/skill/craft/armorsmithing
	melt_amount = 75
	melting_material = /datum/material/steel
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	pickup_sound = "rustle"
	sellprice = VALUE_STEEL_ARMOR
	clothing_flags = CANT_SLEEP_IN
	//Plate doesn't protect a lot against blunt
	armor_class = AC_HEAVY
	armor = ARMOR_PLATE
	body_parts_covered = COVERAGE_ALL_BUT_LEGS //Has shoulder guards, and nothing else to suggest leg protection
	prevent_crits = ALL_EXCEPT_BLUNT
	max_integrity = INTEGRITY_STRONGEST
	stand_speed_reduction = 1.2
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/armor/gambeson/colored
	icon_state = "gambesonl"
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/armor/gambeson/colored/town_watch
	uses_lord_coloring = LORD_SECONDARY

/obj/item/clothing/armor/gambeson/heavy/colored/town_watch
	uses_lord_coloring = LORD_SECONDARY

/obj/item/clothing/armor/corset/colored/black
	color = CLOTHING_BLACK

/obj/item/clothing/armor/gambeson/sophisticated_coat/colored/random/Initialize()
	color = pick_assoc(GLOB.noble_dyes)
	return ..()

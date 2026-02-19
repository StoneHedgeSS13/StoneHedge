/obj/item/clothing/head/roguehood/colored/townhall
	name = "rich dark hood"
	desc = "A fancy dark hood."
	color = "#232025"

/obj/item/clothing/head/chaperon/colored/greyscale/townhall
	name = "chaperon hat"
	desc = "A comfortable and fashionable headgear."
	color = CLOTHING_BLACK

/obj/item/clothing/head/helmet/sargebarbute/town_watch
	name = "captain barbute"
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/helmet/kettle/slit/atarms/town_watch
	name = "sergeant kettle"
	desc = "A lightweight steel helmet decorated for the sergeant of the town watch."
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/helmet/townwatch/town_warden
	name = "warden helmet"
	desc = "An old archaic helmet of a symbol long forgotten, now owned by the Warden. The shape resembles the bars of a prison."
	icon_state = "gatehelm"
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/helmet/townwatch/gatemaster/bulwark
	name = "town watch bulwark helmet"
	flags_inv = HIDEEARS|HIDEHAIR
	desc = "An old archaic helmet of a symbol long forgotten, now owned by the Town Watch Bulwarks. The shape resembles the bars of a gate."
	icon = 'icons/roguetown/clothing/special/gatemaster.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/gatemaster.dmi'
	icon_state = "master_helm"
	flags_inv = HIDEEARS
	equip_delay_self = 3 SECONDS
	unequip_delay_self = 3 SECONDS
	melt_amount = 75
	melting_material = /datum/material/steel
	sellprice = VALUE_STEEL_HELMET
	armor = ARMOR_PLATE
	body_parts_covered = FULL_HEAD
	max_integrity = INTEGRITY_STRONG
	prevent_crits = ALL_CRITICAL_HITS
	item_weight = 6 * STEEL_MULTIPLIER
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/crown/circlet/silverdiadem/moon_priest
	name = "silver diadem"
	desc = "A luxurious diadem forged out of silver, etched with lunar sigils and blessed under moonlight. Worn by priests of Selune as a symbol of guidance, mercy, and quiet vigilance in the dark."
	icon_state = "diadem_s"
	sellprice = VALUE_SILVER_ITEM
	misc_flags = CRAFTING_TEST_EXCLUDE

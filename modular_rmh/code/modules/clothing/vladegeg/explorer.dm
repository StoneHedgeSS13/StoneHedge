/obj/item/clothing/armor/gambeson/explorer
	name = "explorer's vest"
	slot_flags = ITEM_SLOT_SHIRT | ITEM_SLOT_ARMOR
	desc = "A dashing outfit for an experienced tomb raider."
	armor = ARMOR_LEATHER
	icon_state = "vest"
	item_state = "vest"
	icon = 'modular_rmh/icons/clothing/vladegeg/explorer.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/explorer.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/explorer_sleeves.dmi'
	allowed_race = SPECIES_BASE_BODY
	nodismemsleeves = FALSE
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/armor/gambeson/explorer/update_icon()
	. = ..()

/obj/item/clothing/pants/trou/leather/explorer
	icon = 'modular_rmh/icons/clothing/vladegeg/explorer.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/explorer.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/explorer_sleeves.dmi'
	sleevetype = "leg"
	name = "explorer's trousers"
	desc = "Hardy yet comfortable leather pants, suited even for hardest field work."
	armor = ARMOR_PANTS_LEATHER
	icon_state = "pants"
	item_state = "pants"
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = ARMOR_INT_LEG_LEATHER
	resistance_flags = FIRE_PROOF
	salvage_result = /obj/item/natural/hide/cured
	allowed_race = SPECIES_BASE_BODY
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/explorer
	icon = 'modular_rmh/icons/clothing/vladegeg/explorer.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/explorer.dmi'
	name = "explorer's hat"
	desc = "The perfect protection both from heat and things falling on your head."
	icon_state = "hat"
	item_state = "hat"
	sewrepair = TRUE
	armor = ARMOR_HEAD_LEATHER
	color = COLOR_DARK_BROWN
	salvage_result = /obj/item/natural/hide/cured
	misc_flags = CRAFTING_TEST_EXCLUDE

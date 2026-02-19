/obj/item/clothing/shirt/undershirt/desert_sorceress
	slot_flags = ITEM_SLOT_SHIRT | ITEM_SLOT_ARMOR
	name = "desert sorceress top"
	desc = "A revealing silk-and-linen top worn by desert sorceresses, designed to keep the body cool while allowing unrestricted movement and spellcasting."
	body_parts_covered = null
	icon = 'modular_rmh/icons/clothing/vladegeg/desert_sorceress.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/desert_sorceress.dmi'
	icon_state = "top"
	item_state = "top"
	ignore_sleeves_code = TRUE
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/pants/loincloth/desert_sorceress
	name = "desert sorceress skirt"
	desc = "A light, flowing skirt of wrapped cloth favored by desert sorceresses, offering minimal protection but excellent freedom of movement."
	icon = 'modular_rmh/icons/clothing/vladegeg/desert_sorceress.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/desert_sorceress.dmi'
	icon_state = "skirt"
	item_state = "skirt"
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/desert_sorceress
	name = "desert sorceress hood"
	desc = "A thin desert hood worn by sorceresses to shield against sun and sand while leaving the face and eyes unobstructed."
	icon = 'modular_rmh/icons/clothing/vladegeg/desert_sorceress.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/desert_sorceress.dmi'
	flags_inv = HIDEEARS|HIDEHAIR
	icon_state = "hood"
	item_state = "hood"
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/armor/corset/colored
	icon = 'modular_rmh/icons/clothing/armor/corset.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/armor/onmob/corset.dmi'
	icon_state = "corset"
	armor = ARMOR_PADDED
	body_parts_covered = COVERAGE_VEST
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null
	misc_flags = CRAFTING_TEST_EXCLUDE

/datum/repeatable_crafting_recipe/leather/corset_color
	name = "colorable corset"
	output = /obj/item/clothing/armor/corset/colored

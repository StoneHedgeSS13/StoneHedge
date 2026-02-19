/obj/item/clothing/shirt/nightgown
	slot_flags = ITEM_SLOT_SHIRT | ITEM_SLOT_ARMOR
	name = "nightgown"
	desc = "An elegant and enticing nightgown, made for comfort - and allure."
	body_parts_covered = CHEST|GROIN|VITALS
	icon = 'modular_rmh/icons/clothing/vladegeg/nightie.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/nightie.dmi'
	sleeved = null
	sleevetype = null
	icon_state = "dress"
	item_state = "dress"
	allowed_sex = list(FEMALE)
	flags_inv = HIDEBOOB|HIDECROTCH|HIDEBELLY|HIDEBUTT
	color = "#e74b6dff"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	nodismemsleeves = TRUE
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/shirt/nightgown/colored
	color = "#FFFFFF"

/obj/item/clothing/shirt/nightgown/colored/random/Initialize()
	color = pick_assoc(GLOB.common_dyes)
	return ..()

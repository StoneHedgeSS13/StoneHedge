//----------------- INFAREDBARON/HATS.DM ---------------------
/obj/item/clothing/head/roguetown
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/roguetown/helmet/guildguard
	name = "guild guard helm"
	desc = "A reinforced steel helm issued to the guards of the Waterdeep Merchant’s Guild. Its weight and craftsmanship speak of coin-backed authority rather than civic duty."
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/head.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/armor.dmi'
	icon_state = "citywatch_helmet"
	item_state = "citywatch_helmet"
	max_integrity = 225
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	armor_class = AC_MEDIUM
	smeltresult = /obj/item/ingot/steel
	body_parts_covered = HEAD|HAIR|EARS
	flags_inv = HIDEHAIR
	clothing_flags = CANT_SLEEP_IN
	anvilrepair = /datum/skill/craft/blacksmithing
	sewrepair = FALSE

/obj/item/clothing/head/roguetown/duchess_hood
	name = "duchess' veil"
	desc = "A finely tailored hood and veil favored by noble ladies. It conceals the face just enough to preserve mystery—and hide what must remain unseen."
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/head.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/head.dmi'
	icon_state = "duchess_hood"
	item_state = "duchess_hood"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

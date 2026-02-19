/obj/item/clothing/face/snmask
	name = "traveler silly mask"
	icon_state = "nmask"
	item_state = "nmask"
	icon = 'modular_rmh/icons/clothing/karatur.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/karatur.dmi'
	desc = "An white mask that both conceals and protects the face. Made from white wood."
	max_integrity = 300
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	armor = list("blunt" = 80, "slash" = 80, "stab" = 80,  "piercing" = 50, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_LASHING, BCLASS_BITE, BCLASS_TWIST, BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	body_parts_covered = FACE
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	experimental_onhip = TRUE
	sewrepair = FALSE
	anvilrepair = TRUE
	sellprice = 80
	allowed_race = SPECIES_BASE_BODY
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/neck/snscarf
	name = "scarf"
	desc = "A sturdy scarf made of dense fur."
	icon_state = "nscarf"
	item_state = "nscarf"
	icon = 'modular_rmh/icons/clothing/karatur.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/karatur.dmi'
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_MASK
	body_parts_covered = NECK|FACE
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/sillyhat
	name = "bamboo hat"
	desc = "A reinforced bamboo hat."
	icon_state = "nhat"
	item_state = "nhat"
	icon = 'modular_rmh/icons/clothing/karatur.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/karatur.dmi'
	armor = ARMOR_SPELLSINGER
	max_integrity = ARMOR_INT_HELMET_LEATHER
	blocksound = SOFTHIT
	sewrepair = TRUE
	flags_inv = HIDEEARS
	body_parts_covered = HEAD|HAIR|EARS|NOSE|EYES
	resistance_flags = FIRE_PROOF
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/armor/plate/snakekini
	name = "segmented cuirass"
	desc = "A high breastplates and hip armor allowing flexibility and great protection. Your abs is your shield."
	body_parts_covered = CHEST|GROIN
	icon = 'modular_rmh/icons/clothing/snake.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/snake.dmi'
	icon_state = "armor"
	item_state = "armor"
	armor = ARMOR_CUIRASS // Identical to steel cuirass, but covering the groin instead of the vitals.
	max_integrity = ARMOR_INT_CHEST_MEDIUM_STEEL	// Identical to steel cuirasss. Same steel price.
	armor_class = AC_MEDIUM
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/head/helmet/heavy/snakeshell
	name = "naga's head-shell"
	desc = "Segmented helm shaped to the curve of a naga’s hood."
	icon_state = "head"
	item_state = "head"
	icon = 'modular_rmh/icons/clothing/snake.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/snake.dmi'
	emote_environment = 3
	flags_inv = HIDEHAIR
	block2add = FOV_BEHIND
	smeltresult = /obj/item/ingot/steel
	misc_flags = CRAFTING_TEST_EXCLUDE

//----------------- INFAREDBARON SPRITEWORK/ARMOR.DM ---------------------

/obj/item/clothing/suit
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/suit/roguetown/armor/guildguard
	name = "guild guard cuirass"
	desc = "A heavy, meticulously maintained suit of armor bearing the sigils of the Waterdeep Merchant’s Guild. Worn by guild guards sworn to protect caravans, vaults, and trade halls alike."
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/armor.dmi'
	slot_flags = ITEM_SLOT_ARMOR
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/armor.dmi'
	icon_state = "citywatch"
	item_state = "citywatch"
	blocksound = PLATEHIT
	blocksound = CHAINHIT
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	pickup_sound = 'sound/foley/equip/equip_armor_chain.ogg'
	equip_sound = 'sound/foley/equip/equip_armor_chain.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	body_parts_covered = CHEST|GROIN|VITALS
	armor = list("blunt" = 80, "slash" = 100, "stab" = 80,  "piercing" = 80, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 250
	armor_class = AC_MEDIUM
	clothing_flags = CANT_SLEEP_IN
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	sewrepair = FALSE
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/obj/item/clothing/suit/roguetown/armor/leather/duchess
	name = "duchess' court gown"
	desc = "An elegant gown of noble cut and ancient fashion."
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_ARMOR //ugly hack to make it render over the head
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/armor.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/armor.dmi'
	icon_state = "duchess"
	item_state = "duchess"
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/obj/item/clothing/suit/roguetown/armor/leather/marshall
	name = "marshall uniform"
	desc = "A formal uniform once worn by a city watch captain, now repurposed for a Burgmeister."
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/armor.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/armor.dmi'
	icon_state = "duke"
	item_state = "duke"
	armor = list("blunt" = 30, "slash" = 35, "stab" = 10,  "piercing" = 20, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	blocksound = SOFTHIT
	// This doesnt let you wear a belt because the sprite has a cloak and it would appear over the cloak. I cant bother to fix it.
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT|ITEM_SLOT_BELT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS|ARMS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	armor_class = AC_LIGHT
	salvage_result = /obj/item/natural/hide/cured
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/obj/item/clothing/suit/roguetown/armor/leather/burgmeister
	name = "burgmeister's civic vestments"
	desc = "Soft yet dignified garments worn by the elected Burgmeister."
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/armor.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/armor.dmi'
	icon_state = "hand"
	item_state = "hand"
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_ARMOR //ugly hack to make it render over the head
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/obj/item/clothing/suit/roguetown/armor/leather/adjutant
	name = "councilor's uniform"
	desc = "A reinforced uniform worn by a former city watchman now serving as a councilor."
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/armor.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/armor.dmi'
	icon_state = "heir"
	item_state = "heir"
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	slot_flags = ITEM_SLOT_ARMOR
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/obj/item/clothing/suit/roguetown/armor/leather/heiress
	name = "council clerk attire"
	desc = "Neatly kept garments worn by a councilor’s clerk."
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/armor.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/armor.dmi'
	icon_state = "heiress"
	item_state = "heiress"
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	slot_flags = ITEM_SLOT_ARMOR
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/obj/item/clothing/suit/roguetown/armor/councillor
	name = "councilor's formal attire"
	desc = "A tailored uniform denoting a seated member of the Burgmeister’s council. Practical, dignified, and subtly armored against both blades and politics."
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/armor.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/armor.dmi'
	icon_state = "councillor"
	item_state = "councillor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	armor = list("blunt" = 60, "slash" = 40, "stab" = 50,  "piercing" = 40, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	blocksound = SOFTUNDERHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	armor_class = AC_LIGHT
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/obj/item/clothing/suit/roguetown/armor/leather/magos
	name = "magos-administrator robes"
	desc = "Layered robes, worn by the Burgmeister’s Magos, who governs through knowledge, archives, and written law."
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/armor.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/armor.dmi'
	icon_state = "magos"
	item_state = "magos"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	slot_flags = ITEM_SLOT_ARMOR
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/obj/item/clothing/suit/roguetown/armor/leather/banker
	name = "guild banker’s suit"
	desc = "A finely stitched suit worn by a senior banker of the Waterdeep Merchant’s Guild."
	icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/armor.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/licensed-infraredbaron/onmob/armor.dmi'
	icon_state = "steward"
	item_state = "steward"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	slot_flags = ITEM_SLOT_ARMOR
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

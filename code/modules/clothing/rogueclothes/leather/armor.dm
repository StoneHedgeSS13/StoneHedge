
/obj/item/clothing/suit/roguetown/armor/leather
	name = "leather armor"
	desc = "Flexible cowhide armor. Lightweight, better than nothing."
	icon_state = "leather"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	armor = list("blunt" = 60, "slash" = 50, "stab" = 40, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	nodismemsleeves = TRUE
	max_integrity = 150
	sellprice = 20
	armor_class = ARMOR_CLASS_LIGHT
	can_hold_endowed = TRUE
	flags_inv = HIDECROTCH|HIDEBOOB
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/suit/roguetown/armor/leather/advanced
	name = "hardened leather coat"
	desc = "Sturdy, durable, flexible. Will keep you alive in style."
	icon_state = "leather_advanced"
	max_integrity = 350
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_SMASH)
	armor = list("blunt" = 75, "slash" = 60, "stab" = 30, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/roguetown/armor/leather/masterwork
	name = "enhanced leather coat"
	desc = "This coat is a craftsmanship marvel. Made with the finest leather. Strong, nimible, reliable."
	icon_state = "leather_masterwork"
	max_integrity = 400
	//no stab prot unlike studded leather but better overall, legendary studded leather will still surpass this however, probably.
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_SMASH, BCLASS_CHOP)
	armor = list("blunt" = 100, "slash" = 70, "stab" = 40, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = list(list("type" = "drop_shadow", "x" = 0, "y" = 0, "size" = 0.5, "offset" = 1, "color" = "#daa520"))

/obj/item/clothing/suit/roguetown/armor/leather/hide
	name = "hide armor"
	desc = "A light armor of wildbeast hide. Far more durable than leather."
	icon_state = "hidearmor"
	max_integrity = 230
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/leather/studded
	name = "studded leather armor"
	desc = "Studded leather is the most durable of all hides and leathers and about as light."
	icon_state = "studleather"
	item_state = "studleather"
	blocksound = SOFTHIT
	armor = list("blunt" = 75, "slash" = 60, "stab" = 60, "bullet" = 40, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP, BCLASS_SMASH)
	nodismemsleeves = TRUE
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	max_integrity = 300
	sellprice = 25
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/leather/vest
	name = "leather vest"
	desc = "A leather vest. Not very protective, but fashion."
	icon_state = "vest"
	item_state = "vest"
	color = "#514339"
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS|LEGS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	sleevetype = null
	sleeved = null
	armor_class = ARMOR_CLASS_LIGHT
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	name = "sea jacket"
	desc = "A sailor's garb."
	icon_state = "sailorvest"
	color = null
	slot_flags = ITEM_SLOT_ARMOR
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/armor/leather/cult_robe
	name = "cultist robes"
	desc = " "
	icon_state = "warlock"
	item_state = "warlock"
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS|LEGS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	armor_class = ARMOR_CLASS_LIGHT
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/suit/roguetown/armor/leather/vest
	name = "thick leather vest"
	desc = "A leather vest. Not very protective, but fashion."
	icon_state = "vest"
	item_state = "vest"
	color = "#514339"
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS|LEGS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	max_integrity = 150
	sewrepair = TRUE
	sleevetype = null
	sleeved = null
	armor_class = ARMOR_CLASS_LIGHT
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	name = "sea jacket"
	desc = "A sailor's garb."
	icon_state = "sailorvest"
	color = null
	slot_flags = ITEM_SLOT_ARMOR
	flags_inv = HIDEBOOB|HIDEBUTT
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 2
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 1

/obj/item/clothing/suit/roguetown/armor/leathervest
	name = "leather vest"
	desc = "A simple vest made of leather, provides poor protection."
	icon_state = "leathervest"
	item_state = "leathervest"
	allowed_race = CLOTHED_RACES_TYPES

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/nightman
	name = "silk jacket"
	desc = "A soft and comfortable jacket."
	icon_state = "nightman" // No gendered/dwarf sprites
	sleeved = 'icons/roguetown/clothing/onmob/armor.dmi'
	allowed_sex = list(MALE, FEMALE)
	flags_inv = HIDEBOOB|HIDEBUTT


/obj/item/clothing/suit/roguetown/armor/leather/vest/hand
	name = "Hand's vest"
	desc = "A soft vest of finest fabric."
	icon_state = "handcoat"
	color = null
	allowed_sex = list(MALE, FEMALE)

/obj/item/clothing/suit/roguetown/armor/leather/vest/black
	color = "#3c3a38"


//bikini
/obj/item/clothing/suit/roguetown/armor/leather/bikini
	name = "leather bikini"
	desc = "Flexible cowhide armor. Lightweight, better than nothing. Now in tasteful bikini shape."
	icon = 'modular_stonehedge/icons/armor/armor.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/armor.dmi'
	sleeved = 'modular_stonehedge/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "leatherkini"
	item_state = "leatherkini"
	allowed_sex = list(FEMALE)
	flags_inv = HIDECROTCH|HIDEBOOB
	allowed_race = CLOTHED_RACES_TYPES

/obj/item/clothing/suit/roguetown/armor/leather/bikini/bra
	name = "Leather armor bra"
	icon_state = "leatherbra"
	item_state = "leatherbra"
	desc = "Flexible cowhide armor. Lightweight, better than nothing, Although the bottom half is literally covered by nothing, it somehow still protects the full torso!"
	flags_inv = HIDEBOOB
	is_bra = TRUE

/obj/item/clothing/suit/roguetown/armor/leather/studded/bikini
	name = "studded leather bikini"
	desc = "Studded leather is the most durable of all hides and leathers and about as light. This one is in bikini form."
	icon = 'modular_stonehedge/icons/armor/armor.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/armor.dmi'
	sleeved = 'modular_stonehedge/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "studleatherkini"
	item_state = "studleatherkini"
	allowed_sex = list(FEMALE)
	flags_inv = HIDECROTCH|HIDEBOOB
	allowed_race = CLOTHED_RACES_TYPES

/obj/item/clothing/suit/roguetown/armor/leather/studded/bikini/bra
	name = "studded Leather bra"
	icon_state = "studleatherbra"
	item_state = "studleatherbra"
	desc = "Studded leather is the most durable of all hides and leathers and about as light. Although the bottom half is literally covered by nothing, it somehow still protects the full torso!"
	flags_inv = HIDEBOOB
	is_bra = TRUE

/obj/item/clothing/suit/roguetown/armor/leather/hide/bikini
	name = "hide bikini"
	desc = "A light armor of wildbeast hide. Far more durable than leather. This will not keep a person warm though..."
	icon = 'modular_stonehedge/icons/armor/armor.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/armor.dmi'
	sleeved = 'modular_stonehedge/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "hidearmorkini"
	item_state = "hidearmorkini"
	allowed_sex = list(FEMALE)
	flags_inv = HIDECROTCH|HIDEBOOB
	allowed_race = CLOTHED_RACES_TYPES

/obj/item/clothing/suit/roguetown/armor/leather/hide/bikini/bra
	name = "hide bra"
	icon_state = "hidearmorbra"
	item_state = "hidearmorbra"
	desc = "A light armor of wildbeast hide. Far more durable than leather. This will not keep a person warm though... The bottom half is literally covered by nothing, it somehow still protects the full torso!"
	flags_inv = HIDEBOOB
	is_bra = TRUE

/obj/item/clothing/suit/roguetown/armor/leather/advanced/bikini
	name = "hardened leather bikini"
	desc = "Sturdy, durable, flexible. Will keep you alive in style, and now even less than before!"
	icon = 'modular_stonehedge/icons/armor/armor.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/armor.dmi'
	sleeved = 'modular_stonehedge/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "advkini"
	item_state = "advkini"
	allowed_sex = list(FEMALE)
	flags_inv = HIDECROTCH|HIDEBOOB
	allowed_race = CLOTHED_RACES_TYPES

/obj/item/clothing/suit/roguetown/armor/leather/masterwork/bikini
	name = "enhanced leather bikini"
	desc = "This bikini is a craftsmanship marvel. Made with the finest leather. Strong, VERY nimible, reliable."
	icon = 'modular_stonehedge/icons/armor/armor.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/armor.dmi'
	sleeved = 'modular_stonehedge/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "mastkini"
	item_state = "mastkini"
	allowed_sex = list(FEMALE)
	flags_inv = HIDECROTCH|HIDEBOOB
	allowed_race = CLOTHED_RACES_TYPES

/obj/item/clothing/suit/roguetown/armor/leather/advanced/bikini/bra
	name = "hardened leather bra"
	icon_state = "advbra"
	item_state = "advbra"
	desc = "Sturdy, durable, flexible. Will keep you alive in style, and now even... EVEN less than before!"
	flags_inv = HIDEBOOB
	is_bra = TRUE

/obj/item/clothing/suit/roguetown/armor/leather/masterwork/bikini/bra
	name = "enhanced leather bra"
	icon_state = "mastbra"
	item_state = "mastbra"
	desc = "This... bra is a craftsmanship marvel. Made with the finest leather. Strong, VERY VERY nimible, reliable."
	flags_inv = HIDEBOOB
	is_bra = TRUE

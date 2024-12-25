/obj/item/clothing/suit/roguetown/armor/plate/half/iron/goblin
	name = "goblin mail"
	icon_state = "plate_armor_item"
	item_state = "plate_armor"
	armor = list("blunt" = 40, "slash" = 50, "stab" = 40, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 125
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	smeltresult = /obj/item/ingot/iron
	allowed_race = list(/datum/species/goblin, /datum/species/goblin/hell, /datum/species/goblin/cave, /datum/species/goblin/sea, /datum/species/goblin/moon)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	flags_inv = HIDEBOOB
	sellprice = 0

/obj/item/clothing/suit/roguetown/armor/leather/goblin
	name = "goblin armor"
	icon_state = "leather_armor_item"
	item_state = "leather_armor"
	armor = list("blunt" = 30, "slash" = 25, "stab" = 20, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 75
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	flags_inv = HIDEBOOB
	allowed_race = list(/datum/species/goblin, /datum/species/goblin/hell, /datum/species/goblin/cave, /datum/species/goblin/sea, /datum/species/goblin/moon)
	sellprice = 0

// /obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
//	name = "goblin loincloth"
//	icon_state = "cloth_armor"
//	item_state = "cloth_armor"
//	icon = 'icons/roguetown/mob/monster/goblins.dmi'
//	allowed_race = list(/datum/species/goblin)
//	armor = null
//	sellprice = 0

/obj/item/clothing/under/roguetown/loincloth/goblinloin
	name = "goblin loincloth"
	desc = "smells funny."
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	mob_overlay_icon = 'icons/roguetown/mob/monster/goblins.dmi'
	icon_state = "cloth_armor"
	item_state = "cloth_armor"
	flags_inv = HIDECROTCH
	allowed_race = list(/datum/species/goblin, /datum/species/goblin/hell, /datum/species/goblin/cave, /datum/species/goblin/sea, /datum/species/goblin/moon)
	sellprice = 0

/obj/item/clothing/head/roguetown/helmet/leather/goblin
	name = "goblin helmet"
	icon = 'icons/roguetown/clothing/head.dmi'
	armor = list("blunt" = 40, "slash" = 35, "stab" = 30, "bullet" = 25, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 50
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "leather_helm_item"
	item_state = "leather_helm"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = list(/datum/species/goblin, /datum/species/goblin/hell, /datum/species/goblin/cave, /datum/species/goblin/sea, /datum/species/goblin/moon)
	sellprice = 0

/obj/item/clothing/head/roguetown/helmet/goblin
	name = "goblin helmet"
	icon_state = "plate_helm_item"
	item_state = "plate_helm"
	armor = list("blunt" = 45, "slash" = 50, "stab" = 40, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = list(/datum/species/goblin, /datum/species/goblin/hell, /datum/species/goblin/cave, /datum/species/goblin/sea, /datum/species/goblin/moon)
	body_parts_covered = HEAD|EARS|HAIR|EYES
	sellprice = 0
	max_integrity = 100
	smeltresult = /obj/item/ingot/iron

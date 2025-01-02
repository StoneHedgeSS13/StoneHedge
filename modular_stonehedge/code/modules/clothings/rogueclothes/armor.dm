/obj/item/clothing/suit/roguetown/armor/combattante
	name = "combattante vest"
	desc = "A stylish vest worn by the Duellists of the Combattante Association. Light and flexible, it doesn't impede the complex movements the Association is known for."
	icon_state = "puritan_shirt" //Until we get better sprites..
	icon = 'icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	color = "#5a5a5a"
	sleevetype = "shirt"
	armor = list("blunt" = 60, "slash" = 40, "stab" = 50, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	blocksound = SOFTHIT
	allowed_race = CLOTHED_RACES_TYPES
	body_parts_covered = CHEST|VITALS|ARMS
	armor_class = ARMOR_CLASS_LIGHT
	can_hold_endowed = TRUE
	sewrepair = TRUE

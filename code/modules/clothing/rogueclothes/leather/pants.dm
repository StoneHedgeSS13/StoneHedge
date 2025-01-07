
/obj/item/clothing/under/roguetown/trou/leather
	name = "leather trousers"
	desc = "Trousers made of fine leather."
	icon_state = "leatherpants"
	max_integrity = 130
	armor = list("blunt" = 50, "slash" = 25, "stab" = 40, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB)

/obj/item/clothing/under/roguetown/trou/leather/skirt
	name = "leather skirt"
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	desc = "Short skirt made of fine leather."
	icon_state = "leatherskirt"
	genitalaccess = TRUE

/obj/item/clothing/under/roguetown/trou/leather/advanced
	name = "hardened leather chausses"
	desc = "Sturdy, durable, flexible. The finest leather to protect your nether regions."
	icon_state = "leatherpants_masterwork" //no advanced sprite
	max_integrity = 200
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_STAB, BCLASS_SMASH)
	armor = list("blunt" = 70, "slash" = 60, "stab" = 30, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/roguetown/trou/leather/masterwork
	name = "enhanced leather chausses"
	desc = "These chausses are a craftsmanship marvel. Made with the finest leather. Strong, nimible, reliable."
	max_integrity = 250
	icon_state = "leatherpants_masterwork"
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_STAB, BCLASS_SMASH, BCLASS_CHOP)
	armor = list("blunt" = 100, "slash" = 70, "stab" = 40, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = list(list("type" = "drop_shadow", "x" = 0, "y" = 0, "size" = 0.5, "offset" = 1, "color" = "#daa520"))

/obj/item/clothing/under/roguetown/trou/leather/mourning
	name = "mourning trousers"
	desc = "Dark trousers worn by morticians while performing burial rites."
	icon_state = "leathertrou"
	color = "#151615"

/obj/item/clothing/under/roguetown/trou/leather/advanced/skirt
	name = "hardened leather skirt"
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	icon_state = "hlskirt"
	item_state = "hlskirt"
	genitalaccess = TRUE

/obj/item/clothing/under/roguetown/trou/leather/masterwork/skirt
	name = "enhanced leather skirt"
	desc = "This skirt is a craftsmanship marvel. Made with the finest leather. Strong, nimible, reliable."
	icon = 'modular_stonehedge/icons/armor/pants.dmi'
	mob_overlay_icon = 'modular_stonehedge/icons/armor/onmob/pants.dmi'
	icon_state = "hlskirt"
	item_state = "hlskirt"
	genitalaccess = TRUE

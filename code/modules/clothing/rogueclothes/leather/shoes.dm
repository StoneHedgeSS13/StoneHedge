
/obj/item/clothing/shoes/roguetown/boots/armor/leather
	name = "leather boots"
	desc = "Boots made of leather."
	max_integrity = 150
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 1, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB)
	icon_state = "leatherboots"
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured
	clothing_flags = null

/obj/item/clothing/shoes/roguetown/boots/armor/leather/advanced
	name = "hardened leather boots"
	desc = "Sturdy, durable, flexible. A marvel of the dark ages that exists solely to protect your toes."
	max_integrity = 200
	icon_state = "leatherboots" //replace with advanced sprite
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_SMASH)
	armor = list("blunt" = 50, "slash" = 40, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/boots/armor/leather/masterwork
	name = "enhanced leather boots"
	desc = "These boots are a craftsmanship marvel. Made with the finest leather. Strong, nimible, reliable."
	icon_state = "leatherboots" //replace with masterwork sprite
	max_integrity = 300
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH)
	armor = list("blunt" = 80, "slash" = 60, "stab" = 40, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = list(list("type" = "drop_shadow", "x" = 0, "y" = 0, "size" = 0.5, "offset" = 1, "color" = "#daa520"))

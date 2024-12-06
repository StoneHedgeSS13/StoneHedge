/obj/item/clothing/head/roguetown/helmet/leather
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "leather helmet"
	desc = "A helmet made of leather."
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	icon_state = "leatherhelm"
	armor = list("blunt" = 47, "slash" = 27, "stab" = 37, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	smeltresult = null
	blocksound = SOFTHIT
	clothing_flags = null
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/head/roguetown/helmet/leather/advanced
	name = "hardened leather helmet"
	desc = "Sturdy, durable, flexible. A confortable and reliable hood made of hardened leather."
	icon_state = "alhelmet"
	max_integrity = 250
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES|MOUTH
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 70, "slash" = 60, "stab" = 30, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/roguetown/helmet/leather/masterwork
	name = "masterwork leather helmet"
	desc = "This helmet is a craftsmanship marvel. Made with the finest leather. Strong, nimible, reliable."
	max_integrity = 300
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES|MOUTH
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP) //we're adding chop here!
	armor = list("blunt" = 100, "slash" = 70, "stab" = 40, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = list(list("type" = "drop_shadow", "x" = 0, "y" = 0, "size" = 0.5, "offset" = 1, "color" = "#daa520"))

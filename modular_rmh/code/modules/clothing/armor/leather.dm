/obj/item/clothing/armor/leather/studded
	name = "studded leather armor"
	desc = "Studded leather is the most durable of all hides and leathers and about as light."
	icon_state = "studleather"
	item_state = "studleather"
	resistance_flags = FLAMMABLE
	blocksound = SOFTHIT
	armor = ARMOR_LEATHER_STUDDED
	prevent_crits = ALL_EXCEPT_STAB
	nodismemsleeves = TRUE
	body_parts_covered = COVERAGE_TORSO
	max_integrity = INTEGRITY_STRONG
	smeltresult = /obj/item/ingot/iron
	sellprice = 25
	armor_class = AC_LIGHT

/obj/item/clothing/armor/leather/studded/mail
	name = "studded leather mail"
	desc = "Studded leather is the most durable of all hides and leathers and about as light. This one covers the legs a bit too."
	icon_state = "studdedmail"
	item_state = "studleather"
	body_parts_covered = COVERAGE_ALL_BUT_ARMS
	sellprice = 35

/datum/anvil_recipe/armor/iron/studded
	name = "Studded Leather Armor (+Leather Armor)"
	recipe_name = "studded light armor"
	additional_items = list(/obj/item/clothing/armor/leather)
	created_item = /obj/item/clothing/armor/leather/studded

/datum/anvil_recipe/armor/iron/studded/mail
	name = "Studded Leather mail (+Leather Armor, +1 cured leather)"
	recipe_name = "studded light mail armor"
	additional_items = list(/obj/item/clothing/armor/leather, /obj/item/natural/hide/cured)
	created_item = /obj/item/clothing/armor/leather/studded/mail

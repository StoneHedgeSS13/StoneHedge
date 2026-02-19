/obj/item/clothing/shirt/dress/stewarddress/townhall
	name = "rich dress"
	desc = "A rich black dress with shining bronze buttons."
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/shirt/clothvest/colored/townhall
	color = CLOTHING_BLACK

/obj/item/clothing/shirt/robe/colored/moon_acolyte
	color = "#62656C"

/obj/item/clothing/shirt/undershirt/lowcut/colored
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/shirt/undershirt/lowcut/colored/black
	color = CLOTHING_BLACK

/obj/item/clothing/shirt/clothvest/colored/waterdeep_guild
	color = "#50638B"

/obj/item/clothing/shirt/dress/silkdress/colored/waterdeep_guild
	color = "#50638B"

/obj/item/clothing/shirt/dress/gen/sexy/colored
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/shirt/dress/gen/sexy/colored/black
	color = CLOTHING_BLACK

/obj/item/clothing/shirt/robe/colored/random/Initialize()
	color = pick_assoc(GLOB.noble_dyes)
	return ..()

/obj/item/clothing/shirt/undershirt/easttats/exiled
	name = "Tribal Tattoos"
	desc = "Detailed tribal tattoos carved upon half-orc warriors to inspire courage within those who bear them, always on proud display to the world."
	prevent_crits = null
	resistance_flags = INDESTRUCTIBLE
	misc_flags = CRAFTING_TEST_EXCLUDE

/obj/item/clothing/shirt/undershirt/sash/colored/sembian
	color = CLOTHING_MAGE_BLUE

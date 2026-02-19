/obj/item/clothing/gloves/leather/thaumgloves
	name = "alchemist gloves"
	desc = "Sturdy leather gloves treated to resist heat, spills, and harsh reagents. Commonly worn by alchemists."
	icon_state = "thaumgloves"
	item_state = "thaumgloves"
	icon = 'modular_rmh/icons/clothing/thaumgloves.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/onmob/thaumgloves.dmi'

/datum/repeatable_crafting_recipe/leather/standalone/gloves/thaumgloves
	name = "alchemist gloves"
	output = /obj/item/clothing/gloves/leather/thaumgloves
	attacked_atom = /obj/item/clothing/gloves/leather
	requirements = list(/obj/item/clothing/gloves/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/supply_pack/apparel/thaumgloves
	name = "Alchemist Gloves"
	cost = 35
	contains = /obj/item/clothing/gloves/leather/thaumgloves

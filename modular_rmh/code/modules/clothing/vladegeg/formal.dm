/obj/item/clothing/shirt/undershirt/blouse
	name = "blouse"
	desc = "A finely tailored blouse made from soft, lightweight fabric, with delicate buttons and subtly decorated cuffs."
	icon_state = "blouse"
	icon = 'modular_rmh/icons/clothing/vladegeg/formal.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/formal.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/formal_sleeves.dmi'

/datum/repeatable_crafting_recipe/sewing/weaving/blouse
	name = "blouse"
	output = /obj/item/clothing/shirt/undershirt/blouse
	requirements = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 2)
	craftdiff = 4

/obj/item/clothing/pants/skirt/pencil
	name = "pencil skirt"
	desc = "A fitted skirt tailored to follow the line of the legs, narrowing toward the hem."
	icon = 'modular_rmh/icons/clothing/vladegeg/formal.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/formal.dmi'
	icon_state = "skirt"
	item_state = "skirt"
	ignore_sleeves_code = TRUE // No sleeves, otherwise arms will be over the sprite
	nodismemsleeves = TRUE
	sleevetype = null
	sleeved = null

/datum/repeatable_crafting_recipe/sewing/pencil
	name = "pencil skirt"
	output = /obj/item/clothing/pants/skirt/pencil
	requirements = list(/obj/item/natural/cloth = 2,
			/obj/item/natural/fibers = 1)
	craftdiff = 2
	category = "Pants"

/obj/item/clothing/pants/skirt/pencil/colored
	icon_state = "skirt_color"
	item_state = "skirt_color"

/datum/repeatable_crafting_recipe/sewing/pencil_color
	name = "colorable pencil skirt"
	output = /obj/item/clothing/pants/skirt/pencil/colored
	requirements = list(/obj/item/natural/cloth = 2,
			/obj/item/natural/fibers = 1)
	craftdiff = 2
	category = "Pants"

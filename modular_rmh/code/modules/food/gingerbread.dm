/datum/container_craft/oven/gingerbread
	name = "Gingerbread Pastry"
	requirements = list(/obj/item/reagent_containers/food/snacks/butterdough_slice = 1, /obj/item/reagent_containers/food/snacks/produce/sugarcane = 1)
	output = /obj/item/reagent_containers/food/snacks/gingerbread
	cooked_smell = /datum/pollutant/food/pastry
	isolation_craft = TRUE

/obj/item/reagent_containers/food/snacks/gingerbread
	name = "gingerbread pastry"
	desc = "Beautiful and tasty festive cookies."
	icon = 'modular_rmh/icons/obj/food/cookides.dmi'
	icon_state = "cookie1"
	base_icon_state = "cookie1"
	biting = FALSE
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("sweet butterdough" = 1)
	rotprocess = SHELFLIFE_EXTREME

/obj/item/reagent_containers/food/snacks/gingerbread/Initialize(mapload)
	. = ..()
	var/num = rand(1,2)
	icon_state = "cookie[num]"

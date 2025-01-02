
/obj/item/reagent_containers/food/snacks/rogue/honey
	name = "honeycomb"
	desc = "Golden honey rich with the aroma of floral nectar."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "honey"
	bitesize = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/honey = 5)
	grind_results = list(/datum/reagent/consumable/honey = 10)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("sweetness and light" = 1)
	eat_effect = null
	rotprocess = null
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/mead
	distill_amt = 20

/obj/item/reagent_containers/food/snacks/rogue/onionslice
	name = "slice of onion"
	desc = "It makes you cry thinking about it."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "onionslice"
	bitesize = 3
	rotprocess = 20 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/tearjuice = 1)
	grind_results = list(/datum/reagent/consumable/tearjuice = 1)

/obj/item/reagent_containers/food/snacks/rogue/tomatoslice
	name = "slice of tomato"
	desc = "It makes you cry thinking about it."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "tomatoslice"
	bitesize = 3
	rotprocess = 20 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/tomatojuice = 1)
	grind_results = list(/datum/reagent/consumable/tomatojuice = 1)

/obj/item/reagent_containers/food/snacks/grown/sauerkraut
	name = "grenzelkraut"
	desc = "Known simply as 'sauerkraut' to the Grenzelhoftians, this smelly fermented cabbage goes good on dogrolls."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "sauerkraut"
	bitesize = 3
	rotprocess = null
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/sodiumchloride = 3)

/obj/item/reagent_containers/food/snacks/grown/westspice
	name = "western herbs"
	desc = "Herbs that can be found in the western hemisphere - a little less exotic, a lot more affordable, but still tasty."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "westernspice"
	bitesize = 3
	rotprocess = null
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)

/obj/item/reagent_containers/food/snacks/grown/eastspice
	name = "eastern spices"
	desc = "Herbs that have to be imported from the other side of the globe - expensive and flavorful."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "easternspice"
	bitesize = 3
	rotprocess = null
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)

/obj/item/reagent_containers/food/snacks/grown/cucumberjar
	name = "jar of pickling cucumbers"
	desc = "A jar of cucumbers that is currently pickling. Don't eat them until they're ready!"
	bitesize = 0
	icon_state = "cucumberjar"
	rotprocess = 20 MINUTES
	become_rot_type = /obj/item/storage/belt/rogue/pickles

/obj/item/reagent_containers/food/snacks/grown/pickle
	name = "pickle"
	desc = "It has a nice crunch to it."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "pickle"
	bitesize = 3
	rotprocess = null
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	w_class = WEIGHT_CLASS_SMALL

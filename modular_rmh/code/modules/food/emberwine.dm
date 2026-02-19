/obj/item/reagent_containers/glass/bottle/beer/emberwine
	list_reagents = list(/datum/reagent/consumable/ethanol/beer/emberwine = 24)
	desc = "A bottle with an unmarked, tannin-tinted cork-seal. Zybantu red or another such cheap wine, in all likelihood."

/datum/supply_pack/food/drinks/emberwine
	name = "emberwine"
	cost = 25
	contains = /obj/item/reagent_containers/glass/bottle/beer/emberwine

/datum/alch_cauldron_recipe/emberwine
	recipe_name = "Emberwine"
	smells_like = "sweetness"
	output_reagents = list(/datum/reagent/consumable/ethanol/beer/emberwine = 20)
	required_essences = list(
		/datum/thaumaturgical_essence/chaos = 2,
		/datum/thaumaturgical_essence/life = 2,
		/datum/thaumaturgical_essence/fire = 2,
	)

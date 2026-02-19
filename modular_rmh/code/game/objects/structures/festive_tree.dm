
/obj/structure/flora/tree/fir
	name = "fir tree"
	desc = ""
	icon = 'modular_rmh/icons/obj/structures/firs.dmi'
	icon_state = "elka"
	base_icon_state = "elka"
	num_random_icons = 0
	density = TRUE
	max_integrity = 100
	static_debris = list(/obj/item/grown/log/tree = 2)
	stump_type = /obj/structure/flora/tree/stump/pine/fir

/obj/structure/flora/tree/fir/burn()
	new /obj/structure/flora/tree/fir/dead(get_turf(src))
	qdel(src)

/obj/structure/flora/tree/fir/dead
	name = "burnt fir tree"
	icon = 'icons/obj/flora/pines.dmi'
	icon_state = "dead1"
	base_icon_state = "dead"
	num_random_icons = 3
	max_integrity = 50
	static_debris = list(/obj/item/ore/coal/charcoal = 1)
	resistance_flags = FIRE_PROOF
	stump_type = /obj/structure/flora/tree/stump/pine/fir

/obj/structure/flora/tree/stump/pine/fir
	name = "fir stump"
	desc = "Someone doesn't like the holidays..."

/obj/structure/flora/tree/fir/snowy
	icon_state = "elka_n"

/obj/structure/flora/tree/fir/festive
	icon_state = "elka_ng"
	name = "festive fir"
	desc = "Oh festive tree, oh festive tree..."

/obj/structure/flora/tree/fir/festive_snowy
	icon_state = "elka_ng2"
	name = "snowy festive fir"
	desc = "Oh festive tree, oh festive tree..."

/datum/blueprint_recipe/carpentry/festive_fir
	name = "festive tree"
	desc = "A beautifully decorated festive fir tree. Don't ask how you're building a tree from scratch."
	result_type = /obj/structure/flora/tree/fir/festive
	required_materials = list(
		/obj/item/grown/log/tree/small = 4,
		/obj/item/grown/log/tree = 1,
	)
	supports_directions = FALSE
	craftdiff = 0

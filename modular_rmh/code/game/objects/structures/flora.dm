
/obj/structure/flora/shroom_tree/happy
	name = "underdark mushroom"
	icon_state = "happymush1"
	icon = 'modular_rmh/icons/obj/structures/foliagetall.dmi'
	desc = "Mushrooms might be the happiest beings in this god forsaken place."

/obj/structure/flora/shroom_tree/happy/mushroom2
	icon_state = "happymush2"

/obj/structure/flora/shroom_tree/happy/mushroom3
	icon_state = "happymush3"

/obj/structure/flora/shroom_tree/happy/mushroom4
	icon_state = "happymush4"

/obj/structure/flora/shroom_tree/happy/mushroom5
	icon_state = "happymush5"

/obj/structure/flora/shroom_tree/happy/random

/obj/structure/flora/shroom_tree/happy/random/Initialize()
	. = ..()
	icon_state = "happymush[rand(1,5)]"

/obj/structure/flora/shroom_tree/happy/New(loc)
	..()
	set_light(3, 3, 3, l_color ="#5D3FD3")

//bushes
/obj/structure/flora/bush
	name = "bush"
	desc = ""
	icon = 'icons/obj/flora/snowflora.dmi'
	icon_state = "snowbush1"
	anchored = TRUE

/obj/structure/flora/bush/Initialize()
	icon_state = "snowbush[rand(1, 6)]"
	. = ..()

//Jungle grass

/obj/structure/flora/grass/jungle
	name = "jungle grass"
	desc = ""
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa"


/obj/structure/flora/grass/jungle/Initialize()
	icon_state = "[icon_state][rand(1, 5)]"
	. = ..()

/obj/structure/flora/grass/jungle/b
	icon_state = "grassb"

//Jungle bushes

/obj/structure/flora/junglebush
	name = "bush"
	desc = ""
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha"

/obj/structure/flora/junglebush/Initialize()
	icon_state = "[icon_state][rand(1, 3)]"
	. = ..()

/obj/structure/flora/junglebush/b
	icon_state = "bushb"

/obj/structure/flora/junglebush/c
	icon_state = "bushc"

/obj/structure/flora/junglebush/large
	icon_state = "bush"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	pixel_x = -16
	pixel_y = -12
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/flora/grass/bush/wall/green
	name = "green great bush"
	icon = 'modular_rmh/icons/obj/flora/greenflora.dmi'
	icon_state = "bushwall_green1"
	base_icon_state = "bushwall_green"

/obj/structure/flora/grass/bush/green
	name = "green bush"
	icon = 'modular_rmh/icons/obj/flora/greenflora.dmi'
	icon_state = "bush_green"

/obj/structure/flora/grass/bush/wall/tall/green
	name = "green great bush"
	icon = 'modular_rmh/icons/obj/flora/foliagetall.dmi'
	icon_state = "tallbush_green1"
	base_icon_state = "tallbush_green"

/obj/structure/flora/grass/bush_meagre/green
	name = "green bush"
	icon = 'modular_rmh/icons/obj/flora/greenflora.dmi'
	icon_state = "bush_green1"
	base_icon_state = "bush_green1"

/obj/structure/flora/grass/bush_meagre/green2
	name = "green bush"
	icon = 'modular_rmh/icons/obj/flora/greenflora.dmi'
	icon_state = "bush_green2"
	base_icon_state = "bush_green2"

/obj/structure/flora/grass/bush_meagre/green3
	name = "green bush"
	icon = 'modular_rmh/icons/obj/flora/greenflora.dmi'
	icon_state = "bush_green3"
	base_icon_state = "bush_green3"

/obj/structure/flora/mushroomcluster
	name = "mushroom cluster"
	desc = "A cluster of mushrooms native to the underdark."
	icon = 'modular_rmh/icons/obj/flora/foliage.dmi'
	icon_state = "mushroomcluster"
	density = TRUE

/obj/structure/flora/mushroomcluster/New(loc)
	..()
	set_light(1.5, 1.5, 1.5, l_color ="#5D3FD3")

/obj/structure/flora/tinymushrooms
	name = "small mushroom cluster"
	desc = "A cluster of tiny mushrooms native to the underdark."
	icon = 'modular_rmh/icons/obj/flora/foliage.dmi'
	icon_state = "tinymushrooms"

/obj/structure/flora/grass/brown
	icon_state = "snowgrass1bb"
	icon = 'modular_rmh/icons/obj/flora/snowflora.dmi'

/obj/structure/flora/grass/brown/Initialize()
	icon_state = "snowgrass[rand(1, 3)]bb"
	. = ..()

/obj/structure/flora/grass/green
	icon_state = "snowgrass1gb"
	icon = 'modular_rmh/icons/obj/flora/snowflora.dmi'

/obj/structure/flora/grass/green/Initialize()
	icon_state = "snowgrass[rand(1, 3)]gb"
	. = ..()

/obj/structure/flora/grass/both
	icon_state = "snowgrassall1"
	icon = 'modular_rmh/icons/obj/flora/snowflora.dmi'

/obj/structure/flora/grass/both/Initialize()
	icon_state = "snowgrassall[rand(1, 3)]"
	. = ..()

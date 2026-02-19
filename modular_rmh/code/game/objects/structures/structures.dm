/obj/structure/window/harem1
	name = "harem window"
	icon = 'modular_rmh/icons/obj/structures/roguewindow.dmi'
	icon_state = "harem1-solid"

/obj/structure/window/harem2
	name = "harem window"
	icon = 'modular_rmh/icons/obj/structures/roguewindow.dmi'
	icon_state = "harem2-solid"
	opacity = TRUE

/obj/structure/window/harem3
	name = "harem window"
	icon = 'modular_rmh/icons/obj/structures/roguewindow.dmi'
	icon_state = "harem3-solid"

/obj/structure/door/viewport/stone
	desc = "stone door"
	icon_state = "stone"
	max_integrity = 1500
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	broken_repair = /obj/item/natural/stone

/obj/structure/door/viewport/stone/broken
	desc = "A broken stone door from an era bygone. A new one must be constructed in its place."
	icon_state = "stonebr"
	density = 0
	opacity = 0
	max_integrity = 150
	obj_broken = 1

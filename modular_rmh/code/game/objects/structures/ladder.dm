/obj/structure/ladder/hatch
	name = "ladder trapdoor"
	desc = ""
	icon = 'modular_rmh/icons/obj/structures/hatch.dmi'
	icon_state = "hatch"

/obj/structure/ladder/hatch/update_icon()
	. = ..()
	if(up && down)
		icon = 'icons/roguetown/misc/structure.dmi'
		icon_state = "ladder11"

	else if(up)
		icon = 'icons/roguetown/misc/structure.dmi'
		icon_state = "ladder10"

	else if(down)
		icon = 'modular_rmh/icons/obj/structures/hatch.dmi'
		icon_state = "hatch"

	else	//wtf make your ladders properly assholes
		icon = 'icons/roguetown/misc/structure.dmi'
		icon_state = "ladder00"

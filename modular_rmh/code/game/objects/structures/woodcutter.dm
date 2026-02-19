/obj/structure/fluff/woodcutter
	name = "wood cutter"
	desc = "Steadily hums when operated, a massive blade to cut the wood."
	icon = 'modular_rmh/icons/obj/structures/woodcutter.dmi'
	icon_state = "woodcutter"
	density = TRUE
	anchored = FALSE
	blade_dulling = DULLING_BASH
	max_integrity = 300

/obj/structure/fluff/woodcutter/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/grown/log/tree))
		var/skill_level = user.get_skill_level(/datum/skill/craft/carpentry)
		var/wood_time = (40 - (skill_level * 5))
		icon_state = "woodcutter_cut"
		update_icon()
		playsound(src, pick('sound/misc/slide_wood (2).ogg', 'sound/misc/slide_wood (1).ogg'), 100, FALSE)
		if(do_after(user, wood_time, target = src))
			if(istype(I, /obj/item/grown/log/tree/small))
				new /obj/item/natural/wood/plank(get_turf(src))
				new /obj/item/natural/wood/plank(get_turf(src))
			else
				new /obj/item/natural/wood/plank(get_turf(src))
				new /obj/item/natural/wood/plank(get_turf(src))
				new /obj/item/natural/wood/plank(get_turf(src))
				new /obj/item/natural/wood/plank(get_turf(src))
			user.mind.add_sleep_experience(/datum/skill/craft/carpentry, (user.STAINT*0.5))
			icon_state = "woodcutter"
			update_icon()
			qdel(I)
			return
	. = ..()

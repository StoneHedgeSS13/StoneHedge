//By DREAMKEEP, Vide Noir https://github.com/EaglePhntm.
//SOURCE IMAGES CREATED USING CIVITAI, PONY DIFFUSION XL WITH DARKEST DUNGEON LORA.
//SPRITES MADE ON PAINT.NET AND IMPORTED TO DMI

/obj/structure/fluff/statue/lewd
	name = "lewd statue"
	desc = "Who made those..?"
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/roguetown/misc/tallstructure.dmi'
	icon_state = "lewd1"

/obj/structure/fluff/statue/lewd/random/Initialize(mapload)
	. = ..()
	icon_state = "lewd[rand(8)]"

/obj/structure/fluff/statue/lewd/two
	icon_state = "lewd2"

/obj/structure/fluff/statue/lewd/two/c
	icon_state = "lewd2_c"

/obj/structure/fluff/statue/lewd/three
	icon_state = "lewd3"

/obj/structure/fluff/statue/lewd/three/c
	icon_state = "lewd3_c"

/obj/structure/fluff/statue/lewd/four
	icon_state = "lewd4"
	desc = "Who made those..? It leaks... a strange, never ending slimy liquid... Yet it doesn't seem to stain anything, I could even wash here, barely."
	//sterile cause we dont want people impregnating themselves with it.
	var/fountain_reagent = /datum/reagent/consumable/cum/sterile
	var/severed_reagent = /datum/reagent/consumable/cum/sterile/old

/obj/structure/fluff/statue/lewd/four/attackby(obj/item/C, mob/user, params)
	if(user.used_intent.type == INTENT_FILL)
		if(C.reagents)
			if(C.reagents.holder_full())
				to_chat(user, span_warning("[C] is full."))
				return
			if(do_after(user, 8, target = src))
				user.changeNext_move(CLICK_CD_MELEE)
				playsound(user, 'sound/foley/drawwater.ogg', 100, FALSE)
				var/list/L = list()
				L[severed_reagent] = 100
				C.reagents.add_reagent_list(L)
				to_chat(user, span_notice("I fill [C] from [src]."))
				to_chat(user, span_notice("The slimy liquid seems to have lost it's preservation without the statue housing it, it's old and moldy in [C]..."))
			return
	. = ..()

/obj/structure/fluff/statue/lewd/four/attack_right(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(L.stat != CONSCIOUS)
			return
		var/list/wash = list('sound/foley/waterwash (1).ogg','sound/foley/waterwash (2).ogg')
		playsound(user, pick_n_take(wash), 100, FALSE)
		var/item2wash = user.get_active_held_item()
		if(!item2wash)
			user.visible_message(span_info("[user] starts to wash in [src]."))
			to_chat(user, span_info("The slimy liquid is hard to work with but it cleans almost like water..."))
			if(do_after(L, 30, target = src))
				wash_atom(user, CLEAN_MEDIUM)
				playsound(user, pick(wash), 100, FALSE)
		else
			user.visible_message(span_info("[user] starts to wash [item2wash] in [src]."))
			to_chat(user, span_info("The slimy liquid is hard to work with but it cleans almost like water..."))

			if(do_after(L, 30, target = src))
				wash_atom(item2wash, CLEAN_MEDIUM)
				playsound(user, pick(wash), 100, FALSE)
		return
	..()

/obj/structure/fluff/statue/lewd/four/onbite(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(L.stat != CONSCIOUS)
			return
		if(iscarbon(user))
			var/mob/living/carbon/C = user
			if(C.is_mouth_covered())
				return
		playsound(user, pick('sound/foley/waterwash (1).ogg','sound/foley/waterwash (2).ogg'), 100, FALSE)
		user.visible_message(span_info("[user] starts to drink from [src]."))
		if(do_after(L, 25, target = src))
			var/list/fountl = list()
			fountl[fountain_reagent] = 14
			var/datum/reagents/reagents = new()
			reagents.add_reagent_list(fountl)
			reagents.trans_to(L, reagents.total_volume, transfered_by = user, method = INGEST)
			playsound(user,pick('sound/items/drink_gen (1).ogg','sound/items/drink_gen (2).ogg','sound/items/drink_gen (3).ogg'), 100, TRUE)
		return
	..()

/obj/structure/fluff/statue/lewd/four/c
	icon_state = "lewd4_c"

/obj/structure/fluff/statue/lewd/five
	icon_state = "lewd5"

/obj/structure/fluff/statue/lewd/five/c
	icon_state = "lewd5_c"

/obj/structure/fluff/statue/lewd/six
	icon_state = "lewd6"

/obj/structure/fluff/statue/lewd/six/c
	icon_state = "lewd6_c"

/obj/structure/fluff/statue/lewd/seven
	icon_state = "lewd7"

/obj/structure/fluff/statue/lewd/seven/c
	icon_state = "lewd7_c"

/obj/structure/fluff/statue/lewd/eight
	icon_state = "lewd8"

/obj/structure/fluff/statue/lewd/eight/c
	icon_state = "lewd8_c"

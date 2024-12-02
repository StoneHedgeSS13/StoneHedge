
/obj/structure/flora/wildherb //This is an example of
	name = "wild herbs"
	desc = "A growing cluster of medicinal herbs."
	icon = 'icons/obj/flora/herbalflora.dmi'
	anchored = 1
	density = 0
	var/has_plod = TRUE
	var/produce = /obj/item/reagent_containers/food/snacks/grown
	var/timer = 30 MINUTES

/obj/structure/flora/wildherb/attack_hand(mob/user)
	if(!ispath(produce))
		return ..()

	if(has_plod)
		var/obj/item/product = new produce
		if(!istype(product))
			return //Something fucked up here or it's a weird product
		user.put_in_hands(product)
		to_chat(user, "<span class='notice'>You pluck [product] from [src].</span>")
		has_plod = FALSE
		update_icon() //Won't update due to proc otherwise
		timer = initial(timer)
		addtimer(CALLBACK(src, PROC_REF(regrow)),timer) //Set up the timer properly
	update_icon()

/obj/structure/flora/wildherb/proc/regrow()
	if(!QDELETED(src))
		has_plod = TRUE
		update_icon()

/obj/structure/flora/wildherb/update_icon()
	if(has_plod)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]_harvested"

/obj/structure/flora/wildherb/nettle // This is an example of how the rest should be structured. Remember to add their produce type to produce.dm!
	name = "stinging nettle"
	icon_state = "nettle"
	desc = "Though its leaves are covered with stinging, toxic barbs, the stinging nettle is, ironically, useful to alchemists for making paultices that reduce the severity of painful bruising."
	produce = /obj/item/reagent_containers/food/snacks/grown/rogue/nettle



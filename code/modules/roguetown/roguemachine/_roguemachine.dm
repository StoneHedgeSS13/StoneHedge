/obj/structure/roguemachine
	destroy_sound = 'sound/foley/breaksound.ogg'
	break_sound = 'sound/foley/machinebreak.ogg'
	anchored = TRUE
	max_integrity = 0
	var/reject_grove_marked = TRUE

/obj/structure/roguemachine/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	if(HAS_TRAIT(H, TRAIT_GROVE_MARKED) && reject_grove_marked)
		to_chat(H, span_warning("The machine rejects you, sensing the Breuddwyd Grove's mark of judgment upon you."))
		return TRUE

/obj/structure/roguemachine/attackby(obj/item/P, mob/user, params)
	if(!ishuman(user))
		return ..()

	var/mob/living/carbon/human/H = user
	if(HAS_TRAIT(H, TRAIT_GROVE_MARKED) && reject_grove_marked)
		to_chat(H, span_warning("The machine rejects you, sensing the Breuddwyd Grove's mark of judgment upon you."))
		return
	return ..()

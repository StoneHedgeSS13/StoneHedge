/proc/get_dildo_in_either_hand(mob/living/user)
	for(var/obj/item/thing in user.held_items)
		if(thing == null)
			continue
		if(!istype(thing, /obj/item/dildo))
			continue
		return thing
	return null

//for vampires etc
/proc/check_dildo_silver(mob/living/user)
	for(var/obj/item/thing in user.held_items)
		if(thing == null)
			continue
		if(istype(thing, /obj/item/dildo/silver))
			return TRUE
	return null

/proc/dildoburn(mob/living/user)
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			if(prob(25))
				to_chat(H, span_userdanger("THE SILVER SIZZLES AGAINST MY INSIDES!"))
			H.adjustFireLoss(10)
			if(prob(5))
				H.fire_act(1,2)
				H.freak_out()
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				if(prob(15))
					to_chat(H, span_userdanger("The silver feels spicy inside."))
				H.adjustFireLoss(3) //non immune vampire lord
		if(W && W.transformed == TRUE)
			if(prob(25))
				to_chat(H, span_userdanger("THE SILVER SIZZLES AGAINST MY INSIDES!"))
			H.adjustFireLoss(5)
			if(prob(5))
				H.fire_act(1,2)
				H.freak_out()

/proc/other_dildoburn(mob/living/user, mob/living/target)
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			if(prob(25))
				to_chat(H, span_userdanger("THE SILVER SIZZLES AGAINST MY INSIDES!"))
			H.adjustFireLoss(10)
			if(prob(5))
				H.fire_act(1,2)
				H.freak_out()
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				if(prob(15))
					to_chat(H, span_userdanger("The silver feels spicy inside."))
				H.adjustFireLoss(3) //non immune vampire lord
		if(W && W.transformed == TRUE)
			if(prob(25))
				to_chat(H, span_userdanger("THE SILVER SIZZLES AGAINST MY INSIDES!"))
			H.adjustFireLoss(5)
			if(prob(5))
				H.fire_act(1,2)
				H.freak_out()

#define MAX_TOY_SIZE WEIGHT_CLASS_HUGE
#define MAX_INSERT_SIZE WEIGHT_CLASS_BULKY

/proc/get_funobject_in_hand(mob/living/user)
	var/obj/item/thing = user.get_active_held_item()
	if(thing != null && thing.w_class < MAX_TOY_SIZE) //Anything smaller than this fucks the puss.
		return thing
	return null

/proc/get_insertable_in_hand(mob/living/user)
	var/obj/item/thing = user.get_active_held_item()
	if(thing != null && thing.w_class <= MAX_INSERT_SIZE) //Anything smaller than this goes in the puss.
		if(thing.w_class > (MAX_INSERT_SIZE-1) && (istype(thing, /obj/item/rogueweapon) || istype(thing, /obj/item/clothing))) //no weapons unless one less than insert size
			return null
		return thing
	return null

#undef MAX_TOY_SIZE
#undef MAX_INSERT_SIZE

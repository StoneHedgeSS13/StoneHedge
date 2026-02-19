//plug
/obj/item/dildo/plug
	name = "unfinished plug"
	desc = "You have to finish it first."
	icon = 'modular_rmh/icons/obj/lewd/plug.dmi'
	icon_state = "unfinished"
	item_state = "plug"
	lefthand_file = 'modular_rmh/icons/mob/lewd/items_lefthand.dmi'
	righthand_file = 'modular_rmh/icons/mob/lewd/items_righthand.dmi'
	slot_flags = 0
	w_class = WEIGHT_CLASS_TINY

/obj/item/dildo/plug/New()
	. = ..()
	name = "unfinished [dildo_material] plug"

/obj/item/dildo/plug/customize(mob/living/user)
	if(!can_custom)
		return FALSE
	if(src && !user.incapacitated() && in_range(user,src))
		size_choice = input(user, "Choose a size for your dildo.","Dildo Size") as null|anything in list("small", "medium", "big", "huge")
		if(src && size_choice && !user.incapacitated() && in_range(user,src))
			dildo_size = size_choice
			switch(dildo_size)
				if("small")
					pleasure = 4
				if("medium")
					pleasure = 6
				if("big")
					pleasure = 8
				if("huge")
					pleasure = 10
	update_appearance()
	//update_strapon()
	can_custom = FALSE
	return TRUE

/obj/item/dildo/plug/update_appearance()
	. = ..()
	icon_state = "plug_[dildo_size]"
	name = "[dildo_size] [dildo_material] plug"
	if(!istype(src, /obj/item/dildo/plug/gold) && !istype(src, /obj/item/dildo/plug/silver) && !istype(src, /obj/item/dildo/plug/stone) && !istype(src, /obj/item/dildo/plug/wood) && !istype(src, /obj/item/dildo/plug/glass)) //those will maintain desc, rest are randomized below.
		desc = pick("To keep a woman's contents within.","To shut a hole.","Redirector.","Suitable chair replacement.","Redirect to the correct path.","Keeps what's needed, within.")
	if(istype(src, /obj/item/dildo/plug/gold))
		desc = pick("Prevents royal accidents.","Royal hole preserver.","Shuts the wrong hole of royalty.","Best investment ever.")
/*
/obj/item/dildo/plug/update_strapon()
	var/obj/item/organ/genitals/penis/temp = new /obj/item/organ/genitals/penis
	temp.name = name
	icon_state = "plug_[dildo_size]"
	switch(dildo_size)
		if("small")
			temp.organ_size = DEFAULT_PENIS_SIZE-1
		if("medium")
			temp.organ_size = DEFAULT_PENIS_SIZE
		if("big")
			temp.organ_size = DEFAULT_PENIS_SIZE+1
		if("huge")
			temp.organ_size = DEFAULT_PENIS_SIZE+1 //huge doesnt exist in mobs
	temp.always_hard = TRUE
	temp.strapon = TRUE
	strapon = temp*/

/obj/item/dildo/plug/wood
	color = "#7D4033"
	resistance_flags = FLAMMABLE
	dildo_material = "wooden"
	sellprice = 1
	desc = "Watch for splinters."

/obj/item/dildo/plug/stone
	color = "#3f3f3f"
	dildo_material = "stone"
	sellprice = 3
	desc = "Same as putting a regular stone up a place, probably. Now comes in convenient shape?"

/obj/item/dildo/plug/iron
	color = "#909090"
	dildo_material = "iron"
	sellprice = 5

/obj/item/dildo/plug/copper
	color = "#a86918"
	dildo_material = "copper"
	sellprice = 8

/obj/item/dildo/plug/steel
	color = "#887e99"
	dildo_material = "steel"
	sellprice = 12

/obj/item/dildo/plug/silver
	color = "#ffffff"
	dildo_material = "silver"
	sellprice = 30
	desc = "Not recommended for vampires and verevolves in heat."
	last_used = 0

/obj/item/dildo/plug/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampire/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampire/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(V_lord)
			//if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("The silver sizzles in my hand..."))
			H.adjustFireLoss(15)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("The silver sizzles and burns my hand!"))
			H.adjustFireLoss(25)

/obj/item/dildo/plug/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 100)
		to_chat(user, span_notice("The silver needs more time to purify again."))
		return

	. = ..()
	if(ishuman(target))
		//var/mob/living/carbon/human/s_user = user
		var/mob/living/carbon/human/H = target
		var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
		var/datum/antagonist/vampire/Vp = H.mind.has_antag_datum(/datum/antagonist/vampire)
		//var/datum/antagonist/vampirelord/lesser/V = H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
		//var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(Vp)
			H.Stun(20)
			to_chat(H, span_userdanger("The silver burns me!"))
			H.adjustFireLoss(30)
			H.Paralyze(20)
			H.fire_act(1,4)
			H.apply_status_effect(/datum/status_effect/debuff/silver_bane)
			src.last_used = world.time
		/*if(V)
			if(V.disguised)
				H.Stun(20)
				H.visible_message("<font color='white'>The silver weapon manifests the [H] curse!</font>")
				to_chat(H, span_userdanger("The silver burns me!"))
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_bane)
				src.last_used = world.time
			else
				H.Stun(20)
				to_chat(H, span_userdanger("The silver burns me!"))
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_bane)
				src.last_used = world.time
		if(V_lord)
			if(V_lord.vamplevel < 4 && !V)
				if(V_lord.disguised)
					H.visible_message("<font color='white'>The silver weapon manifests the [H] curse!</font>")
				to_chat(H, span_userdanger("The silver burns me!"))
				H.Stun(10)
				H.adjustFireLoss(25)
				H.Paralyze(10)
				H.fire_act(1,4)
				src.last_used = world.time
			if(V_lord.vamplevel == 4 && !V)
				s_user.Stun(10)
				s_user.Paralyze(10)
				to_chat(s_user, "<font color='red'> The silver weapon fails!</font>")
				H.visible_message(H, span_userdanger("This feeble metal can't hurt me, I AM THE ANCIENT!"))*/
		if(W && W.transformed == TRUE)
			H.Stun(40)
			H.Paralyze(40)
			to_chat(H, span_userdanger("The silver burns me!"))
			src.last_used = world.time

/obj/item/dildo/plug/gold
	color = "#b38f1b"
	dildo_material = "golden"
	sellprice = 50

/obj/item/dildo/plug/glass
	color = "#9ffcff"
	dildo_material = "glass"
	sellprice = 5
	alpha = 123
	desc = "Similiar to putting a jar up where?"

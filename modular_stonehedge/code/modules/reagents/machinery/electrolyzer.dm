/* I cant get ui to work i dont know shit about tgui -vide
/obj/item/device/makeshift_electrolyser
	name = "alchemical seperator"
	desc = "An advanced dwarven alchemy machine used for seperation of chemicals."
	var/on = FALSE
	var/tick_cost = 3
	icon = 'icons/obj/chemical.dmi'
	color = "#b98620"
	icon_state = "smoke0"
	var/obj/item/reagent_containers/beaker
	var/obj/item/reagent_containers/separation_beaker


// returns FALSE on errors TRUE on success and -1 if nothing to do
/proc/electrolysis(var/obj/item/reagent_containers/primary_beaker, var/obj/item/reagent_containers/secondary_beaker, var/amount)
	if(!primary_beaker || !secondary_beaker)
		return FALSE
	//check if has reagents
	if(!primary_beaker.reagents.total_volume)
		return FALSE

	//check only one reagent present
	if(!primary_beaker.reagents.reagent_list.len > 1)
		return FALSE

	var/datum/reagent/active_reagent
	for(var/datum/reagent/R in primary_beaker.reagents.reagent_list)
		active_reagent = R
		break

	if(!istype(active_reagent))
		return -1

	var/volumeToHandle = min(primary_beaker.reagents.total_volume, amount)
	var/partVolume = volumeToHandle

	if((secondary_beaker.reagents.maximum_volume - secondary_beaker.reagents.total_volume) < volumeToHandle)
		return FALSE

	primary_beaker.reagents.trans_id_to(secondary_beaker, active_reagent, partVolume)
	return TRUE

/obj/item/device/makeshift_electrolyser/Destroy()
	QDEL_NULL(beaker)
	return ..()

/obj/item/device/makeshift_electrolyser/MouseDrop_T(atom/movable/C, mob/user, src_location, over_location, src_control, over_control, params)
	if(!Adjacent(user) || !C.Adjacent(user))
		return ..()
	if(istype(C, /obj/item/reagent_containers) && C.is_open_container() && (!beaker || !separation_beaker))
		. = TRUE //no afterattack
		var/obj/item/reagent_containers/B = C
		if(user.dropItemToGround(C))
			user.dropItemToGround(C)
			C.forceMove(src)
			C.add_fingerprint(user)
			if(!beaker)
				beaker = B
			else if(!separation_beaker)
				separation_beaker = B
			to_chat(user, span_notice("You add [B] to [src]."))
			SStgui.update_uis(src)
			return

/obj/item/device/makeshift_electrolyser/handle_atom_del(atom/A)
	..()
	if(A == beaker)
		beaker = null
		update_icon()

/obj/item/device/makeshift_electrolyser/proc/turn_on(mob/user)
	on = TRUE
	START_PROCESSING(SSobj, src)

/obj/item/device/makeshift_electrolyser/proc/turn_off(mob/user)
	on = FALSE
	STOP_PROCESSING(SSobj, src)
	SStgui.update_uis(src)

/obj/item/device/makeshift_electrolyser/process()
	. = ..()
	if(on)
		if(beaker && beaker.reagents.total_volume)
			var/state = electrolysis(beaker, separation_beaker, 2)
			if(!state || state == -1)
				turn_off()
			SStgui.update_uis(src)


/obj/item/device/makeshift_electrolyser/attack_self(mob/user as mob)
	user.set_machine(src)
	ui_interact(user)
	add_fingerprint(user)

/obj/item/device/makeshift_electrolyser/attackby(obj/item/C, mob/living/user)
	if(istype(C, /obj/item/reagent_containers) && C.is_open_container() && (!beaker || !separation_beaker))
		. = TRUE //no afterattack
		var/obj/item/reagent_containers/B = C
		if(!user.dropItemToGround(B, src))
			return
		if(!beaker)
			beaker = B
		else if(!separation_beaker)
			separation_beaker = B
		to_chat(user, span_notice("You add [B] to [src]."))
		SStgui.update_uis(src)
		return
	return ..()

/obj/item/device/makeshift_electrolyser/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null)
	var/list/data = ui_data()

	// update the ui if it exists, returns null if no ui is passed/found
	ui = SStgui.try_update_ui(user, src, ui_key, data)
	if (!ui)
		// the ui does not exist, so we'll create a new() one
        // for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "electrolyzer.tmpl", name, 550, 400)
		// when the ui is first opened this is the data it will use
		ui.reinitialize(data)
		// open the new ui window
		ui.open()

/obj/item/device/makeshift_electrolyser/ui_data()
	var/data = list()
	data["on"] = on

	if(beaker)
		data["beaker"] = beaker.reagents.ui_data()
	if(separation_beaker)
		data["separation_beaker"] = separation_beaker.reagents.ui_data()
	return data

/obj/item/device/makeshift_electrolyser/attack_hand(mob/user)
	if(loc != user && ..())
		return TRUE
	user.set_machine(src)
	ui_interact(user)

/obj/item/device/makeshift_electrolyser/Topic(href, href_list)
	if(..())
		return

	if(href_list["turn_on"])
		turn_on()

	if(href_list["turn_off"])
		turn_off()

	if(href_list["eject"] && beaker)
		turn_off()
		if(beaker)
			beaker.forceMove(get_turf(src))
			beaker = null

	if(href_list["ejectSecondary"] && separation_beaker)
		turn_off()
		if(separation_beaker)
			separation_beaker.forceMove(get_turf(src))
			separation_beaker = null

	return 1 // update UIs attached to this object
*/

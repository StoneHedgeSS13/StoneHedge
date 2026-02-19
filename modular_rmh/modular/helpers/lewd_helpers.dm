//this would go to surgery helpers normally.
/proc/get_organ_blocker(mob/user, location = BODY_ZONE_CHEST)
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		for(var/obj/item/clothing/equipped_item in carbon_user.get_equipped_items(include_pockets = FALSE))
			if(zone2covered(location, equipped_item.body_parts_covered))
				//skips bra items if the location we are looking at is groin
				if(equipped_item.is_bra && location == BODY_ZONE_PRECISE_GROIN)
					continue
				return equipped_item

/obj/item/clothing/armor
	flags_inv = HIDEBOOB|HIDEBELLY|HIDEUNDIESTOP|HIDEUNDIESBOT

/obj/item/clothing/pants
	flags_inv = HIDEBUTT|HIDECROTCH|HIDEUNDIESBOT

/obj/item/clothing/shirt
	flags_inv = HIDEBUTT|HIDEBOOB|HIDEBELLY|HIDEUNDIESTOP

/obj/item
	var/genital_access = FALSE
	///for bra only body armors that allow groin interactions.
	var/is_bra = FALSE

/obj/item/organ/genitals
	var/visible_through_clothes = FALSE

//we handle all of this here because cant timer another goddamn thing from here correctly.
/obj/item/organ/genitals/filling_organ/vagina/proc/be_impregnated()
	if(!owner)
		return
	if(owner.stat == DEAD)
		return
	if(owner.has_quirk(/datum/quirk/peculiarity/selfawaregeni))
		to_chat(owner, span_love("I feel a surge of warmth in my [src.name], I’m definitely pregnant!"))
	reagents.maximum_volume *= 0.5 //ick ock, should make the thing recalculate on next life tick.
	pregnant = TRUE
	if(owner.getorganslot(ORGAN_SLOT_BREASTS)) //shitty default behavior i guess, i aint gonna customiza-ble this fuck that.
		var/obj/item/organ/genitals/filling_organ/breasts/breasties = owner.getorganslot(ORGAN_SLOT_BREASTS)
		if(!breasties.refilling)
			breasties.refilling = TRUE
			to_chat(owner, span_love("I feel damp warmness on my nipples, I'm definitely leaking milk..."))
	if(owner.getorganslot(ORGAN_SLOT_BELLY)) //shitty default behavior i guess, i aint gonna customiza-ble this fuck that.
		var/obj/item/organ/genitals/belly/belly = owner.getorganslot(ORGAN_SLOT_BELLY)
		pre_pregnancy_size = belly.organ_size
		addtimer(CALLBACK(src, PROC_REF(handle_preggoness)), 3 HOURS, TIMER_STOPPABLE)

/obj/item/organ/genitals/filling_organ/vagina/proc/undo_preggoness()
	if(!pregnant)
		return
	deltimer(preggotimer)
	pregnant = FALSE
	to_chat(owner, span_love("I feel my [src] shrink to how it was before. Pregnancy is no more."))
	if(owner.getorganslot(ORGAN_SLOT_BELLY))
		var/obj/item/organ/genitals/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
		bellyussy.organ_size = pre_pregnancy_size
	owner.update_body_parts(TRUE)

/obj/item/organ/genitals/filling_organ/vagina/proc/handle_preggoness()
	if(owner.getorganslot(ORGAN_SLOT_BELLY))
		var/obj/item/organ/genitals/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
		if(bellyussy.organ_size < BELLY_SIZE_SMALL) //yes it only grows one size, maybe change later
			if(prob(30))
				to_chat(owner, span_love("I notice my belly has grown due to pregnancy...")) //dont need to repeat this probably if size cant grow anyway.
				bellyussy.organ_size = bellyussy.organ_size + 1
				owner.update_body_parts(TRUE)
			preggotimer = addtimer(CALLBACK(src, PROC_REF(handle_preggoness)), 3 HOURS, TIMER_STOPPABLE)
		else
			deltimer(preggotimer)

/mob/living/carbon/verb/toggle_genitals()
	set category = "IC"
	set name = "Expose/Hide genitals"
	set desc = "Allows you to toggle which genitals should show through clothes or not."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can toggle genitals visibility right now..."))
		return

	var/list/genital_list = list()
	for(var/obj/item/organ/G in internal_organs)
		if(G.visible_organ \
			&& !istype(G, /obj/item/organ/eyes) \
			&& !istype(G, /obj/item/organ/ears) \
			&& !istype(G, /obj/item/organ/genitals/filling_organ/anus))
			genital_list += G

	if(!genital_list.len)
		return

	//Full list of exposable genitals created
	var/obj/item/organ/genitals/picked_organ
	picked_organ = input(src, "Choose which genitalia to expose/hide", "Expose/Hide genitals") \
		as null|anything in genital_list

	if(!picked_organ \
		|| QDELETED(picked_organ) \
		|| stat != CONSCIOUS \
		|| picked_organ.owner != src \
		|| !(picked_organ in internal_organs))
		return

	var/vis_type = input(src, "How will it be shown?", "Expose/Hide genitals") \
		in list("Hidden", "Show Under clothes", "Show Above clothes")

	// Re-validate again after yield
	if(!picked_organ \
		|| QDELETED(picked_organ) \
		|| stat != CONSCIOUS \
		|| picked_organ.owner != src \
		|| !(picked_organ in internal_organs))
		return

	picked_organ.toggle_visibility(vis_type)

/obj/item/organ/genitals/proc/toggle_visibility(vis_type)
	switch(vis_type)
		if("Show Under clothes")
			visible_through_clothes = TRUE
		if("Show Above clothes")
			visible_through_clothes = DRAW_ABOVE
		else
			visible_through_clothes = FALSE
	if(owner)
		owner.regenerate_icons()


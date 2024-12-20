/obj/item/organ/filling_organ
	name = "self filling organ"

	//self generating liquid stuff, dont use with absorbing stuff
	var/storage_per_size = 10 //added per organ size
	var/datum/reagent/reagent_to_make = /datum/reagent/consumable/nutriment //naturally generated reagent
	var/refilling = FALSE //slowly refills when not hungry
	var/reagent_generate_rate = HUNGER_FACTOR //with refilling
	var/hungerhelp = FALSE //if refilling, absorbs reagent_to_make as nutrients if hungry. Conversion is to nutrients direct even if you brew poison in there.
	var/uses_nutrient = TRUE //incase someone for some reason wanna make an OP paradox i guess.
	var/organ_sizeable = FALSE //if organ can be resized in prefs etc, SET THIS RIGHT, IT'S IMPORTANT.
	var/max_reagents = 30 //use if organ not sizeable, it auto calculates with sizeable organs and uses it as a base.
	var/startsfilled = FALSE

	//absorbing etc content liquid stuff, non self generated.
	var/absorbing = FALSE //absorbs liquids within slowly. Wont absorb reagent_to_make type, refilling and hungerhelp are irrelevant to this.
	var/absorbrate = 1 //refilling and hungerhelp are irrelevant to this, each life tick. NO LESS THAN 1 DIGESTS RIGHT.
	var/absorbmult = 1.25 //for a longer absorbtion time it's probably fine to have more.
	var/driprate = 0.1
	var/spiller = FALSE //toggles if it will spill its contents when not plugged.
	var/blocker = ITEM_SLOT_SHIRT //pick an item slot
	var/processspeed = 5 SECONDS//will apply the said seconds cooldown each time before any spill or absorb happens.

	//pregnancy vars
	var/fertility = FALSE //can it be impregnated
	var/pregnant = FALSE // is it pregnant
	var/preggotimer //dumbass timer
	var/pre_pregnancy_size = 0
	var/obj/item/organ/belly/pregnantaltorgan = null //change to switch which organ grows from pregnancy of this one. 

	//misc
	var/list/altnames = list("bugged place", "bugged organ") //used in thought messages.
	COOLDOWN_DECLARE(liquidcd)

/obj/item/organ/filling_organ/Insert(mob/living/carbon/M, special, drop_if_replaced) //update size cap n shit on insert
	. = ..()
	if(organ_sizeable)
		max_reagents = rand(1,5) + storage_per_size + storage_per_size * organ_size
	create_reagents(max_reagents)
	if(!refilling)
		startsfilled = FALSE
	if(special && startsfilled) // won't fill the organ if you insert this organ via surgery
		reagents.add_reagent(reagent_to_make, reagents.maximum_volume)

/obj/item/organ/filling_organ/on_life()
	var/mob/living/carbon/human/H = owner

	..()

	//updates size caps
	if(!issimple(H) && H.mind)
		var/athletics = H.mind?.get_skill_level(/datum/skill/misc/athletics)
		var/captarget = max_reagents+(athletics*4)
		if(damage)
			captarget -= damage
		if(contents.len)
			for(var/obj/item/thing as anything in contents)
				if(thing.type != /obj/item/dildo/plug) //plugs wont take space as they are especially for this.
					captarget -= thing.w_class*10
		if(captarget != reagents.maximum_volume)
			if(fertility && pregnant)
				captarget *= 0.5
			reagents.maximum_volume = captarget
			if(H.has_quirk(/datum/quirk/selfawaregeni))
				to_chat(H, span_blue("My [pick(altnames)] may be able to hold a different amount now."))

	if(reagents.total_volume > reagents.maximum_volume + 5) //lil allowance
		visible_message(span_info("[owner]'s [pick(altnames)] spill some of it's contents with the pressure on it!"),span_info("My [pick(altnames)] spill it's excesss contents with the pressure built up on it!"),span_unconscious("I hear a splash."))
		reagents.remove_all(reagents.total_volume - reagents.maximum_volume)
		playsound(owner, 'sound/foley/waterenter.ogg', 15)

	if(damage > low_threshold)
		if(prob(5))
			to_chat(H, span_warning("My [pick(altnames)] aches..."))

	// modify nutrition to generate reagents
	if(!HAS_TRAIT(src, TRAIT_NOHUNGER)) //if not nohunger
		if(owner.nutrition < (NUTRITION_LEVEL_FED + 25) && hungerhelp) //consumes if hungry and uses nutrient, putting just above the limit so person dont get stress message spam.
			var/remove_amount = min(reagent_generate_rate, reagents.total_volume)
			if(uses_nutrient) //add nutrient
				owner.adjust_nutrition(remove_amount*20) //since hunger factor is so tiny compared to the nutrition levels it has to fill
			reagents.remove_reagent(reagent_to_make, remove_amount)
		else
			if((reagents.total_volume < reagents.maximum_volume) && refilling) //if organ is not full.
				var/max_restore = owner.nutrition > (NUTRITION_LEVEL_WELL_FED) ? reagent_generate_rate * 2 : reagent_generate_rate
				var/restore_amount = min(max_restore, reagents.maximum_volume - reagents.total_volume) // amount restored if fed, capped by reagents.maximum_volume
				if(uses_nutrient) //consume nutrient
					owner.adjust_nutrition(-restore_amount*20)
				reagents.add_reagent(reagent_to_make, restore_amount)
	else //if nohunger, should just regenerate stuff for free no matter what, if refilling.
		if((reagents.total_volume < reagents.maximum_volume) && refilling)
			var/max_restore = reagent_generate_rate * 2
			var/restore_amount = min(max_restore, reagents.maximum_volume - reagents.total_volume)
			reagents.add_reagent(reagent_to_make, restore_amount)

	if(!COOLDOWN_FINISHED(src, liquidcd))
		return
	if(reagents.total_volume && absorbing) //slowly inject to your blood if they have reagents. Will not work if refilling because i cant properly seperate the reagents for which to keep which to dump.
		reagents.trans_to(owner, absorbrate, absorbmult, TRUE, FALSE)
	if(!contents.len) //if nothing is plugging the hole, stuff will drip out.
		var/tempdriprate = driprate
		if((reagents.total_volume && spiller) || (reagents.total_volume > reagents.maximum_volume)) //spiller or above it's capacity to leak.
			var/obj/item/clothing/blockingitem = H.mob_slot_wearing(blocker)
			if(blockingitem && !blockingitem.genitalaccess) //if worn slot cover it, drip nearly nothing.
				tempdriprate *= 0.1
				if(H.has_quirk(/datum/quirk/selfawaregeni))
					if(prob(5))
						to_chat(H, pick(span_info("A little bit of [english_list(reagents.reagent_list)] drips from my [pick(altnames)] to my [blockingitem.name]..."),
						span_info("Some liquid drips from my [pick(altnames)] to my [blockingitem.name]."),
						span_info("My [pick(altnames)] spills some liquid to my [blockingitem.name]."),
						span_info("Some [english_list(reagents.reagent_list)] drips from my [pick(altnames)] to my [blockingitem.name].")))
			else
				if(H.has_quirk(/datum/quirk/selfawaregeni))
					if(prob(5))
						to_chat(H, pick(span_info("A little bit of [english_list(reagents.reagent_list)] drips from my [pick(altnames)]..."),
						span_info("Some liquid drips from my [pick(altnames)]."),
						span_info("My [pick(altnames)] spills some liquid."),
						span_info("Some [english_list(reagents.reagent_list)] drips from my [pick(altnames)].")))
			reagents.remove_all(tempdriprate)
	COOLDOWN_START(src, liquidcd, processspeed)

/obj/item/organ/filling_organ/proc/organ_jumped()
	var/mob/living/carbon/human/H = owner
	var/obj/item/organ/filling_organ/forgan = src

	var/stealth = H.mind?.get_skill_level(/datum/skill/misc/sneaking)
	var/keepinsidechance = CLAMP((rand(25,100) - (stealth * 20)),0,100) //basically cant lose your item if you have 5 stealth.
	if(reagents.total_volume > reagents.maximum_volume / 2 && spiller && prob(keepinsidechance)) //if you have more than half full spiller organ.
		visible_message(span_info("[owner]'s [pick(altnames)] spill some of it's contents with the pressure on it!"),span_info("My [pick(altnames)] spill some of it's contents with the pressure on it! [keepinsidechance]%"),span_unconscious("I hear a splash."))
		reagents.remove_all(keepinsidechance)
		playsound(owner, 'sound/foley/waterenter.ogg', 15)

	if(!issimple(H) && H.mind)
		if(contents.len)
			for(var/obj/item/forgancontents as anything in forgan.contents)
				if(!istype(forgancontents, /obj/item/dildo)) //dildo keeps stuff in even if you have no pants ig
					var/obj/item/clothing/blockingitem = get_organ_blocker(H, zone)
					if(!blockingitem || blockingitem.genitalaccess) //checks if the item has genitalaccess, like skirts, if not, it blocks the thing from flying off.
						if(prob(keepinsidechance))
							if(H.client?.prefs.showrolls)
								to_chat(H, span_alert("Damn! I lose my [pick(altnames)]'s grip on [english_list(contents)]! [keepinsidechance]%"))
							else
								to_chat(H, span_alert("Damn! I lose my [pick(altnames)]'s grip on [english_list(contents)]!"))
							playsound(H, 'sound/misc/mat/insert (1).ogg', 20, TRUE, -2, ignore_walls = FALSE)
							forgancontents.doMove(get_turf(H))
							forgan.contents -= forgancontents
							var/yeet = rand(4)
							var/turf/selectedturf = pick(orange(H, yeet)) //object flies off the hole with pressure at a random turf, funny.
							forgancontents.throw_at(selectedturf, yeet, 2)
						else
							if(H.client?.prefs.showrolls)
								if(keepinsidechance < 10)
									to_chat(H, span_blue("I easily maintain my [pick(altnames)]'s grip on [english_list(contents)]. [keepinsidechance]%"))
								else
									to_chat(H, span_info("Phew, I maintain my [pick(altnames)]'s grip on [english_list(contents)]. [keepinsidechance]%"))
							else
								if(keepinsidechance < 10)
									to_chat(H, span_blue("I easily maintain my [pick(altnames)]'s grip on [english_list(contents)]."))
								else
									to_chat(H, span_info("Phew, I maintain my [pick(altnames)]'s grip on [english_list(contents)]."))
				break		

/obj/item/organ/filling_organ/vagina/proc/be_impregnated(silent = FALSE)
	if(pregnant || !pregnantaltorgan || !owner || owner.stat == DEAD)
		return
	if(!silent && owner.has_quirk(/datum/quirk/selfawaregeni))
		to_chat(owner, span_love("I feel a surge of warmth in my [src], I’m definitely pregnant!"))
	pregnant = TRUE
	pre_pregnancy_size = pregnantaltorgan.organ_size
	preggotimer = addtimer(CALLBACK(src, PROC_REF(handle_preggo_growth)), 2 HOURS, TIMER_STOPPABLE)

	var/obj/item/organ/filling_organ/breasts/breasties = owner.getorganslot(ORGAN_SLOT_BREASTS)
	if(breasties && !breasties.refilling && owner.has_quirk(/datum/quirk/selfawaregeni))
		to_chat(owner, span_love("My [breasties] should start lactating soon..."))
	breasties.refilling = TRUE
	RegisterSignal(SSticker, COMSIG_ROUNDEND, PROC_REF(save_preggo))
	RegisterSignal(owner, COMSIG_MOB_DEATH, PROC_REF(undo_preggoness))

/obj/item/organ/filling_organ/vagina/proc/save_preggo()
	if(!owner && !pregnant && owner.stat == DEAD)
		return
	// technically, there's 4 stages, and motherhood needs to consider that, and the other number is to increment it next time
	owner.set_persistent_motherhood_stage(pregnantaltorgan.organ_size + 2)

/obj/item/organ/filling_organ/vagina/proc/handle_preggo_growth()
	if(!owner)
		return
	if(organ_size < 3)
		set_preggo_stage(pregnantaltorgan.organ_size + 1)

/obj/item/organ/filling_organ/vagina/proc/set_preggo_stage(stage = 1)
	if(!pregnant || !pregnantaltorgan)
		return
	to_chat(owner, span_love("I noticed my [pregnantaltorgan] has grown...")) //dont need to repeat this probably if size cant grow anyway.
	if(organ_sizeable)
		pregnantaltorgan.set_preggoness_stage(stage)
	if(preggotimer)
		deltimer(preggotimer)
	preggotimer = addtimer(CALLBACK(src, PROC_REF(handle_preggo_growth)), 2 HOURS, TIMER_STOPPABLE)
	pregnancy_debuff(stage * 2)

/obj/item/organ/filling_organ/vagina/proc/pregnancy_debuff(debuff_value = 1)
	// normalize stats, and then debuff them.
	if(pregnancy_stat_debuff_multiplier)
		owner.change_stat(STAT_SPEED, -pregnancy_stat_debuff_multiplier)
		owner.change_stat(STAT_ENDURANCE, -pregnancy_stat_debuff_multiplier)
	if(debuff_value == 0)
		return
	pregnancy_stat_debuff_multiplier = debuff_value
	owner.change_stat(STAT_SPEED, debuff_value)
	owner.change_stat(STAT_ENDURANCE, debuff_value)

/obj/item/organ/filling_organ/vagina
	var/pregnancy_stat_debuff_multiplier = 0

/obj/item/organ/filling_organ/vagina/Remove(mob/living/carbon/M, special, drop_if_replaced)
	// yes you can remove the breasts, then remove this organ to have it refilling forever, but I do not care.
	if(pregnant)
		undo_preggoness()
	. = ..() // this nulls owner

/obj/item/organ/belly/proc/set_preggoness_stage(stage = 1, silent = FALSE)
	var/datum/sprite_accessory/acc = accessory_type
	organ_size = stage
	acc.get_icon_state() // unsure the function of this
	owner.update_body_parts(TRUE)

/obj/item/organ/filling_organ/vagina/proc/undo_preggoness()
	if(!pregnant)
		return

	UnregisterSignal(SSticker, COMSIG_ROUNDEND)
	UnregisterSignal(owner, COMSIG_MOB_DEATH)
	deltimer(preggotimer)
	pregnant = FALSE

	var/obj/item/organ/belly/belly = owner.getorganslot(ORGAN_SLOT_BELLY)
	if(belly)
		to_chat(owner, span_love("I feel my [belly] shrink to how it was before. Pregnancy is no more."))
		var/datum/sprite_accessory/belly/bellyacc = belly.accessory_type
		belly.organ_size = pre_pregnancy_size
		bellyacc.get_icon_state()

	var/obj/item/organ/filling_organ/breasts/breasties = owner.getorganslot(ORGAN_SLOT_BREASTS)
	if(breasties)
		addtimer(CALLBACK(breasties, TYPE_PROC_REF(/obj/item/organ/filling_organ/breasts, normalize_breasts)), 2 HOURS)

	owner.update_body_parts(TRUE)
	pregnancy_debuff(0)

/obj/item/organ/filling_organ/breasts/proc/normalize_breasts()
	refilling = FALSE

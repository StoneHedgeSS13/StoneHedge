/obj/effect/proc_holder/spell/invoked/archfey_warlock_strip
	name = "Strip Clothes"
	overlay_state = "bcry"
	releasedrain = 80
	charge_max = 3 MINUTES
	range = 1
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	invocation_type = "none" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/invoked/archfey_warlock_strip/cast(list/targets, mob/user)
	. = ..()
	user.emote("giggle")
	var/mob/living/target = targets[1]
	if(iscarbon(target))
		var/obj/item/object = target.get_item_by_slot(pick(SLOT_GLOVES,SLOT_SHOES,SLOT_HEAD))
		if(!istype(object, /obj/item/clothing/head/roguetown/helmet))//Can't take helmets!
			target.dropItemToGround(object)
		user.log_message("has stripped a piece of clothing from [key_name(target)] via spell", LOG_ATTACK)
		target.log_message("has had a piece of clothing stripped by [key_name(user)] via spell", LOG_ATTACK)
	return TRUE

/obj/effect/proc_holder/spell/targeted/archfey_warlock_seelie_kiss
	name = "Regenerative Kiss"
	overlay_state = "heal"
	releasedrain = 0
	charge_max = 2 MINUTES
	range = 1
	invocation_type = "none" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/targeted/archfey_warlock_seelie_kiss/cast(list/targets, mob/user)
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.reagents.add_reagent_list(list(/datum/reagent/medicine/healthpot = 12, /datum/reagent/medicine/manapot = 12))
		target.add_nausea(9)
		to_chat(target, span_notice("I suddenly feel reinvigorated!"))
		to_chat(user, span_notice("I have reinvigorated [target] with a kiss."))
		user.log_message("has blessed [key_name(target)] with a kiss spell, healing them a little", LOG_ATTACK)
		target.log_message("has been blessed by [key_name(user)] with a kiss spell, healing them a little", LOG_ATTACK)
		user.emote("kiss")
		return TRUE
	return FALSE

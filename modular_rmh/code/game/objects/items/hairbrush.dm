
/obj/item/hairbrush
	name = "Hairbrush"
	desc = "A must-have for any princess or anyone who wants to look irresistible. Do not use for anal pleasure."
	w_class = WEIGHT_CLASS_TINY
	force = 0
	throwforce = 0
	slot_flags = ITEM_SLOT_HIP
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "brush_0"

/obj/item/hairbrush/attack(mob/living/M, mob/living/user)
	combhair(M, user)

/obj/item/hairbrush/proc/combhair(mob/living/carbon/target, mob/living/user)//добавить фигню про проверки на покрытие, волосы и тд

	if(!user)
		return

	if(!ishuman(user))
		return

	if(!get_location_accessible(target, BODY_ZONE_HEAD))
		to_chat(user, span_warning("With an important grin you comb your headdress."))
		return
	var/mob/living/carbon/human/user_carb = target
	var/datum/bodypart_feature/hair/hair = user_carb.get_bodypart_feature_of_slot(BODYPART_FEATURE_HAIR)
	if(ispath(hair.accessory_type, /datum/sprite_accessory/hair/head/bald))
	//голова лысая
		if(user == target)
			to_chat(user, span_warning("You scratch your bald head with a calm expression."))
		else
			to_chat(user, span_warning("You scratch [target]'s head with a calm expression."))
			to_chat(target, span_warning("[user] scratches your bald head."))
		return
	if(user == target)
		var/mob/living/carbon/human/H = user
		H.apply_status_effect(STATUS_EFFECT_COMB_HAIR)
		to_chat(user, "You style your hair and tidy it up.")
		return TRUE
	var/mob/living/carbon/human/H = target
	H.apply_status_effect(STATUS_EFFECT_COMB_HAIR)
	user.visible_message(span_info("[user] combs [H]'s hair."))
	return TRUE















/datum/sprite_accessory/bodyhair
	//abstract_type = /datum/sprite_accessory/bodyhair
	icon = 'modular_rmh/icons/mob/sprite_accessory/bodyhair/bodyhair.dmi'
	color_key_name = "Bodyhair"
	layer = BODY_FRONT_LAYER
	color_disabled = TRUE
	color_key_defaults = list(KEY_HAIR_COLOR)
	icon_state = "hairy"

/datum/sprite_accessory/bodyhair/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_BELT, OFFSET_BELT_F)

/datum/sprite_accessory/bodyhair/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	return is_human_part_visible(owner, HIDECROTCH)

/datum/sprite_accessory/bodyhair/bush
	name = "hairy"
	icon_state = "hairy"

/datum/sprite_accessory/bodyhair/bigbush
	name = "very hairy"
	icon_state = "extrahairy"

/datum/sprite_accessory/bodyhair/medbush
	name = "low hair"
	icon_state = "furred"

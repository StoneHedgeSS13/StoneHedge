/datum/sprite_accessory/piercing
	abstract_type = /datum/sprite_accessory/piercing
	icon = 'modular_rmh/icons/mob/sprite_accessory/piercings/rings.dmi'
	color_key_name = "Piercings"
	layer = BODY_ADJ_TOP_TOP_LAYER
	//color_disabled = TRUE
	var/piercing_type

/datum/sprite_accessory/piercing/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	if(owner.getorganslot(ORGAN_SLOT_BREASTS))
		var/obj/item/organ/genitals/filling_organ/breasts/breasts = owner.getorganslot(ORGAN_SLOT_BREASTS)
		var/tag = icon_state
		if((breasts.organ_size == 0) || (breasts.organ_size == 1))
			tag = tag + "-1"
		if(breasts.organ_size == 2)
			tag = tag + "-2"
		if(breasts.organ_size == 3)
			tag = tag + "-3"
		if(breasts.organ_size == 4)
			tag = tag + "-4"
		if(breasts.organ_size == 5)
			tag = tag + "-5"
		return tag
	else
		var/tag = icon_state + "-1"
		return tag

/datum/sprite_accessory/piercing/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_SUIT, OFFSET_SUIT)

/datum/sprite_accessory/piercing/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	var/obj/item/organ/genitals/filling_organ/breasts/breasts = owner.getorganslot(ORGAN_SLOT_BREASTS)
	if(breasts)
		if(breasts.visible_through_clothes)
			return TRUE
	if(isnull(owner.underwear))
		return is_human_part_visible(owner, HIDEBOOB)
	else
		return is_human_part_visible(owner, HIDEBOOB) && !owner.underwear.covers_breasts

/datum/sprite_accessory/piercing/rings
	icon = 'modular_rmh/icons/mob/sprite_accessory/piercings/rings.dmi'
	name = "rings"
	icon_state = "rings"
	piercing_type = /obj/item/piercings/rings

/datum/sprite_accessory/piercing/rings/emerald
	name = "emerald rings"
	icon_state = "rings-e"
	piercing_type = /obj/item/piercings/rings

/datum/sprite_accessory/piercing/rings/gold
	name = "gold rings"
	icon_state = "rings-g"
	piercing_type = /obj/item/piercings/rings

/datum/sprite_accessory/piercing/rings/silver
	name = "silver rings"
	icon_state = "rings-s"
	piercing_type = /obj/item/piercings/rings

/datum/sprite_accessory/piercing/beads
	icon = 'modular_rmh/icons/mob/sprite_accessory/piercings/beads.dmi'
	name = "beads"
	icon_state = "beads"
	piercing_type = /obj/item/piercings/beads

/datum/sprite_accessory/piercing/beads/emerald
	name = "emerald beads"
	icon_state = "beads-e"
	piercing_type = /obj/item/piercings/beads

/datum/sprite_accessory/piercing/beads/gold
	name = "gold beads"
	icon_state = "beads-g"
	piercing_type = /obj/item/piercings/beads

/datum/sprite_accessory/piercing/beads/silver
	name = "silver beads"
	icon_state = "beads-s"
	piercing_type = /obj/item/piercings/beads

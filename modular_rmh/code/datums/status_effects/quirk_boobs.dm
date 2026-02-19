
/datum/status_effect/debuff/boobs_quirk
	id = "bigboobs"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/boobs_quirk
	examine_text = span_notice("They have massive MAGICAL GOODS!")
	//effectedstats = list("constitution" = 2, "speed" = -2)
	duration = -1
	var/initialbreasts

/atom/movable/screen/alert/status_effect/debuff/boobs_quirk
	name = "Huge Breasts"
	desc = "They feel as heavy as gold and are massive... My back hurts."
	icon_state = "status"


/datum/status_effect/debuff/boobs_quirk/on_apply()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	to_chat(user, span_warning("Gah! My tits expand to impossible sizes!"))
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)
	if(forgan)
		initialbreasts = forgan.organ_size
		forgan.organ_size = 6 // max selectable is 5
	user.update_body_parts(TRUE)

/datum/status_effect/debuff/boobs_quirk/on_remove()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	to_chat(user, span_notice("Phew, My bits shrunk back to the way they were."))
	//return to pref sizes.
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)

	if(forgan)
		forgan.organ_size = initialbreasts
	user.update_body_parts(TRUE)

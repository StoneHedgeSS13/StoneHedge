//By DREAMKEEP, Vide Noir https://github.com/EaglePhntm.
//Bloat
//added and removed by filling_organs
/datum/status_effect/debuff/bloatone
	id = "bloatone"
	duration = 5 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/bloatone
	examine_text = span_notice("Their belly is bulging...")
	effectedstats = list("constitution" = 1, "speed" = -1)

/atom/movable/screen/alert/status_effect/bloatone
	name = "Bloated"
	desc = "Bit full..."
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "bloat1"

/datum/status_effect/debuff/bloattwo
	id = "bloattwo"
	duration = 5 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/bloattwo
	examine_text = span_notice("Their belly is bulging largely...")
	effectedstats = list("constitution" = 2, "speed" = -2)

/datum/status_effect/debuff/bloattwo/on_apply()
	. = ..()
	//upgrades people, upgrades.
	if(owner.has_status_effect(/datum/status_effect/debuff/bloatone))
		owner.remove_status_effect(/datum/status_effect/debuff/bloatone)

/atom/movable/screen/alert/status_effect/bloattwo
	name = "Bloated"
	desc = "So full..."
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "bloat2"

/datum/status_effect/debuff/pregnant
	id = "pregnant"
	duration = 30 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/pregnant
	examine_text = span_notice("Their belly is swollen...")
	//effectedstats = list("constitution" = 1, "speed" = -1)
	//maybe. MAYBE.

/atom/movable/screen/alert/status_effect/pregnant
	name = "Pregnant"
	desc = "My belly is growing"
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "bloat1"


/datum/status_effect/debuff/pregnant/on_remove()
	if(owner.getorganslot(ORGAN_SLOT_BELLY))
		//var w = owner.getorganslot(ORGAN_SLOT_VAGINA)

		var/obj/item/organ/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
		var/datum/sprite_accessory/belly/bellyacc = bellyussy.accessory_type
		if(bellyussy.organ_size < 3)
			bellyussy.organ_size = bellyussy.organ_size + 1
			bellyacc.get_icon_state()

			// how to call update_body_parts from a status effect.
			//owner.update_body_parts()
			owner.apply_status_effect(/datum/status_effect/debuff/pregnant)

	else
		return

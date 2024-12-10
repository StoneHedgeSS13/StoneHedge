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

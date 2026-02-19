
/datum/status_effect/facial
	id = "facial"
	alert_type = null
	tick_interval = 12 MINUTES
	var/has_dried_up = FALSE

/datum/status_effect/facial/internal
	id = "creampie"
	alert_type = null
	tick_interval = 7 MINUTES

/datum/status_effect/facial/on_apply()
	. = ..()
	if(!.)
		return FALSE
	RegisterSignal(owner, list(COMSIG_COMPONENT_CLEAN_ACT, COMSIG_COMPONENT_CLEAN_FACE_ACT), PROC_REF(clean_up))
	has_dried_up = FALSE
	return TRUE

/datum/status_effect/facial/on_remove()
	UnregisterSignal(owner, list(COMSIG_COMPONENT_CLEAN_ACT, COMSIG_COMPONENT_CLEAN_FACE_ACT))
	return ..()

/datum/status_effect/facial/tick()
	has_dried_up = TRUE

/datum/status_effect/facial/proc/refresh_cum()
	has_dried_up = FALSE
	tick_interval = world.time + initial(tick_interval)

/datum/status_effect/facial/proc/clean_up(datum/source, clean_types)
	SIGNAL_HANDLER
	if(QDELETED(owner))
		return
	if(clean_types & (CLEAN_WASH | CLEAN_SCRUB | CLEAN_ALL))
		if(!owner.has_stress_type(/datum/stress_event/bathcleaned))
			to_chat(owner, span_notice("I feel much cleaner now!"))
			owner.add_stress(/datum/stress_event/bathcleaned)
		owner.remove_status_effect(src)

/datum/status_effect/edged_penis_cooldown
	id = "tired_penis"
	alert_type = null
	duration = 7 MINUTES

/datum/status_effect/blue_bean
	id = "blue_bean"
	alert_type = null
	duration = -1

/datum/status_effect/blue_bean/on_apply()
	. = ..()
	owner.add_stress(/datum/stress_event/blue_bean)

/datum/status_effect/blue_bean/on_remove()
	. = ..()
	owner.remove_stress(/datum/stress_event/blue_bean)

/datum/status_effect/blue_balls
	id = "blue_balls"
	alert_type = null
	duration = -1

/datum/status_effect/blue_balls/on_apply()
	. = ..()
	owner.add_stress(/datum/stress_event/blue_balls)

/datum/status_effect/blue_balls/on_remove()
	. = ..()
	owner.remove_stress(/datum/stress_event/blue_balls)

/datum/status_effect/close_to_orgasm
	id = "close_to_orgasm"
	duration = 1 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/close_to_orgasm
	effectedstats = list("strength" = -1, "speed" = -1, "intelligence" = -2)

/datum/stress_event/close_to_orgasm
	desc = "<span class='love_low'>I am really close to release.</span>"
	timer = 1 MINUTES
	stress_change = 1

/datum/status_effect/close_to_orgasm/on_apply()
	owner.add_stress(/datum/stress_event/close_to_orgasm)
	. = ..()

/datum/status_effect/close_to_orgasm/on_remove()
	owner.remove_stress(/datum/stress_event/close_to_orgasm)
	. = ..()

/atom/movable/screen/alert/status_effect/close_to_orgasm
	name = "Close"
	desc = "<span class='love_low'>I feel the pleasure building, I am really close...</span>"

/datum/status_effect/edging_overstimulation
	id = "edging_overstimulation"
	duration = 5 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/edging_overstimulation
	effectedstats = list("strength" = -1, "speed" = -2, "intelligence" = -2)

/datum/stress_event/edging_overstimulation
	desc = "<span class='love_low'>I have been going at it for too long without release, I need relief...</span>\n"
	timer = 60 MINUTES
	stress_change = 1

/datum/status_effect/edging_overstimulation/on_apply()
	owner.add_stress(/datum/stress_event/edging_overstimulation)
	. = ..()

/datum/status_effect/edging_overstimulation/on_remove()
	owner.remove_stress(/datum/stress_event/edging_overstimulation)
	. = ..()

/atom/movable/screen/alert/status_effect/edging_overstimulation
	name = "Overstimulated"
	desc = "I have been going at it for too long without release, I need relief..."

/datum/status_effect/debuff/orgasmbroken
	id = "orgasmbroken"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/orgasmbroken
	effectedstats = list("intelligence" = -2, "strength" = -1, "speed" = -1, "perception" = -2, "endurance" = 2, "constitution" = -1)
	duration = -1

/datum/stress_event/orgasmbroken
	desc = "<span class='love_low'>My legs are shaking, but I need more.</span>\n"
	timer = 60 MINUTES
	stress_change = -5

/datum/status_effect/debuff/orgasmbroken/on_apply()
	owner.add_stress(/datum/stress_event/orgasmbroken)
	. = ..()

/datum/status_effect/debuff/orgasmbroken/on_remove()
	owner.remove_stress(/datum/stress_event/orgasmbroken)
	. = ..()

/datum/status_effect/debuff/orgasmbroken/on_apply()
	. = ..()
	owner.add_movespeed_modifier("ORGASM_SLOWDOWN", multiplicative_slowdown=4)

/datum/status_effect/debuff/orgasmbroken/on_remove()
	. = ..()
	owner.remove_movespeed_modifier("ORGASM_SLOWDOWN")

/atom/movable/screen/alert/status_effect/debuff/orgasmbroken
	name = "Orgasm Broken"
	desc = "My legs are shaking, but I need more."
	icon_state = "debuff"

/datum/status_effect/debuff/nympho_addiction
	id = "nympho_addiction"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/nympho_addiction
	//effectedstats = list("intelligence" = -20, "strength" = -8, "speed" = -6, "perception" = -5, "endurance" = 2, "constitution" = -2)
	duration = -1

/datum/stress_event/nympho_addiction
	desc = "<span class='love_low'>I want to do it again. And again. And again.</span>\n"
	timer = 60 MINUTES
	stress_change = -3

/datum/status_effect/debuff/nympho_addiction/on_apply()
	owner.add_stress(/datum/stress_event/nympho_addiction)
	. = ..()

/datum/status_effect/debuff/nympho_addiction/on_remove()
	owner.remove_stress(/datum/stress_event/nympho_addiction)
	. = ..()

/datum/status_effect/debuff/nympho_addiction/on_apply()
	. = ..()
	var/mob/living/carbon/human/human = owner
	human.add_quirk(/datum/quirk/vice/lovefiend)

/atom/movable/screen/alert/status_effect/debuff/nympho_addiction
	name = "Addicted to Sex"
	desc = "I want to do it again. And again. And again."
	icon_state = "debuff"

/datum/status_effect/debuff/cumbrained
	id = "cumbrained"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/cumbrained
	effectedstats = list("intelligence" = -10, "strength" = -6, "speed" = -6)
	duration = -1

/datum/stress_event/cumbrained
	desc = "<span class='love_low'>It's hard to think of anything but sex...</span>\n"
	timer = 60 MINUTES
	stress_change = -1

/datum/status_effect/debuff/cumbrained/on_apply()
	owner.add_stress(/datum/stress_event/cumbrained)
	. = ..()

/datum/status_effect/debuff/cumbrained/on_remove()
	owner.remove_stress(/datum/stress_event/cumbrained)
	. = ..()

/atom/movable/screen/alert/status_effect/debuff/cumbrained
	name = "Cum Brained"
	desc = "It's hard to think of anything but sex..."
	icon_state = "debuff"

/datum/status_effect/debuff/cumbrained/tick()
	. = ..()
	if(!owner)
		return

	if(!MOBTIMER_FINISHED(owner, "cumbrained_ticker", rand(30,90)SECONDS))
		return

	MOBTIMER_SET(owner, "cumbrained_ticker")

	var/list/arousal_data = list()
	SEND_SIGNAL(owner, COMSIG_SEX_GET_AROUSAL, arousal_data)

	if(arousal_data["arousal"] < 40)
		SEND_SIGNAL(owner, COMSIG_SEX_ADJUST_AROUSAL, rand(25, 35))//so it instantly fully arouses
	else
		SEND_SIGNAL(owner, COMSIG_SEX_ADJUST_AROUSAL, rand(5, 15))
	to_chat(owner, span_love("My body wants more..."))

/datum/status_effect/debuff/loinspent
	id = "loinspent"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/loinspent
	duration = -1

/datum/stress_event/loinspent
	desc = "<span class='love_low'>All this effort is starting to hurt a bit...</span>\n"
	timer = 60 MINUTES
	stress_change = 1

/datum/status_effect/debuff/loinspent/on_apply()
	owner.add_stress(/datum/stress_event/loinspent)
	. = ..()

/datum/status_effect/debuff/loinspent/on_remove()
	owner.remove_stress(/datum/stress_event/loinspent)
	. = ..()

/atom/movable/screen/alert/status_effect/debuff/loinspent
	name = "Spent Loins"
	desc = "It's starting to hurt a bit..."
	icon_state = "debuff"


/datum/status_effect/debuff/loinspent/tick()
	. = ..()
	if(!owner)
		return

	if(!MOBTIMER_FINISHED(owner, "chafing_loins", rand(20,90)SECONDS))
		return

	MOBTIMER_SET(owner, "chafing_loins")

	var/mob/living/carbon/human/human = owner
	if(human.underwear)
		if(rand(5))
			to_chat(human, span_love("I feel [human.underwear] rub against me..."))
		SEND_SIGNAL(owner, COMSIG_SEX_ADJUST_AROUSAL, rand(10,20))
	else if(human.wear_pants)
		if(human.wear_pants.flags_inv & HIDECROTCH && !human.wear_pants.genital_access)
			if(rand(5))
				to_chat(human, span_love("I feel [human.wear_pants] rub against me..."))
			SEND_SIGNAL(owner, COMSIG_SEX_ADJUST_AROUSAL, rand(5,10))


/datum/status_effect/debuff/bloatone
	id = "bloatone"
	duration = 5 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/bloatone
	examine_text = span_notice("Their belly is bulging...")
	effectedstats = list("constitution" = 1, "speed" = -1)

/datum/stress_event/bloatsex
	desc = "<span class='love_low'>I have been filled to the brim...</span>\n"
	timer = 60 MINUTES
	stress_change = -1

/datum/status_effect/debuff/bloatone/on_apply()
	owner.add_stress(/datum/stress_event/bloatsex)
	. = ..()

/datum/status_effect/debuff/bloatone/on_remove()
	owner.remove_stress(/datum/stress_event/bloatsex)
	. = ..()

/atom/movable/screen/alert/status_effect/bloatone
	name = "Bloated"
	desc = "Bit full..."
	icon_state = "status"

/datum/status_effect/debuff/bloattwo
	id = "bloattwo"
	duration = 5 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/bloattwo
	examine_text = span_notice("Their belly is bulging largely...")
	effectedstats = list("constitution" = 2, "speed" = -2)

/datum/status_effect/debuff/bloattwo/on_apply()
	. = ..()
	if(owner.has_status_effect(/datum/status_effect/debuff/bloatone))
		owner.remove_status_effect(/datum/status_effect/debuff/bloatone)
	owner.add_stress(/datum/stress_event/bloatsex)

/datum/status_effect/debuff/bloattwo/on_remove()
	owner.remove_stress(/datum/stress_event/bloatsex)
	. = ..()

/atom/movable/screen/alert/status_effect/bloattwo
	name = "Bloated"
	desc = "So full..."
	icon_state = "status"

/datum/stress_event/loinache
	timer = 1 MINUTES
	stress_change = 2
	desc = span_red("My loins ache!")

/datum/stress_event/loinachegood
	timer = 5 MINUTES
	stress_change = -3
	desc = list(span_green("My loins took a GOOD beating!~"),span_green("My loins got slammed GOOD!"),span_green("My loins got beaten GOOD!"))

//---------------------------------------------------------------------------------------------------------------------------------

/datum/status_effect/debuff/flatboobs
	id = "flatboobs"
	examine_text = span_notice("They have magical flat goodies!")
	effectedstats = list("speed" = 2)
	duration = 10 MINUTES
	var/initialbreasts

/datum/status_effect/debuff/vsmallboobs
	id = "vsmallboobs"
	examine_text = span_notice("They have magical very small goodies!")
	effectedstats = list("speed" = 2)
	duration = 10 MINUTES
	var/initialbreasts

/datum/status_effect/debuff/smallboobs
	id = "smallboobs"
	examine_text = span_notice("They have magical small goodies!")
	effectedstats = list("speed" = 1)
	duration = 10 MINUTES
	var/initialbreasts

/datum/status_effect/debuff/largeboobs
	id = "largeboobs"
	//alert_type = /atom/movable/screen/alert/status_effect/debuff/largeboobs
	examine_text = span_notice("They have large MAGICAL GOODS!")
	effectedstats = list("constitution" = 1, "speed" = -1)
	duration = 10 MINUTES
	var/initialbreasts

/datum/status_effect/debuff/bigboobs
	id = "bigboobs"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bigboobs
	examine_text = span_notice("They have massive MAGICAL GOODS!")
	effectedstats = list("constitution" = 2, "speed" = -2)
	duration = 10 MINUTES
	var/initialbreasts

//---------------------------------------------------------------------------------------------------------------------------------

/datum/status_effect/debuff/flatboobs/permanent
	duration = -1

/datum/status_effect/debuff/vsmallboobs/permanent
	duration = -1

/datum/status_effect/debuff/smallboobs/permanent
	duration = -1

/datum/status_effect/debuff/largeboobs/permanent
	duration = -1 //used for quirk

/datum/status_effect/debuff/bigboobs/permanent
	duration = -1 //used for quirk

//---------------------------------------------------------------------------------------------------------------------------------

/datum/status_effect/debuff/flatboobs/permanent/lite
	examine_text = null
	alert_type = null
	effectedstats = list("speed" = 2)

/datum/status_effect/debuff/vsmallboobs/permanent/lite
	examine_text = null
	alert_type = null
	effectedstats = list("speed" = 1)

/datum/status_effect/debuff/smallboobs/permanent/lite
	examine_text = null
	alert_type = null
	//effectedstats = list("speed" = 1)

/datum/status_effect/debuff/largeboobs/permanent/lite
	examine_text = null
	alert_type = null
	effectedstats = list("constitution" = 1, "speed" = -1)

/datum/status_effect/debuff/bigboobs/permanent/lite
	examine_text = null
	alert_type = null
	effectedstats = list("constitution" = 2, "speed" = -1)

//---------------------------------------------------------------------------------------------------------------------------------

/atom/movable/screen/alert/status_effect/debuff/flatboobs
	name = "Flat Chest!" //was gonna name it a curse but it isn't a technically one.
	desc = "They feel as light as feather! But they are gone..."
	//icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "status"

/atom/movable/screen/alert/status_effect/debuff/vsmallboobs
	name = "Small Breasts" //was gonna name it a curse but it isn't a technically one.
	desc = "They feel as light as an apple! But they are very small!."
	//icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "status"

/atom/movable/screen/alert/status_effect/debuff/smallboobs
	name = "Moderate breasts" //was gonna name it a curse but it isn't a technically one.
	desc = "They feel as heavy as dagger! But they are small!"
	//icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "status"

/atom/movable/screen/alert/status_effect/debuff/largeboobs
	name = "Big breasts" //was gonna name it a curse but it isn't a technically one.
	desc = "They feel as heavy as iron and are massive... My back hurts a little."
	//icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "status"

/atom/movable/screen/alert/status_effect/debuff/bigboobs
	name = "Huge Breasts" //was gonna name it a curse but it isn't a technically one.
	desc = "They feel as heavy as gold and are massive... My back hurts."
	//icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "status"

//---------------------------------------------------------------------------------------------------------------------------------

/atom/movable/screen/alert/status_effect/debuff/flatboobslite
	name = "Natural Endowment"
	desc = "I got flat, natural bits."

/atom/movable/screen/alert/status_effect/debuff/vsmallboobslite
	name = "Natural Endowment"
	desc = "I got very small, natural bits."

/atom/movable/screen/alert/status_effect/debuff/smallboobslite
	name = "Natural Endowment"
	desc = "I got small, natural bits."

/atom/movable/screen/alert/status_effect/debuff/largeboobslite
	name = "Natural Endowment"
	desc = "I got large, natural bits."

/atom/movable/screen/alert/status_effect/debuff/bigboobslite
	name = "Natural Endowment"
	desc = "I got unusually large, natural bits."

//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------

/datum/status_effect/debuff/flatboobs/on_apply()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	if(duration == -1) //hack for applied status
		return
	to_chat(user, span_warning("Gah! My tits shrink to impossible sizes!"))
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)

	if(forgan)
		initialbreasts = forgan.organ_size
		forgan.organ_size = BREAST_SIZE_FLAT
	user.update_body_parts(TRUE)

/datum/status_effect/debuff/vsmallboobs/on_apply()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	if(duration == -1) //hack for applied status
		return
	to_chat(user, span_warning("Gah! My tits shrink to very small sizes!"))
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)

	if(forgan)
		initialbreasts = forgan.organ_size
		forgan.organ_size = BREAST_SIZE_VERY_SMALL
	user.update_body_parts(TRUE)

/datum/status_effect/debuff/smallboobs/on_apply()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	if(duration == -1) //hack for applied status
		return
	to_chat(user, span_warning("Gah! My tits shrink to small sizes!"))
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)
	if(forgan)
		initialbreasts = forgan.organ_size
		forgan.organ_size = BREAST_SIZE_SMALL
	user.update_body_parts(TRUE)

/datum/status_effect/debuff/largeboobs/on_apply()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	if(duration == -1) //hack for applied status
		return
	to_chat(user, span_warning("Gah! My tits expand to large sizes!"))
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)
	if(forgan)
		initialbreasts = forgan.organ_size
		forgan.organ_size = BREAST_SIZE_LARGE //making it right way, no math while im working
	user.update_body_parts(TRUE)

/datum/status_effect/debuff/bigboobs/on_apply()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	if(duration == -1) //hack for applied status
		return
	to_chat(user, span_warning("Gah! My tits expand to impossible sizes!"))
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)
	if(forgan)
		initialbreasts = forgan.organ_size
		forgan.organ_size = BREAST_SIZE_ENORMOUS //making it right way, no math while im working
	user.update_body_parts(TRUE)

//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------

/datum/status_effect/debuff/flatboobs/on_remove()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	if(duration == -1) //hack for applied status
		return
	to_chat(user, span_notice("Phew, My bits expand back to the way they were."))
	//return to pref sizes.
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)

	if(forgan)
		forgan.organ_size = initialbreasts
	user.update_body_parts(TRUE)

/datum/status_effect/debuff/vsmallboobs/on_remove()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	if(duration == -1) //hack for applied status
		return
	to_chat(user, span_notice("Phew, My bits expand back to the way they were."))
	//return to pref sizes.
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)

	if(forgan)
		forgan.organ_size = initialbreasts
	user.update_body_parts(TRUE)

/datum/status_effect/debuff/smallboobs/on_remove()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	if(duration == -1) //hack for applied status
		return
	to_chat(user, span_notice("Phew, My bits expand back to the way they were."))
	//return to pref sizes.
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)

	if(forgan)
		forgan.organ_size = initialbreasts
	user.update_body_parts(TRUE)

/datum/status_effect/debuff/largeboobs/on_remove()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	if(duration == -1) //hack for applied status
		return
	to_chat(user, span_notice("Phew, My bits shrunk back to the way they were."))
	//return to pref sizes.
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)

	if(forgan)
		forgan.organ_size = initialbreasts
	user.update_body_parts(TRUE)

/datum/status_effect/debuff/bigboobs/on_remove()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	if(duration == -1) //hack for applied status
		return
	to_chat(user, span_notice("Phew, My bits shrunk back to the way they were."))
	//return to pref sizes.
	var/obj/item/organ/genitals/forgan = user.getorganslot(ORGAN_SLOT_BREASTS)

	if(forgan)
		forgan.organ_size = initialbreasts
	user.update_body_parts(TRUE)

//---------------------------------------------------------------------------------------------------------------------------------

// Underdwellers Debuffs
/datum/status_effect/debuff/darkling_glare
	id = "darkling_glare"
	alert_type = /atom/movable/screen/alert/status_effect/darkling_glare
	effectedstats = list(STATKEY_PER = -1)
	duration = 10 SECONDS

/atom/movable/screen/alert/status_effect/darkling_glare
	name = "Sunlight Sensitivity"
	desc = "It's too bright for my kind!"
	icon = 'modular_rmh/icons/mob/screen_alert.dmi'
	icon_state = "blackeye"

// Emberwine
/atom/movable/screen/alert/status_effect/emberwine
	name = "Emberwine"
	desc = "The warmth is spreading through my body..."
	icon = 'modular_rmh/icons/mob/screen_alert.dmi'
	icon_state = "emberwine"

/datum/status_effect/debuff/emberwine
	id = "emberwine"
	effectedstats = list("strength" = -1, "endurance" = -2, "speed" = -2, "intelligence" = -3)
	duration = 1 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/emberwine

//Aphrodisiac

/atom/movable/screen/alert/status_effect/aphrodisiac
	name = "Aphrodisiac"
	desc = "A dull heat coils low in my abdomen..."
	icon = 'modular_rmh/icons/mob/screen_alert.dmi'
	icon_state = "emberwine"

/datum/status_effect/debuff/aphrodisiac
	id = "aphrodisiac"
	effectedstats = list("strength" = -2, "endurance" = -3, "speed" = -3, "intelligence" = -5)
	duration = 1 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/aphrodisiac


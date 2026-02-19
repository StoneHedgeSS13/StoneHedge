/mob/living/carbon/human/species/slime
	race = /datum/species/slime
	footstep_type = FOOTSTEP_MOB_SLIME
	flags_1 = PREVENT_CONTENTS_EXPLOSION_1
	base_strength = 5
	base_constitution = 5
	base_endurance = 5
	gender = NEUTER

/mob/living/carbon/human/species/slime/death(gibbed, nocutscene)
	. = ..()
	icon_state = "[icon_state]_dead"
	update_icon()

/datum/species/slime
	name = "slime"
	id = "slime"

	species_traits = list(NO_UNDERWEAR, NOEYESPRITES)
	inherent_traits = list(
		TRAIT_NOSTAMINA,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RADIMMUNE,
		TRAIT_NODISMEMBER,
		TRAIT_POISON_RESILIENCE,
		TRAIT_STRONGBITE,
		TRAIT_ZJUMP,
		TRAIT_NOFALLDAMAGE1,
		TRAIT_BASHDOORS,
		TRAIT_STEELHEARTED,
		TRAIT_BREADY,
		TRAIT_ORGAN_EATER,
		TRAIT_NASTY_EATER,
		TRAIT_DEADNOSE,
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_IGNORESLOWDOWN,
		TRAIT_HARDDISMEMBER,
		TRAIT_UNDODGING,
		TRAIT_LONGSTRIDER
	)

	inherent_biotypes = MOB_HUMANOID

	no_equip = list(ITEM_SLOT_SHIRT, ITEM_SLOT_HEAD, ITEM_SLOT_MASK, ITEM_SLOT_ARMOR, ITEM_SLOT_GLOVES, ITEM_SLOT_SHOES, ITEM_SLOT_PANTS, ITEM_SLOT_CLOAK, ITEM_SLOT_BELT, ITEM_SLOT_BACK_R, ITEM_SLOT_BACK_L)

	specstats_m = list(STATKEY_STR = 1, STATKEY_PER = 1, STATKEY_INT = 1, STATKEY_CON = 1, STATKEY_END = 1, STATKEY_SPD = 1, STATKEY_LCK = 1)
	specstats_f = list(STATKEY_STR = 1, STATKEY_PER = 1, STATKEY_INT = 1, STATKEY_CON = 1, STATKEY_END = 1, STATKEY_SPD = 1, STATKEY_LCK = 1)

	enflamed_icon = "widefire"

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/night_vision,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_ANUS = /obj/item/organ/genitals/filling_organ/anus,
		ORGAN_SLOT_PENIS = /obj/item/organ/genitals/penis,
		ORGAN_SLOT_VAGINA = /obj/item/organ/genitals/filling_organ/vagina,
	)

	changesource_flags = WABBAJACK
	bleed_mod = 0.3
	pain_mod = 0.2

/datum/species/slime/send_voice(mob/living/carbon/human/H)
	playsound(get_turf(H), pick('modular_rmh/sound/effects/blob.ogg'), 15, TRUE, -1)

/datum/species/slime/regenerate_icons(mob/living/carbon/human/H)
	H.icon = 'modular_rmh/icons/mob/lewd/custom/slime.dmi'
	H.base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB)
	H.icon_state = "slime"

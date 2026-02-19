/mob/living/carbon/human/species/minotaur
	race = /datum/species/minotaur
	footstep_type = FOOTSTEP_MOB_HEAVY
	flags_1 = PREVENT_CONTENTS_EXPLOSION_1
	base_strength = 15
	base_constitution = 15
	base_endurance = 15

/mob/living/carbon/human/species/minotaur/death(gibbed, nocutscene)
	. = ..()
	icon_state = "[icon_state]_dead"
	update_icon()

/mob/living/carbon/human/species/minotaur/male
	gender = MALE

/mob/living/carbon/human/species/minotaur/male/Initialize()
	. = ..()
	name = "Minotaur"

/mob/living/carbon/human/species/minotaur/female
	gender = FEMALE

/mob/living/carbon/human/species/minotaur/female/Initialize()
	. = ..()
	name = "Minotaur"

/datum/species/minotaur
	name = "minotaur"
	id = "minotaur"

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

	offset_features_m = list(OFFSET_HANDS = list(0,2))
	offset_features_f = list(OFFSET_HANDS = list(0,2))

	soundpack_m = /datum/voicepack/orc
	soundpack_f = /datum/voicepack/orc

	specstats_m = list(STATKEY_STR = 5, STATKEY_PER = 5, STATKEY_INT = -3, STATKEY_CON = 5, STATKEY_END = 5, STATKEY_SPD = 3, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = 5, STATKEY_PER = 5, STATKEY_INT = -3, STATKEY_CON = 5, STATKEY_END = 5, STATKEY_SPD = 3, STATKEY_LCK = 0)

	enflamed_icon = "widefire"

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/night_vision,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/guts,
		ORGAN_SLOT_PUBIC = /obj/item/organ/genitals/pubes,
		ORGAN_SLOT_ANUS = /obj/item/organ/genitals/filling_organ/anus,
	)

	changesource_flags = WABBAJACK
	bleed_mod = 0.3
	pain_mod = 0.2

/datum/species/minotaur/send_voice(mob/living/carbon/human/H)
	playsound(get_turf(H), pick('sound/vo/mobs/minotaur/minoidle.ogg', 'sound/vo/mobs/minotaur/minoidle2.ogg'), 100, TRUE, -1)

/datum/species/minotaur/regenerate_icons(mob/living/carbon/human/H)
	H.icon = 'icons/mob/newminotaur.dmi'
	H.base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB)
	var/list/arousal_data = list()
	SEND_SIGNAL(H, COMSIG_SEX_GET_AROUSAL, arousal_data)
	if(H.gender == MALE)
		H.icon_state = "MinotaurMale"
	else
		H.icon_state = "MinotaurFem"
	H.update_damage_overlays()
	return TRUE

/datum/species/minotaur/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/beast)

/mob/living/carbon/human/species/minotaur/custom/male
	gender = MALE

/mob/living/carbon/human/species/minotaur/custom/male/Initialize()
	. = ..()
	name = "Minotaur"
	icon_state = "MinotaurMale"

/mob/living/carbon/human/species/minotaur/custom/female
	gender = FEMALE

/mob/living/carbon/human/species/minotaur/custom/female/Initialize()
	. = ..()
	name = "Minotaur"
	icon_state = "MinotaurFem"

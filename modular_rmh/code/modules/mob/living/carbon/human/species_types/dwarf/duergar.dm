/mob/living/carbon/human/species/dwarf/duergar
	race = /datum/species/dwarf/duergar

/datum/species/dwarf/duergar
	name = "Duergar"
	id = SPEC_ID_DUERGAR
	desc = "Duergar, also known as gray dwarves, dwell in the Underdark beneath Faerûn.\
	\n\n\
	ong ago enslaved by mind flayers, they emerged hardened, bitter, and deeply suspicious of all outsiders. \
	\n\n\
	Their society values discipline, self-reliance, and survival above all else.\
	\n\n\
	Unlike their surface kin, duergar suppress emotion and sentiment, viewing them as weaknesses. \
	n\n\
	Though often cruel and merciless, their harsh nature is forged from generations of oppression rather than inherent malice. \
	n\n\
	(+1 STR, 2+ CON, +1 END, -1 LCK, Poison Resistance, Darkvision, Sunlight Sensitivity, Dwarvish Language).\
	\n\n\
	Proficiencies: Axemaces(4), Polearms(3), Sneaking(3), Blacksmithing(3), Smelting(3), Mining(4), Arcane(2).\
	\n\n\
	THIS IS A DISCRIMINATED SPECIES. PLAY AT YOUR OWN RISK."

	species_traits = list(EYECOLOR, HAIR, FACEHAIR, LIPS, YOUNGBEARD, STUBBLE, OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_POISON_RESILIENCE)
	inherent_skills = list(
		/datum/skill/combat/axesmaces = 4,
		/datum/skill/combat/polearms = 3,

		/datum/skill/misc/sneaking = 3,

		/datum/skill/craft/blacksmithing = 3,
		/datum/skill/craft/smelting = 3,

		/datum/skill/labor/mining = 4,

		/datum/skill/magic/arcane = 2,
	)

	possible_ages = NORMAL_AGES_LIST
	use_skintones = TRUE

	changesource_flags = WABBAJACK

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/md.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fd.dmi'

	hairyness = "t3"

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

	soundpack_m = /datum/voicepack/male/dwarf
	soundpack_f = /datum/voicepack/female/dwarf

	custom_clothes = TRUE
	custom_id = SPEC_ID_DWARF

	offset_features_m = list(
		OFFSET_RING = list(0,0),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,-3),\
		OFFSET_CLOAK = list(0,0),\
		OFFSET_FACEMASK = list(0,-4),\
		OFFSET_HEAD = list(0,-4),\
		OFFSET_FACE = list(0,-4),\
		OFFSET_BELT = list(0,0),\
		OFFSET_BACK = list(0,-4),\
		OFFSET_NECK = list(0,-4),\
		OFFSET_MOUTH = list(0,-4),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0),\
	)

	offset_features_f = list(
		OFFSET_RING = list(0,-4),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,-4),\
		OFFSET_CLOAK = list(0,0),\
		OFFSET_FACEMASK = list(0,-5),\
		OFFSET_HEAD = list(0,-5),\
		OFFSET_FACE = list(0,-5),\
		OFFSET_BELT = list(0,0),\
		OFFSET_BACK = list(0,-5),\
		OFFSET_NECK = list(0,-5),\
		OFFSET_MOUTH = list(0,-5),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0)\
	)

	offset_genitals_m = list(
		OFFSET_PENIS = list(0,-4),\
		OFFSET_BREASTS = list(0,-4),\
		OFFSET_TESTICLES = list(0,-2),\
		OFFSET_VAGINA = list(0,-4),\
		OFFSET_BUTT = list(0,-4),\
		OFFSET_BELLY = list(0,-4),\
	)

	offset_genitals_f = list(
		OFFSET_PENIS = list(0,-4),\
		OFFSET_BREASTS = list(0,-4),\
		OFFSET_TESTICLES = list(0,-2),\
		OFFSET_VAGINA = list(0,-4),\
		OFFSET_BUTT = list(0,-4),\
		OFFSET_BELLY = list(0,-4),\
	)

	specstats_m = list(STATKEY_STR = 1, STATKEY_PER = 0, STATKEY_INT = 0, STATKEY_CON = 2, STATKEY_END = 1, STATKEY_SPD = 0, STATKEY_LCK = -1)
	specstats_f = list(STATKEY_STR = 1, STATKEY_PER = 0, STATKEY_INT = 0, STATKEY_CON = 2, STATKEY_END = 1, STATKEY_SPD = 0, STATKEY_LCK = -1)

	enflamed_icon = "widefire"

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/piercing,
		/datum/customizer/organ/genitals/penis/human,
		/datum/customizer/organ/genitals/vagina/human,
		/datum/customizer/organ/genitals/breasts/human,
		/datum/customizer/organ/genitals/belly/human,
		/datum/customizer/organ/genitals/butt/human,
		/datum/customizer/organ/genitals/testicles/human,
	)
	body_markings = list(
		/datum/body_marking/tonage,
		/datum/body_marking/womb_tattoo,
		/datum/body_marking/butterfly,
		/datum/body_marking/waist,
		/datum/body_marking/diagonal_eyes,
		/datum/body_marking/wide_eyes,
		/datum/body_marking/stripes,
		/datum/body_marking/plain,
		/datum/body_marking/spotted,
		/datum/body_marking/tiger,
		/datum/body_marking/tiger/dark,
		/datum/body_marking/sock,
		/datum/body_marking/sock/tertiary,
		/datum/body_marking/socklonger,
		/datum/body_marking/tips,
		/datum/body_marking/bellyscale,
		/datum/body_marking/kobold_scale,
		/datum/body_marking/bellyscaleslim,
		/datum/body_marking/bellyscalesmooth,
		/datum/body_marking/bellyscaleslimsmooth,
		/datum/body_marking/buttscale,
		/datum/body_marking/belly,
		/datum/body_marking/bellyslim,
		/datum/body_marking/tie,
		/datum/body_marking/butt,
		/datum/body_marking/tiesmall,
		/datum/body_marking/backspots,
		/datum/body_marking/front,
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
	)

/datum/species/dwarf/duergar/check_roundstart_eligible()
	return TRUE

/datum/species/dwarf/duergar/get_span_language(datum/language/message_language)
	if(!message_language)
		return
	if(message_language.type == /datum/language/dwarvish)
		return list(SPAN_DWARF)
	return message_language.spans

/datum/species/dwarf/duergar/get_skin_list()
	return sortList(list(
		"Pale Blue"       = SKIN_TONE_DROW_PALE_BLUE,       // #9796a9
		"Pale Purple"     = SKIN_TONE_DROW_PALE_PURPLE,     // #897489
		"Pale Grey"       = SKIN_TONE_DROW_PALE_GREY,       // #938f9c
		"Deep Grey"       = SKIN_TONE_DROW_DEEP_GREY,       // #737373
		"Grey-Purple"     = SKIN_TONE_DROW_GREY_PURPLE,     // #6a616d
		"Grey-Blue"       = SKIN_TONE_DROW_GREY_BLUE,       // #5f5f70
		"Black-Blue"      = SKIN_TONE_DROW_BLACK_BLUE,      // #2F2F38
		"Very Pale"       = SKIN_TONE_DROW_VERY_PALE,       // #fff0e9
		"Light Purple"    = SKIN_TONE_DROW_LIGHT_PURPLE,    // #a191a1
		"Mid Purple"      = SKIN_TONE_DROW_MID_PURPLE,      // #897489
		"Dark Purple"     = SKIN_TONE_DROW_DARK_PURPLE,     // #5f5f70
		"Depth Grey-Blue" = SKIN_TONE_DROW_DEPTH_GREY_BLUE, // #5f5f70
		"Pink"            = SKIN_TONE_DROW_PINK,            // #897489
		"Very Pale"		  = SKIN_COLOR_DROW_PALE,	       // #fff0e9

	))

/datum/species/dwarf/duergar/get_possible_names(gender = MALE)
	var/static/list/male_names = world.file2list('strings/rt/names/dwarf/dwarmm.txt')
	var/static/list/female_names = world.file2list('strings/rt/names/dwarf/dwarmf.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/dwarf/duergar/get_possible_surnames(gender = MALE)
	var/static/list/last_names = world.file2list('strings/rt/names/dwarf/dwarmlast.txt')
	return last_names

/datum/species/dwarf/duergar/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()

	spawn(5)
		if(!C || QDELETED(C))
			return

		if(!C.GetComponent(/datum/component/darkling))
			C.AddComponent(/datum/component/darkling)

/datum/species/dwarf/duergar/on_species_loss(mob/living/carbon/human/C)
	. = ..()

	var/datum/component/darkling/D = C.GetComponent(/datum/component/darkling)
	if(D)
		qdel(D)

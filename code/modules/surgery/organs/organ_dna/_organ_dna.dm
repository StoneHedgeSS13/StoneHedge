/datum/organ_dna
	/// Type of the organ thats imprinted.
	var/organ_type
	/// Accessory type thats imprinted.
	var/accessory_type
	/// Accessory colors thats imprinted.
	var/accessory_colors
	/// Whether the DNA shouldn't yield an organ. This is so people can customize species that usually have an organ to not have one.
	var/disabled = FALSE

/datum/organ_dna/proc/can_create_organ()
	if(disabled)
		return FALSE
	return TRUE

/// Creates an organ at location, imprints its information on it and returns it
/datum/organ_dna/proc/create_organ(atom/location)
	var/obj/item/organ/new_organ = new organ_type(location)
	imprint_organ(new_organ)
	return new_organ

/// Imprints information on the organ.
/datum/organ_dna/proc/imprint_organ(obj/item/organ/organ)
	if(accessory_type)
		organ.set_accessory_type(accessory_type, accessory_colors)

/datum/organ_dna/eyes
	var/eye_color = "#FFFFFF"
	var/heterochromia = FALSE
	var/second_color = "#FFFFFF"

/datum/organ_dna/eyes/imprint_organ(obj/item/organ/organ)
	..()
	var/obj/item/organ/eyes/eyes_organ = organ
	eyes_organ.eye_color = eye_color
	eyes_organ.heterochromia  = heterochromia
	eyes_organ.second_color = second_color

/datum/organ_dna/penis
	var/organ_size = DEFAULT_PENIS_SIZE

/datum/organ_dna/penis/imprint_organ(obj/item/organ/organ)
	..()
	var/obj/item/organ/penis/penis_organ = organ
	penis_organ.organ_size = organ_size

/datum/organ_dna/testicles
	var/organ_size = DEFAULT_TESTICLES_SIZE
	var/virility = TRUE

/datum/organ_dna/testicles/imprint_organ(obj/item/organ/organ)
	..()
	var/obj/item/organ/filling_organ/testicles/testicles_organ = organ
	testicles_organ.organ_size = organ_size
	testicles_organ.virility = virility

/datum/organ_dna/breasts
	var/organ_size = DEFAULT_BREASTS_SIZE
	var/refilling = FALSE

/datum/organ_dna/breasts/imprint_organ(obj/item/organ/organ)
	..()
	var/obj/item/organ/filling_organ/breasts/breasts_organ = organ
	breasts_organ.organ_size = organ_size
	breasts_organ.refilling = refilling

/datum/organ_dna/belly
	var/organ_size = DEFAULT_BELLY_SIZE

/datum/organ_dna/belly/imprint_organ(obj/item/organ/organ)
	..()
	var/obj/item/organ/belly/belly_organ = organ
	belly_organ.organ_size = organ_size

/datum/organ_dna/vagina
	var/fertility = TRUE

/datum/organ_dna/vagina/imprint_organ(obj/item/organ/organ)
	..()
	var/obj/item/organ/filling_organ/vagina/vagina_organ = organ
	vagina_organ.fertility = fertility

/datum/organ_dna/butt
	var/organ_size = DEFAULT_BUTT_SIZE

/datum/organ_dna/butt/imprint_organ(obj/item/organ/organ)
	..()
	var/obj/item/organ/butt/butt_organ = organ
	butt_organ.organ_size = organ_size

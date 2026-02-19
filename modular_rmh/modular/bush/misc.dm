/datum/customizer/bodypart_feature/bodyhair
	name = "Body hair"
	customizer_choices = list(/datum/customizer_choice/bodypart_feature/bodyhair)
	allows_disabling = TRUE
	default_disabled = TRUE

/datum/customizer_choice/bodypart_feature/bodyhair
	name = "Body hair"
	feature_type = /datum/bodypart_feature/bodyhair
	sprite_accessories = list(
		/datum/sprite_accessory/bodyhair/bush,
		/datum/sprite_accessory/bodyhair/bigbush,
		/datum/sprite_accessory/bodyhair/medbush,
		)

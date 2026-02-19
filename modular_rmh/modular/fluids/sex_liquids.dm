/mob/living/carbon
	var/cum = /datum/reagent/consumable/cum
	var/femcum = /datum/reagent/consumable/femcum

/datum/species
	var/cum = /datum/reagent/consumable/cum
	var/femcum = /datum/reagent/consumable/femcum

/datum/species/elf
		cum = /datum/reagent/consumable/cum/elf
		femcum = /datum/reagent/consumable/femcum/elf

/datum/species/elf/dark
		cum = /datum/reagent/consumable/cum/drow
		femcum = /datum/reagent/consumable/femcum/drow

/datum/species/tieberian
		cum = /datum/reagent/consumable/cum/tiefling
		femcum = /datum/reagent/consumable/femcum/tiefling

/datum/species/dwarf
		cum = /datum/reagent/consumable/cum/dwarf
		femcum = /datum/reagent/consumable/femcum/dwarf

/datum/species/human/halfelf
		cum = /datum/reagent/consumable/cum/halfelf
		femcum = /datum/reagent/consumable/femcum/halfelf
/*
/datum/species/lizardfolk
		cum = /datum/reagent/consumable/cum/lizardfolk
		femcum = /datum/reagent/consumable/femcum/lizardfolk*/

/datum/species/rakshari
		cum = /datum/reagent/consumable/cum/tabaxi
		femcum = /datum/reagent/consumable/femcum/tabaxi
/*
/datum/species/dracon
		cum = /datum/reagent/consumable/cum/dracon
		femcum = /datum/reagent/consumable/femcum/dracon*/

/datum/species/halforc
		cum = /datum/reagent/consumable/cum/halforc
		femcum = /datum/reagent/consumable/femcum/halforc

/datum/species/kobold
		cum = /datum/reagent/consumable/cum/kobold
		femcum = /datum/reagent/consumable/femcum/kobold

/datum/species/goblin
		cum = /datum/reagent/consumable/cum/goblinp
		femcum = /datum/reagent/consumable/femcum/goblinp


/datum/species/on_species_gain(mob/living/carbon/C, datum/species/old_species, datum/preferences/pref_load)
	. = ..()
	C.set_cum(cum)
	C.set_girlcum(femcum)

/mob/living/carbon/proc/set_cum(cum_in) //haha come in
	cum = cum_in
	if(getorganslot(ORGAN_SLOT_TESTICLES))
		var/obj/item/organ/genitals/filling_organ/testicles/testes = getorganslot(ORGAN_SLOT_TESTICLES)
		testes.reagent_to_make = cum
		testes.reagents.clear_reagents()
		testes.create_reagents(testes.max_reagents/2)

/mob/living/carbon/proc/set_girlcum(femcum_in)
	femcum = femcum_in
	if(getorganslot(ORGAN_SLOT_VAGINA))
		var/obj/item/organ/genitals/filling_organ/vagina/vag = getorganslot(ORGAN_SLOT_VAGINA)
		vag.reagent_to_make = femcum
		vag.reagents.clear_reagents()
		//vag.create_reagents(vag.max_reagents/2)

/datum/reagent/consumable/cum/elf
	color = "#c6c6c6"
	taste_description = "mint and apples"

/datum/reagent/consumable/femcum/elf
	color = "#c6c6c6"
	taste_description = "flowery sweetness"

/datum/reagent/consumable/cum/drow
	color = "#c6c6c6"
	taste_description = "mushroomy sourness"

/datum/reagent/consumable/femcum/drow
	color = "#c6c6c6"
	taste_description = "mushroomy sweetness"

/datum/reagent/consumable/cum/tiefling
	color = "#c6c6c6"
	taste_description = "peppery hotness"

/datum/reagent/consumable/femcum/tiefling
	color = "#c6c6c6"
	taste_description = "hotness and sweetness"

/datum/reagent/consumable/cum/dwarf
	color = "#c6c6c6"
	taste_description = "metallic hops"

/datum/reagent/consumable/femcum/dwarf
	color = "#c6c6c6"
	taste_description = "tangy hops"

/datum/reagent/consumable/cum/halfelf
	color = "#c6c6c6"
	taste_description = "faint mint and apples"

/datum/reagent/consumable/femcum/halfelf
	color = "#c6c6c6"
	taste_description = "faint flowery sweetness"

/datum/reagent/consumable/cum/lizardfolk
	color = "#c6c6c6"
	taste_description = "meat and bitterness"

/datum/reagent/consumable/femcum/lizardfolk
	color = "#c6c6c6"
	taste_description = "salty bitterness"

/datum/reagent/consumable/cum/tabaxi
	color = "#c6c6c6"
	taste_description = "fish and mint"

/datum/reagent/consumable/femcum/tabaxi
	color = "#c6c6c6"
	taste_description = "tangy mint"

/datum/reagent/consumable/cum/dracon
	color = "#c6c6c6"
	taste_description = "smoked steak"

/datum/reagent/consumable/femcum/dracon
	color = "#c6c6c6"
	taste_description = "smoky sweetness"

/datum/reagent/consumable/cum/halforc
	color = "#c6c6c6"
	taste_description = "meat and musk"

/datum/reagent/consumable/femcum/halforc
	color = "#c6c6c6"
	taste_description = "salty meat"

/datum/reagent/consumable/cum/kobold
	color = "#c6c6c6"
	taste_description = "fishy vegetables"

/datum/reagent/consumable/femcum/kobold
	color = "#c6c6c6"
	taste_description = "salty fish"

/datum/reagent/consumable/cum/goblinp
	color = "#c6c6c6"
	taste_description = "fishy earthiness"

/datum/reagent/consumable/femcum/goblinp
	color = "#c6c6c6"
	taste_description = "sour fish"

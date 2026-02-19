/mob/living/carbon
	var/breast_milk = /datum/reagent/consumable/milk

/datum/species
	var/breast_milk = /datum/reagent/consumable/milk

/datum/species/elf
		breast_milk = /datum/reagent/consumable/milk/elf

/datum/species/elf/dark
		breast_milk = /datum/reagent/consumable/milk/darkelf

/datum/species/tieberian
		breast_milk = /datum/reagent/consumable/milk/tiefling

/datum/species/dwarf
		breast_milk = /datum/reagent/consumable/milk/dwarf

/datum/species/on_species_gain(mob/living/carbon/C, datum/species/old_species, datum/preferences/pref_load)
	. = ..()
	C.set_milk(breast_milk)

/mob/living/carbon/proc/set_milk(milk)
	breast_milk = milk
	if(getorganslot(ORGAN_SLOT_BREASTS))
		var/obj/item/organ/genitals/filling_organ/breasts/breasties = getorganslot(ORGAN_SLOT_BREASTS)
		breasties.reagent_to_make = breast_milk
		breasties.reagents.clear_reagents()
		breasties.create_reagents(breasties.max_reagents/2)

/datum/reagent/consumable/milk/elf
	description = "An opaque white liquid produced by the mammary glands of mammals. It seeems tinted a little green..."
	color = "#d0f3de"
	taste_description = "mint and cream"
	glass_desc = "It smells faintly like mint."

/datum/reagent/consumable/milk/tiefling
	description = "An opaque white liquid produced by the mammary glands of mammals. It seeems tinted a little red..."
	color = "#f1d4c0"
	taste_description = "creamy butterscotch and cinnamon"

/datum/reagent/consumable/milk/darkelf
	description = "An opaque white liquid produced by the mammary glands of mammals. It seeems tinted a little grey..."
	color = "#c2cbec"
	taste_description = "tartness and mushrooms"

/datum/reagent/consumable/milk/dwarf
	description = "An opaque white liquid produced by the mammary glands of mammals. It seeems tinted a little yellow..."
	color = "#ece4bd"
	taste_description = "hops, cream and barley"

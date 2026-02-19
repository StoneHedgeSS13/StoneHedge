
/datum/reagent/consumable/cum
	name = "Semen"
	description = "A pearly white liquid produced by testicles."
	color = "#c6c6c6"
	taste_description = "salty slime"
	glass_icon_state = "glass_white"
	glass_name = "glass of semen"
	glass_desc = ""
	nutriment_factor = 5 * REAGENTS_METABOLISM
	hydration_factor = 2
	var/virile = TRUE
	evaporation_rate = 0.2


/datum/reagent/consumable/cum/on_transfer(atom/A, method, trans_volume)
	. = ..()
	if(istype(A, /obj/item/organ/genitals/filling_organ/vagina) && virile)
		var/obj/item/organ/genitals/filling_organ/vagina/forgan = A
		if(forgan.fertility && !forgan.pregnant)
			if(prob(20))
				forgan.be_impregnated() //boom

/datum/reagent/consumable/cum/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!HAS_TRAIT(H, TRAIT_NOHUNGER))
			H.adjust_hydration(5)
			H.adjust_nutrition(5)
		if(H.blood_volume < BLOOD_VOLUME_NORMAL)
			H.blood_volume = min(H.blood_volume+10, BLOOD_VOLUME_NORMAL)
	. = 1
	..()

/datum/reagent/consumable/cum/sterile
	virile = FALSE

/datum/reagent/consumable/femcum
	name = "Pussy juice"
	description = "A sticky, slimy, clear liquid, produced by female arousal."
	color = "#c6c6c6"
	taste_description = "tangy slime"
	glass_icon_state = "glass_clear"
	glass_name = "glass of femcum"
	glass_desc = ""
	nutriment_factor = 0.1 * REAGENTS_METABOLISM
	evaporation_rate = 0.2

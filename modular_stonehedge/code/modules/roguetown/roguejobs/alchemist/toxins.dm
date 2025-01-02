//////////////////////////Poison stuff///////////////////////

/datum/reagent/toxin/berrypoison
	name = "Berry Poison"
	description = "Contains a poisonous thick, dark purple liquid."
	reagent_state = LIQUID
	color = "#00B4FF"

/datum/reagent/toxin/berrypoison/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M, TRAIT_NASTY_EATER))
		return ..()

/datum/reagent/toxin/organpoison
	name = "Organ Poison"
	description = "A viscous black liquid clings to the glass."
	reagent_state = LIQUID
	toxpwr =  3
	color = "#ff2f00"

/datum/reagent/toxin/organpoison/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M, TRAIT_NASTY_EATER) && !HAS_TRAIT(M, TRAIT_ORGAN_EATER) && !HAS_TRAIT(M, TRAIT_WILD_EATER))
		return ..()

/datum/reagent/toxin/infection
	name = "excess choleric humour"
	description = "Red-yellow pustulence - the carrier of disease, the enemy of all Pestrans."
	reagent_state = LIQUID
	color = "#dfe36f"
	var/damage_tick = 0.3
	var/lethal_fever = FALSE
	var/fever_multiplier = 1

/datum/reagent/toxin/infection/on_mob_life(mob/living/carbon/M)
	var/heat = (BODYTEMP_AUTORECOVERY_MINIMUM + clamp(volume, 3, 15)) * fever_multiplier
	if(HAS_TRAIT(M, TRAIT_SNEK))
		M.apply_status_effect(/datum/status_effect/buff/healing)
		if(holder.has_reagent(/datum/reagent/toxin/infection))
			holder.remove_reagent(/datum/reagent/toxin/infection, 9999)
			return
	M.adjustToxLoss(damage_tick, 0)
	if (lethal_fever)
		M.adjust_bodytemperature(heat, 0)
		if (prob(5))
			to_chat(M, span_warning("A wicked heat settles within me... I feel ill. Very ill."))
	else
		M.adjust_bodytemperature(heat, 0, BODYTEMP_HEAT_DAMAGE_LIMIT - 1)
		if (prob(5))
			to_chat(M, span_warning("I feel a horrible chill despite the sweat rolling from my brow..."))
	return ..()

/datum/reagent/toxin/infection/minor
	name = "disrupted choleric humor"
	description = "Symptomatic of disrupted humours."
	damage_tick = 0.1
	lethal_fever = FALSE

/datum/reagent/toxin/infection/minor/on_mob_life(mob/living/carbon/M)
	var/heat = (BODYTEMP_AUTORECOVERY_MINIMUM + clamp(volume, 3, 15)) * fever_multiplier
	if(HAS_TRAIT(M, TRAIT_SNEK))
		M.apply_status_effect(/datum/status_effect/buff/healing)
		if(holder.has_reagent(/datum/reagent/toxin/infection/minor))
			holder.remove_reagent(/datum/reagent/toxin/infection/minor, 9999)
			return
	M.adjustToxLoss(damage_tick, 0)
	if (lethal_fever)
		M.adjust_bodytemperature(heat, 0)
		if (prob(5))
			to_chat(M, span_warning("A wicked heat settles within me... I feel ill. Very ill."))
	else
		M.adjust_bodytemperature(heat, 0, BODYTEMP_HEAT_DAMAGE_LIMIT - 1)
		if (prob(5))
			to_chat(M, span_warning("I feel a horrible chill despite the sweat rolling from my brow..."))
	return ..()

/datum/reagent/toxin/infection/major
	name = "excess melancholic humour"
	description = "Kingsfield's Bane. Excess melancholic has killed thousands, and even Pestra's greatest struggle against its insidious advance."
	damage_tick = 1
	lethal_fever = TRUE
	fever_multiplier = 3

/datum/reagent/toxin/infection/major/on_mob_life(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_SNEK))
		M.apply_status_effect(/datum/status_effect/buff/healing)
		if(holder.has_reagent(/datum/reagent/toxin/infection/major))
			holder.remove_reagent(/datum/reagent/toxin/infection/major, 9999)
			return
	if (M.badluck(1))
		M.reagents.add_reagent(src, rand(1,3))
		to_chat(M, span_small("I feel even worse..."))
	return ..()

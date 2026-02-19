/////////////////////////////////////////////
// Aphrodisiac smoke
/////////////////////////////////////////////

/obj/effect/particle_effect/smoke/aphrodisiac
	color = "#FF00B4"
	lifetime = 10

/obj/effect/particle_effect/smoke/aphrodisiac/smoke_mob(mob/living/carbon/M)
	if(..())
		M.reagents.add_reagent(/datum/reagent/consumable/aphrodisiac, 1)
		if(prob(5))
			to_chat(M, span_warning("You feel warmth spreading through your body..."))
		return 1


/datum/effect_system/smoke_spread/aphrodisiac
	effect_type = /obj/effect/particle_effect/smoke/aphrodisiac

/////////////////////////////////////////////
// Destroy Clothes smoke
/////////////////////////////////////////////

/obj/effect/particle_effect/smoke/destroy_clothes
	color = "#6a00ffc6"
	lifetime = 10

/obj/effect/particle_effect/smoke/destroy_clothes/smoke_mob(mob/living/carbon/M)
	if(..())
		if(!ishuman(M))
			return

		var/mob/living/carbon/human/H = M

		var/list/clothes = list(
			H.shoes,
			H.gloves,
			H.wear_mask,
			H.mouth,
			H.cloak,
			H.wear_armor,
			H.wear_pants,
			H.wear_shirt,
			H.wear_wrists,
			H.belt,
			H.head
			)

		for(var/obj/item/clothing/C in clothes)
			if(!C)
				continue

			var/armor_class = 0
			if(istype(C, /obj/item/clothing) && C.armor_class)
				armor_class = C.armor_class

			switch(armor_class)
				if(AC_HEAVY)
					continue
				if(AC_MEDIUM)
					C.take_damage(damage_amount = C.max_integrity * 0.5, sound_effect = FALSE)
					continue
				else
					H.dropItemToGround(C)
					qdel(C)

		if(H.underwear)
			var/obj/item/clothing/undies/U = H.underwear
			H.dropItemToGround(U)
			qdel(U)
			H.visible_message(
				span_danger("[H]'s underwear dissolves away!"),
				span_danger("Your underwear suddenly dissolves!")
				)

		H.visible_message(
			span_danger("[H]'s clothing dissolves!"),
			span_danger("Your clothing dissolves!")
			)
		playsound(src, 'modular_rmh/sound/effects/dissolve.ogg', 100)
		return 1

/datum/effect_system/smoke_spread/destroy_clothes
	effect_type = /obj/effect/particle_effect/smoke/destroy_clothes
